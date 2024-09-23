@implementation _UIFilteredDataSource

- (void)setFilterType:(int64_t)a3
{
  self->_filterType = a3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[_UIFilteredDataSource tableDataSource](self, "tableDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableView:cellForRowAtIndexPath:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;

  v4 = a3;
  self->_limitingWithSections = 0;
  -[_UIFilteredDataSource tableDataSource](self, "tableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_UIFilteredDataSource tableDataSource](self, "tableDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "numberOfSectionsInTableView:", v4);

  }
  else
  {
    v7 = 1;
  }

  if (-[_UIFilteredDataSource filterType](self, "filterType") == 1 && v7 != 1)
  {
    self->_limitingWithSections = 1;
    self->_maxVisibleSection = 0;
    if (v7 < 1)
    {
LABEL_11:
      self->_maxVisibleSection = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v8 = 0;
      v9 = 0;
      while (1)
      {
        -[_UIFilteredDataSource tableDataSource](self, "tableDataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "tableView:numberOfRowsInSection:", v4, v8);

        if (v11 + v9 == 12)
        {
          self->_maxVisibleSection = v8;
          self->_numberOfVisibleItemsInLastSection = v11;
          goto LABEL_14;
        }
        if (v11 + v9 >= 13)
          break;
        ++v8;
        v9 += v11;
        if (v7 == v8)
          goto LABEL_11;
      }
      self->_maxVisibleSection = v8;
      self->_numberOfVisibleItemsInLastSection = 12 - v9;
LABEL_14:
      v7 = v8 + 1;
    }
  }

  return v7;
}

- (int64_t)_filteredNumberOfItemsGivenSection:(int64_t)a3 numberOfItems:(int64_t)a4
{
  int64_t maxVisibleSection;
  int64_t v8;

  if (-[_UIFilteredDataSource filterType](self, "filterType") != 1)
  {
    v8 = 0x7FFFFFFFLL;
    goto LABEL_9;
  }
  if (!self->_limitingWithSections)
  {
    v8 = 12;
LABEL_9:
    if (v8 >= a4)
      return a4;
    else
      return v8;
  }
  maxVisibleSection = self->_maxVisibleSection;
  if (maxVisibleSection <= a3)
  {
    if (maxVisibleSection == a3)
      return self->_numberOfVisibleItemsInLastSection;
    else
      return 0;
  }
  return a4;
}

- (int64_t)filterType
{
  return self->_filterType;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v3;
  char v4;

  -[_UIFilteredDataSource tableDataSource](self, "tableDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a3;
  -[_UIFilteredDataSource tableDataSource](self, "tableDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "tableView:numberOfRowsInSection:", v6, a4);

  return -[_UIFilteredDataSource _filteredNumberOfItemsGivenSection:numberOfItems:](self, "_filteredNumberOfItemsGivenSection:numberOfItems:", a4, v8);
}

- (UITableViewDataSource)tableDataSource
{
  return self->_tableDataSource;
}

- (void)setTableDataSource:(id)a3
{
  self->_tableDataSource = (UITableViewDataSource *)a3;
}

@end
