@implementation SCLTimePickerTableViewCell

- (SCLTimePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SCLTimePickerTableViewCell *v4;
  SCLTimePickerTableViewCell *v5;
  id v6;
  void *v7;
  uint64_t v8;
  UIDatePicker *datePicker;
  NSDateFormatter *v10;
  NSDateFormatter *dateFormatter;
  NSDateIntervalFormatter *v12;
  NSDateIntervalFormatter *intervalFormatter;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;
  _QWORD v31[4];

  v31[3] = *MEMORY[0x24BDAC8D0];
  v30.receiver = self;
  v30.super_class = (Class)SCLTimePickerTableViewCell;
  v4 = -[SCLTimePickerTableViewCell initWithStyle:reuseIdentifier:](&v30, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_constraintMode = 0;
    v6 = objc_alloc(MEMORY[0x24BDF69B8]);
    -[SCLTimePickerTableViewCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v8 = objc_msgSend(v6, "initWithFrame:");
    datePicker = v5->_datePicker;
    v5->_datePicker = (UIDatePicker *)v8;

    -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](v5->_datePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIDatePicker setDatePickerMode:](v5->_datePicker, "setDatePickerMode:", 0);
    -[UIDatePicker setPreferredDatePickerStyle:](v5->_datePicker, "setPreferredDatePickerStyle:", 1);
    -[UIDatePicker addTarget:action:forControlEvents:](v5->_datePicker, "addTarget:action:forControlEvents:", v5, sel_datePickerDidChangeDate_, 4096);
    v10 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatter = v5->_dateFormatter;
    v5->_dateFormatter = v10;

    -[NSDateFormatter setTimeStyle:](v5->_dateFormatter, "setTimeStyle:", 1);
    -[NSDateFormatter setDateStyle:](v5->_dateFormatter, "setDateStyle:", 1);
    v12 = (NSDateIntervalFormatter *)objc_alloc_init(MEMORY[0x24BDD1510]);
    intervalFormatter = v5->_intervalFormatter;
    v5->_intervalFormatter = v12;

    -[NSDateIntervalFormatter setTimeStyle:](v5->_intervalFormatter, "setTimeStyle:", 1);
    -[NSDateIntervalFormatter setDateStyle:](v5->_intervalFormatter, "setDateStyle:", 1);
    -[UIDatePicker sizeToFit](v5->_datePicker, "sizeToFit");
    -[SCLTimePickerTableViewCell contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v5->_datePicker);

    -[UIDatePicker topAnchor](v5->_datePicker, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLTimePickerTableViewCell contentView](v5, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIDatePicker bottomAnchor](v5->_datePicker, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLTimePickerTableViewCell contentView](v5, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIDatePicker centerXAnchor](v5->_datePicker, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLTimePickerTableViewCell contentView](v5, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x24BDD1628];
    v31[0] = v18;
    v31[1] = v22;
    v31[2] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v28);

  }
  return v5;
}

- (void)setCalendar:(id)a3
{
  UIDatePicker *datePicker;
  UIDatePicker *v5;
  void *v6;
  id v7;

  datePicker = self->_datePicker;
  v7 = a3;
  -[UIDatePicker setCalendar:](datePicker, "setCalendar:", v7);
  v5 = self->_datePicker;
  objc_msgSend(v7, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setTimeZone:](v5, "setTimeZone:", v6);

  -[NSDateIntervalFormatter setCalendar:](self->_intervalFormatter, "setCalendar:", v7);
  -[NSDateFormatter setCalendar:](self->_dateFormatter, "setCalendar:", v7);

}

- (NSCalendar)calendar
{
  return -[UIDatePicker calendar](self->_datePicker, "calendar");
}

- (void)setConstraintInterval:(id)a3
{
  id v4;
  NSDateInterval *v5;
  NSDateInterval *constraintInterval;
  id v7;

  v4 = a3;
  v5 = (NSDateInterval *)objc_msgSend(v4, "copy");
  constraintInterval = self->_constraintInterval;
  self->_constraintInterval = v5;

  -[UIDatePicker date](self->_datePicker, "date");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SCLTimePickerTableViewCell _updateConstraintModeWithInterval:selectedDate:](self, "_updateConstraintModeWithInterval:selectedDate:", v4, v7);

}

- (void)setSelectedDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SCLTimePickerTableViewCell datePicker](self, "datePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToDate:", v6);

  scl_framework_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 1024;
    v13 = v7 ^ 1;
    _os_log_impl(&dword_22151E000, v8, OS_LOG_TYPE_INFO, "Set Selected Date: %@; shouldSet=%{BOOL}d",
      (uint8_t *)&v10,
      0x12u);

  }
  if ((v7 & 1) == 0)
    -[UIDatePicker setDate:](self->_datePicker, "setDate:", v4);

}

- (NSDate)selectedDate
{
  return -[UIDatePicker date](self->_datePicker, "date");
}

- (void)datePickerDidChangeDate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSDateFormatter *dateFormatter;
  uint64_t v17;
  NSDateFormatter *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSDateInterval *constraintInterval;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  NSDateFormatter *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  scl_framework_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_constraintMode);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v39 = v7;
    v40 = 2112;
    v41 = (uint64_t)v8;
    _os_log_impl(&dword_22151E000, v6, OS_LOG_TYPE_INFO, "Did pick date: %@; constraintMode = %@", buf, 0x16u);

  }
  if (self->_constraintMode == 2 && !-[NSDateInterval containsDate:](self->_constraintInterval, "containsDate:", v5))
  {
    -[SCLTimePickerTableViewCell calendar](self, "calendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "components:fromDate:", 96, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hour") || objc_msgSend(v10, "minute"))
    {
      -[NSDateInterval startDate](self->_constraintInterval, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "components:fromDate:", 33022, v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = -[NSObject copy](v12, "copy");
      objc_msgSend(v13, "setHour:", objc_msgSend(v10, "hour"));
      objc_msgSend(v13, "setMinute:", objc_msgSend(v10, "minute"));
      objc_msgSend(v9, "dateFromComponents:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[NSDateInterval containsDate:](self->_constraintInterval, "containsDate:", v14))
      {
        scl_framework_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v36 = v12;
          -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v14);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          dateFormatter = self->_dateFormatter;
          objc_msgSend(v4, "date");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = dateFormatter;
          v19 = (void *)v17;
          -[NSDateFormatter stringFromDate:](v18, "stringFromDate:");
          v20 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v39 = v35;
          v40 = 2112;
          v41 = v20;
          v21 = (void *)v20;
          _os_log_impl(&dword_22151E000, v15, OS_LOG_TYPE_INFO, "Normalizing back to date %@ from %@", buf, 0x16u);

          v12 = v36;
        }

        objc_msgSend(v4, "setDate:animated:", v14, 0);
      }
      else
      {
        v22 = objc_msgSend(v10, "hour");
        v23 = objc_msgSend(v10, "minute") + 60 * v22;
        v24 = -[NSObject hour](v12, "hour");
        v37 = v12;
        v25 = -[NSObject minute](v12, "minute") - v23 + 60 * v24;
        if (v25 < 0)
          v25 = -v25;
        constraintInterval = self->_constraintInterval;
        if (v25 <= v23)
          -[NSDateInterval startDate](constraintInterval, "startDate");
        else
          -[NSDateInterval endDate](constraintInterval, "endDate");
        v27 = objc_claimAutoreleasedReturnValue();

        scl_framework_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v27);
          v34 = v27;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = self->_dateFormatter;
          objc_msgSend(v4, "date");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDateFormatter stringFromDate:](v30, "stringFromDate:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v39 = v29;
          v40 = 2112;
          v41 = (uint64_t)v32;
          _os_log_impl(&dword_22151E000, v28, OS_LOG_TYPE_INFO, "Date %@ falls outside of constraint interval. Setting to %@", buf, 0x16u);

          v27 = v34;
        }

        objc_msgSend(v4, "setDate:animated:", v27, 1);
        v14 = (void *)v27;
        v12 = v37;
      }

      v5 = v14;
    }
    else
    {
      scl_framework_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22151E000, v12, OS_LOG_TYPE_INFO, "Picked midnight", buf, 2u);
      }
    }

  }
  -[SCLTimePickerTableViewCell _updateConstraintModeWithInterval:selectedDate:](self, "_updateConstraintModeWithInterval:selectedDate:", self->_constraintInterval, v5);
  -[SCLTimePickerTableViewCell delegate](self, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "timePickerCell:didUpdateDate:", self, v5);

}

- (void)_updateConstraintModeWithInterval:(id)a3 selectedDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIDatePicker *datePicker;
  void *v15;
  UIDatePicker *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[SCLTimePickerTableViewCell calendar](self, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    scl_framework_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[NSDateIntervalFormatter stringFromDateInterval:](self->_intervalFormatter, "stringFromDateInterval:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_22151E000, v9, OS_LOG_TYPE_INFO, "Update constraint with interval %@; selected date %@",
        (uint8_t *)&v20,
        0x16u);

    }
    objc_msgSend(v6, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject components:fromDate:](v8, "components:fromDate:", 96, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "hour") || objc_msgSend(v13, "minute"))
    {
      self->_constraintMode = 1;
      datePicker = self->_datePicker;
      objc_msgSend(v6, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDatePicker setMinimumDate:](datePicker, "setMinimumDate:", v15);

      v16 = self->_datePicker;
      objc_msgSend(v6, "endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDatePicker setMaximumDate:](v16, "setMaximumDate:", v17);

      scl_framework_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        -[NSDateIntervalFormatter stringFromDateInterval:](self->_intervalFormatter, "stringFromDateInterval:", v6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412290;
        v21 = v19;
        _os_log_impl(&dword_22151E000, v18, OS_LOG_TYPE_INFO, "Setting constraint mode to picker: %@", (uint8_t *)&v20, 0xCu);

      }
    }
    else
    {
      self->_constraintMode = 2;
      -[UIDatePicker setMinimumDate:](self->_datePicker, "setMinimumDate:", 0);
      -[UIDatePicker setMaximumDate:](self->_datePicker, "setMaximumDate:", 0);
      scl_framework_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_22151E000, v18, OS_LOG_TYPE_INFO, "Setting constraint mode to manual workaround", (uint8_t *)&v20, 2u);
      }
    }

  }
  else
  {
    self->_constraintMode = 0;
    -[UIDatePicker setMinimumDate:](self->_datePicker, "setMinimumDate:", 0);
    -[UIDatePicker setMaximumDate:](self->_datePicker, "setMaximumDate:", 0);
    scl_framework_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_22151E000, v8, OS_LOG_TYPE_INFO, "Setting constraint mode to  none", (uint8_t *)&v20, 2u);
    }
  }

}

- (UIDatePicker)datePicker
{
  return (UIDatePicker *)objc_getProperty(self, a2, 1048, 1);
}

- (NSDateInterval)constraintInterval
{
  return self->_constraintInterval;
}

- (SCLTimePickerTableViewCellDelegate)delegate
{
  return (SCLTimePickerTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_constraintInterval, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_intervalFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end
