@implementation TTRIRecurrenceMonthlyChooserController

- (TTRIRecurrenceMonthlyChooserController)initWithDate:(id)a3
{
  id v4;
  TTRIRecurrenceMonthlyChooserController *v5;
  TTRIRecurrenceMonthDayChooserController *v6;
  TTRIRecurrenceMonthDayChooserController *monthDayChooser;
  TTRIRecurrenceOrdinalChooserController *v8;
  TTRIRecurrenceOrdinalChooserController *ordinalChooser;
  TTRICustomRecurrenceTableViewCell *v10;
  UITableViewCell *onEachCell;
  void *v12;
  void *v13;
  void *v14;
  TTRIUIFullWidthDividerTableViewCell *v15;
  UITableViewCell *onTheCell;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TTRIRecurrenceMonthlyChooserController;
  v5 = -[TTRIRecurrenceChooserController initWithDate:](&v21, sel_initWithDate_, v4);
  if (v5)
  {
    v6 = -[TTRIRecurrenceMonthDayChooserController initWithDate:]([TTRIRecurrenceMonthDayChooserController alloc], "initWithDate:", v4);
    monthDayChooser = v5->_monthDayChooser;
    v5->_monthDayChooser = v6;

    v8 = -[TTRIRecurrenceOrdinalChooserController initWithDate:]([TTRIRecurrenceOrdinalChooserController alloc], "initWithDate:", v4);
    ordinalChooser = v5->_ordinalChooser;
    v5->_ordinalChooser = v8;

    v10 = -[TTRICustomRecurrenceTableViewCell initWithStyle:reuseIdentifier:]([TTRICustomRecurrenceTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    onEachCell = v5->_onEachCell;
    v5->_onEachCell = &v10->super;

    RemindersUICoreBundleGet();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Each"), CFSTR("Each"), CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](v5->_onEachCell, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    v15 = -[TTRIUIFullWidthDividerTableViewCell initWithStyle:reuseIdentifier:]([TTRIUIFullWidthDividerTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    onTheCell = v5->_onTheCell;
    v5->_onTheCell = &v15->super.super;

    RemindersUICoreBundleGet();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("On the…"), CFSTR("On the…"), CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](v5->_onTheCell, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  TTRIRecurrenceChooserControllerDelegate **p_delegate;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  -[TTRIRecurrenceChooserController setDelegate:](self->_monthDayChooser, "setDelegate:", v5);
  -[TTRIRecurrenceChooserController setDelegate:](self->_ordinalChooser, "setDelegate:", v5);

}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TTRIRecurrenceMonthlyChooserController _currentChooser](self, "_currentChooser");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateRecurrenceRuleBuilder:", v4);

}

- (void)updateFromRecurrenceRule:(id)a3
{
  TTRIRecurrenceMonthDayChooserController *monthDayChooser;
  id v5;

  monthDayChooser = self->_monthDayChooser;
  v5 = a3;
  -[TTRIRecurrenceMonthDayChooserController updateFromRecurrenceRule:](monthDayChooser, "updateFromRecurrenceRule:", v5);
  -[TTRIRecurrenceOrdinalChooserController updateFromRecurrenceRule:](self->_ordinalChooser, "updateFromRecurrenceRule:", v5);
  LODWORD(monthDayChooser) = +[TTRICustomRecurrenceViewController isRecurrenceRuleOrdinal:](TTRICustomRecurrenceViewController, "isRecurrenceRuleOrdinal:", v5);

  -[TTRIRecurrenceMonthlyChooserController _selectRow:](self, "_selectRow:", monthDayChooser);
}

- (int64_t)frequency
{
  return 2;
}

- (id)_currentChooser
{
  int *v2;

  if (self->_selectedRow)
    v2 = &OBJC_IVAR___TTRIRecurrenceMonthlyChooserController__ordinalChooser;
  else
    v2 = &OBJC_IVAR___TTRIRecurrenceMonthlyChooserController__monthDayChooser;
  return *(id *)((char *)&self->super.super.isa + *v2);
}

- (int64_t)numberOfRows
{
  return 3;
}

- (id)cellForRow:(int64_t)a3
{
  void *v3;
  id v4;
  uint64_t v5;

  if (a3 == 1)
  {
    v5 = 72;
LABEL_6:
    v4 = *(id *)((char *)&self->super.super.isa + v5);
    return v4;
  }
  if (a3 != 2)
  {
    v5 = 64;
    goto LABEL_6;
  }
  -[TTRIRecurrenceMonthlyChooserController _currentChooser](self, "_currentChooser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForRow:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)heightForRow:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  if (a3 != 2)
    return *MEMORY[0x1E0DC53D8];
  -[TTRIRecurrenceMonthlyChooserController _currentChooser](self, "_currentChooser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightForRow:", 0);
  v5 = v4;

  return v5;
}

- (void)rowTapped:(int64_t)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  -[TTRIRecurrenceMonthlyChooserController _selectRow:](self, "_selectRow:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "recurrenceChooser:wantsRowReload:", self, 2);

  v6 = objc_loadWeakRetained((id *)&self->_delegate);
  -[TTRIRecurrenceMonthlyChooserController _currentChooser](self, "_currentChooser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recurrenceChooserUpdated:", v5);

}

- (BOOL)drawBackgroundForRow:(int64_t)a3
{
  void *v3;
  char v4;

  if (a3 != 2)
    return 1;
  -[TTRIRecurrenceMonthlyChooserController _currentChooser](self, "_currentChooser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "drawBackgroundForRow:", 2);

  return v4;
}

- (void)_selectRow:(int64_t)a3
{
  int *v4;
  int *v5;

  self->_selectedRow = a3;
  if (a3)
  {
    if (a3 != 1)
      return;
    v4 = &OBJC_IVAR___TTRIRecurrenceMonthlyChooserController__onEachCell;
    v5 = &OBJC_IVAR___TTRIRecurrenceMonthlyChooserController__onTheCell;
  }
  else
  {
    v4 = &OBJC_IVAR___TTRIRecurrenceMonthlyChooserController__onTheCell;
    v5 = &OBJC_IVAR___TTRIRecurrenceMonthlyChooserController__onEachCell;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v5), "setAccessoryType:", 3);
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v4), "setAccessoryType:", 0);
}

- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence
{
  return -[TTRIRecurrenceMonthDayChooserController prohibitsMultipleDaysInMonthlyRecurrence](self->_monthDayChooser, "prohibitsMultipleDaysInMonthlyRecurrence");
}

- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3
{
  -[TTRIRecurrenceMonthDayChooserController setProhibitsMultipleDaysInMonthlyRecurrence:](self->_monthDayChooser, "setProhibitsMultipleDaysInMonthlyRecurrence:", a3);
}

- (id)backgroundColor
{
  void *v2;
  void *v3;

  -[TTRIRecurrenceMonthlyChooserController _currentChooser](self, "_currentChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  TTRIRecurrenceMonthDayChooserController *monthDayChooser;
  id v5;

  monthDayChooser = self->_monthDayChooser;
  v5 = a3;
  -[TTRIRecurrenceChooserController setBackgroundColor:](monthDayChooser, "setBackgroundColor:", v5);
  -[TTRIRecurrenceChooserController setBackgroundColor:](self->_ordinalChooser, "setBackgroundColor:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onTheCell, 0);
  objc_storeStrong((id *)&self->_onEachCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ordinalChooser, 0);
  objc_storeStrong((id *)&self->_monthDayChooser, 0);
}

@end
