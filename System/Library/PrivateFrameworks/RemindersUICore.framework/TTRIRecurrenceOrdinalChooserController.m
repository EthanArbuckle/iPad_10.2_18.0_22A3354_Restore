@implementation TTRIRecurrenceOrdinalChooserController

- (TTRIRecurrenceOrdinalChooserController)initWithDate:(id)a3
{
  TTRIRecurrenceOrdinalChooserController *v3;
  TTRIRecurrenceOrdinalPickerViewController *v4;
  TTRIRecurrenceOrdinalPickerViewController *pickerViewController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TTRIRecurrenceOrdinalChooserController;
  v3 = -[TTRIRecurrenceChooserController initWithDate:](&v7, sel_initWithDate_, a3);
  if (v3)
  {
    v4 = (TTRIRecurrenceOrdinalPickerViewController *)objc_opt_new();
    -[TTRIRecurrenceOrdinalPickerViewController setDelegate:](v4, "setDelegate:", v3);
    pickerViewController = v3->_pickerViewController;
    v3->_pickerViewController = v4;

  }
  return v3;
}

- (int64_t)frequency
{
  return 2;
}

- (int64_t)numberOfRows
{
  return 1;
}

- (double)heightForRow:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[TTRIRecurrenceOrdinalPickerViewController view](self->_pickerViewController, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v5 = v4;

  return v5;
}

- (id)cellForRow:(int64_t)a3
{
  UITableViewCell *cell;
  void *v5;
  void *v6;
  void *v7;
  TTRICustomRecurrenceTableViewCell *v8;
  UITableViewCell *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  cell = self->_cell;
  if (!cell)
  {
    -[TTRIRecurrenceOrdinalPickerViewController view](self->_pickerViewController, "view", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TTRIRecurrenceChooserController backgroundColor](self, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[TTRIRecurrenceChooserController backgroundColor](self, "backgroundColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v7);

    }
    v8 = -[TTRICustomRecurrenceTableViewCell initWithStyle:reuseIdentifier:]([TTRICustomRecurrenceTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v9 = self->_cell;
    self->_cell = &v8->super;

    -[UITableViewCell contentView](self->_cell, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v5);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 9, 0, v5, 9, 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addConstraint:", v11);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 7, 0, v10, 7, 1.0, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addConstraint:", v12);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 8, 1, v5, 8, 1.0, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1148829696;
    objc_msgSend(v13, "setPriority:", v14);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 3, 0, v5, 3, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addConstraints:", v16);

    cell = self->_cell;
  }
  return cell;
}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  -[TTRIRecurrenceOrdinalPickerViewController updateRecurrenceRuleBuilder:](self->_pickerViewController, "updateRecurrenceRuleBuilder:", a3);
}

- (void)updateFromRecurrenceRule:(id)a3
{
  -[TTRIRecurrenceOrdinalPickerViewController updateFromRecurrenceRule:](self->_pickerViewController, "updateFromRecurrenceRule:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_pickerViewController, 0);
}

@end
