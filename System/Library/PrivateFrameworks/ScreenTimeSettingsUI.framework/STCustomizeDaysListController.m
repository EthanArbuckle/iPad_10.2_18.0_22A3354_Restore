@implementation STCustomizeDaysListController

- (STCustomizeDaysListController)init
{
  STCustomizeDaysListController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STCustomizeDaysListController;
  v2 = -[STCustomizeDaysListController init](&v6, sel_init);
  if (v2)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AllowanceCustomizeDaysSpecifierName"), &stru_24DB8A1D0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCustomizeDaysListController setTitle:](v2, "setTitle:", v4);

  }
  return v2;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[16];

  v3 = a3;
  -[STCustomizeDaysListController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[STCustomizeDaysListController timeByDay](self, "timeByDay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customizeDaysListController:didFinishEditingTimeByDay:", self, v6);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STCustomizeDaysListController.viewWillDisappear", buf, 2u);
  }
  v7.receiver = self;
  v7.super_class = (Class)STCustomizeDaysListController;
  -[STCustomizeDaysListController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);

}

- (id)_localizedDayOrder
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned int i;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "firstWeekday");

  for (i = 8; i > 1; --i)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

    if ((unint64_t)(v4 + 1) <= 7)
      ++v4;
    else
      v4 = 1;
  }
  v7 = (void *)objc_msgSend(v2, "copy");

  return v7;
}

- (id)_localizedDayNames
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setFormattingContext:", 3);
  objc_msgSend(v2, "standaloneWeekdaySymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)specifiers
{
  STCustomizeDaysListController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  STCustomizeDaysListController *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v2 = self;
  v32 = *MEMORY[0x24BDAC8D0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v25 = (int)*MEMORY[0x24BE756E0];
    -[STCustomizeDaysListController setSelectedDaySpecifier:](v2, "setSelectedDaySpecifier:", 0);
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24DB8A1D0, v2, 0, 0, 0, 4, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v6);

    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE754D8], "preferredHeight");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75D10]);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    v24 = v4;
    -[STCustomizeDaysListController setTimePickerSpecifier:](v2, "setTimePickerSpecifier:", v4);
    -[STCustomizeDaysListController _localizedDayNames](v2, "_localizedDayNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCustomizeDaysListController _localizedDayOrder](v2, "_localizedDayOrder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v10;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(obj);
          v16 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v15), "unsignedIntegerValue");
          objc_msgSend(v9, "objectAtIndex:", v16 - 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, v2, 0, sel_budgetTime_, 0, 4, 0);
          v18 = v2;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setUserInfo:", v20);

          objc_msgSend(v11, "addObject:", v19);
          v2 = v18;

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v13);
    }

    v21 = objc_msgSend(v11, "copy");
    v22 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v25);
    *(Class *)((char *)&v2->super.super.super.super.super.isa + v25) = (Class)v21;

    v3 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v25);
  }
  return v3;
}

- (void)_showOrHidePickerSpecifierForSpecifier:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  id v24;

  v24 = a3;
  v4 = *MEMORY[0x24BE75D18];
  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCustomizeDaysListController selectedDaySpecifier](self, "selectedDaySpecifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v24)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellGrayTextColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detailTextLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextColor:", v19);

    -[STCustomizeDaysListController timePickerSpecifier](self, "timePickerSpecifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCustomizeDaysListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v21, 1);

    -[STCustomizeDaysListController selectedDaySpecifier](self, "selectedDaySpecifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCustomizeDaysListController highlightSpecifierWithID:](self, "highlightSpecifierWithID:", v23);

    -[STCustomizeDaysListController setSelectedDaySpecifier:](self, "setSelectedDaySpecifier:", 0);
  }
  else
  {
    -[STCustomizeDaysListController selectedDaySpecifier](self, "selectedDaySpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "detailTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v10);

    objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellBlueTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detailTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v12);

    -[STCustomizeDaysListController setSelectedDaySpecifier:](self, "setSelectedDaySpecifier:", v24);
    -[STCustomizeDaysListController timePickerSpecifier](self, "timePickerSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCustomizeDaysListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v14, 1);

    -[STCustomizeDaysListController timePickerSpecifier](self, "timePickerSpecifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCustomizeDaysListController selectedDaySpecifier](self, "selectedDaySpecifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCustomizeDaysListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v15, v16, 1);

    -[STCustomizeDaysListController selectedDaySpecifier](self, "selectedDaySpecifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCustomizeDaysListController highlightSpecifierWithID:](self, "highlightSpecifierWithID:", v18);

  }
}

- (id)budgetTime:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  __CFString *v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCustomizeDaysListController timeByDay](self, "timeByDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[STAllowance timeIntervalForAllowanceDateComponents:](STAllowance, "timeIntervalForAllowanceDateComponents:", v6);
    v8 = v7;
    objc_msgSend(MEMORY[0x24BDD14F8], "st_sharedShortDynamicDateFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromTimeInterval:", v8);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &stru_24DB8A1D0;
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = -[STCustomizeDaysListController indexForIndexPath:](self, "indexForIndexPath:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[STCustomizeDaysListController timePickerSpecifier](self, "timePickerSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
    -[STCustomizeDaysListController _showOrHidePickerSpecifierForSpecifier:](self, "_showOrHidePickerSpecifierForSpecifier:", v9);
  v11.receiver = self;
  v11.super_class = (Class)STCustomizeDaysListController;
  -[STCustomizeDaysListController tableView:didSelectRowAtIndexPath:](&v11, sel_tableView_didSelectRowAtIndexPath_, v6, v7);

}

- (void)datePickerChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "components:fromDate:", 96, v6);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[STCustomizeDaysListController selectedDaySpecifier](self, "selectedDaySpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[STCustomizeDaysListController timeByDay](self, "timeByDay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v8);
  v11 = (void *)objc_msgSend(v10, "copy");
  -[STCustomizeDaysListController setTimeByDay:](self, "setTimeByDay:", v11);

  -[STCustomizeDaysListController selectedDaySpecifier](self, "selectedDaySpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCustomizeDaysListController reloadSpecifier:](self, "reloadSpecifier:", v12);

  -[STCustomizeDaysListController selectedDaySpecifier](self, "selectedDaySpecifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellBlueTextColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "detailTextLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v15);

}

- (id)datePickerForSpecifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v4 = (objc_class *)MEMORY[0x24BEBD520];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v7, "setPreferredDatePickerStyle:", 1);
  objc_msgSend(v7, "setDatePickerMode:", 3);
  v8 = (void *)objc_opt_new();
  -[STCustomizeDaysListController timePickerSpecifier](self, "timePickerSpecifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v5)
  {
    -[STCustomizeDaysListController selectedDaySpecifier](self, "selectedDaySpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[STCustomizeDaysListController timeByDay](self, "timeByDay");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = v13;

      v8 = v14;
    }

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[STCustomizeDaysListController datePickerForSpecifier:].cold.1();
  }
  objc_msgSend(v7, "calendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateFromComponents:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDate:animated:", v16, 1);

  return v7;
}

- (STCustomizeDaysListControllerDelegate)delegate
{
  return (STCustomizeDaysListControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)timeByDay
{
  return self->_timeByDay;
}

- (void)setTimeByDay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1384);
}

- (PSSpecifier)timePickerSpecifier
{
  return self->_timePickerSpecifier;
}

- (void)setTimePickerSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_timePickerSpecifier, a3);
}

- (PSSpecifier)selectedDaySpecifier
{
  return self->_selectedDaySpecifier;
}

- (void)setSelectedDaySpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_selectedDaySpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedDaySpecifier, 0);
  objc_storeStrong((id *)&self->_timePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_timeByDay, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)datePickerForSpecifier:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Trying to get date picker for invalid specifier.", v0, 2u);
}

@end
