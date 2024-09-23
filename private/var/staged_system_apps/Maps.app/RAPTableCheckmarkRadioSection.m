@implementation RAPTableCheckmarkRadioSection

- (RAPTableCheckmarkRadioSection)initWithOwner:(id)a3 configureForValue:(id)a4 selection:(id)a5
{
  return -[RAPTableCheckmarkRadioSection initWithOwner:initialValues:initialSelectedValue:configureForValue:selection:](self, "initWithOwner:initialValues:initialSelectedValue:configureForValue:selection:", a3, &__NSArray0__struct, 0, a4, a5);
}

- (RAPTableCheckmarkRadioSection)initWithOwner:(id)a3 initialValues:(id)a4 initialSelectedValue:(id)a5 configureForValue:(id)a6 selection:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  RAPTableCheckmarkRadioSection *v17;
  RAPTableCheckmarkRadioSection *v18;
  id v19;
  id configure;
  id v21;
  id selection;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)RAPTableCheckmarkRadioSection;
  v17 = -[RAPTablePartSection init](&v24, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeWeak(&v17->_owner, v12);
    -[RAPTableCheckmarkRadioSection setValues:](v18, "setValues:", v13);
    v19 = objc_msgSend(v15, "copy");
    configure = v18->_configure;
    v18->_configure = v19;

    v21 = objc_msgSend(v16, "copy");
    selection = v18->_selection;
    v18->_selection = v21;

    -[RAPTableCheckmarkRadioSection setSelectedValue:](v18, "setSelectedValue:", v14);
  }

  return v18;
}

- (Class)defaultCellClass
{
  return 0;
}

- (void)selectedValueDidChange
{
  id WeakRetained;
  id v4;

  if (self->_selection)
  {
    WeakRetained = objc_loadWeakRetained(&self->_owner);
    if (WeakRetained)
    {
      v4 = WeakRetained;
      (*((void (**)(void))self->_selection + 2))();
      WeakRetained = v4;
    }

  }
}

- (void)registerReuseIdentifiersForCells
{
  objc_class *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RAPTableCheckmarkRadioSection;
  -[RAPTablePartSection registerReuseIdentifiersForCells](&v7, "registerReuseIdentifiersForCells");
  v3 = -[RAPTableCheckmarkRadioSection defaultCellClass](self, "defaultCellClass");
  if (v3)
  {
    v4 = v3;
    v5 = NSStringFromClass(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[RAPTablePartSection registerClass:forNamespacedReuseIdentifier:](self, "registerClass:forNamespacedReuseIdentifier:", v4, v6);

  }
}

- (id)dequeueCellForValue:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  NSString *v7;
  uint64_t v8;
  RAPCheckmarkTableViewCell *v9;

  v4 = a3;
  v5 = -[RAPTableCheckmarkRadioSection defaultCellClass](self, "defaultCellClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCheckmarkTableViewCell reuseIdentifier](RAPCheckmarkTableViewCell, "reuseIdentifier"));
  if (v5)
  {
    v7 = NSStringFromClass(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);

    v9 = (RAPCheckmarkTableViewCell *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dequeueCellWithNamespacedReuseIdentifier:](self, "dequeueCellWithNamespacedReuseIdentifier:", v8));
    v6 = (void *)v8;
  }
  else
  {
    v9 = -[RAPCheckmarkTableViewCell initWithStyle:reuseIdentifier:]([RAPCheckmarkTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, v6);
  }
  -[RAPCheckmarkTableViewCell setSelectionStyle:](v9, "setSelectionStyle:", 0);
  -[RAPTableCheckmarkRadioSection configureCell:forValue:](self, "configureCell:forValue:", v9, v4);

  return v9;
}

- (void)configureCell:(id)a3 forValue:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  if (self->_configure)
  {
    WeakRetained = objc_loadWeakRetained(&self->_owner);
    if (WeakRetained)
      (*((void (**)(void))self->_configure + 2))();

  }
}

- (void)setValues:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  NSArray *v6;
  NSArray *values;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;

  v10 = (NSArray *)a3;
  if (self->_values != v10)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableCheckmarkRadioSection selectedValue](self, "selectedValue"));
    if (v4)
    {
      v5 = -[NSArray containsObject:](v10, "containsObject:", v4);
      v6 = (NSArray *)-[NSArray copy](v10, "copy");
      values = self->_values;
      self->_values = v6;

      if ((v5 & 1) != 0)
        goto LABEL_7;
    }
    else
    {
      v8 = (NSArray *)-[NSArray copy](v10, "copy");
      v9 = self->_values;
      self->_values = v8;

    }
    -[RAPTableCheckmarkRadioSection setSelectedValue:](self, "setSelectedValue:", 0);
LABEL_7:
    -[RAPTablePartSection didChange](self, "didChange");

  }
}

- (void)setSelectedValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  __objc2_class **p_superclass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  RAPTableCheckmarkRadioSection *v20;
  id v21;
  void *v22;
  __objc2_class **v23;
  void *v24;
  id v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v29 = a3;
  if (self->_selectedValue != v29)
  {
    objc_storeStrong(&self->_selectedValue, a3);
    v5 = -[RAPTablePartSection sectionIndex](self, "sectionIndex");
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForVisibleRows"));

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      p_superclass = &OBJC_METACLASS___ClientTypeResolver.superclass;
      do
      {
        v12 = 0;
        v30 = v9;
        do
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v12);
          if (objc_msgSend(v13, "section", v29) == v5)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForRowAtIndexPath:", v13));

            v16 = objc_msgSend(v13, "row");
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableCheckmarkRadioSection values](self, "values"));
            if (v16 >= objc_msgSend(v17, "count"))
            {
              v26 = 0;
            }
            else
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableCheckmarkRadioSection values](self, "values"));
              v19 = v10;
              v20 = self;
              v21 = v5;
              v22 = v7;
              v23 = p_superclass;
              v24 = v18;
              v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v16));
              v26 = v25 == v29;

              p_superclass = v23;
              v7 = v22;
              v5 = v21;
              self = v20;
              v10 = v19;
              v9 = v30;
            }

            v27 = objc_opt_class(p_superclass + 184);
            if ((objc_opt_isKindOfClass(v15, v27) & 1) != 0)
            {
              objc_msgSend(v15, "setChecked:", v26);
            }
            else
            {
              if (v26)
                v28 = 3;
              else
                v28 = 0;
              objc_msgSend(v15, "setAccessoryType:", v28);
            }

          }
          v12 = (char *)v12 + 1;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v9);
    }

    -[RAPTableCheckmarkRadioSection selectedValueDidChange](self, "selectedValueDidChange");
  }

}

- (int64_t)rowsCount
{
  return -[NSArray count](self->_values, "count");
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableCheckmarkRadioSection values](self, "values"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableCheckmarkRadioSection dequeueCellForValue:](self, "dequeueCellForValue:", v6));
  v8 = objc_opt_class(RAPCheckmarkTableViewCell);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableCheckmarkRadioSection selectedValue](self, "selectedValue"));
    objc_msgSend(v9, "setChecked:", v10 == v6);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableCheckmarkRadioSection selectedValue](self, "selectedValue"));

    if (v11 == v6)
      v12 = 3;
    else
      v12 = 0;
    objc_msgSend(v7, "setAccessoryType:", v12);
  }

  return v7;
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableCheckmarkRadioSection values](self, "values"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", a3));

  -[RAPTableCheckmarkRadioSection setSelectedValue:](self, "setSelectedValue:", v9);
}

- (NSArray)values
{
  return self->_values;
}

- (id)selectedValue
{
  return self->_selectedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectedValue, 0);
  objc_storeStrong(&self->_selection, 0);
  objc_storeStrong(&self->_configure, 0);
  objc_destroyWeak(&self->_owner);
  objc_storeStrong((id *)&self->_values, 0);
}

@end
