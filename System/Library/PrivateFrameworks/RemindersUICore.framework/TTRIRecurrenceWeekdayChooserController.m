@implementation TTRIRecurrenceWeekdayChooserController

- (TTRIRecurrenceWeekdayChooserController)initWithDate:(id)a3
{
  TTRIRecurrenceWeekdayChooserController *v3;
  TTRIRecurrenceWeekdayChooserController *v4;
  uint64_t v5;
  NSMutableArray *selectedRows;
  uint64_t v7;
  NSMutableArray *cells;
  uint64_t v9;
  TTRICustomRecurrenceTableViewCell *v10;
  TTRICustomRecurrenceTableViewCell *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TTRIRecurrenceWeekdayChooserController;
  v3 = -[TTRIRecurrenceChooserController initWithDate:](&v15, sel_initWithDate_, a3);
  v4 = v3;
  if (v3)
  {
    -[TTRIRecurrenceWeekdayChooserController setDaysOfTheWeek:](v3, "setDaysOfTheWeek:", MEMORY[0x1E0C9AA60]);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
    selectedRows = v4->_selectedRows;
    v4->_selectedRows = (NSMutableArray *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
    cells = v4->_cells;
    v4->_cells = (NSMutableArray *)v7;

    v9 = 0;
    v10 = 0;
    do
    {
      v11 = v10;
      v10 = -[TTRICustomRecurrenceTableViewCell initWithStyle:reuseIdentifier:]([TTRICustomRecurrenceTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);

      -[TTRIRecurrenceWeekdayChooserController _calStringForDayOfWeek:](v4, "_calStringForDayOfWeek:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTRICustomRecurrenceTableViewCell textLabel](v10, "textLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v12);

      -[NSMutableArray addObject:](v4->_cells, "addObject:", v10);
      ++v9;
    }
    while (v9 != 7);

  }
  return v4;
}

- (void)setDaysOfTheWeek:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *selectedRows;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  if (self->_daysOfTheWeek != v5)
  {
    objc_storeStrong((id *)&self->_daysOfTheWeek, a3);
    -[NSMutableArray removeAllObjects](self->_selectedRows, "removeAllObjects");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          selectedRows = self->_selectedRows;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dayOfTheWeek", (_QWORD)v13) - 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](selectedRows, "addObject:", v12);

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (int64_t)frequency
{
  return 1;
}

- (int64_t)numberOfRows
{
  return 7;
}

- (double)heightForRow:(int64_t)a3
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)cellForRow:(int64_t)a3
{
  void *v5;
  NSMutableArray *selectedRows;
  void *v7;

  -[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  selectedRows = self->_selectedRows;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIRecurrenceWeekdayChooserController _setCell:selected:](self, "_setCell:selected:", v5, -[NSMutableArray containsObject:](selectedRows, "containsObject:", v7));

  return v5;
}

- (void)rowTapped:(int64_t)a3
{
  NSMutableArray *selectedRows;
  void *v6;
  int v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  selectedRows = self->_selectedRows;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSMutableArray containsObject:](selectedRows, "containsObject:", v6);

  if (-[NSMutableArray count](self->_selectedRows, "count") != 1 || (v7 & 1) == 0)
  {
    v8 = self->_selectedRows;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[NSMutableArray removeObject:](v8, "removeObject:", v9);
    else
      -[NSMutableArray addObject:](v8, "addObject:", v9);

    -[TTRIRecurrenceWeekdayChooserController cellForRow:](self, "cellForRow:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIRecurrenceWeekdayChooserController _setCell:selected:](self, "_setCell:selected:", v10, v7 ^ 1u);

    v11 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = self->_selectedRows;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(MEMORY[0x1E0D845C0], "dayOfWeek:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "integerValue", (_QWORD)v18) + 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

    -[TTRIRecurrenceWeekdayChooserController setDaysOfTheWeek:](self, "setDaysOfTheWeek:", v11);
    -[TTRIRecurrenceChooserController notifyDelegate](self, "notifyDelegate");

  }
}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setDays:", -[TTRIRecurrenceWeekdayChooserController _dayMask](self, "_dayMask"));

}

- (void)updateFromRecurrenceRule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "daysOfTheWeek");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "daysOfTheWeek");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIRecurrenceWeekdayChooserController setDaysOfTheWeek:](self, "setDaysOfTheWeek:", v6);
  }
  else
  {
    -[TTRIRecurrenceChooserController startDateComponents:](self, "startDateComponents:", 512);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D845C0], "dayOfWeek:", objc_msgSend(v6, "weekday"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIRecurrenceWeekdayChooserController setDaysOfTheWeek:](self, "setDaysOfTheWeek:", v8);

  }
}

- (void)_setCell:(id)a3 selected:(BOOL)a4
{
  uint64_t v5;

  if (a4)
    v5 = 3;
  else
    v5 = 0;
  objc_msgSend(a3, "setAccessoryType:", v5);
}

- (int)_dayMask
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TTRIRecurrenceWeekdayChooserController daysOfTheWeek](self, "daysOfTheWeek", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= +[TTRIRecurrenceChooserController dayFromNumber:](TTRIRecurrenceChooserController, "dayFromNumber:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "dayOfTheWeek"));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_calStringForDayOfWeek:(int)a3
{
  return (id)CUIKStringForDayOfWeek();
}

- (NSMutableArray)cells
{
  return self->_cells;
}

- (void)setCells:(id)a3
{
  objc_storeStrong((id *)&self->_cells, a3);
}

- (NSArray)daysOfTheWeek
{
  return self->_daysOfTheWeek;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daysOfTheWeek, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_selectedRows, 0);
}

@end
