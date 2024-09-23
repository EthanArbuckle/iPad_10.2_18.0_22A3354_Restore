@implementation SCLTimeIntervalDataSource

- (SCLTimeIntervalDataSource)initWithListController:(id)a3 timeIntervals:(id)a4
{
  id v6;
  id v7;
  SCLSettingsViewModel *v8;
  SCLTimeIntervalDataSource *v9;
  SCLTimeIntervalModel *v10;
  SCLTimeIntervalModel *model;
  NSMutableArray *v12;
  NSMutableArray *intervalGroupSpecifiers;
  SCLScheduleTimeFormatter *v14;
  SCLScheduleTimeFormatter *scheduleTimeFormatter;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(SCLSettingsViewModel);
  v17.receiver = self;
  v17.super_class = (Class)SCLTimeIntervalDataSource;
  v9 = -[SCLSpecifierDataSource initWithListController:viewModel:](&v17, sel_initWithListController_viewModel_, v6, v8);

  if (v9)
  {
    v10 = -[SCLTimeIntervalModel initWithTimeIntervals:]([SCLTimeIntervalModel alloc], "initWithTimeIntervals:", v7);
    model = v9->_model;
    v9->_model = v10;

    objc_msgSend(v6, "setWantsEditingMode:", 1);
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    intervalGroupSpecifiers = v9->_intervalGroupSpecifiers;
    v9->_intervalGroupSpecifiers = v12;

    v14 = (SCLScheduleTimeFormatter *)objc_alloc_init(MEMORY[0x24BE84200]);
    scheduleTimeFormatter = v9->_scheduleTimeFormatter;
    v9->_scheduleTimeFormatter = v14;

    -[SCLTimeIntervalDataSource loadSpecifiers](v9, "loadSpecifiers");
  }

  return v9;
}

- (NSArray)timeIntervals
{
  void *v2;
  void *v3;

  -[SCLTimeIntervalDataSource model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTimeIntervals:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[SCLTimeIntervalModel timeIntervals](self->_model, "timeIntervals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v11, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[SCLTimeIntervalModel setTimeIntervals:](self->_model, "setTimeIntervals:", v11);
    -[NSMutableArray removeAllObjects](self->_intervalGroupSpecifiers, "removeAllObjects");
    -[SCLTimeIntervalDataSource model](self, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervals");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    -[SCLTimeIntervalDataSource model](self, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLTimeIntervalDataSource model:didAddIntervalAtIndexes:](self, "model:didAddIntervalAtIndexes:", v9, v10);

    -[SCLTimeIntervalDataSource applySpecifiers](self, "applySpecifiers");
  }

}

- (void)loadSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *addIntervalGroupSpecifiers;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("schooltime.addinterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SCHEDULE_EDITOR_ADD_TIME_INTERVAL"), CFSTR("Add Time"), CFSTR("SchoolTimeSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, -1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  v7 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SCLListControllerEditingEnabled"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24E716BC8, CFSTR("SCLListControllerCellEditingStyle"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75A18]);
  objc_msgSend(v6, "setButtonAction:", sel_addInterval_);
  v15[0] = v3;
  v15[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  addIntervalGroupSpecifiers = self->_addIntervalGroupSpecifiers;
  self->_addIntervalGroupSpecifiers = v8;

  -[SCLTimeIntervalDataSource model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervals");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  -[SCLTimeIntervalDataSource model](self, "model");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLTimeIntervalDataSource model:didAddIntervalAtIndexes:](self, "model:didAddIntervalAtIndexes:", v13, v14);

  -[SCLTimeIntervalDataSource applySpecifiers](self, "applySpecifiers");
}

- (void)applySpecifiers
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "addObjectsFromArray:", self->_intervalGroupSpecifiers);
  objc_msgSend(v3, "addObjectsFromArray:", self->_addIntervalGroupSpecifiers);
  -[SCLSpecifierDataSource setSpecifiers:](self, "setSpecifiers:", v3);

}

- (id)createSpecifiersForIntervalsAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id from;
  _QWORD v26[4];
  id v27;
  id location;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Group-%@"), v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, sel_setTimeInterval_forSpecifier_, 0, 0, -1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Interval-%@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75AC0]);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_scheduleTimeFormatter, CFSTR("SCLTimeIntervalTableViewCellScheduleTimeFormatter"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_model, CFSTR("SCLTimeIntervalTableViewCellDateConverter"));
  -[SCLTimeIntervalDataSource configureSpecifier:forIndex:](self, "configureSpecifier:forIndex:", v7, a3);
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __65__SCLTimeIntervalDataSource_createSpecifiersForIntervalsAtIndex___block_invoke;
  v26[3] = &unk_24E712088;
  objc_copyWeak(&v27, &location);
  v10 = (void *)objc_msgSend(v26, "copy");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("SCLTimeIntervalTableViewCellPickerStateHandler"));

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SCHEDULE_EDITOR_DELETE_TIME_INTERVAL_SWIPE_ACTION_TITLE"), CFSTR("Delete"), CFSTR("SchoolTimeSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&from, v7);
  v13 = (void *)MEMORY[0x24BDF6990];
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __65__SCLTimeIntervalDataSource_createSpecifiersForIntervalsAtIndex___block_invoke_38;
  v22[3] = &unk_24E7120B0;
  objc_copyWeak(&v23, &location);
  objc_copyWeak(&v24, &from);
  objc_msgSend(v13, "contextualActionWithStyle:title:handler:", 1, v12, v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDF6E10];
  v30[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configurationWithActions:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("SCLListControllerTrailingSwipeActionsConfiguration"));
  v29[0] = v20;
  v29[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v18;
}

void __65__SCLTimeIntervalDataSource_createSpecifiersForIntervalsAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "listController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginUpdates");

  objc_msgSend(v5, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("SCLTimeIntervalTableViewCellPickerState"));

  v20 = v5;
  objc_msgSend(v5, "reloadWithSpecifier:animated:", v8, 1);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = WeakRetained;
  objc_msgSend(WeakRetained, "intervalSpecifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    v14 = *MEMORY[0x24BE75D18];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
        if (v8 != v16)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15), "setObject:forKeyedSubscript:", &unk_24E716BE0, CFSTR("SCLTimeIntervalTableViewCellPickerState"));
          objc_msgSend(v16, "propertyForKey:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "reloadWithSpecifier:animated:", v16, 1);

        }
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  objc_msgSend(v19, "listController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "endUpdates");

}

void __65__SCLTimeIntervalDataSource_createSpecifiersForIntervalsAtIndex___block_invoke_38(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  id v6;
  void *v7;
  void (**v8)(id, uint64_t);

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = v6;
  if (WeakRetained && v6)
    objc_msgSend(WeakRetained, "removeIntervalForSpecifier:", v6);
  v8[2](v8, 1);

}

- (void)reconfigureAllSpecifiers
{
  void *v3;
  _QWORD v4[5];

  -[SCLTimeIntervalDataSource intervalSpecifiers](self, "intervalSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__SCLTimeIntervalDataSource_reconfigureAllSpecifiers__block_invoke;
  v4[3] = &unk_24E7120D8;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

uint64_t __53__SCLTimeIntervalDataSource_reconfigureAllSpecifiers__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "configureSpecifier:forIndex:", a2, a3);
}

- (void)configureSpecifier:(id)a3 forIndex:(unint64_t)a4
{
  SCLTimeIntervalModel *model;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  model = self->_model;
  v7 = a3;
  -[SCLTimeIntervalModel timeIntervals](model, "timeIntervals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[SCLTimeIntervalModel constraintIntervals](self->_model, "constraintIntervals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75DA0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SCLTimeIntervalModel canRemoveTimeIntervals](self->_model, "canRemoveTimeIntervals"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("SCLListControllerEditingEnabled"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24E716BF8, CFSTR("SCLListControllerCellEditingStyle"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("SCLTimeIntervalTableViewCellConstrainingInterval"));

}

- (unint64_t)modelIndexForSpecifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[SCLTimeIntervalDataSource intervalSpecifiers](self, "intervalSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (id)intervalSpecifiers
{
  NSMutableArray *intervalGroupSpecifiers;
  void *v3;
  void *v4;

  intervalGroupSpecifiers = self->_intervalGroupSpecifiers;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filteredArrayUsingPredicate:](intervalGroupSpecifiers, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __47__SCLTimeIntervalDataSource_intervalSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BE75DA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)addInterval:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  -[SCLTimeIntervalDataSource model](self, "model", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canAppendTimeInterval");

  if (v5)
  {
    -[SCLTimeIntervalDataSource model](self, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextProposedTimeInterval");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[SCLTimeIntervalDataSource model](self, "model");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendTimeInterval:", v13);

      -[SCLTimeIntervalDataSource model](self, "model");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervals");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count") - 1;

      -[SCLTimeIntervalDataSource model](self, "model");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLTimeIntervalDataSource model:didAddIntervalAtIndexes:](self, "model:didAddIntervalAtIndexes:", v11, v12);

    }
  }
}

- (void)setTimeInterval:(id)a3 forSpecifier:(id)a4
{
  id v6;
  unint64_t v7;
  id v8;

  v6 = a3;
  v7 = -[SCLTimeIntervalDataSource modelIndexForSpecifier:](self, "modelIndexForSpecifier:", a4);
  -[SCLTimeIntervalModel replaceTimeIntervalAtIndex:withTimeInterval:](self->_model, "replaceTimeIntervalAtIndex:withTimeInterval:", v7, v6);

  -[SCLTimeIntervalDataSource model](self, "model");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SCLTimeIntervalDataSource model:didUpdateIntervalAtIndex:](self, "model:didUpdateIntervalAtIndex:", v8, v7);

}

- (void)removeIntervalForSpecifier:(id)a3
{
  unint64_t v4;
  void *v5;
  id v6;

  v4 = -[SCLTimeIntervalDataSource modelIndexForSpecifier:](self, "modelIndexForSpecifier:", a3);
  -[SCLTimeIntervalDataSource model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTimeIntervalAtIndex:", v4);

  -[SCLTimeIntervalDataSource model](self, "model");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SCLTimeIntervalDataSource model:didDeleteIntervalAtIndex:](self, "model:didDeleteIntervalAtIndex:", v6, v4);

}

- (void)notifyDelegateOfModelUpdate
{
  void *v3;
  id v4;

  -[SCLTimeIntervalDataSource delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCLTimeIntervalDataSource timeIntervals](self, "timeIntervals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalDataSource:didUpdateTimeIntervals:", self, v3);

}

- (void)model:(id)a3 didAddIntervalAtIndexes:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a4;
  -[SCLSpecifierDataSource listController](self, "listController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginUpdates");

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__SCLTimeIntervalDataSource_model_didAddIntervalAtIndexes___block_invoke;
  v8[3] = &unk_24E712140;
  v8[4] = self;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v8);

  -[SCLTimeIntervalDataSource reconfigureAllSpecifiers](self, "reconfigureAllSpecifiers");
  -[SCLTimeIntervalDataSource applySpecifiers](self, "applySpecifiers");
  -[SCLSpecifierDataSource listController](self, "listController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endUpdates");

  -[SCLTimeIntervalDataSource notifyDelegateOfModelUpdate](self, "notifyDelegateOfModelUpdate");
}

void __59__SCLTimeIntervalDataSource_model_didAddIntervalAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "createSpecifiersForIntervalsAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObjectsFromArray:", v3);

}

- (void)model:(id)a3 didDeleteIntervalAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *intervalGroupSpecifiers;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  -[SCLSpecifierDataSource listController](self, "listController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginUpdates");

  -[SCLTimeIntervalDataSource intervalSpecifiers](self, "intervalSpecifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLSpecifierDataSource listController](self, "listController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getGroupSpecifierForSpecifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  intervalGroupSpecifiers = self->_intervalGroupSpecifiers;
  v14[0] = v8;
  v14[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInArray:](intervalGroupSpecifiers, "removeObjectsInArray:", v12);

  -[SCLTimeIntervalDataSource reconfigureAllSpecifiers](self, "reconfigureAllSpecifiers");
  -[SCLTimeIntervalDataSource applySpecifiers](self, "applySpecifiers");
  -[SCLSpecifierDataSource listController](self, "listController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endUpdates");

  -[SCLTimeIntervalDataSource notifyDelegateOfModelUpdate](self, "notifyDelegateOfModelUpdate");
}

- (void)model:(id)a3 didUpdateIntervalAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SCLSpecifierDataSource listController](self, "listController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginUpdates");

  -[SCLTimeIntervalDataSource reconfigureAllSpecifiers](self, "reconfigureAllSpecifiers");
  -[SCLTimeIntervalDataSource intervalSpecifiers](self, "intervalSpecifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadWithSpecifier:animated:", v10, 0);
  -[SCLSpecifierDataSource listController](self, "listController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endUpdates");

  -[SCLTimeIntervalDataSource notifyDelegateOfModelUpdate](self, "notifyDelegateOfModelUpdate");
}

- (SCLTimeIntervalDataSourceDelegate)delegate
{
  return (SCLTimeIntervalDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SCLTimeIntervalModel)model
{
  return self->_model;
}

- (NSMutableArray)intervalGroupSpecifiers
{
  return self->_intervalGroupSpecifiers;
}

- (NSArray)addIntervalGroupSpecifiers
{
  return self->_addIntervalGroupSpecifiers;
}

- (SCLScheduleTimeFormatter)scheduleTimeFormatter
{
  return self->_scheduleTimeFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleTimeFormatter, 0);
  objc_storeStrong((id *)&self->_addIntervalGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_intervalGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
