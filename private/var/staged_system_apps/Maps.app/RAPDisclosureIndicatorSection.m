@implementation RAPDisclosureIndicatorSection

- (RAPDisclosureIndicatorSection)initWithOwner:(id)a3 initialValues:(id)a4 configureForValue:(id)a5 selection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RAPDisclosureIndicatorSection *v14;
  RAPDisclosureIndicatorSection *v15;
  NSArray *v16;
  NSArray *values;
  id v18;
  id configure;
  id v20;
  id selection;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)RAPDisclosureIndicatorSection;
  v14 = -[RAPTablePartSection init](&v23, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeWeak(&v14->_owner, v10);
    v16 = (NSArray *)objc_msgSend(v11, "copy");
    values = v15->_values;
    v15->_values = v16;

    v18 = objc_msgSend(v12, "copy");
    configure = v15->_configure;
    v15->_configure = v18;

    v20 = objc_msgSend(v13, "copy");
    selection = v15->_selection;
    v15->_selection = v20;

  }
  return v15;
}

- (void)setValues:(id)a3
{
  NSArray *v4;
  NSArray *values;

  if (self->_values != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    values = self->_values;
    self->_values = v4;

    -[RAPTablePartSection didChange](self, "didChange");
  }
}

- (void)selected:(id)a3
{
  id *p_owner;
  id WeakRetained;
  void (**selection)(id, id, id);
  id v7;
  id v8;

  v8 = a3;
  if (self->_selection)
  {
    p_owner = &self->_owner;
    WeakRetained = objc_loadWeakRetained(&self->_owner);

    if (WeakRetained)
    {
      selection = (void (**)(id, id, id))self->_selection;
      v7 = objc_loadWeakRetained(p_owner);
      selection[2](selection, v7, v8);

    }
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

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dequeueDefaultSingleLineTableViewCell](self, "dequeueDefaultSingleLineTableViewCell"));
  objc_msgSend(v5, "setAccessoryType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDisclosureIndicatorSection values](self, "values"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));
  -[RAPDisclosureIndicatorSection configureCell:forValue:](self, "configureCell:forValue:", v5, v7);

  return v5;
}

- (void)configureCell:(id)a3 forValue:(id)a4
{
  id v6;
  id WeakRetained;
  void (**configure)(id, RAPDisclosureIndicatorSection *, id, id, id);
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (self->_configure)
  {
    WeakRetained = objc_loadWeakRetained(&self->_owner);

    if (WeakRetained)
    {
      configure = (void (**)(id, RAPDisclosureIndicatorSection *, id, id, id))self->_configure;
      v9 = objc_loadWeakRetained(&self->_owner);
      configure[2](configure, self, v9, v10, v6);

    }
  }

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

  v9 = (id)objc_claimAutoreleasedReturnValue(-[RAPDisclosureIndicatorSection values](self, "values"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", a3));
  -[RAPDisclosureIndicatorSection selected:](self, "selected:", v8);

}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong(&self->_selection, 0);
  objc_storeStrong(&self->_configure, 0);
  objc_destroyWeak(&self->_owner);
}

@end
