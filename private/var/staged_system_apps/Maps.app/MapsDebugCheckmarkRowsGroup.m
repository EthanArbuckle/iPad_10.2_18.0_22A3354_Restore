@implementation MapsDebugCheckmarkRowsGroup

- (id)_relinquishOwnershipOfHeldRows
{
  id v3;
  NSMutableArray *heldRows;

  v3 = -[NSMutableArray copy](self->_heldRows, "copy");
  heldRows = self->_heldRows;
  self->_heldRows = 0;

  return v3;
}

+ (id)rowsGroupContainingRows:(id *)a3 withContent:(id)a4 get:(id)a5 set:(id)a6
{
  return objc_msgSend(a1, "rowsGroupContainingRows:withContent:backingGeoConfigKey:get:set:", a3, a4, GEOConfigKey_Invalid[0], GEOConfigKey_Invalid[1], a5, a6);
}

+ (id)rowsGroupContainingRows:(id *)a3 withContent:(id)a4 backingGeoConfigKey:(id)a5 get:(id)a6 set:(id)a7
{
  uint64_t v9;
  void (**v11)(id, id);
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *var1;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;
  id location;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  var1 = a5.var1;
  v9 = *(_QWORD *)&a5.var0;
  v11 = (void (**)(id, id))a4;
  v12 = a6;
  v13 = a7;
  v14 = -[MapsDebugCheckmarkRowsGroup _initWithHeldRows]([MapsDebugCheckmarkRowsGroup alloc], "_initWithHeldRows");
  v11[2](v11, v14);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_relinquishOwnershipOfHeldRows"));
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v30;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v18), "setGet:", v12, var1);
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v16);
  }

  objc_initWeak(&location, v14);
  v22 = _NSConcreteStackBlock;
  v23 = 3221225472;
  v24 = sub_10025A8F8;
  v25 = &unk_1011ADE18;
  objc_copyWeak(&v27, &location);
  v19 = v13;
  v26 = v19;
  objc_msgSend(v14, "setSelectionChanged:", &v22);
  objc_msgSend(v14, "update");
  if (a3)
    *a3 = objc_retainAutorelease(v15);
  objc_msgSend(v14, "setGeoConfigKey:", v9, var1, var1, v22, v23, v24, v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v14;
}

- (MapsDebugCheckmarkRowsGroup)init
{
  MapsDebugCheckmarkRowsGroup *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsDebugCheckmarkRowsGroup;
  v2 = -[MapsDebugCheckmarkRowsGroup init](&v4, "init");
  if (v2)
    v2->_weakRows = CFArrayCreateMutable(kCFAllocatorDefault, 0, 0);
  return v2;
}

- (id)_initWithHeldRows
{
  MapsDebugCheckmarkRowsGroup *v2;
  NSMutableArray *v3;
  NSMutableArray *heldRows;

  v2 = -[MapsDebugCheckmarkRowsGroup init](self, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    heldRows = v2->_heldRows;
    v2->_heldRows = v3;

  }
  return v2;
}

- (void)dealloc
{
  __CFArray *weakRows;
  objc_super v4;

  weakRows = self->_weakRows;
  if (weakRows)
  {
    CFRelease(weakRows);
    self->_weakRows = 0;
  }
  GEOConfigRemoveDelegateListenerForAllKeys(self, a2);
  v4.receiver = self;
  v4.super_class = (Class)MapsDebugCheckmarkRowsGroup;
  -[MapsDebugCheckmarkRowsGroup dealloc](&v4, "dealloc");
}

- (id)weakRows
{
  return self->_weakRows;
}

- (id)addRowWithTitle:(id)a3 value:(id)a4
{
  return -[MapsDebugCheckmarkRowsGroup addRowWithTitle:subtitle:value:](self, "addRowWithTitle:subtitle:value:", a3, 0, a4);
}

- (id)addRowWithTitle:(id)a3 subtitle:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  MapsDebugCheckmarkRow *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(MapsDebugCheckmarkRow);
  -[MapsDebugTableRow setTitle:](v11, "setTitle:", v10);

  -[MapsDebugTableRow setSubtitle:](v11, "setSubtitle:", v9);
  -[MapsDebugCheckmarkRow setValue:](v11, "setValue:", v8);

  -[MapsDebugCheckmarkRowsGroup addRow:](self, "addRow:", v11);
  return v11;
}

- (void)addRow:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setRowsGroup:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRowsGroup weakRows](self, "weakRows"));
  objc_msgSend(v4, "addObject:", v5);

  -[NSMutableArray addObject:](self->_heldRows, "addObject:", v5);
}

- (void)checkmarkRowDidChangeChecked:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRowsGroup selectionChanged](self, "selectionChanged"));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRowsGroup selectionChanged](self, "selectionChanged"));
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (void)checkmarkRowWillInvalidate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRowsGroup weakRows](self, "weakRows"));
  objc_msgSend(v5, "removeObject:", v4);

}

- (NSArray)rows
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRowsGroup weakRows](self, "weakRows"));
  v3 = objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (unint64_t)selectedRowsCount
{
  void *v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRowsGroup rows](self, "rows", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "isChecked");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canDeselectRows
{
  unint64_t v3;

  v3 = -[MapsDebugCheckmarkRowsGroup selectedRowsCount](self, "selectedRowsCount");
  return v3 > -[MapsDebugCheckmarkRowsGroup minimumSelectionCount](self, "minimumSelectionCount");
}

- (void)update
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRowsGroup rows](self, "rows"));
  objc_msgSend(v3, "makeObjectsPerformSelector:", "updateChecked");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MapsDebugCheckmarkRowsGroup rows](self, "rows"));
  objc_msgSend(v4, "makeObjectsPerformSelector:", "updateConfiguration");

}

- (NSString)groupIdentifier
{
  NSString *groupIdentifier;
  NSString *v4;
  NSString *v5;

  groupIdentifier = self->_groupIdentifier;
  if (!groupIdentifier)
  {
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MapsDebugCheckmarkRowsGroup-%p"), self));
    v5 = self->_groupIdentifier;
    self->_groupIdentifier = v4;

    groupIdentifier = self->_groupIdentifier;
  }
  return groupIdentifier;
}

- (void)setGeoConfigKey:(id)a3
{
  void *var1;
  uint64_t v4;

  var1 = a3.var1;
  v4 = *(_QWORD *)&a3.var0;
  GEOConfigRemoveDelegateListenerForAllKeys(self, a2);
  if ((_DWORD)v4)
  {
    if (var1)
      _GEOConfigAddDelegateListenerForKey(v4, var1, &_dispatch_main_q, self);
  }
}

- (id)selectionChanged
{
  return self->_selectionChanged;
}

- (void)setSelectionChanged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowMultipleSelection;
}

- (void)setAllowMultipleSelection:(BOOL)a3
{
  self->_allowMultipleSelection = a3;
}

- (unint64_t)minimumSelectionCount
{
  return self->_minimumSelectionCount;
}

- (void)setMinimumSelectionCount:(unint64_t)a3
{
  self->_minimumSelectionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong(&self->_selectionChanged, 0);
  objc_storeStrong((id *)&self->_heldRows, 0);
}

@end
