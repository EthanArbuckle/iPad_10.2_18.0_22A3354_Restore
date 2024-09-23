@implementation PKPassShareScheduleSectionController

- (PKPassShareScheduleSectionController)initWithConfiguration:(id)a3 possibleTimeConfiguration:(id)a4 isEditable:(BOOL)a5 isDisabled:(BOOL)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  PKPassShareScheduleSectionController *v16;
  PKPassShareScheduleSectionController *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *tags;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PKPassShareScheduleSectionController;
  v16 = -[PKPassShareSectionController initWithIdentifiers:](&v21, sel_initWithIdentifiers_, MEMORY[0x1E0C9AA60]);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_configuration, a3);
    objc_storeStrong((id *)&v17->_possibleTimeConfiguration, a4);
    v17->_isEditable = a5;
    v17->_isDisabled = a6;
    objc_storeStrong((id *)&v17->_delegate, a7);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tags = v17->_tags;
    v17->_tags = v18;

    -[PKPassShareScheduleSectionController _updateRowsIfNecessary](v17, "_updateRowsIfNecessary");
  }

  return v17;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
  -[PKPassShareScheduleSectionController _updateRowsIfNecessary](self, "_updateRowsIfNecessary");
}

- (void)setIsDisabled:(BOOL)a3
{
  if (self->_isDisabled != a3)
  {
    self->_isDisabled = a3;
    -[PKPassShareScheduleSectionController _updateRowsIfNecessary](self, "_updateRowsIfNecessary");
  }
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_msgSend(v4, "hasDayPicker");
  v6 = (void *)MEMORY[0x1E0DC35C8];
  if (v5)
  {
    v7 = objc_opt_class();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__PKPassShareScheduleSectionController_cellRegistrationForItem___block_invoke;
    v15[3] = &unk_1E3E6DAC0;
    v8 = &v16;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v6, "registrationWithCellClass:configurationHandler:", v7, v15);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_class();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__PKPassShareScheduleSectionController_cellRegistrationForItem___block_invoke_2;
    v13[3] = &unk_1E3E62748;
    v8 = &v14;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v6, "registrationWithCellClass:configurationHandler:", v10, v13);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

  return v11;
}

void __64__PKPassShareScheduleSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a2;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "decorateDayPicker:forScheduleRowItem:", v8, v6);

  }
}

void __64__PKPassShareScheduleSectionController_cellRegistrationForItem___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a2;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = (id)objc_msgSend(WeakRetained, "decorateCell:forScheduleRowItem:", v9, v6);

  }
}

- (void)decorateDayPicker:(id)a3 forScheduleRowItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v5, "setDelegate:", self);
  -[PKPassShareTimeConfiguration schedules](self->_configuration, "schedules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPassShareTimeConfiguration schedules](self->_possibleTimeConfiguration, "schedules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "daysOfWeek");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "daysOfWeek");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedDays:possibleDays:", v10, v11);

}

- (id)decorateCell:(id)a3 forScheduleRowItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void **v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(v7, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecondaryText:", v10);

  objc_msgSend(v7, "icon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "setImage:", v11);
    objc_msgSend(v8, "imageProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("number.circle.fill"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v13);

    objc_msgSend(v8, "imageProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v14);

  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 8.0);
  objc_msgSend(v6, "setContentConfiguration:", v8);
  v15 = objc_msgSend(v7, "userInteractionEnabled");
  if (objc_msgSend(v7, "hasToggle"))
  {
    v16 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    objc_msgSend(v16, "setOn:", objc_msgSend(v7, "isOn"));
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "hash"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setTag:", objc_msgSend(v19, "unsignedIntegerValue"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tags, "setObject:forKeyedSubscript:", v7, v19);
    objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel_toggleValueChanged_, 4096);
    objc_msgSend(v16, "setEnabled:", v15);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v16, 1);
    objc_msgSend(v20, "setMaintainsFixedSize:", 1);
    v32[0] = v20;
    v21 = (void *)MEMORY[0x1E0C99D20];
    v22 = (void **)v32;
LABEL_8:
    objc_msgSend(v21, "arrayWithObjects:count:", v22, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessories:", v28);

LABEL_12:
    goto LABEL_13;
  }
  if (objc_msgSend(v7, "hasTimePicker"))
  {
    v16 = objc_alloc_init(MEMORY[0x1E0DC36F0]);
    objc_msgSend(v16, "setDatePickerMode:", 0);
    objc_msgSend(v16, "setPreferredDatePickerStyle:", 3);
    objc_msgSend(v7, "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDate:", v23);

    objc_msgSend(v7, "minimumDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMinimumDate:", v24);

    objc_msgSend(v7, "maximumDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMaximumDate:", v25);

    objc_msgSend(v16, "setMinuteInterval:", 60);
    objc_msgSend(v16, "setRoundsToMinuteInterval:", 1);
    objc_msgSend(v16, "setEnabled:", v15);
    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "title");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "hash"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setTag:", objc_msgSend(v19, "unsignedIntegerValue"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tags, "setObject:forKeyedSubscript:", v7, v19);
    objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel_timePickerValueDidChange_, 4096);
    +[PKDatePickerCellAccessory accessoryWithDatePicker:](PKDatePickerCellAccessory, "accessoryWithDatePicker:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v20;
    v21 = (void *)MEMORY[0x1E0C99D20];
    v22 = &v31;
    goto LABEL_8;
  }
  if ((v15 & 1) != 0 || objc_msgSend(v7, "isSelectable"))
  {
    v16 = objc_alloc_init(MEMORY[0x1E0DC3568]);
    v30 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessories:", v19);
    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend(v6, "setConfigurationUpdateHandler:", &__block_literal_global_108);
  objc_msgSend(v6, "setUserInteractionEnabled:", !self->_isDisabled);

  return v8;
}

void __72__PKPassShareScheduleSectionController_decorateCell_forScheduleRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)MEMORY[0x1E0DC34D8];
  v5 = a2;
  objc_msgSend(v4, "listGroupedCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isHighlighted") & 1) != 0 || (objc_msgSend(v9, "isSelected") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v5, "setBackgroundConfiguration:", v6);
}

- (void)timePickerValueDidChange:(id)a3
{
  id v4;
  NSMutableDictionary *tags;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  void *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  PKPassShareTimeConfiguration *configuration;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  tags = self->_tags;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "tag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](tags, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassShareTimeConfiguration schedules](self->_configuration, "schedules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D66F48], "emptySchedule");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v12, "hoursOfDay");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = (void *)MEMORY[0x1E0C9AA60];
  if (v13)
    v15 = (void *)v13;
  v16 = v15;

  v48 = v4;
  objc_msgSend(v4, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "identifier");
  v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v46 = v16;
  v47 = v7;
  if (v19 == CFSTR("StartHourRow")
    || (v20 = v19) != 0
    && (v21 = -[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("StartHourRow")),
        v20,
        v20,
        v21))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (__CFString *)(objc_msgSend(v22, "component:fromDate:", 32, v17) + 1);

    objc_msgSend(v16, "lastObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "integerValue");

    goto LABEL_16;
  }
  objc_msgSend(v7, "identifier");
  v26 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v26 != CFSTR("EndHourRow"))
  {
    v23 = v26;
    if (v26)
    {
      v27 = -[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("EndHourRow"));

      if (v27)
        goto LABEL_13;
      v23 = 0;
    }
    v25 = 0;
    goto LABEL_20;
  }
LABEL_13:
  objc_msgSend(v16, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (__CFString *)objc_msgSend(v28, "integerValue");

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "component:fromDate:", 32, v17);

  if (v30)
    v25 = v30;
  else
    v25 = 24;
LABEL_16:
  if ((uint64_t)v23 > v25)
  {
    objc_msgSend(v7, "date");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v48;
    objc_msgSend(v48, "setDate:animated:", v31, 1);

    goto LABEL_26;
  }
LABEL_20:
  v33 = v23;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v34);

    v33 = (__CFString *)((char *)v33 + 1);
  }
  while ((__CFString *)(v25 + 1) != v33);
  objc_msgSend(v12, "setHoursOfDay:", v18);
  PKLogFacilityTypeGetObject();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v51 = v36;
    v52 = 2112;
    v53 = v37;
    v54 = 2112;
    v55 = v18;
    _os_log_impl(&dword_19D178000, v35, OS_LOG_TYPE_DEFAULT, "TimeConfiguration: Updated startHour: %@ endHour: %@. New Hours: %@", buf, 0x20u);

  }
  configuration = self->_configuration;
  v49 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareTimeConfiguration setSchedules:](configuration, "setSchedules:", v39);

  -[PKPassShareScheduleSectionControllerDelegate timeConfigurationDidChange:](self->_delegate, "timeConfigurationDidChange:", self->_configuration);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "component:fromDate:", 64, v17);

  v32 = v48;
  if (v41 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "components:fromDate:", 96, v17);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "setMinute:", 0);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "dateFromComponents:", v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setDate:animated:", v45, 1);

  }
LABEL_26:

}

- (void)toggleValueChanged:(id)a3
{
  NSMutableDictionary *tags;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  PKPassShareTimeConfiguration **p_configuration;
  void *v14;
  void *v15;
  PKPassShareTimeConfiguration *v16;
  void *v17;
  void **v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  tags = self->_tags;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "tag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](tags, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIsOn:", objc_msgSend(v6, "isOn"));
  v9 = objc_msgSend(v6, "isOn");

  objc_msgSend(v8, "identifier");
  v10 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v10 == CFSTR("DaysOfWeekRow")
    || (v11 = v10) != 0
    && (v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("DaysOfWeekRow")),
        v11,
        v11,
        v12))
  {
    p_configuration = &self->_configuration;
    -[PKPassShareTimeConfiguration schedules](self->_configuration, "schedules");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v15, "setDaysOfWeek:", 0);
      goto LABEL_18;
    }
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0D66F48], "emptySchedule");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "setDaysOfWeek:", MEMORY[0x1E0C9AA60]);
    v16 = *p_configuration;
    v25[0] = v15;
    v17 = (void *)MEMORY[0x1E0C99D20];
    v18 = (void **)v25;
LABEL_15:
    objc_msgSend(v17, "arrayWithObjects:count:", v18, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareTimeConfiguration setSchedules:](v16, "setSchedules:", v23);

LABEL_18:
    -[PKPassShareScheduleSectionControllerDelegate timeConfigurationDidChange:](self->_delegate, "timeConfigurationDidChange:", *p_configuration);

    goto LABEL_19;
  }
  objc_msgSend(v8, "identifier");
  v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v19 == CFSTR("HoursOfDayRow")
    || (v20 = v19) != 0
    && (v21 = -[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("HoursOfDayRow")),
        v20,
        v20,
        v21))
  {
    p_configuration = &self->_configuration;
    -[PKPassShareTimeConfiguration schedules](self->_configuration, "schedules");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v15, "setHoursOfDay:", 0);
      goto LABEL_18;
    }
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0D66F48], "emptySchedule");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "setHoursOfDay:", &unk_1E3FAE7A0);
    v16 = *p_configuration;
    v24 = v15;
    v17 = (void *)MEMORY[0x1E0C99D20];
    v18 = &v24;
    goto LABEL_15;
  }
LABEL_19:
  -[PKPassShareScheduleSectionController _updateRowsIfNecessary](self, "_updateRowsIfNecessary");
  -[PKPassShareScheduleSectionControllerDelegate reloadDataAnimated:](self->_delegate, "reloadDataAnimated:", 1);

}

- (void)didSelectItem:(id)a3
{
  int v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  id v12;

  v12 = a3;
  v4 = objc_msgSend(v12, "isSelectable");
  v5 = v12;
  if (v4)
  {
    objc_msgSend(v12, "identifier");
    v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 != CFSTR("StartDateRow"))
    {
      if (!v6)
      {
LABEL_6:

        v5 = v12;
        goto LABEL_7;
      }
      v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("StartDateRow"));

      if (!v8)
      {
        v9 = v7;
        if (v9 == CFSTR("EndDateRow")
          || (v10 = v9,
              v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("EndDateRow")),
              v10,
              v11))
        {
          -[PKPassShareScheduleSectionControllerDelegate didSelectEditEndDate](self->_delegate, "didSelectEditEndDate");
        }
        goto LABEL_6;
      }
    }
    -[PKPassShareScheduleSectionControllerDelegate didSelectEditStartDate](self->_delegate, "didSelectEditStartDate");
    goto LABEL_6;
  }
LABEL_7:

}

- (BOOL)shouldHighlightItem:(id)a3
{
  return objc_msgSend(a3, "isSelectable");
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  int *v7;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  if ((PKEqualObjects() & 1) != 0)
  {
    v7 = &OBJC_IVAR___PKPassShareScheduleSectionController__dayRowItems;
LABEL_5:
    objc_msgSend(v6, "appendItems:", *(Class *)((char *)&self->super.super.super.isa + *v7));
    goto LABEL_6;
  }
  if (PKEqualObjects())
  {
    v7 = &OBJC_IVAR___PKPassShareScheduleSectionController__dateRowItems;
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_showTimeLimitHeader)
    goto LABEL_10;
  -[PKPaymentSetupListSectionController identifiers](self, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v8 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (!v7 || !v6)
    {

LABEL_10:
      v15 = 0;
      goto LABEL_11;
    }
    v9 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_10;
  }
  PKLocalizedShareableCredentialString(CFSTR("SHARE_SCHEDULES_TIME_LIMIT_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  v17[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48F8], 2, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v17[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithString:attributes:", v10, v14);

LABEL_11:
  return v15;
}

- (void)_updateRowsIfNecessary
{
  unint64_t v3;
  id v4;
  NSMutableArray *v5;
  PKPassShareScheduleRowItem *v6;
  void *v7;
  void *v8;
  PKPassShareScheduleRowItem *v9;
  void *v10;
  void *v11;
  void *v12;
  PKPassShareScheduleRowItem *v13;
  PKPassShareScheduleRowItem *v14;
  void *v15;
  void *v16;
  PKPassShareScheduleRowItem *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD);
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void (**v34)(_QWORD);
  void (**v35)(void *, void *, const __CFString *, uint64_t);
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSMutableArray *dayRowItems;
  PKPassShareScheduleRowItem *v41;
  void *v42;
  PKPassShareScheduleRowItem *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  PKPassShareScheduleRowItem *v48;
  void *v49;
  PKPassShareScheduleRowItem *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSArray *v55;
  NSArray *dateRowItems;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  unint64_t v66;
  id v67;
  NSMutableArray *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  PKPassShareScheduleSectionController *v72;
  NSMutableArray *v73;
  id v74;
  _QWORD aBlock[4];
  id v76;
  id v77;
  _QWORD v78[4];

  v78[2] = *MEMORY[0x1E0C80C00];
  v3 = -[PKPassShareTimeConfiguration support](self->_possibleTimeConfiguration, "support");
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v3 > 1
    || !self->_isEditable
    && (-[PKPassShareTimeConfiguration schedules](self->_configuration, "schedules"),
        v57 = (void *)objc_claimAutoreleasedReturnValue(),
        v57,
        v57))
  {
    v66 = v3;
    v67 = v4;
    objc_msgSend(v4, "addObject:", CFSTR("DayModifierSection"));
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = [PKPassShareScheduleRowItem alloc];
    PKLocalizedShareableCredentialString(CFSTR("SHARE_SCHEDULE_DAYS_OF_WEEK_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("calendar"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKPassShareScheduleRowItem initWithTitle:icon:](v6, "initWithTitle:icon:", v7, v8);

    -[PKPassShareScheduleRowItem setIdentifier:](v9, "setIdentifier:", CFSTR("DaysOfWeekRow"));
    -[PKPassShareScheduleRowItem setSelectable:](v9, "setSelectable:", 0);
    objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareScheduleRowItem setConfiguration:](v9, "setConfiguration:", v10);

    -[PKPassShareScheduleRowItem setHasToggle:](v9, "setHasToggle:", 1);
    -[PKPassShareScheduleRowItem setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", self->_isEditable);
    v68 = v5;
    -[NSMutableArray addObject:](v5, "addObject:", v9);
    -[PKPassShareTimeConfiguration schedules](self->_configuration, "schedules");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "daysOfWeek");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64 && !self->_isDisabled)
    {
      -[PKPassShareScheduleRowItem setIsOn:](v9, "setIsOn:", 1);
      v13 = -[PKPassShareScheduleRowItem initWithTitle:icon:]([PKPassShareScheduleRowItem alloc], "initWithTitle:icon:", 0, 0);
      -[PKPassShareScheduleRowItem setIdentifier:](v13, "setIdentifier:", CFSTR("DaysSelectionRow"));
      -[PKPassShareScheduleRowItem setHasDayPicker:](v13, "setHasDayPicker:", 1);
      -[PKPassShareScheduleRowItem setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", self->_isEditable);
      -[NSMutableArray addObject:](v5, "addObject:", v13);

    }
    v14 = [PKPassShareScheduleRowItem alloc];
    PKLocalizedShareableCredentialString(CFSTR("SHARE_SCHEDULE_TIME_OF_DAY_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("clock.fill"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PKPassShareScheduleRowItem initWithTitle:icon:](v14, "initWithTitle:icon:", v15, v16);

    -[PKPassShareScheduleRowItem setIdentifier:](v17, "setIdentifier:", CFSTR("HoursOfDayRow"));
    -[PKPassShareScheduleRowItem setSelectable:](v17, "setSelectable:", 0);
    objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareScheduleRowItem setConfiguration:](v17, "setConfiguration:", v18);

    -[PKPassShareScheduleRowItem setHasToggle:](v17, "setHasToggle:", 1);
    -[PKPassShareScheduleRowItem setUserInteractionEnabled:](v17, "setUserInteractionEnabled:", self->_isEditable);
    -[NSMutableArray addObject:](v5, "addObject:", v17);
    v65 = v12;
    objc_msgSend(v12, "hoursOfDay");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareTimeConfiguration schedules](self->_possibleTimeConfiguration, "schedules");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hoursOfDay");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 && !self->_isDisabled)
    {
      -[PKPassShareScheduleRowItem setIsOn:](v17, "setIsOn:", 1);
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "components:fromDate:", 96, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "setMinute:", 0);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__PKPassShareScheduleSectionController__updateRowsIfNecessary__block_invoke;
      aBlock[3] = &unk_1E3E6DB08;
      v76 = v26;
      v77 = v23;
      v63 = v23;
      v62 = v26;
      v27 = (void (**)(_QWORD))_Block_copy(aBlock);
      objc_msgSend(v22, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "integerValue");

      v30 = 0;
      if (objc_msgSend(v22, "count") && v29 != 1)
      {
        v27[2](v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "lastObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "integerValue");

      v33 = 0;
      if (objc_msgSend(v22, "count") && v32 != 24)
      {
        ((void (*)(void (**)(_QWORD), uint64_t))v27[2])(v27, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __62__PKPassShareScheduleSectionController__updateRowsIfNecessary__block_invoke_2;
      v69[3] = &unk_1E3E6DB30;
      v70 = v30;
      v71 = v33;
      v74 = v27;
      v72 = self;
      v73 = v68;
      v61 = v33;
      v60 = v30;
      v34 = v27;
      v35 = (void (**)(void *, void *, const __CFString *, uint64_t))_Block_copy(v69);
      PKLocalizedShareableCredentialString(CFSTR("SHARE_SCHEDULE_START_TIME_TITLE"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2](v35, v36, CFSTR("StartHourRow"), objc_msgSend(v37, "integerValue") - 1);

      PKLocalizedShareableCredentialString(CFSTR("SHARE_SCHEDULE_END_TIME_TITLE"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2](v35, v38, CFSTR("EndHourRow"), objc_msgSend(v39, "integerValue"));

    }
    dayRowItems = self->_dayRowItems;
    self->_dayRowItems = v68;

    v3 = v66;
    v4 = v67;
  }
  if (!v3)
  {
    if (self->_isEditable)
      goto LABEL_19;
    -[PKPassShareTimeConfiguration startDate](self->_configuration, "startDate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {

    }
    else
    {
      -[PKPassShareTimeConfiguration expirationDate](self->_configuration, "expirationDate");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v59)
        goto LABEL_19;
    }
  }
  objc_msgSend(v4, "addObject:", CFSTR("DateModifierSection"), v60);
  v41 = [PKPassShareScheduleRowItem alloc];
  PKLocalizedShareableCredentialString(CFSTR("SHARE_SCHEDULE_START_DATE_TITLE"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[PKPassShareScheduleRowItem initWithTitle:icon:](v41, "initWithTitle:icon:", v42, 0);

  -[PKPassShareScheduleRowItem setIdentifier:](v43, "setIdentifier:", CFSTR("StartDateRow"));
  -[PKPassShareScheduleRowItem setSelectable:](v43, "setSelectable:", self->_isEditable);
  -[PKPassShareScheduleRowItem setUserInteractionEnabled:](v43, "setUserInteractionEnabled:", self->_isEditable);
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareScheduleRowItem setConfiguration:](v43, "setConfiguration:", v44);

  -[PKPassShareTimeConfiguration startDate](self->_configuration, "startDate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareScheduleSectionController _formattedDate:](self, "_formattedDate:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareScheduleRowItem setValue:](v43, "setValue:", v46);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("calendar"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareScheduleRowItem setIcon:](v43, "setIcon:", v47);

  v48 = [PKPassShareScheduleRowItem alloc];
  PKLocalizedShareableCredentialString(CFSTR("SHARE_SCHEDULE_EXPIRATION_DATE_TITLE"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[PKPassShareScheduleRowItem initWithTitle:icon:](v48, "initWithTitle:icon:", v49, 0);

  -[PKPassShareScheduleRowItem setIdentifier:](v50, "setIdentifier:", CFSTR("EndDateRow"));
  -[PKPassShareScheduleRowItem setSelectable:](v50, "setSelectable:", self->_isEditable);
  -[PKPassShareScheduleRowItem setUserInteractionEnabled:](v50, "setUserInteractionEnabled:", self->_isEditable);
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareScheduleRowItem setConfiguration:](v50, "setConfiguration:", v51);

  -[PKPassShareTimeConfiguration expirationDate](self->_configuration, "expirationDate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareScheduleSectionController _formattedDate:](self, "_formattedDate:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareScheduleRowItem setValue:](v50, "setValue:", v53);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("calendar"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareScheduleRowItem setIcon:](v50, "setIcon:", v54);

  v78[0] = v43;
  v78[1] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
  v55 = (NSArray *)objc_claimAutoreleasedReturnValue();
  dateRowItems = self->_dateRowItems;
  self->_dateRowItems = v55;

LABEL_19:
  -[PKPaymentSetupListSectionController setIdentifiers:](self, "setIdentifiers:", v4, v60);

}

uint64_t __62__PKPassShareScheduleSectionController__updateRowsIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setHour:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "dateFromComponents:", *(_QWORD *)(a1 + 32));
}

void __62__PKPassShareScheduleSectionController__updateRowsIfNecessary__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  PKPassShareScheduleRowItem *v9;

  v5 = a3;
  v6 = a2;
  v9 = -[PKPassShareScheduleRowItem initWithTitle:icon:]([PKPassShareScheduleRowItem alloc], "initWithTitle:icon:", v6, 0);

  -[PKPassShareScheduleRowItem setIdentifier:](v9, "setIdentifier:", v5);
  -[PKPassShareScheduleRowItem setSelectable:](v9, "setSelectable:", 0);
  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareScheduleRowItem setConfiguration:](v9, "setConfiguration:", v7);

  -[PKPassShareScheduleRowItem setHasTimePicker:](v9, "setHasTimePicker:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareScheduleRowItem setDate:](v9, "setDate:", v8);

  -[PKPassShareScheduleRowItem setMinimumDate:](v9, "setMinimumDate:", *(_QWORD *)(a1 + 32));
  -[PKPassShareScheduleRowItem setMaximumDate:](v9, "setMaximumDate:", *(_QWORD *)(a1 + 40));
  -[PKPassShareScheduleRowItem setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 104));
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);

}

- (id)_formattedDate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;
  NSDateFormatter *formatter;
  NSDateFormatter *v10;
  NSDateFormatter *v11;
  void *v12;

  v4 = a3;
  if (!v4)
  {
    v7 = CFSTR("SHARE_SCHEDULE_DATE_NEVER");
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDateInToday:", v4);

  if (v6)
  {
    v7 = CFSTR("SHARE_SCHEDULE_DATE_TODAY");
LABEL_5:
    PKLocalizedShareableCredentialString(&v7->isa);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  formatter = self->_formatter;
  if (!formatter)
  {
    v10 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v11 = self->_formatter;
    self->_formatter = v10;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_formatter, "setLocalizedDateFormatFromTemplate:", CFSTR("E, d MMM, yyyy"));
    formatter = self->_formatter;
  }
  -[NSDateFormatter stringFromDate:](formatter, "stringFromDate:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v12 = (void *)v8;

  return v12;
}

- (void)weekdaySelector:(id)a3 didUpdateSelectedWeekdays:(id)a4
{
  PKPassShareTimeConfiguration *configuration;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  PKPassShareTimeConfiguration *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  configuration = self->_configuration;
  v6 = a4;
  -[PKPassShareTimeConfiguration schedules](configuration, "schedules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D66F48], "emptySchedule");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v11, "setDaysOfWeek:", v6);
  v12 = self->_configuration;
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareTimeConfiguration setSchedules:](v12, "setSchedules:", v13);

  -[PKPassShareScheduleSectionControllerDelegate timeConfigurationDidChange:](self->_delegate, "timeConfigurationDidChange:", self->_configuration);
}

- (PKPassShareTimeConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (BOOL)showTimeLimitHeader
{
  return self->_showTimeLimitHeader;
}

- (void)setShowTimeLimitHeader:(BOOL)a3
{
  self->_showTimeLimitHeader = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_possibleTimeConfiguration, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_dateRowItems, 0);
  objc_storeStrong((id *)&self->_dayRowItems, 0);
}

@end
