@implementation UICalendarSelectionMultiDate

- (UICalendarSelectionMultiDate)init
{
  return -[UICalendarSelectionMultiDate initWithDelegate:](self, "initWithDelegate:", 0);
}

- (UICalendarSelectionMultiDate)initWithDelegate:(id)delegate
{
  id v4;
  id *v5;
  id *v6;
  uint64_t v7;
  id v8;
  char v9;
  char v10;
  char v11;
  objc_super v13;

  v4 = delegate;
  v13.receiver = self;
  v13.super_class = (Class)UICalendarSelectionMultiDate;
  v5 = -[UICalendarSelection _init](&v13, sel__init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(v5 + 4, v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v6[2];
    v6[2] = (id)v7;

    *((_BYTE *)v6 + 24) = (_BYTE)v6[3] & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 2;
    else
      v9 = 0;
    *((_BYTE *)v6 + 24) = (_BYTE)v6[3] & 0xFD | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 4;
    else
      v10 = 0;
    *((_BYTE *)v6 + 24) = (_BYTE)v6[3] & 0xFB | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 8;
    else
      v11 = 0;
    *((_BYTE *)v6 + 24) = (_BYTE)v6[3] & 0xF7 | v11;
  }

  return (UICalendarSelectionMultiDate *)v6;
}

- (NSArray)selectedDates
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_selectedDates, "copy");
}

- (void)setSelectedDates:(NSArray *)selectedDates
{
  -[UICalendarSelectionMultiDate setSelectedDates:animated:](self, "setSelectedDates:animated:", selectedDates, 0);
}

- (void)setSelectedDates:(NSArray *)selectedDates animated:(BOOL)animated
{
  _BOOL8 v4;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = animated;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = selectedDates;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        if (objc_msgSend(v12, "year") == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v12, "month") == 0x7FFFFFFFFFFFFFFFLL)
        {

        }
        else
        {
          v13 = objc_msgSend(v12, "day");

          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_9;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICalendarSelectionMultiDate.m"), 57, CFSTR("dateComponents (%@) is invalid. It requires at least [.year, .month, .day]."), v12);

LABEL_9:
        ++v11;
      }
      while (v9 != v11);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v9 = v15;
    }
    while (v15);
  }
  -[UICalendarSelection view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_deselectDates:animated:", self->_selectedDates, v4);

  -[UICalendarSelection view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "calendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICalendarSelectionMultiDate _sanitizeDateComponents:calendar:](self, "_sanitizeDateComponents:calendar:", v7, v18);
  v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v20 = self->_selectedDates;
  self->_selectedDates = v19;

  -[UICalendarSelectionMultiDate selectAllDatesAnimated:](self, "selectAllDatesAnimated:", v4);
}

- (void)willMoveToCalendarView:(id)a3
{
  id v4;

  -[UICalendarSelection view](self, "view", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_deselectDates:animated:", self->_selectedDates, 0);

}

- (void)didMoveToCalendarView
{
  NSMutableArray *selectedDates;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;

  selectedDates = self->_selectedDates;
  -[UICalendarSelection view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICalendarSelectionMultiDate _sanitizeDateComponents:calendar:](self, "_sanitizeDateComponents:calendar:", selectedDates, v5);
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v7 = self->_selectedDates;
  self->_selectedDates = v6;

  -[UICalendarSelection view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsMultipleSelection:", 1);

  -[UICalendarSelectionMultiDate selectAllDatesAnimated:](self, "selectAllDatesAnimated:", 0);
}

- (BOOL)canSelectDate:(id)a3
{
  UICalendarSelectionMultiDate *v4;
  id v5;
  void *v6;

  if ((*(_BYTE *)&self->_delegateImplements & 1) == 0)
    return 1;
  v4 = self;
  v5 = a3;
  -[UICalendarSelectionMultiDate delegate](v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "multiDateSelection:canSelectDate:", v4, v5);

  return (char)v4;
}

- (BOOL)shouldDeselectDate:(id)a3
{
  UICalendarSelectionMultiDate *v4;
  id v5;
  void *v6;

  if ((*(_BYTE *)&self->_delegateImplements & 2) == 0)
    return 1;
  v4 = self;
  v5 = a3;
  -[UICalendarSelectionMultiDate delegate](v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "multiDateSelection:canDeselectDate:", v4, v5);

  return (char)v4;
}

- (void)didSelectDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableArray addObject:](self->_selectedDates, "addObject:");
  if ((*(_BYTE *)&self->_delegateImplements & 4) != 0)
  {
    -[UICalendarSelectionMultiDate delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multiDateSelection:didSelectDate:", self, v5);

  }
}

- (void)didDeselectDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableArray removeObject:](self->_selectedDates, "removeObject:");
  if ((*(_BYTE *)&self->_delegateImplements & 8) != 0)
  {
    -[UICalendarSelectionMultiDate delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multiDateSelection:didDeselectDate:", self, v5);

  }
}

- (void)selectAllDatesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[UICalendarSelection view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_selectDates:animated:", self->_selectedDates, v3);

}

- (void)didChangeCalendar:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *selectedDates;

  -[UICalendarSelectionMultiDate _sanitizeDateComponents:calendar:](self, "_sanitizeDateComponents:calendar:", self->_selectedDates, a3);
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  selectedDates = self->_selectedDates;
  self->_selectedDates = v4;

}

- (void)didChangeAvailableDateRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  if (-[NSMutableArray count](self->_selectedDates, "count"))
  {
    -[UICalendarSelection view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __60__UICalendarSelectionMultiDate_didChangeAvailableDateRange___block_invoke;
    v13 = &unk_1E16E6170;
    v14 = v6;
    v15 = v4;
    v7 = v6;
    -[UICalendarSelectionMultiDate _removeSelectedDatesSatisfyingPredicate:](self, "_removeSelectedDatesSatisfyingPredicate:", &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICalendarSelection view](self, "view", v10, v11, v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_deselectDates:animated:", v8, 0);

  }
}

uint64_t __60__UICalendarSelectionMultiDate_didChangeAvailableDateRange___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "dateFromComponents:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "containsDate:", v3) ^ 1;

  return v4;
}

- (BOOL)highlightsToday
{
  return 0;
}

- (id)_sanitizeDateComponents:(id)a3 calendar:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  _QWORD v18[2];
  id (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v19 = __65__UICalendarSelectionMultiDate__sanitizeDateComponents_calendar___block_invoke;
    v20 = &unk_1E16E6198;
    v21 = v6;
    v8 = v5;
    v9 = v18;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v19((uint64_t)v9, *(void **)(*((_QWORD *)&v22 + 1) + 8 * i));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

  }
  else
  {
    v10 = (void *)objc_msgSend(v5, "mutableCopy");
  }

  return v10;
}

id __65__UICalendarSelectionMultiDate__sanitizeDateComponents_calendar___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  void *v14;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v5, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      objc_msgSend(v5, "setCalendar:", v4);
    if (v4)
    {
      objc_msgSend(v5, "calendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", v4);

      if ((v8 & 1) == 0)
      {
        objc_msgSend(v5, "calendar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dateFromComponents:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDateComponents * _Nullable _UICalendarSanitizeWithCalendar(NSDateComponents * _Nonnull __strong, NSCalendar * _Nonnull __strong)");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("_UICalendarViewHelper.h"), 92, CFSTR("Date components yielded an invalid NSDate"));

        }
        objc_msgSend(v4, "components:fromDate:", 1048606, v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v11;
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_removeSelectedDatesSatisfyingPredicate:(id)a3
{
  unsigned int (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = (unsigned int (**)(id, void *))a3;
  v5 = (void *)objc_opt_new();
  v6 = -[NSMutableArray count](self->_selectedDates, "count");
  if (v6 - 1 >= 0)
  {
    v7 = v6;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_selectedDates, "objectAtIndex:", --v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4[2](v4, v8))
      {
        objc_msgSend(v5, "addObject:", v8);
        -[NSMutableArray removeObjectAtIndex:](self->_selectedDates, "removeObjectAtIndex:", v7);
      }

    }
    while (v7 > 0);
  }

  return v5;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedDates, 0);
}

@end
