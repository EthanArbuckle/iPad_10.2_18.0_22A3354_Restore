@implementation TTRIRecurrenceMonthDayChooserController

- (TTRIRecurrenceMonthDayChooserController)initWithDate:(id)a3
{
  TTRIRecurrenceMonthDayChooserController *v3;
  uint64_t v4;
  NSMutableSet *daysOfTheMonthSet;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TTRIRecurrenceMonthDayChooserController;
  v3 = -[TTRIRecurrenceChooserController initWithDate:](&v7, sel_initWithDate_, a3);
  if (v3)
  {
    v4 = objc_opt_new();
    daysOfTheMonthSet = v3->_daysOfTheMonthSet;
    v3->_daysOfTheMonthSet = (NSMutableSet *)v4;

  }
  return v3;
}

- (int64_t)frequency
{
  return 2;
}

- (id)daysOfTheMonth
{
  void *v2;
  void *v3;

  -[NSMutableSet allObjects](self->_daysOfTheMonthSet, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDaysOfTheMonth:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *daysOfTheMonthSet;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableSet *)objc_msgSend(v6, "mutableCopy");
  daysOfTheMonthSet = self->_daysOfTheMonthSet;
  self->_daysOfTheMonthSet = v4;

}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TTRIRecurrenceMonthDayChooserController daysOfTheMonth](self, "daysOfTheMonth");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDayNumbers:", v5);

}

- (void)updateFromRecurrenceRule:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "daysOfTheMonth");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "daysOfTheMonth");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIRecurrenceMonthDayChooserController setDaysOfTheMonth:](self, "setDaysOfTheMonth:", v5);

    -[TTRIRecurrenceMonthDayChooserController refreshCells](self, "refreshCells");
  }

}

- (id)cellLabels
{
  if (cellLabels_onceToken_0 != -1)
    dispatch_once(&cellLabels_onceToken_0, &__block_literal_global_5);
  return (id)cellLabels___cellLabels_0;
}

void __53__TTRIRecurrenceMonthDayChooserController_cellLabels__block_invoke()
{
  void *v0;
  uint64_t i;
  void *v2;
  void *v3;

  v0 = (void *)objc_opt_new();
  for (i = 1; i != 32; ++i)
  {
    CUIKLocalizedStringForInteger();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "addObject:", v2);

  }
  v3 = (void *)cellLabels___cellLabels_0;
  cellLabels___cellLabels_0 = (uint64_t)v0;

}

- (int64_t)gridViewType
{
  return 1;
}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableSet count](self->_daysOfTheMonthSet, "count"))
  {
    -[TTRIRecurrenceChooserController startDateComponents:](self, "startDateComponents:", 16);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "day"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIRecurrenceMonthDayChooserController setDaysOfTheMonth:](self, "setDaysOfTheMonth:", v5);

  }
}

- (void)refreshCells
{
  unint64_t v3;
  void *v4;
  NSMutableSet *daysOfTheMonthSet;
  void *v6;
  uint64_t v7;
  id v8;

  -[TTRIRecurrenceGridChooserController allCells](self, "allCells");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      daysOfTheMonthSet = self->_daysOfTheMonthSet;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ++v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSMutableSet containsObject:](daysOfTheMonthSet, "containsObject:", v6);

      objc_msgSend(v4, "setSelected:", v7);
    }
    while (v3 < objc_msgSend(v8, "count"));
  }

}

- (void)selectCell:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSMutableSet *daysOfTheMonthSet;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NSMutableSet count](self->_daysOfTheMonthSet, "count") != 1 || (objc_msgSend(v6, "selected") & 1) == 0)
  {
    objc_msgSend(v6, "setSelected:", objc_msgSend(v6, "selected") ^ 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "selected")
      && -[TTRIRecurrenceMonthDayChooserController prohibitsMultipleDaysInMonthlyRecurrence](self, "prohibitsMultipleDaysInMonthlyRecurrence"))
    {
      v11[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTRIRecurrenceMonthDayChooserController setDaysOfTheMonth:](self, "setDaysOfTheMonth:", v8);

      -[TTRIRecurrenceMonthDayChooserController refreshCells](self, "refreshCells");
    }
    else
    {
      v9 = objc_msgSend(v6, "selected");
      daysOfTheMonthSet = self->_daysOfTheMonthSet;
      if (v9)
        -[NSMutableSet addObject:](daysOfTheMonthSet, "addObject:", v7);
      else
        -[NSMutableSet removeObject:](daysOfTheMonthSet, "removeObject:", v7);
    }
    -[TTRIRecurrenceChooserController notifyDelegate](self, "notifyDelegate");

  }
}

- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (self->_prohibitsMultipleDaysInMonthlyRecurrence != a3)
  {
    self->_prohibitsMultipleDaysInMonthlyRecurrence = a3;
    if (a3)
    {
      -[TTRIRecurrenceMonthDayChooserController daysOfTheMonth](self, "daysOfTheMonth");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      if (v5)
      {
        -[TTRIRecurrenceMonthDayChooserController daysOfTheMonth](self, "daysOfTheMonth");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[TTRIRecurrenceMonthDayChooserController setDaysOfTheMonth:](self, "setDaysOfTheMonth:", v8);

        -[TTRIRecurrenceMonthDayChooserController refreshCells](self, "refreshCells");
      }
    }
  }
}

- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence
{
  return self->_prohibitsMultipleDaysInMonthlyRecurrence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daysOfTheMonthSet, 0);
}

@end
