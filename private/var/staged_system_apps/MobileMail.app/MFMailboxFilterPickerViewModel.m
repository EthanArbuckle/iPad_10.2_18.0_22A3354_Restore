@implementation MFMailboxFilterPickerViewModel

- (MFMailboxFilterPickerViewModel)initWithProvider:(id)a3 selectedFilters:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  MFMailboxFilterPickerViewModel *v12;
  MFMailboxFilterPickerViewModel *v13;
  void *v14;
  NSMutableSet *v15;
  NSMutableSet *selectedIndexPaths;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MFMailboxFilterPickerViewModel;
  v12 = -[MFMailboxFilterPickerViewModel init](&v18, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_provider, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel indexPathsForFilters:](v13, "indexPathsForFilters:", v10));
    v15 = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v14);

    selectedIndexPaths = v13->_selectedIndexPaths;
    v13->_selectedIndexPaths = v15;

    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

- (MFMailboxFilterPickerViewModel)initWithFilterViewModel:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MFMailboxFilterPickerViewModel *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "provider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedFilters"));
  v10 = -[MFMailboxFilterPickerViewModel initWithProvider:selectedFilters:delegate:](self, "initWithProvider:selectedFilters:delegate:", v8, v9, v7);

  return v10;
}

- (NSArray)filters
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel provider](self, "provider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allFilters"));

  return (NSArray *)v3;
}

- (int64_t)numberOfFilterSection
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel provider](self, "provider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "filtersGroups"));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (int64_t)numberOfFiltersForSection:(int64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel filtersForGroupAtIndex:](self, "filtersForGroupAtIndex:", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (id)filtersForGroupAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel groupAtIndex:](self, "groupAtIndex:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filters"));

  return v4;
}

- (id)groupAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel provider](self, "provider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filtersGroups"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));

  return v6;
}

- (int64_t)indexOfGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel provider](self, "provider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filtersGroups"));
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  return (int64_t)v7;
}

- (id)titleForSection:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel groupAtIndex:](self, "groupAtIndex:", a3));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = (void *)v4;
  v6 = &stru_100531B00;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  return v7;
}

- (id)filterAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel filtersForGroupAtIndex:](self, "filtersForGroupAtIndex:", objc_msgSend(v4, "section")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

  return v6;
}

- (id)indexPathForFilter:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel provider](self, "provider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupContainingFilter:", v5));

  v8 = -[MFMailboxFilterPickerViewModel indexOfGroup:](self, "indexOfGroup:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel filtersForGroupAtIndex:](self, "filtersForGroupAtIndex:", v8)),
        v10 = (uint64_t)objc_msgSend(v11, "indexOfObject:", v5),
        v11,
        v10 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailboxFilterPickerViewModel.m"), 96, CFSTR("It should always be possible to find the group and the filter index"));

    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v10, v8));

  return v12;
}

- (id)indexPathsForFilters:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10016AB40;
  v4[3] = &unk_100521310;
  v4[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ef_map:", v4));
}

- (BOOL)canDeselectRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel groupAtIndex:](self, "groupAtIndex:", objc_msgSend(v4, "section")));
  if (objc_msgSend(v5, "selectionCardinality"))
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel selectedIndexPaths](self, "selectedIndexPaths"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10016AC64;
    v10[3] = &unk_10051F768;
    v11 = v4;
    v8 = objc_msgSend(v7, "ef_countObjectsPassingTest:", v10);

    v6 = (unint64_t)v8 > 1;
  }

  return v6;
}

- (int64_t)selectionTypeAtIndex:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel groupAtIndex:](self, "groupAtIndex:", objc_msgSend(v4, "section")));
  v6 = objc_msgSend(v5, "combinator") == 0;

  return v6;
}

- (void)selectFilterAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10
    || (v5 = objc_msgSend(v10, "row"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel filters](self, "filters")),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5 >= v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailboxFilterPickerViewModel.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath && ((NSUInteger)indexPath.row < self.filters.count)"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel selectedIndexPaths](self, "selectedIndexPaths"));
  objc_msgSend(v9, "addObject:", v10);

  -[MFMailboxFilterPickerViewModel _notifyDelegateOfChangeAtIndexPath:](self, "_notifyDelegateOfChangeAtIndexPath:", v10);
}

- (void)deselectFilterAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10
    || (v5 = objc_msgSend(v10, "row"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel filters](self, "filters")),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5 >= v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailboxFilterPickerViewModel.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath && ((NSUInteger)indexPath.row < self.filters.count)"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel selectedIndexPaths](self, "selectedIndexPaths"));
  objc_msgSend(v9, "removeObject:", v10);

  -[MFMailboxFilterPickerViewModel _notifyDelegateOfChangeAtIndexPath:](self, "_notifyDelegateOfChangeAtIndexPath:", v10);
}

- (id)selected
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel selectedIndexPaths](self, "selectedIndexPaths"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));

  return v3;
}

- (id)selectedFilters
{
  NSString *v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[2];

  v3 = NSStringFromSelector("section");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", v4, 1));

  v6 = NSStringFromSelector("row");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", v7, 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel selected](self, "selected"));
  v15[0] = v5;
  v15[1] = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingDescriptors:", v10));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10016B184;
  v14[3] = &unk_100521338;
  v14[4] = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_map:", v14));

  return v12;
}

- (void)_notifyDelegateOfChangeAtIndexPath:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel filterAtIndexPath:](self, "filterAtIndexPath:", a3));
  if (objc_msgSend(v5, "hasCriterionOfType:", 23))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerViewModel delegate](self, "delegate"));
    objc_msgSend(v4, "filterPickerViewModelDidChangeSelectedAccounts:", self);

  }
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(int64_t)a3
{
  self->_badgeType = a3;
}

- (MFMailboxFilterPickerViewModelDelegate)delegate
{
  return (MFMailboxFilterPickerViewModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableSet)selectedIndexPaths
{
  return self->_selectedIndexPaths;
}

- (void)setSelectedIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPaths, a3);
}

- (MUIMailboxFilterProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
