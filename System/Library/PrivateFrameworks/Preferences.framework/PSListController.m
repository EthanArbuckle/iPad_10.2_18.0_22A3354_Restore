@implementation PSListController

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  double result;

  -[PSListController _tableView:estimatedHeightForCustomInSection:isHeader:](self, "_tableView:estimatedHeightForCustomInSection:isHeader:", a3, a4, 1);
  return result;
}

- (double)_tableView:(id)a3 estimatedHeightForCustomInSection:(int64_t)a4 isHeader:(BOOL)a5
{
  return *MEMORY[0x1E0CEBC10];
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  double result;

  -[PSListController _tableView:estimatedHeightForCustomInSection:isHeader:](self, "_tableView:estimatedHeightForCustomInSection:isHeader:", a3, a4, 0);
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return -[PSListController _tableView:viewForCustomInSection:isHeader:](self, "_tableView:viewForCustomInSection:isHeader:", a3, a4, 0);
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result;

  -[PSListController _tableView:heightForCustomInSection:isHeader:](self, "_tableView:heightForCustomInSection:isHeader:", a3, a4, 0);
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  -[PSListController _tableView:heightForCustomInSection:isHeader:](self, "_tableView:heightForCustomInSection:isHeader:", a3, a4, 1);
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return -[PSListController _tableView:viewForCustomInSection:isHeader:](self, "_tableView:viewForCustomInSection:isHeader:", a3, a4, 1);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  int64_t v5;
  BOOL v6;
  void *v7;

  v5 = -[PSListController indexForIndexPath:](self, "indexForIndexPath:", a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[NSArray objectAtIndex:](self->_specifiers, "objectAtIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "cellType") != 13;

  return v6;
}

- (int64_t)indexForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;

  v4 = a3;
  if (v4)
  {
    if (!self->_groups)
      -[PSListController createGroupIndices](self, "createGroupIndices");
    v5 = objc_msgSend(v4, "row");
    v6 = -[PSListController indexOfGroup:](self, "indexOfGroup:", objc_msgSend(v4, "section"));
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v7 = v5 + v6 + 1;
  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)indexOfGroup:(int64_t)a3
{
  NSMutableArray *groups;
  unint64_t v6;
  NSMutableArray *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  groups = self->_groups;
  if (!groups)
  {
    -[PSListController createGroupIndices](self, "createGroupIndices");
    groups = self->_groups;
  }
  v6 = -[NSMutableArray count](groups, "count");
  v7 = self->_groups;
  if (v6 <= a3)
  {
    v10 = -[NSMutableArray count](v7, "count");
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Critical Error - Access to PSListController Groups Array index %ld is out of bounds (count = %ld) in %@"), a3, v10, v12);

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v13, "sf_isInternalInstall");

    if (!(_DWORD)v10)
      return 0x7FFFFFFFFFFFFFFFLL;
    NSLog(CFSTR("Specifiers = %@"), self->_specifiers);
    NSLog(CFSTR("Group Indices = %@"), self->_groups);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundlePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Please file a bug on %@"), v15);

    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");
  }

  return v9;
}

- (id)table
{
  return self->_table;
}

- (NSArray)unprotectedSpecifiers
{
  return self->_specifiers;
}

- (id)_tableView:(id)a3 viewForCustomInSection:(int64_t)a4 isHeader:(BOOL)a5
{
  _BOOL8 v5;
  NSArray *specifiers;
  void *v9;
  void *v10;
  __CFString **v11;
  NSString *v12;
  Class v13;
  void *v14;
  NSObject *v15;
  uint8_t v17[16];

  v5 = a5;
  if (-[NSArray count](self->_specifiers, "count", a3))
  {
    specifiers = self->_specifiers;
    -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndex:](specifiers, "objectAtIndex:", objc_msgSend(v9, "integerValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = PSHeaderCellClassGroupKey;
    if (!v5)
      v11 = PSFooterCellClassGroupKey;
    objc_msgSend(v10, "propertyForKey:", *v11);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = NSClassFromString(v12);
    if (v13)
    {
      -[PSListController _customViewForSpecifier:class:isHeader:](self, "_customViewForSpecifier:class:isHeader:", v10, v13, v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

    return v14;
  }
  else
  {
    _PSLoggingFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1A3819000, v15, OS_LOG_TYPE_DEFAULT, "viewForCustomInSection called while _specifiers is nil or empty", v17, 2u);
    }

    return 0;
  }
}

- (void)createPrequeuedPSTableCells:(unint64_t)a3
{
  NSMutableArray *prequeuedReusablePSTableCells;
  NSMutableArray *v6;
  PSTableCell *v7;
  NSMutableArray *v8;
  PSSpecifier *i;

  prequeuedReusablePSTableCells = self->_prequeuedReusablePSTableCells;
  if (prequeuedReusablePSTableCells)
  {
    self->_prequeuedReusablePSTableCells = 0;

  }
  v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
  for (i = objc_alloc_init(PSSpecifier); a3; --a3)
  {
    v7 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:]([PSTableCell alloc], "initWithStyle:reuseIdentifier:specifier:", +[PSTableCell cellStyle](PSTableCell, "cellStyle"), CFSTR("PSTableCell"), i);
    -[NSMutableArray addObject:](v6, "addObject:", v7);

  }
  v8 = self->_prequeuedReusablePSTableCells;
  self->_prequeuedReusablePSTableCells = v6;

}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  NSArray *specifiers;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  specifiers = self->_specifiers;
  -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](specifiers, "objectAtIndex:", objc_msgSend(v5, "integerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "propertyForKey:", CFSTR("footerText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length")
    && (objc_msgSend(v6, "propertyForKey:", CFSTR("footerCellClass")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    v9 = v7;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  NSArray *specifiers;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  specifiers = self->_specifiers;
  -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](specifiers, "objectAtIndex:", objc_msgSend(v5, "integerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v6, "propertyForKey:", CFSTR("headerCellClass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = 0;
    else
      v9 = v7;
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)createGroupIndices
{
  uint64_t v2;
  NSMutableArray *groups;
  PSListController *obj;

  obj = self;
  objc_sync_enter(obj);
  -[PSListController _createGroupIndices:](obj, "_createGroupIndices:", obj->_specifiers);
  v2 = objc_claimAutoreleasedReturnValue();
  groups = obj->_groups;
  obj->_groups = (NSMutableArray *)v2;

  objc_sync_exit(obj);
}

- (id)_createGroupIndices:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  _QWORD *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(v3, "objectAtIndex:", i);
      v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (!v7[7])
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

      }
    }
  }

  return v5;
}

- (double)_tableView:(id)a3 heightForCustomInSection:(int64_t)a4 isHeader:(BOOL)a5
{
  _BOOL8 v5;
  NSArray *specifiers;
  void *v8;
  void *v9;
  __CFString **v10;
  NSString *v11;
  Class v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v5 = a5;
  specifiers = self->_specifiers;
  -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](specifiers, "objectAtIndex:", objc_msgSend(v8, "integerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = PSHeaderCellClassGroupKey;
  if (!v5)
    v10 = PSFooterCellClassGroupKey;
  objc_msgSend(v9, "propertyForKey:", *v10);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = NSClassFromString(v11);
  if (!v12)
    goto LABEL_15;
  -[PSListController _customViewForSpecifier:class:isHeader:](self, "_customViewForSpecifier:class:isHeader:", v9, v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView _sectionContentInset](self->_table, "_sectionContentInset");
  v15 = v14;
  v17 = v16;
  -[UITableView bounds](self->_table, "bounds");
  if (v18 - v15 - v17 >= 0.0)
    v19 = v18 - v15 - v17;
  else
    v19 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "preferredHeightForWidth:", v19);
      if (v22 >= *MEMORY[0x1E0CEBC10])
        v21 = v22;
      else
        v21 = *MEMORY[0x1E0CEBC10];
      goto LABEL_13;
    }

LABEL_15:
    v21 = *MEMORY[0x1E0CEBC10];
    goto LABEL_16;
  }
  objc_msgSend(v13, "preferredHeightForWidth:inTableView:", self->_table, v19);
  v21 = v20;
LABEL_13:

LABEL_16:
  return v21;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  NSMutableArray *groups;

  groups = self->_groups;
  if (!groups)
  {
    -[PSListController createGroupIndices](self, "createGroupIndices", a3);
    groups = self->_groups;
  }
  return -[NSMutableArray count](groups, "count", a3);
}

- (int64_t)tableView:(id)a3 titleAlignmentForHeaderInSection:(int64_t)a4
{
  NSArray *specifiers;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  specifiers = self->_specifiers;
  -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](specifiers, "objectAtIndex:", objc_msgSend(v5, "integerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "propertyForKey:", CFSTR("alignment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v7, "integerValue");
  else
    v8 = 4;

  return v8;
}

- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4
{
  NSArray *specifiers;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  specifiers = self->_specifiers;
  -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](specifiers, "objectAtIndex:", objc_msgSend(v5, "integerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "propertyForKey:", CFSTR("footerAlignment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v7, "integerValue");
  else
    v8 = 4;

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  NSUInteger v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  void *v10;

  if (-[NSMutableArray count](self->_groups, "count", a3) - 1 == a4)
  {
    v6 = -[NSArray count](self->_specifiers, "count");
    -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 + ~objc_msgSend(v7, "integerValue");
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a4 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "integerValue");
    -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9 + ~objc_msgSend(v10, "integerValue");

  }
  return v8;
}

- (void)reloadSpecifierAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  PSListController *v6;
  NSArray *specifiers;
  UITableView *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableDictionary *cells;
  void *v15;
  void *v16;
  void *v17;
  UITableView *table;
  void *v19;
  uint64_t v20;
  void *v21;
  UITableView *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  UITableView *v27;
  unsigned int v28;
  uint64_t v29;
  _BOOL4 v30;
  int64_t v31;
  _QWORD *v32;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v4 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  specifiers = v6->_specifiers;
  v31 = a3;
  if (specifiers)
  {
    -[NSArray objectAtIndex:](specifiers, "objectAtIndex:", a3);
    v32 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
  objc_sync_exit(v6);

  v28 = objc_msgSend(MEMORY[0x1E0CEABB0], "areAnimationsEnabled");
  v30 = v4;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", 0);
  -[UITableView indexPathForSelectedRow](v6->_table, "indexPathForSelectedRow");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[PSListController indexForIndexPath:](v6, "indexForIndexPath:", v33);
  v39 = 0;
  v40 = 0;
  if (-[PSListController getGroup:row:ofSpecifierAtIndex:](v6, "getGroup:row:ofSpecifierAtIndex:", &v40, &v39, a3))
  {
    if (v39 < 0)
    {
      -[PSListController specifiersInGroup:](v6, "specifiersInGroup:", v40);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v36 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            cells = v6->_cells;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](cells, "removeObjectForKey:", v15);

            objc_msgSend(v13, "removePropertyForKey:", CFSTR("cellObject"));
          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v10);
      }
      -[UITableView beginUpdates](v6->_table, "beginUpdates");
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("headerView"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EE6F58C8)
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v16, "refreshContentsWithSpecifier:", v32);
      }
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("footerView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "conformsToProtocol:", &unk_1EE6F58C8)
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v17, "refreshContentsWithSpecifier:", v32);
      }
      table = v6->_table;
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v40);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        v20 = 0;
      else
        v20 = 5;
      -[UITableView reloadSections:withRowAnimation:](table, "reloadSections:withRowAnimation:", v19, v20);

      -[UITableView endUpdates](v6->_table, "endUpdates");
      goto LABEL_38;
    }
    if (v6->_reusesCells)
    {
      v8 = v6->_table;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView cellForRowAtIndexPath:](v8, "cellForRowAtIndexPath:", v9);
      obj = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v32, "propertyForKey:", CFSTR("cellObject"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      if (obj)
        goto LABEL_29;
      v27 = v6->_table;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v39, v40);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView cellForRowAtIndexPath:](v27, "cellForRowAtIndexPath:", v9);
      obj = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_29:
    if (objc_msgSend(obj, "canReload") && objc_msgSend(obj, "type") == v32[7])
    {
      objc_msgSend(obj, "reloadWithSpecifier:animated:", v32, v4);
    }
    else if (obj || !v6->_reusesCells)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v6->_cells, "removeObjectForKey:", v21);
      objc_msgSend(v32, "removePropertyForKey:", CFSTR("cellObject"));
      -[UITableView beginUpdates](v6->_table, "beginUpdates");
      v22 = v6->_table;
      v23 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v39, v40);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "arrayWithObject:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
        v26 = 0;
      else
        v26 = 5;
      -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v22, "reloadRowsAtIndexPaths:withRowAnimation:", v25, v26);

      -[UITableView endUpdates](v6->_table, "endUpdates");
    }
LABEL_38:

  }
  if (!v30)
    objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", v28);
  if (v29 == v31)
    -[UITableView selectRowAtIndexPath:animated:scrollPosition:](v6->_table, "selectRowAtIndexPath:animated:scrollPosition:", v33, 0, 0);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  PSListController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v8 = -[PSListController indexForIndexPath:](self, "indexForIndexPath:", v7);
  v9 = self;
  objc_sync_enter(v9);
  -[NSArray objectAtIndex:](v9->_specifiers, "objectAtIndex:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v9);

  if (v9->_cachesCells)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v9->_cells, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_29;
    goto LABEL_14;
  }
  if (v9->_reusesCells)
  {
    +[PSTableCell reuseIdentifierForSpecifier:](PSTableCell, "reuseIdentifierForSpecifier:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
LABEL_6:
      objc_msgSend(v10, "setProperty:forKey:", v12, CFSTR("cellObject"));
      goto LABEL_13;
    }
    if (-[NSMutableArray count](v9->_prequeuedReusablePSTableCells, "count")
      && objc_msgSend(v13, "isEqualToString:", CFSTR("PSTableCell")))
    {
      -[NSMutableArray lastObject](v9->_prequeuedReusablePSTableCells, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeLastObject](v9->_prequeuedReusablePSTableCells, "removeLastObject");
      if (v12)
        goto LABEL_6;
    }
    else
    {
      v12 = 0;
    }
LABEL_13:

    v11 = 0;
    if (v12)
      goto LABEL_29;
    goto LABEL_14;
  }
  v11 = 0;
LABEL_14:
  v14 = +[PSTableCell cellClassForSpecifier:](PSTableCell, "cellClassForSpecifier:", v10);
  if (-[objc_class isSubclassOfClass:](v14, "isSubclassOfClass:", objc_opt_class()))
  {
    -[objc_class cellStyle](v14, "cellStyle");
    objc_msgSend(v10, "propertyForKey:", CFSTR("styleOverride"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (-[PSListController isValidCellStyle:](v9, "isValidCellStyle:", objc_msgSend(v15, "integerValue")))
          objc_msgSend(v15, "integerValue");
      }
    }

  }
  -[PSListControllerAppearanceProvider cellForSpecifier:inController:](v9->_appearanceProvider, "cellForSpecifier:inController:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v12, "setReusedCell:", v9->_reusesCells);
  objc_msgSend(v12, "_accessibilitySetInterfaceStyleIntent:", objc_msgSend(v6, "_accessibilityInterfaceStyleIntent"));
  objc_msgSend(v10, "setProperty:forKey:", v12, CFSTR("cellObject"));
  if (v12 && v9->_cachesCells)
    -[NSMutableDictionary setObject:forKey:](v9->_cells, "setObject:forKey:", v12, v11);
  v19 = 0;
  v20 = 0;
  if (-[PSListController getGroup:row:ofSpecifier:](v9, "getGroup:row:ofSpecifier:", &v20, &v19, v10))
  {
    -[NSArray objectAtIndex:](v9->_specifiers, "objectAtIndex:", -[PSListController indexOfGroup:](v9, "indexOfGroup:", v20));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "propertyForKey:", CFSTR("radioGroupCheckedSpecifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v17)
      objc_msgSend(v12, "setChecked:", 1);

  }
LABEL_29:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "setSpecifier:", v10);
    objc_msgSend(v12, "refreshCellContentsWithSpecifier:", v10);
    if (v9->_forceSynchronousIconLoadForCreatedCells)
      objc_msgSend(v12, "forceSynchronousIconLoadOnNextIconLoad");
  }

  return v12;
}

- (BOOL)getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifierAtIndex:(int64_t)a5
{
  NSMutableArray *groups;

  if (a5 == 0x7FFFFFFFFFFFFFFFLL || !self->_specifiers)
    return 0;
  groups = self->_groups;
  if (!groups)
  {
    -[PSListController createGroupIndices](self, "createGroupIndices");
    groups = self->_groups;
  }
  return -[PSListController _getGroup:row:ofSpecifierAtIndex:groups:](self, "_getGroup:row:ofSpecifierAtIndex:groups:", a3, a4, a5, groups);
}

- (BOOL)_getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifierAtIndex:(int64_t)a5 groups:(id)a6
{
  id v9;
  int64_t v10;
  int64_t v11;
  void *v13;
  int64_t v14;

  v9 = a6;
  v10 = objc_msgSend(v9, "count");
  while (1)
  {
    v11 = v10;
    if (v10-- < 1)
      break;
    objc_msgSend(v9, "objectAtIndex:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    if (v14 <= a5)
    {
      if (a3)
        *a3 = v10;
      if (a4)
        *a4 = ~v14 + a5;
      break;
    }
  }

  return v11 > 0;
}

- (BOOL)getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifier:(id)a5
{
  return -[PSListController getGroup:row:ofSpecifierAtIndex:](self, "getGroup:row:ofSpecifierAtIndex:", a3, a4, -[NSArray indexOfObject:](self->_specifiers, "indexOfObject:", a5));
}

+ (id)appearance
{
  return +[PSListController appearanceWhenContainedInInstancesOfClasses:](PSListController, "appearanceWhenContainedInInstancesOfClasses:", MEMORY[0x1E0C9AA60]);
}

+ (id)appearanceWhenContainedInInstancesOfClasses:(id)a3
{
  if (appearanceWhenContainedInInstancesOfClasses__onceToken != -1)
    dispatch_once(&appearanceWhenContainedInInstancesOfClasses__onceToken, &__block_literal_global_0);
  return (id)appearanceWhenContainedInInstancesOfClasses___listController;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (UIColor)altTextColor
{
  return self->_altTextColor;
}

- (UIColor)cellHighlightColor
{
  return self->_cellHighlightColor;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  -[PSListController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p: navItem %@, view %p>"), v4, self, v5, self->_table);

  return (NSString *)v3;
}

void __64__PSListController_appearanceWhenContainedInInstancesOfClasses___block_invoke()
{
  PSListController *v0;
  void *v1;

  v0 = objc_alloc_init(PSListController);
  v1 = (void *)appearanceWhenContainedInInstancesOfClasses___listController;
  appearanceWhenContainedInInstancesOfClasses___listController = (uint64_t)v0;

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  id WeakRetained;
  char isKindOfClass;
  void *v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v22.receiver = self;
  v22.super_class = (Class)PSListController;
  -[PSListController viewDidLayoutSubviews](&v22, sel_viewDidLayoutSubviews);
  -[PSListController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "sf_isiPad"))
  {
    v13 = PSIsRunningInAssistant();

    if (v13)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->super._rootController);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v24 = 0;
        v25 = &v24;
        v26 = 0x2050000000;
        v16 = (void *)getBFFStyleClass_softClass;
        v27 = getBFFStyleClass_softClass;
        if (!getBFFStyleClass_softClass)
        {
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __getBFFStyleClass_block_invoke;
          v23[3] = &unk_1E4A65650;
          v23[4] = &v24;
          __getBFFStyleClass_block_invoke((uint64_t)v23);
          v16 = (void *)v25[3];
        }
        v17 = objc_retainAutorelease(v16);
        _Block_object_dispose(&v24, 8);
        objc_msgSend(v17, "sharedStyle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "edgeInsetsForTable:", self->_table);
        v5 = v19;
        v21 = v20;

        v9 = v9 - (v5 + v21);
      }
    }
  }
  else
  {

  }
  -[UITableView setFrame:](self->_table, "setFrame:", v5, v7, v9, v11);
  -[PSListController _updateSectionContentInsetWithAnimation:](self, "_updateSectionContentInsetWithAnimation:", 0);
}

- (void)_updateSectionContentInsetWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  PSListControllerAppearanceProvider *appearanceProvider;
  _BOOL8 v6;
  _BOOL8 sectionContentInsetInitialized;
  _QWORD v8[5];

  v3 = a3;
  -[PSListController _ensureAppearanceProviderAndNavigationCoordinator](self, "_ensureAppearanceProviderAndNavigationCoordinator");
  appearanceProvider = self->_appearanceProvider;
  v6 = -[PSListController _isRegularWidth](self, "_isRegularWidth");
  sectionContentInsetInitialized = self->_sectionContentInsetInitialized;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__PSListController__updateSectionContentInsetWithAnimation___block_invoke;
  v8[3] = &unk_1E4A654F0;
  v8[4] = self;
  -[PSListControllerAppearanceProvider listController:updateSectionContentInsetAnimated:isRegularWidth:contentInsetInitialized:contentInsetInitializedApplicator:](appearanceProvider, "listController:updateSectionContentInsetAnimated:isRegularWidth:contentInsetInitialized:contentInsetInitializedApplicator:", self, v3, v6, sectionContentInsetInitialized, v8);
}

- (BOOL)edgeToEdgeCells
{
  return self->_edgeToEdgeCells;
}

- (void)loadView
{
  void *v3;
  id v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UITableView *v10;
  UITableView *table;
  UIView *v12;
  id WeakRetained;
  char isKindOfClass;
  UIView *containerView;
  UIView *v16;

  -[PSListController _ensureAppearanceProviderAndNavigationCoordinator](self, "_ensureAppearanceProviderAndNavigationCoordinator");
  +[PSListController appearance](PSListController, "appearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", objc_msgSend(v3, "extendedLayoutIncludesOpaqueBars"));

  v4 = objc_alloc(-[PSListController tableViewClass](self, "tableViewClass"));
  v5 = -[PSListController tableViewStyle](self, "tableViewStyle");
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = (UITableView *)objc_msgSend(v4, "initWithFrame:style:", v5, *MEMORY[0x1E0C9D648], v7, v8, v9);
  table = self->_table;
  self->_table = v10;

  -[UITableView setDataSource:](self->_table, "setDataSource:", self);
  -[UITableView setDelegate:](self->_table, "setDelegate:", self);
  if (self->_prefetchingEnabled)
    -[UITableView setPrefetchDataSource:](self->_table, "setPrefetchDataSource:", self);
  v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v6, v7, v8, v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._rootController);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[PSListControllerAppearanceProvider customizeTableView:inContainerView:hostedInSetupController:forListController:](self->_appearanceProvider, "customizeTableView:inContainerView:hostedInSetupController:forListController:", self->_table, v12, isKindOfClass & 1, self);
  -[UIView addSubview:](v12, "addSubview:", self->_table);
  containerView = self->_containerView;
  self->_containerView = v12;
  v16 = v12;

  -[PSListController setView:](self, "setView:", self->_containerView);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (Class)tableViewClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  UITableView *table;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  PSListController *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  objc_super v24;

  v3 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PSListController;
  -[PSViewController viewWillAppear:](&v24, sel_viewWillAppear_);
  if (objc_msgSend(MEMORY[0x1E0CEA2F8], "shouldMakeUIForDefaultPNG"))
  {
    -[PSListController table](self, "table");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 0);

  }
  v6 = -[PSListControllerNavigationCoordinator listControllerShouldNotDeselectAfterAppearing:](self->_navigationCoordinator, "listControllerShouldNotDeselectAfterAppearing:", self);
  -[UITableView indexPathForSelectedRow](self->_table, "indexPathForSelectedRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
    {
      table = self->_table;
      -[UITableView indexPathForSelectedRow](table, "indexPathForSelectedRow");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](table, "scrollToRowAtIndexPath:atScrollPosition:animated:", v9, 1, 1);

    }
    else if (v3)
    {
      -[PSListController transitionCoordinator](self, "transitionCoordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __35__PSListController_viewWillAppear___block_invoke;
      v22[3] = &unk_1E4A65518;
      v22[4] = self;
      v23 = v7;
      v16 = v11;
      v17 = 3221225472;
      v18 = __35__PSListController_viewWillAppear___block_invoke_2;
      v19 = &unk_1E4A65518;
      v20 = self;
      v21 = v23;
      objc_msgSend(v10, "animateAlongsideTransition:completion:", v22, &v16);

    }
    else
    {
      -[UITableView deselectRowAtIndexPath:animated:](self->_table, "deselectRowAtIndexPath:animated:", v7, 0);
    }
  }
  +[PSListController appearance](PSListController, "appearance", v16, v17, v18, v19, v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "usesDarkTheme");

  if (v13)
  {
    -[PSListController table](self, "table");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIndicatorStyle:", 2);

    -[PSListController table](self, "table");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_accessibilitySetInterfaceStyleIntent:", 2);

  }
  self->_hasAppeared = 1;
  if (-[PSListController contentSizeDidChange](self, "contentSizeDidChange"))
  {
    -[PSListController delayedContentSizeDidChange](self, "delayedContentSizeDidChange");
    -[PSListController setContentSizeDidChange:](self, "setContentSizeDidChange:", 0);
  }

}

- (void)didBecomeActive:(id)a3
{
  if (-[PSListController contentSizeDidChange](self, "contentSizeDidChange", a3))
  {
    -[PSListController delayedContentSizeDidChange](self, "delayedContentSizeDidChange");
    -[PSListController setContentSizeDidChange:](self, "setContentSizeDidChange:", 0);
  }
}

- (BOOL)contentSizeDidChange
{
  return self->_contentSizeDidChange;
}

- (BOOL)usesDarkTheme
{
  return self->_usesDarkTheme;
}

- (BOOL)_isRegularWidth
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithHorizontalSizeClass:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController splitViewController](self, "splitViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsTraitsInCollection:", v3);

  return v6;
}

uint64_t __60__PSListController__updateSectionContentInsetWithAnimation___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1153) = 1;
  return result;
}

- (int64_t)tableViewStyle
{
  -[PSListController _ensureAppearanceProviderAndNavigationCoordinator](self, "_ensureAppearanceProviderAndNavigationCoordinator");
  return -[PSListControllerAppearanceProvider tableViewStyleForListController:](self->_appearanceProvider, "tableViewStyleForListController:", self);
}

- (void)reloadSpecifiers
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  PSListController *v10;
  NSArray *specifiers;
  NSMutableDictionary *specifiersByID;
  NSMutableArray *groups;
  id v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UITableView *table;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  id obj;
  uint8_t buf[4];
  PSListController *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  PKLogForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, "PSListController.reloadSpecifiers");

  PKLogForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138543618;
    v31 = self;
    v32 = 2082;
    v33 = "-[PSListController reloadSpecifiers]";
    _os_signpost_emit_with_name_impl(&dword_1A3819000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PSListController.reloadSpecifiers", "%{public}@: %{public}s", buf, 0x16u);
  }

  -[UITableView indexPathForSelectedRow](self->_table, "indexPathForSelectedRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PSListController specifierAtIndex:](self, "specifierAtIndex:", -[PSListController indexForIndexPath:](self, "indexForIndexPath:", v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v10 = self;
  objc_sync_enter(v10);
  specifiers = v10->_specifiers;
  v10->_specifiers = 0;

  specifiersByID = v10->_specifiersByID;
  v10->_specifiersByID = 0;

  groups = v10->_groups;
  v10->_groups = 0;

  objc_sync_exit(v10);
  v14 = -[PSListController specifiers](v10, "specifiers");
  -[PSListController prepareSpecifiersMetadata](v10, "prepareSpecifiersMetadata");
  -[PSListController reload](v10, "reload");
  WeakRetained = objc_loadWeakRetained((id *)&v10->super._rootController);
  objc_msgSend(WeakRetained, "viewControllers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "indexOfObject:", v10);
  if (objc_msgSend(v16, "count") > (unint64_t)(v17 + 1))
  {
    objc_msgSend(v16, "objectAtIndex:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "specifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSListController specifierForID:](v10, "specifierForID:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v18, "specifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "migrateSpecifierMetadataFrom:to:", v22, v21);

      }
      objc_msgSend(v18, "setSpecifier:", v21);

    }
  }
  if (v9)
  {
    -[PSListController specifierForID:](v10, "specifierForID:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      table = self->_table;
      -[PSListController indexPathForIndex:](v10, "indexPathForIndex:", -[PSListController indexOfSpecifier:](v10, "indexOfSpecifier:", v23));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView selectRowAtIndexPath:animated:scrollPosition:](table, "selectRowAtIndexPath:animated:scrollPosition:", v25, 0, 0);

    }
  }
  -[PSListController setForceSynchronousIconLoadForCreatedCells:](v10, "setForceSynchronousIconLoadForCreatedCells:", 1);
  v26 = -[UITableView visibleCells](self->_table, "visibleCells");
  -[PSListController setForceSynchronousIconLoadForCreatedCells:](v10, "setForceSynchronousIconLoadForCreatedCells:", 0);
  PKLogForCategory(6);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A3819000, v28, OS_SIGNPOST_INTERVAL_END, v4, "PSListController.reloadSpecifiers", (const char *)&unk_1A38FDA81, buf, 2u);
  }

  objc_sync_exit(obj);
}

- (void)viewDidLoad
{
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  PSSpecifier *specifier;
  id WeakRetained;
  NSArray *v27;
  NSArray *specifiers;
  objc_super v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  v29.receiver = self;
  v29.super_class = (Class)PSListController;
  -[PSViewController viewDidLoad](&v29, sel_viewDidLoad);
  PKLogForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, "PSListController.loadSpecifiersInViewDidLoad");

  PKLogForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v8 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v31 = v8;
    v32 = 2082;
    v33 = "-[PSListController viewDidLoad]";
    _os_signpost_emit_with_name_impl(&dword_1A3819000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PSListController.loadSpecifiersInViewDidLoad", "%{public}@: %{public}s", buf, 0x16u);
  }

  v9 = -[PSListController specifiers](self, "specifiers");
  -[PSListController _loadBundleControllers](self, "_loadBundleControllers");
  PKLogForCategory(6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A3819000, v11, OS_SIGNPOST_INTERVAL_END, v5, "PSListController.loadSpecifiersInViewDidLoad", (const char *)&unk_1A38FDA81, buf, 2u);
  }

  if (!self->_specifiers)
  {
    specifier = self->super._specifier;
    if (specifier)
    {
      if (specifier->getter)
      {
        WeakRetained = objc_loadWeakRetained(&specifier->target);
        SFPerformSelector();
        v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
        specifiers = self->_specifiers;
        self->_specifiers = v27;

      }
    }
  }
  -[PSListController prepareSpecifiersMetadata](self, "prepareSpecifiersMetadata");
  -[PSListController reload](self, "reload");
  v12 = objc_loadWeakRetained((id *)&self->super._rootController);
  if (v12)
  {
    -[PSViewController rootController](self, "rootController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[PSViewController rootController](self, "rootController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logSettingsPath");

    }
  }
  v16 = objc_loadWeakRetained((id *)&self->super._rootController);
  if (v16)
  {
    -[PSViewController rootController](self, "rootController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[PSViewController rootController](self, "rootController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "aggregateDictionaryPath");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v20, "length"))
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        +[PSListController aggregateReportingDomainOverride](PSListController, "aggregateReportingDomainOverride");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@.%@"), v22, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        ADClientAddValueForScalarKey();
        _PSLoggingFacility();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v31 = (uint64_t)v23;
          _os_log_impl(&dword_1A3819000, v24, OS_LOG_TYPE_DEFAULT, "viewDidLoad \"%@\", buf, 0xCu);
        }

      }
    }
  }
  objc_sync_exit(v3);

}

- (void)reload
{
  _BOOL4 cachesCells;
  void *v4;

  -[PSListController clearCache](self, "clearCache");
  cachesCells = self->_cachesCells;
  if (self->_cachesCells)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](self->_specifiers, "count"));
  else
    v4 = 0;
  objc_storeStrong((id *)&self->_cells, v4);
  if (cachesCells)

  -[UITableView reloadData](self->_table, "reloadData");
}

- (void)_loadBundleControllers
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;

  if (!self->_bundlesLoaded)
  {
    v3 = -[NSMutableArray count](self->_bundleControllers, "count");
    self->_bundlesLoaded = 1;
    if (v3)
    {
      v4 = v3;
      for (i = 0; i != v4; ++i)
      {
        -[NSMutableArray objectAtIndex:](self->_bundleControllers, "objectAtIndex:", i);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "load");

      }
    }
  }
}

- (void)clearCache
{
  NSMutableDictionary *cells;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  cells = self->_cells;
  self->_cells = 0;

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (void *)-[NSArray copy](self->_specifiers, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "removePropertyForKey:", CFSTR("cellObject"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setForceSynchronousIconLoadForCreatedCells:(BOOL)a3
{
  self->_forceSynchronousIconLoadForCreatedCells = a3;
}

- (id)specifiers
{
  PSListController *v2;
  PSSpecifierDataSource *dataSource;
  void *v4;
  uint64_t v5;
  NSArray *specifiers;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *v10;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_specifiers)
  {
    if (v2->_dataSource)
    {
      v2->_requestingSpecifiersFromDataSource = 1;
      dataSource = v2->_dataSource;
      -[PSListController specifier](v2, "specifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierDataSource specifiersForSpecifier:observer:](dataSource, "specifiersForSpecifier:observer:", v4, v2);
      v5 = objc_claimAutoreleasedReturnValue();
      specifiers = v2->_specifiers;
      v2->_specifiers = (NSArray *)v5;

      v2->_requestingSpecifiersFromDataSource = 0;
    }
    else
    {
      -[PSSpecifier propertyForKey:](v2->super._specifier, "propertyForKey:", CFSTR("label"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier target](v2->super._specifier, "target");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSListController loadSpecifiersFromPlistName:target:](v2, "loadSpecifiersFromPlistName:target:", v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v2->_specifiers;
      v2->_specifiers = (NSArray *)v9;

    }
  }
  objc_sync_exit(v2);

  return v2->_specifiers;
}

- (id)specifier
{
  return self->super._specifier;
}

- (UIColor)buttonTextColor
{
  return self->_buttonTextColor;
}

- (PSListController)init
{
  PSListController *v2;
  PSListController *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSListController;
  v2 = -[PSViewController init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cachesCells = 1;
    v2->_reusesCells = 0;
    -[PSListController _ensureAppearanceProviderAndNavigationCoordinator](v2, "_ensureAppearanceProviderAndNavigationCoordinator");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__returnKeyPressed_, *MEMORY[0x1E0CEB938], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__keyboardWillShow_, *MEMORY[0x1E0CEB978], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__keyboardWillHide_, *MEMORY[0x1E0CEB970], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__keyboardDidHide_, *MEMORY[0x1E0CEB820], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_contentSizeDidChange_, *MEMORY[0x1E0CEB3F0], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_didBecomeActive_, *MEMORY[0x1E0CEB270], 0);
    v5 = (void *)objc_opt_new();
    -[PSListController setUrlHandler:](v3, "setUrlHandler:", v5);

    -[PSListController urlHandler](v3, "urlHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v3);

  }
  return v3;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  double v6;
  double v7;

  v5 = a4;
  -[PSListController _ensureAppearanceProviderAndNavigationCoordinator](self, "_ensureAppearanceProviderAndNavigationCoordinator");
  -[PSListControllerAppearanceProvider estimatedHeightOfRowForCellWithIndexPath:inController:](self->_appearanceProvider, "estimatedHeightOfRowForCellWithIndexPath:inController:", v5, self);
  v7 = v6;

  return v7;
}

- (void)_ensureAppearanceProviderAndNavigationCoordinator
{
  PSListControllerAppearanceProvider *v3;
  PSListControllerAppearanceProvider *appearanceProvider;
  PSListControllerNavigationCoordinator *v5;
  PSListControllerNavigationCoordinator *navigationCoordinator;

  if (ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken != -1)
    dispatch_once(&ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken, &__block_literal_global_851);
  if (!self->_appearanceProvider)
  {
    v3 = (PSListControllerAppearanceProvider *)objc_alloc_init((Class)defaultAppearanceProviderClass);
    appearanceProvider = self->_appearanceProvider;
    self->_appearanceProvider = v3;

  }
  if (!self->_navigationCoordinator)
  {
    v5 = (PSListControllerNavigationCoordinator *)objc_alloc_init((Class)defaultNavigationCoordinatorClass);
    navigationCoordinator = self->_navigationCoordinator;
    self->_navigationCoordinator = v5;

  }
}

- (PSURLControllerHandler)urlHandler
{
  return self->_urlHandler;
}

- (void)setUrlHandler:(id)a3
{
  objc_storeStrong((id *)&self->_urlHandler, a3);
}

- (void)reloadSpecifier:(id)a3
{
  -[PSListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", a3, 0);
}

- (UIColor)footerHyperlinkColor
{
  return self->_footerHyperlinkColor;
}

- (void)reloadSpecifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  PSListController *v6;
  NSArray *specifiers;
  uint64_t v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = self;
  objc_sync_enter(v6);
  specifiers = v6->_specifiers;
  if (specifiers)
    v8 = -[NSArray indexOfObject:](specifiers, "indexOfObject:", v9);
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  objc_sync_exit(v6);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    -[PSListController reloadSpecifierAtIndex:animated:](v6, "reloadSpecifierAtIndex:animated:", v8, v4);

}

- (void)removeSpecifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  id v8;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99D20];
  v7 = a3;
  v8 = (id)objc_msgSend([v6 alloc], "initWithObjects:", v7, 0);

  -[PSListController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v8, v4);
}

- (void)_removeContiguousSpecifiers:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSMutableDictionary *cells;
  void *v37;
  PSListController *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  _BOOL4 v49;
  BOOL v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id *location;
  void *v57;
  PSListController *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v4 = a4;
  v70 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  location = (id *)&self->_specifiers;
  if (self->_specifiers)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
    goto LABEL_52;
  v67 = -1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  v58 = self;
  if (!v12)
  {

    v55 = 0;
    goto LABEL_29;
  }
  v13 = v12;
  v49 = v4;
  v51 = v6;
  v53 = v9;
  v55 = 0;
  v14 = 0;
  LOBYTE(v15) = 0;
  v16 = *(_QWORD *)v64;
  v17 = -1;
  v18 = -1;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v64 != v16)
        objc_enumerationMutation(v11);
      v20 = *(id *)(*((_QWORD *)&v63 + 1) + 8 * i);

      v57 = v20;
      v21 = objc_msgSend(*location, "indexOfObject:", v20);
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_27:

        v6 = v51;
        v9 = v53;
        goto LABEL_51;
      }
      v22 = v21;
      if (v18 == -1)
      {
        -[PSListController getGroup:row:ofSpecifierAtIndex:](v58, "getGroup:row:ofSpecifierAtIndex:", &v67, 0, v21);
        -[NSMutableArray objectAtIndex:](v58->_groups, "objectAtIndex:", v67);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v23, "integerValue");

        v18 = v22;
        v55 = v22;
      }
      else if (v21 != v18)
      {
        goto LABEL_27;
      }
      v14 = v20;
      if (*((_QWORD *)v20 + 7))
      {
        if ((v15 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v18 + ~v17, v67);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "insertObject:atIndex:", v24, 0);

          v14 = v20;
          v15 = 0;
          goto LABEL_22;
        }
      }
      else
      {
        if (v55 != v18)
          ++v67;
        objc_msgSend(v10, "addIndex:");
      }
      v15 = 1;
LABEL_22:
      ++v18;
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    if (v13)
      continue;
    break;
  }

  if (v15)
  {
    v25 = v67;
    self = v58;
    v4 = v49;
    if (v25 == -[NSMutableArray count](v58->_groups, "count") - 1)
    {
      v26 = objc_msgSend(*location, "count") - v55;
    }
    else
    {
      -[NSMutableArray objectAtIndex:](v58->_groups, "objectAtIndex:", v67 + 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v47, "integerValue") - v55;

    }
    v6 = v51;
    v9 = v53;
    goto LABEL_30;
  }
  v6 = v51;
  v9 = v53;
  self = v58;
  v4 = v49;
LABEL_29:
  v26 = objc_msgSend(v11, "count");
LABEL_30:
  if (v4)
    v27 = 0;
  else
    v27 = 5;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", 0);
  -[UITableView beginUpdates](self->_table, "beginUpdates");
  v28 = (void *)objc_msgSend(*location, "mutableCopy");
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v57 = v28;
  objc_msgSend(v28, "subarrayWithRange:", v55, v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  if (v30)
  {
    v31 = v30;
    v48 = v26;
    v52 = v6;
    v54 = v9;
    v50 = v4;
    v32 = 0;
    v33 = *(_QWORD *)v60;
    do
    {
      v34 = 0;
      v35 = v32;
      do
      {
        if (*(_QWORD *)v60 != v33)
          objc_enumerationMutation(v29);
        v32 = *(id *)(*((_QWORD *)&v59 + 1) + 8 * v34);

        if (v32[7])
        {
          cells = self->_cells;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v32);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](cells, "removeObjectForKey:", v37);

          self = v58;
          objc_msgSend(v32, "removePropertyForKey:", CFSTR("cellObject"));
        }
        -[PSListController _removeIdentifierForSpecifier:](self, "_removeIdentifierForSpecifier:", v32);
        ++v34;
        v35 = v32;
      }
      while (v31 != v34);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    }
    while (v31);

    v6 = v52;
    v9 = v54;
    LOBYTE(v4) = v50;
    v26 = v48;
  }

  objc_msgSend(v57, "removeObjectsInRange:", v55, v26);
  v38 = self;
  objc_sync_enter(v38);
  objc_storeStrong(location, v57);
  objc_sync_exit(v38);

  -[PSListController createGroupIndices](v38, "createGroupIndices");
  if (objc_msgSend(v10, "count"))
    -[UITableView deleteSections:withRowAnimation:](self->_table, "deleteSections:withRowAnimation:", v10, v27);
  if (objc_msgSend(v9, "count"))
    -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](self->_table, "deleteRowsAtIndexPaths:withRowAnimation:", v9, v27);
  -[UITableView endUpdates](self->_table, "endUpdates");
  if (!v4)
    objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", 1);
LABEL_51:

LABEL_52:
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    _PSLoggingFacility();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      -[PSListController _removeContiguousSpecifiers:animated:].cold.1(v39, v40, v41, v42, v43, v44, v45, v46);

  }
}

- (void)setSpecifier:(id)a3
{
  id v4;
  _BOOL8 v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  if (self->super._specifier != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)PSListController;
    v4 = a3;
    -[PSViewController setSpecifier:](&v10, sel_setSpecifier_, v4);
    v5 = (-[UITableView _displaysCellContentStringsOnTapAndHold](self->_table, "_displaysCellContentStringsOnTapAndHold", v10.receiver, v10.super_class) & 1) != 0|| -[PSSpecifier showContentString](self->super._specifier, "showContentString");
    -[UITableView _setDisplaysCellContentStringsOnTapAndHold:](self->_table, "_setDisplaysCellContentStringsOnTapAndHold:", v5);
    objc_msgSend(v4, "propertyForKey:", CFSTR("dataSourceClass"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[objc_class sharedInstance](NSClassFromString(v6), "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSListController setSpecifierDataSource:](self, "setSpecifierDataSource:", v7);

    }
    else
    {
      -[PSListController setSpecifierDataSource:](self, "setSpecifierDataSource:", 0);
    }
    -[PSListController title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[PSSpecifier name](self->super._specifier, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSListController setTitle:](self, "setTitle:", v9);

    }
  }
}

- (void)setTitle:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v5.receiver = self;
    v5.super_class = (Class)PSListController;
    -[PSListController setTitle:](&v5, sel_setTitle_, v4);
  }

}

- (void)setSpecifierDataSource:(id)a3
{
  PSSpecifierDataSource *v5;
  PSSpecifierDataSource *dataSource;
  PSSpecifierDataSource *v7;

  v5 = (PSSpecifierDataSource *)a3;
  dataSource = self->_dataSource;
  if (dataSource != v5)
  {
    v7 = v5;
    -[PSSpecifierDataSource removeObserver:](dataSource, "removeObserver:", self);
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[PSSpecifierDataSource addObserver:](self->_dataSource, "addObserver:", self);
    v5 = v7;
  }

}

- (int64_t)indexOfSpecifierID:(id)a3
{
  id v4;
  void *v5;
  PSListController *v6;
  int64_t v7;

  v4 = a3;
  -[PSListController specifierForID:](self, "specifierForID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  if (v5)
    v7 = -[NSArray indexOfObject:](v6->_specifiers, "indexOfObject:", v5);
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  objc_sync_exit(v6);

  return v7;
}

- (void)insertSpecifier:(id)a3 afterSpecifierID:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a3;
  -[PSListController specifierForID:](self, "specifierForID:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PSListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v8, v9, v5);

}

- (id)specifierForID:(id)a3
{
  NSMutableDictionary *specifiersByID;
  id v5;
  void *v6;
  void *v7;

  specifiersByID = self->_specifiersByID;
  v5 = a3;
  if (specifiersByID)
  {
    -[NSMutableDictionary objectForKey:](specifiersByID, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PSListController specifiers](self, "specifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "specifierForID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v7;
  }

  return v6;
}

- (void)insertSpecifier:(id)a3 afterSpecifier:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSArray *specifiers;
  uint64_t v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  specifiers = self->_specifiers;
  if (specifiers)
  {
    if (v8)
      v10 = -[NSArray indexOfObject:](specifiers, "indexOfObject:", v8) + 1;
    else
      v10 = -[NSArray count](specifiers, "count");
    -[PSListController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v11, v10, v5);
  }

}

- (void)insertSpecifier:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  id v10;

  if (self->_specifiers)
  {
    v5 = a5;
    v8 = (objc_class *)MEMORY[0x1E0C99D20];
    v9 = a3;
    v10 = (id)objc_msgSend([v8 alloc], "initWithObjects:", v9, 0);

    -[PSListController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v10, a4, v5);
  }
}

- (void)_insertContiguousSpecifiers:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5
{
  id v8;
  void *v9;
  NSArray **p_specifiers;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id *location;
  BOOL v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  int64_t v51;
  id obj;
  uint64_t v53;
  id v54;
  PSListController *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  v55 = self;
  p_specifiers = &self->_specifiers;
  if (self->_specifiers)
  {
    v11 = objc_msgSend(v8, "count");
    if ((a4 & 0x8000000000000000) == 0 && v11 && -[NSArray count](*p_specifiers, "count") >= a4)
    {
      v60 = -1;
      v61 = -1;
      v50 = -[NSArray count](*p_specifiers, "count");
      v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
      v14 = v9;
      v15 = v14;
      v48 = v13;
      v44 = v9;
      v46 = a5;
      v51 = a4;
      if (a4)
      {
        -[PSListController getGroup:row:ofSpecifierAtIndex:](self, "getGroup:row:ofSpecifierAtIndex:", &v60, &v61, a4 - 1);
        v17 = v60;
        v16 = v61;
      }
      else
      {
        objc_msgSend(v14, "objectAtIndex:", 0);
        v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (v18[7])
        {
          v19 = (void *)objc_msgSend(v15, "mutableCopy");
          +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
          v20 = v12;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "insertObject:atIndex:", v21, 0);

          v12 = v20;
          v13 = v48;

          v15 = v19;
        }

        v17 = -1;
        v16 = -1;
      }
      v53 = v16;
      location = (id *)p_specifiers;
      v54 = (id)-[NSArray mutableCopy](*p_specifiers, "mutableCopy");
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      obj = v15;
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      if (v22)
      {
        v23 = v22;
        v24 = 0;
        v25 = *(_QWORD *)v57;
        v49 = v12;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v57 != v25)
              objc_enumerationMutation(obj);
            v27 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
            objc_msgSend(v54, "insertObject:atIndex:", v27, a4);
            -[PSListController _addIdentifierForSpecifier:](v55, "_addIdentifierForSpecifier:", v27);
            if (*(_QWORD *)(v27 + 56))
            {
              if ((v24 & 1) == 0)
              {
                ++v53;
                objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "addObject:", v28);

                v24 = 0;
                goto LABEL_28;
              }
LABEL_26:
              v24 = 1;
              goto LABEL_28;
            }
            objc_msgSend(v12, "addIndex:", ++v17);
            if (objc_msgSend(v12, "count") != 1)
              goto LABEL_26;
            v29 = v50;
            if (v17 != -[NSMutableArray count](v55->_groups, "count"))
            {
              -[NSMutableArray objectAtIndex:](v55->_groups, "objectAtIndex:", v17);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v30, "integerValue");

            }
            v31 = v29 - v51;
            if (v29 == v51 || v31 < 1)
            {
              v24 = 1;
              v12 = v49;
            }
            else
            {
              v32 = v61;
              do
              {
                objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", ++v32, v60);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "addObject:", v33);

              }
              while (v32 < v31 + v61);
              v24 = 1;
              v13 = v48;
              v12 = v49;
            }
LABEL_28:
            ++a4;
          }
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        }
        while (v23);
      }

      v34 = v55;
      objc_sync_enter(v34);
      objc_storeStrong(location, v54);
      objc_sync_exit(v34);

      objc_msgSend(v34, "createGroupIndices");
      if (v46)
      {
        v35 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", 0);
        v35 = 5;
      }
      v9 = v44;
      objc_msgSend(v34[130], "beginUpdates");
      if (objc_msgSend(v47, "count"))
        objc_msgSend(v34[130], "deleteRowsAtIndexPaths:withRowAnimation:", v47, v35);
      if (objc_msgSend(v12, "count"))
        objc_msgSend(v34[130], "insertSections:withRowAnimation:", v12, v35);
      if (objc_msgSend(v48, "count"))
        objc_msgSend(v34[130], "insertRowsAtIndexPaths:withRowAnimation:", v48, v35);
      objc_msgSend(v34[130], "endUpdates");
      if (!v46)
        objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", 1);

    }
  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    _PSLoggingFacility();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      -[PSListController _insertContiguousSpecifiers:atIndex:animated:].cold.1(v36, v37, v38, v39, v40, v41, v42, v43);

  }
}

- (void)prepareSpecifiersMetadata
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  PSListController *v10;
  NSArray *specifiers;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  NSMutableDictionary *specifiersByID;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSListController viewIfLoaded](self, "viewIfLoaded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("View is loaded");
    *(_DWORD *)buf = 138543874;
    v29 = v6;
    if (!v8)
      v9 = CFSTR("View is not loaded");
    v30 = 2114;
    v31 = v7;
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_1A3819000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ %@", buf, 0x20u);

  }
  v10 = self;
  objc_sync_enter(v10);
  specifiers = v10->_specifiers;
  if (specifiers && -[NSArray count](specifiers, "count"))
  {
    -[NSArray objectAtIndex:](v10->_specifiers, "objectAtIndex:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12 && *(_QWORD *)(v12 + 56))
    {
      v14 = (NSArray *)-[NSArray mutableCopy](v10->_specifiers, "mutableCopy");
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray insertObject:atIndex:](v14, "insertObject:atIndex:", v15, 0);

      v16 = v10->_specifiers;
      v10->_specifiers = v14;

    }
  }
  else
  {
    v13 = 0;
  }
  objc_sync_exit(v10);

  -[PSListController createGroupIndices](v10, "createGroupIndices");
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](v10->_specifiers, "count"));
  specifiersByID = v10->_specifiersByID;
  v10->_specifiersByID = (NSMutableDictionary *)v17;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v19 = v10->_specifiers;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v19);
        -[PSListController _addIdentifierForSpecifier:](v10, "_addIdentifierForSpecifier:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v20);
  }

}

- (void)_addIdentifierForSpecifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[PSListController indexOfSpecifier:](self, "indexOfSpecifier:", v4));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProperty:forKey:", v5, CFSTR("id"));
  }
  v6 = v5;
  v7 = 0;
  v8 = v6;
  do
  {
    -[NSMutableDictionary objectForKey:](self->_specifiersByID, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = v8;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%lu"), v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->_specifiersByID, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    ++v7;
    v8 = v10;
  }
  while (v11);
  objc_msgSend(v4, "setProperty:forKey:", v10, CFSTR("id"));
  _PSLoggingFacility();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v15 = v13;
    v16 = 2048;
    v17 = v4;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_1A3819000, v12, OS_LOG_TYPE_DEFAULT, "re-assigned ID for %@ <%p> from %@ to %@", buf, 0x2Au);

  }
LABEL_10:
  -[NSMutableDictionary setObject:forKey:](self->_specifiersByID, "setObject:forKey:", v4, v10);

}

- (BOOL)containsSpecifier:(id)a3
{
  return -[PSListController indexOfSpecifier:](self, "indexOfSpecifier:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)indexOfSpecifier:(id)a3
{
  id v4;
  PSListController *v5;
  NSArray *specifiers;
  int64_t v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  specifiers = v5->_specifiers;
  if (specifiers)
    v7 = -[NSArray indexOfObject:](specifiers, "indexOfObject:", v4);
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  objc_sync_exit(v5);

  return v7;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (PSSpecifierDataSource)specifierDataSource
{
  return self->_dataSource;
}

- (void)setCellHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_cellHighlightColor, a3);
}

- (void)setSpecifierID:(id)a3
{
  objc_storeStrong((id *)&self->_specifierID, a3);
}

- (void)setSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_separatorColor, a3);
}

- (void)setForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundColor, a3);
}

- (void)setFooterHyperlinkColor:(id)a3
{
  objc_storeStrong((id *)&self->_footerHyperlinkColor, a3);
}

- (void)setEditableTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_editableTextColor, a3);
}

- (void)setEditablePlaceholderTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_editablePlaceholderTextColor, a3);
}

- (void)setButtonTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTextColor, a3);
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setAltTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_altTextColor, a3);
}

- (void)setPadSelectionColor:(id)a3
{
  objc_storeStrong((id *)&self->_padSelectionColor, a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float verticalContentOffset;
  NSString *offsetItemName;
  void *v23;
  NSString *highlightItemName;
  NSString *v25;
  int v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PSListController;
  -[PSViewController viewDidAppear:](&v27, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRunningTest:", CFSTR("EnterMMCPane"));

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    v8 = CFSTR("EnterMMCPane");
LABEL_5:
    objc_msgSend(v7, "finishedTest:extraResults:", v8, 0);
LABEL_6:

    goto LABEL_7;
  }
  v9 = objc_msgSend(v6, "isRunningTest:", CFSTR("EnterGeneralPane"));

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (v9)
  {
    v8 = CFSTR("EnterGeneralPane");
    goto LABEL_5;
  }
  v26 = objc_msgSend(v10, "isRunningTest:", CFSTR("EnteriCloudPane"));

  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishedTest:", CFSTR("EnteriCloudPane"));
    goto LABEL_6;
  }
LABEL_7:
  if (self->_verticalContentOffset == 0.0)
  {
    offsetItemName = self->_offsetItemName;
    if (!offsetItemName)
      goto LABEL_18;
    -[PSListController _scrollToSpecifierWithID:animated:](self, "_scrollToSpecifierWithID:animated:", offsetItemName, 0);
    v11 = self->_offsetItemName;
    self->_offsetItemName = 0;
  }
  else
  {
    -[PSListController table](self, "table");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentSize");
    v13 = v12;
    objc_msgSend(v11, "contentInset");
    v15 = v13 + v14;
    objc_msgSend(v11, "contentInset");
    v17 = v15 + v16;
    objc_msgSend(v11, "frame");
    v19 = v17 - v18;
    verticalContentOffset = self->_verticalContentOffset;
    if (v17 - v18 > 0.0 && v19 < verticalContentOffset)
    {
      verticalContentOffset = v19;
      self->_verticalContentOffset = verticalContentOffset;
    }
    objc_msgSend(v11, "setContentOffset:", 0.0, verticalContentOffset);
    self->_verticalContentOffset = 0.0;
  }

LABEL_18:
  if (-[PSListController shouldSelectResponderOnAppearance](self, "shouldSelectResponderOnAppearance"))
  {
    -[PSListController findFirstVisibleResponder](self, "findFirstVisibleResponder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "becomeFirstResponder");

  }
  self->_showingSetupController = 0;
  -[UITableView flashScrollIndicators](self->_table, "flashScrollIndicators");
  self->_isVisible = 1;
  highlightItemName = self->_highlightItemName;
  if (highlightItemName)
  {
    -[PSListController _performHighlightForSpecifierWithID:tryAgainIfFailed:](self, "_performHighlightForSpecifierWithID:tryAgainIfFailed:", highlightItemName, 1);
    v25 = self->_highlightItemName;
    self->_highlightItemName = 0;

  }
}

- (BOOL)shouldSelectResponderOnAppearance
{
  void *v3;
  char isKindOfClass;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "sf_isiPad") && !self->_hasAppeared)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._rootController);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)setReusesCells:(BOOL)a3
{
  if (self->_reusesCells != a3)
  {
    self->_reusesCells = a3;
    if (a3)
      -[PSListController setCachesCells:](self, "setCachesCells:", 0);
  }
}

- (void)setUsesDarkTheme:(BOOL)a3
{
  self->_usesDarkTheme = a3;
}

- (void)setEdgeToEdgeCells:(BOOL)a3
{
  self->_edgeToEdgeCells = a3;
}

- (id)bundle
{
  if (-[PSListController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  else
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setSegmentedSliderTrackColor:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedSliderTrackColor, a3);
}

- (void)setEditableSelectionHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_editableSelectionHighlightColor, a3);
}

- (void)setEditableSelectionBarColor:(id)a3
{
  objc_storeStrong((id *)&self->_editableSelectionBarColor, a3);
}

- (void)setEditableInsertionPointColor:(id)a3
{
  objc_storeStrong((id *)&self->_editableInsertionPointColor, a3);
}

- (void)setCellAccessoryColor:(id)a3
{
  objc_storeStrong((id *)&self->_cellAccessoryColor, a3);
}

- (void)setCachesCells:(BOOL)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *cells;

  if (self->_cachesCells != a3)
  {
    self->_cachesCells = a3;
    if (a3)
    {
      -[PSListController setReusesCells:](self, "setReusesCells:", 0);
      if (!self->_cells)
      {
        v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        cells = self->_cells;
        self->_cells = v4;

      }
    }
    else
    {
      -[PSListController clearCache](self, "clearCache");
    }
  }
}

- (id)tableView:(id)a3 detailTextForHeaderInSection:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  NSUInteger v8;
  NSArray *specifiers;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (-[NSMutableArray count](self->_groups, "count", a3) <= (unint64_t)a4
    || (-[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "integerValue"),
        v8 = -[NSArray count](self->_specifiers, "count"),
        v6,
        v7 >= v8))
  {
    v13 = 0;
  }
  else
  {
    specifiers = self->_specifiers;
    -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndex:](specifiers, "objectAtIndex:", objc_msgSend(v10, "integerValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "propertyForKey:", CFSTR("headerDetailText"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      v13 = v12;
    else
      v13 = 0;

  }
  return v13;
}

- (id)indexPathForIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;

  v7 = -1;
  v8 = -1;
  if (-[PSListController getGroup:row:ofSpecifierAtIndex:](self, "getGroup:row:ofSpecifierAtIndex:", &v8, &v7, a3))
  {
    if (v7 < 0)
      v3 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v3 = v7;
    if (v8 < 0)
      v4 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v4 = v8;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSString)specifierIDPendingPush
{
  return self->_specifierIDPendingPush;
}

- (void)reloadSpecifierID:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PKLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = " not";
    v11 = "-[PSListController reloadSpecifierID:animated:]";
    v10 = 136446722;
    if (v4)
      v8 = "";
    v12 = 2114;
    v13 = v6;
    v14 = 2082;
    v15 = v8;
    _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_INFO, "%{public}s: identifier: '%{public}@';%{public}s animated",
      (uint8_t *)&v10,
      0x20u);
  }

  -[PSListController specifierForID:](self, "specifierForID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v9, v4);

}

- (void)insertContiguousSpecifiers:(id)a3 atEndOfGroup:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v8 = a3;
  -[NSArray objectAtIndex:](self->_specifiers, "objectAtIndex:", -[PSListController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", self->_table, a4)+ -[PSListController indexOfGroup:](self, "indexOfGroup:", a4));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", v8, v9, v5);

}

- (void)insertContiguousSpecifiers:(id)a3 afterSpecifierID:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  if (self->_specifiers)
  {
    v5 = a5;
    v8 = a3;
    -[PSListController specifierForID:](self, "specifierForID:", a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PSListController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", v8, v9, v5);

  }
}

- (void)insertContiguousSpecifiers:(id)a3 afterSpecifier:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSArray *specifiers;
  uint64_t v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  specifiers = self->_specifiers;
  if (specifiers)
  {
    if (v8)
      v10 = -[NSArray indexOfObject:](specifiers, "indexOfObject:", v8);
    else
      v10 = -[NSArray count](specifiers, "count") - 1;
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      -[PSListController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v11, v10 + 1, v5);
  }

}

- (BOOL)getGroup:(int64_t *)a3 row:(int64_t *)a4 ofSpecifierID:(id)a5
{
  void *v8;

  -[PSListController specifierForID:](self, "specifierForID:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[PSListController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", a3, a4, v8);

  return (char)a4;
}

- (void)addSpecifiersFromArray:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSArray *specifiers;
  id v7;

  v4 = a4;
  specifiers = self->_specifiers;
  v7 = a3;
  -[PSListController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v7, -[NSArray count](specifiers, "count"), v4);

}

+ (BOOL)displaysButtonBar
{
  return 0;
}

+ (void)setAggregateReportingDomainOverride:(id)a3
{
  uint64_t v3;
  void *v4;

  if ((id)AggregateReportingDomainOverride != a3)
  {
    v3 = objc_msgSend(a3, "copy");
    v4 = (void *)AggregateReportingDomainOverride;
    AggregateReportingDomainOverride = v3;

  }
}

+ (id)aggregateReportingDomainOverride
{
  if (AggregateReportingDomainOverride)
    return (id)AggregateReportingDomainOverride;
  else
    return CFSTR("com.apple.Preferences.Views");
}

- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PSListController bundle](self, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController loadSpecifiersFromPlistName:target:bundle:](self, "loadSpecifiersFromPlistName:target:bundle:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4 bundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  PSSpecifier *specifier;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v22 = 0;
  v23 = 0;
  v10 = a4;
  objc_msgSend(v9, "pathForResource:ofType:", v8, CFSTR("plist"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    _PSLoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "bundlePath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v8;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1A3819000, v12, OS_LOG_TYPE_DEFAULT, "Warning: failed to load preferences plist '%@.plist' for bundle %@", buf, 0x16u);

    }
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v11);
  v15 = (void *)objc_opt_new();
  specifier = self->super._specifier;
  v21 = v15;
  SpecifiersFromPlist(v14, specifier, v10, v8, v9, &v22, &v23, self, &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v21;
  v19 = v21;

  if (self->_bundleControllers)
    -[NSMutableArray addObjectsFromArray:](self->_bundleControllers, "addObjectsFromArray:", v19);
  else
    objc_storeStrong((id *)&self->_bundleControllers, v18);
  -[PSListController setSpecifierID:](self, "setSpecifierID:", v23);
  -[PSListController setTitle:](self, "setTitle:", v22);

  return v17;
}

- (void)_removeIdentifierForSpecifier:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[NSMutableDictionary removeObjectForKey:](self->_specifiersByID, "removeObjectForKey:", v4);
    v4 = v5;
  }

}

- (void)setSpecifiers:(id)a3
{
  PSListController *v5;
  NSArray *v6;

  v6 = (NSArray *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_specifiers == v6)
  {
    objc_sync_exit(v5);

  }
  else
  {
    objc_storeStrong((id *)&v5->_specifiers, a3);
    objc_sync_exit(v5);

    -[PSListController prepareSpecifiersMetadata](v5, "prepareSpecifiersMetadata");
    -[PSListController reload](v5, "reload");
  }

}

- (id)indexPathForSpecifier:(id)a3
{
  return -[PSListController indexPathForIndex:](self, "indexPathForIndex:", -[PSListController indexOfSpecifier:](self, "indexOfSpecifier:", a3));
}

- (void)beginUpdates
{
  -[UITableView beginUpdates](self->_table, "beginUpdates");
}

- (void)endUpdates
{
  -[UITableView endUpdates](self->_table, "endUpdates");
}

- (void)reloadSpecifierAtIndex:(int64_t)a3
{
  -[PSListController reloadSpecifierAtIndex:animated:](self, "reloadSpecifierAtIndex:animated:", a3, 0);
}

- (void)reloadSpecifierID:(id)a3
{
  -[PSListController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", a3, 0);
}

- (int64_t)numberOfGroups
{
  NSMutableArray *groups;

  groups = self->_groups;
  if (!groups)
  {
    -[PSListController createGroupIndices](self, "createGroupIndices");
    groups = self->_groups;
  }
  return -[NSMutableArray count](groups, "count");
}

- (id)specifierAtIndexPath:(id)a3
{
  return -[PSListController specifierAtIndex:](self, "specifierAtIndex:", -[PSListController indexForIndexPath:](self, "indexForIndexPath:", a3));
}

- (id)specifierAtIndex:(int64_t)a3
{
  PSListController *v4;
  unint64_t v5;
  void *v6;

  v4 = self;
  objc_sync_enter(v4);
  v5 = -[NSArray count](v4->_specifiers, "count");
  v6 = 0;
  if ((a3 & 0x8000000000000000) == 0 && v5 > a3)
  {
    -[NSArray objectAtIndex:](v4->_specifiers, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_sync_exit(v4);

  return v6;
}

- (id)getGroupSpecifierForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;

  if (!a3)
    return 0;
  v7 = 0;
  v8 = 0;
  -[PSListController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", &v8, &v7, a3);
  -[PSListController specifiersInGroup:](self, "specifiersInGroup:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)getGroupSpecifierForSpecifierID:(id)a3
{
  void *v4;
  void *v5;

  -[PSListController specifierForID:](self, "specifierForID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController getGroupSpecifierForSpecifier:](self, "getGroupSpecifierForSpecifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)indexForRow:(int64_t)a3 inGroup:(int64_t)a4
{
  void *v5;
  uint64_t v6;

  -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return a3 + v6 + 1;
}

- (int64_t)rowsForGroup:(int64_t)a3
{
  if (!self->_groups)
    -[PSListController createGroupIndices](self, "createGroupIndices");
  return -[UITableView numberOfRowsInSection:](self->_table, "numberOfRowsInSection:", a3);
}

- (id)specifiersInGroup:(int64_t)a3
{
  if (!self->_groups)
    -[PSListController createGroupIndices](self, "createGroupIndices");
  return -[NSArray subarrayWithRange:](self->_specifiers, "subarrayWithRange:", -[PSListController indexOfGroup:](self, "indexOfGroup:", a3), -[PSListController rowsForGroup:](self, "rowsForGroup:", a3) + 1);
}

- (_NSRange)rangeOfSpecifiersInGroupID:(id)a3
{
  int64_t v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v4 = -[PSListController indexOfSpecifierID:](self, "indexOfSpecifierID:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = 1;
    do
    {
      v5 = v6;
      v7 = v4 + v6;
      -[PSListController specifiers](self, "specifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v7 >= v9)
        break;
      -[PSListController specifierAtIndex:](self, "specifierAtIndex:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "cellType");

      v6 = v5 + 1;
    }
    while (v11);
  }
  v12 = v4;
  v13 = v5;
  result.length = v13;
  result.location = v12;
  return result;
}

- (void)insertSpecifier:(id)a3 atEndOfGroup:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v8 = a3;
  -[NSArray objectAtIndex:](self->_specifiers, "objectAtIndex:", -[PSListController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", self->_table, a4)+ -[PSListController indexOfGroup:](self, "indexOfGroup:", a4));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController insertSpecifier:afterSpecifierID:animated:](self, "insertSpecifier:afterSpecifierID:animated:", v8, v9, v5);

}

- (void)insertSpecifier:(id)a3 atIndex:(int64_t)a4
{
  -[PSListController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", a3, a4, 0);
}

- (void)insertSpecifier:(id)a3 afterSpecifier:(id)a4
{
  -[PSListController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", a3, a4, 0);
}

- (void)insertSpecifier:(id)a3 afterSpecifierID:(id)a4
{
  -[PSListController insertSpecifier:afterSpecifierID:animated:](self, "insertSpecifier:afterSpecifierID:animated:", a3, a4, 0);
}

- (void)insertSpecifier:(id)a3 atEndOfGroup:(int64_t)a4
{
  -[PSListController insertSpecifier:atEndOfGroup:animated:](self, "insertSpecifier:atEndOfGroup:animated:", a3, a4, 0);
}

- (void)insertContiguousSpecifiers:(id)a3 atIndex:(int64_t)a4
{
  -[PSListController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", a3, a4, 0);
}

- (void)insertContiguousSpecifiers:(id)a3 afterSpecifier:(id)a4
{
  -[PSListController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", a3, a4, 0);
}

- (void)insertContiguousSpecifiers:(id)a3 afterSpecifierID:(id)a4
{
  -[PSListController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", a3, a4, 0);
}

- (void)insertContiguousSpecifiers:(id)a3 atEndOfGroup:(int64_t)a4
{
  -[PSListController insertContiguousSpecifiers:atEndOfGroup:animated:](self, "insertContiguousSpecifiers:atEndOfGroup:animated:", a3, a4, 0);
}

- (void)addSpecifier:(id)a3
{
  -[PSListController addSpecifier:animated:](self, "addSpecifier:animated:", a3, 0);
}

- (void)addSpecifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSArray *specifiers;
  id v7;

  v4 = a4;
  specifiers = self->_specifiers;
  v7 = a3;
  -[PSListController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v7, -[NSArray count](specifiers, "count"), v4);

}

- (void)addSpecifiersFromArray:(id)a3
{
  -[PSListController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", a3, 0);
}

- (void)removeSpecifierID:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[PSListController specifierForID:](self, "specifierForID:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PSListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v6, v4);

}

- (void)removeSpecifierAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  NSArray *specifiers;
  _BOOL8 v6;
  unint64_t v8;
  id v9;

  specifiers = self->_specifiers;
  if (specifiers)
  {
    v6 = a4;
    v8 = -[NSArray count](specifiers, "count");
    if ((a3 & 0x8000000000000000) == 0 && v8 > a3)
    {
      -[NSArray objectAtIndex:](self->_specifiers, "objectAtIndex:", a3);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[PSListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v9, v6);

    }
  }
}

- (void)removeSpecifier:(id)a3
{
  -[PSListController removeSpecifier:animated:](self, "removeSpecifier:animated:", a3, 0);
}

- (void)removeSpecifierID:(id)a3
{
  -[PSListController removeSpecifierID:animated:](self, "removeSpecifierID:animated:", a3, 0);
}

- (void)removeSpecifierAtIndex:(int64_t)a3
{
  -[PSListController removeSpecifierAtIndex:animated:](self, "removeSpecifierAtIndex:animated:", a3, 0);
}

- (void)removeLastSpecifier
{
  -[PSListController removeLastSpecifierAnimated:](self, "removeLastSpecifierAnimated:", 0);
}

- (void)removeLastSpecifierAnimated:(BOOL)a3
{
  NSArray *specifiers;
  _BOOL8 v5;
  id v6;

  specifiers = self->_specifiers;
  if (specifiers)
  {
    v5 = a3;
    -[NSArray lastObject](specifiers, "lastObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PSListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v6, v5);

  }
}

- (void)removeContiguousSpecifiers:(id)a3
{
  -[PSListController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", a3, 0);
}

- (void)replaceContiguousSpecifiers:(id)a3 withSpecifiers:(id)a4
{
  -[PSListController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", a3, a4, 0);
}

- (void)replaceContiguousSpecifiers:(id)a3 withSpecifiers:(id)a4 animated:(BOOL)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "count");
  v10 = objc_msgSend(v13, "count");
  if (v9 && v10)
  {
    objc_msgSend(v13, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PSListController indexOfSpecifier:](self, "indexOfSpecifier:", v11);
    if (a5)
    {
      -[UITableView beginUpdates](self->_table, "beginUpdates");
      -[PSListController _removeContiguousSpecifiers:animated:](self, "_removeContiguousSpecifiers:animated:", v13, 1);
      -[PSListController _insertContiguousSpecifiers:atIndex:animated:](self, "_insertContiguousSpecifiers:atIndex:animated:", v8, v12, 1);
      -[UITableView endUpdates](self->_table, "endUpdates");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", 0);
      -[UITableView beginUpdates](self->_table, "beginUpdates");
      -[PSListController _removeContiguousSpecifiers:animated:](self, "_removeContiguousSpecifiers:animated:", v13, 0);
      -[PSListController _insertContiguousSpecifiers:atIndex:animated:](self, "_insertContiguousSpecifiers:atIndex:animated:", v8, v12, 0);
      -[UITableView endUpdates](self->_table, "endUpdates");
      objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", 1);
    }

  }
}

- (int64_t)_nextGroupInSpecifiersAfterIndex:(int64_t)a3 inArray:(id)a4
{
  id v5;
  unint64_t v6;
  int64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v5 = a4;
  v6 = a3 + 1;
  do
  {
    v7 = v6;
    if (v6 >= objc_msgSend(v5, "count"))
      break;
    objc_msgSend(v5, "objectAtIndex:", v7);
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v9 = v8[7];

    v6 = v7 + 1;
  }
  while (v9);

  return v7;
}

- (void)updateSpecifiers:(id)a3 withSpecifiers:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray containsObject:](self->_specifiers, "containsObject:", v7))
      -[PSListController updateSpecifiersInRange:withSpecifiers:](self, "updateSpecifiersInRange:withSpecifiers:", -[NSArray indexOfObject:](self->_specifiers, "indexOfObject:", v7), objc_msgSend(v8, "count"), v6);

  }
}

- (void)updateSpecifiersInRange:(_NSRange)a3 withSpecifiers:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  NSArray *specifiers;
  NSUInteger v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  char v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  char v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t j;
  void *v61;
  uint64_t v62;
  NSUInteger v63;
  void *v64;
  PSListController *v65;
  NSUInteger v66;
  uint64_t v67;
  NSUInteger v68;
  void *v69;
  id v70;
  void *v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  unint64_t v78;
  int64_t v79;
  void *v80;
  void *v81;
  PSListController *v82;
  uint64_t v83;
  NSArray **p_specifiers;
  id v85;
  unint64_t v86;
  _QWORD v87[5];
  _QWORD v88[5];
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;

  length = a3.length;
  location = a3.location;
  v85 = a4;
  if (objc_msgSend(v85, "count"))
  {
    if (length)
    {
      p_specifiers = &self->_specifiers;
      specifiers = self->_specifiers;
      if (specifiers)
      {
        if (location <= -[NSArray count](specifiers, "count"))
        {
          v8 = length + location;
          if (length + location <= -[NSArray count](*p_specifiers, "count"))
          {
            v66 = length;
            objc_msgSend(v85, "objectAtIndex:", 0);
            v67 = objc_claimAutoreleasedReturnValue();
            v91 = -1;
            v92 = -1;
            v9 = -[PSListController getGroup:row:ofSpecifierAtIndex:](self, "getGroup:row:ofSpecifierAtIndex:", &v91, &v92, location);
            v10 = v91;
            v89 = -1;
            v90 = -1;
            if (v8 == -[NSArray count](*p_specifiers, "count"))
            {
              v89 = -[NSMutableArray count](self->_groups, "count");
            }
            else if (v9)
            {
              v9 = -[PSListController getGroup:row:ofSpecifierAtIndex:](self, "getGroup:row:ofSpecifierAtIndex:", &v89, &v90, v8);
            }
            v12 = (void *)v67;
            if (*(_QWORD *)(v67 + 56))
              v13 = 0;
            else
              v13 = v92 == -1;
            if (v13 && v90 == -1 && v9)
            {
              v16 = objc_alloc_init(MEMORY[0x1E0CB3788]);
              v17 = objc_alloc_init(MEMORY[0x1E0CB3788]);
              v70 = objc_alloc_init(MEMORY[0x1E0CB3788]);
              v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v79 = -[PSListController _nextGroupInSpecifiersAfterIndex:inArray:](self, "_nextGroupInSpecifiersAfterIndex:inArray:", 0, v85);
              v69 = v16;
              if (!objc_msgSend(v85, "count"))
                goto LABEL_71;
              v78 = 0;
              v71 = v17;
              v81 = v18;
              v82 = self;
              v68 = location;
              while (1)
              {
                v19 = v91;
                if (v91 >= v89)
                {
                  v20 = v10;
                  goto LABEL_69;
                }
                v20 = v10;
                do
                {
                  v21 = *p_specifiers;
                  -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", v19);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSArray objectAtIndex:](v21, "objectAtIndex:", objc_msgSend(v22, "integerValue"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v85, "objectAtIndex:", v78);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "identifier");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v80 = v24;
                  objc_msgSend(v24, "identifier");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v25, "isEqualToString:", v26);

                  if ((v27 & 1) != 0)
                  {
                    v76 = v27;
                    for (i = v91; i < v19; ++i)
                      objc_msgSend(v71, "addIndex:", i);
                    objc_msgSend(v23, "propertyForKey:", CFSTR("footerText"));
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v80, "propertyForKey:", CFSTR("footerText"));
                    v30 = objc_claimAutoreleasedReturnValue();
                    v77 = v23;
                    objc_msgSend(v23, "name");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v80, "name");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v74 = (void *)v30;
                    v75 = v29;
                    if (!objc_msgSend(v31, "isEqualToString:", v32) || (v29 != 0) != (v30 != 0))
                    {

                      v27 = v76;
                      goto LABEL_32;
                    }
                    if (v29 && v30)
                    {
                      v34 = objc_msgSend(v29, "isEqualToString:", v30);

                      v27 = v76;
                      if ((v34 & 1) != 0)
                      {
LABEL_45:
                        -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", v19);
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        v36 = objc_msgSend(v35, "integerValue");

                        if (v19 + 1 == -[NSMutableArray count](self->_groups, "count"))
                        {
                          v37 = -[NSArray count](*p_specifiers, "count");
                        }
                        else
                        {
                          -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", v19 + 1);
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          v39 = objc_msgSend(v38, "integerValue");

                          v37 = v39;
                        }
                        v40 = 0x1E0CB3000;
                        v41 = v73;
                        v42 = v36 + 1;
                        v83 = v37;
                        if ((uint64_t)(v78 + 1) < v79)
                        {
                          v43 = 0;
                          v86 = v78 + 1;
                          v72 = v20;
                          do
                          {
                            if (v42 >= v37)
                              goto LABEL_62;
                            v44 = v42;
                            do
                            {
                              objc_msgSend(v85, "objectAtIndex:", v86);
                              v45 = (void *)objc_claimAutoreleasedReturnValue();
                              -[NSArray objectAtIndex:](*p_specifiers, "objectAtIndex:", v44);
                              v46 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v45, "identifier");
                              v47 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v46, "identifier");
                              v48 = (void *)objc_claimAutoreleasedReturnValue();
                              v49 = objc_msgSend(v47, "isEqualToString:", v48);

                              if ((v49 & 1) != 0)
                              {
                                for (; v42 < v44; ++v42)
                                {
                                  v50 = (void *)MEMORY[0x1E0CB36B0];
                                  -[NSMutableArray objectAtIndex:](v82->_groups, "objectAtIndex:", v19);
                                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v50, "indexPathForRow:inSection:", ~objc_msgSend(v51, "integerValue") + v42, v19);
                                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v81, "addObject:", v52);

                                }
                                ++v44;
                                ++v43;
                                v42 = v44;
                                v37 = v83;
                              }
                              else
                              {
                                ++v44;
                              }

                              if (v44 >= v37)
                                v53 = 1;
                              else
                                v53 = v49;
                            }
                            while (v53 != 1);
                            v18 = v81;
                            self = v82;
                            v54 = v49;
                            v20 = v72;
                            v41 = v73;
                            v40 = 0x1E0CB3000uLL;
                            if ((v54 & 1) == 0)
                            {
LABEL_62:
                              objc_msgSend(*(id *)(v40 + 1712), "indexPathForRow:inSection:", v43, v20);
                              v55 = v43;
                              v56 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v41, "addObject:", v56);

                              v43 = v55 + 1;
                            }
                            ++v86;
                          }
                          while (v86 != v79);
                        }
                        if (v42 < v37)
                        {
                          do
                          {
                            v57 = *(void **)(v40 + 1712);
                            -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", v19);
                            v58 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v57, "indexPathForRow:inSection:", ~objc_msgSend(v58, "integerValue") + v42, v19);
                            v59 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v18, "addObject:", v59);

                            ++v42;
                          }
                          while (v83 != v42);
                        }
                        v23 = v77;
                        v27 = v76;
                        ++v19;
                      }
                      else
                      {
LABEL_32:
                        objc_msgSend(v70, "addIndex:", v19++);
                      }
                      v91 = v19;
                      ++v20;

                      goto LABEL_35;
                    }

                    goto LABEL_45;
                  }
                  ++v19;
LABEL_35:

                  if (v19 >= v89)
                    v33 = 1;
                  else
                    v33 = v27;
                }
                while (v33 != 1);
                location = v68;
                v16 = v69;
                v17 = v71;
                if ((v27 & 1) == 0)
LABEL_69:
                  objc_msgSend(v16, "addIndex:", v20++);
                v10 = v20;
                v78 = v79;
                v79 = -[PSListController _nextGroupInSpecifiersAfterIndex:inArray:](self, "_nextGroupInSpecifiersAfterIndex:inArray:", v79, v85);
                if (v78 >= objc_msgSend(v85, "count"))
                {
LABEL_71:
                  for (j = v91; j < v89; ++j)
                    objc_msgSend(v17, "addIndex:", j);
                  -[NSArray subarrayWithRange:](*p_specifiers, "subarrayWithRange:", location, v66);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  v62 = MEMORY[0x1E0C809B0];
                  v88[0] = MEMORY[0x1E0C809B0];
                  v88[1] = 3221225472;
                  v63 = location;
                  v88[2] = __59__PSListController_updateSpecifiersInRange_withSpecifiers___block_invoke;
                  v88[3] = &unk_1E4A654C8;
                  v88[4] = self;
                  objc_msgSend(v61, "enumerateObjectsUsingBlock:", v88);

                  v87[0] = v62;
                  v87[1] = 3221225472;
                  v87[2] = __59__PSListController_updateSpecifiersInRange_withSpecifiers___block_invoke_2;
                  v87[3] = &unk_1E4A654C8;
                  v87[4] = self;
                  objc_msgSend(v85, "enumerateObjectsUsingBlock:", v87);
                  v64 = (void *)-[NSArray mutableCopy](*p_specifiers, "mutableCopy");
                  objc_msgSend(v64, "replaceObjectsInRange:withObjectsFromArray:", v63, v66, v85);
                  v65 = self;
                  objc_sync_enter(v65);
                  objc_storeStrong((id *)p_specifiers, v64);
                  objc_sync_exit(v65);

                  -[PSListController createGroupIndices](v65, "createGroupIndices");
                  -[UITableView beginUpdates](v65->_table, "beginUpdates");
                  if (objc_msgSend(v70, "count"))
                    -[UITableView reloadSections:withRowAnimation:](v65->_table, "reloadSections:withRowAnimation:", v70, 0);
                  if (objc_msgSend(v73, "count"))
                    -[UITableView insertRowsAtIndexPaths:withRowAnimation:](v65->_table, "insertRowsAtIndexPaths:withRowAnimation:", v73, 0);
                  if (objc_msgSend(v69, "count"))
                    -[UITableView insertSections:withRowAnimation:](v65->_table, "insertSections:withRowAnimation:", v69, 0);
                  if (objc_msgSend(v18, "count"))
                    -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](v65->_table, "deleteRowsAtIndexPaths:withRowAnimation:", v18, 0);
                  if (objc_msgSend(v17, "count"))
                    -[UITableView deleteSections:withRowAnimation:](v65->_table, "deleteSections:withRowAnimation:", v17, 0);
                  -[UITableView endUpdates](v65->_table, "endUpdates");

                  v12 = (void *)v67;
                  break;
                }
              }
            }

          }
        }
      }
    }
  }
  else
  {
    -[NSArray subarrayWithRange:](self->_specifiers, "subarrayWithRange:", location, length);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSListController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v11, 1);

  }
}

void __59__PSListController_updateSpecifiersInRange_withSpecifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;

  v5 = a2;
  if (v5[7])
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1024);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", v4);

    objc_msgSend(v5, "removePropertyForKey:", CFSTR("cellObject"));
  }
  objc_msgSend(*(id *)(a1 + 32), "_removeIdentifierForSpecifier:", v5);

}

uint64_t __59__PSListController_updateSpecifiersInRange_withSpecifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addIdentifierForSpecifier:", a2);
}

- (void)_unloadBundleControllers
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;

  if (self->_bundlesLoaded)
  {
    v3 = -[NSMutableArray count](self->_bundleControllers, "count");
    if (v3)
    {
      v4 = v3;
      for (i = 0; i != v4; ++i)
      {
        -[NSMutableArray objectAtIndex:](self->_bundleControllers, "objectAtIndex:", i);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "unload");

      }
    }
  }
}

- (void)dealloc
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PSListController dismissConfirmationViewAnimated:](self, "dismissConfirmationViewAnimated:", 0);
  -[PSSpecifierDataSource removeObserver:](self->_dataSource, "removeObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PSListController clearCache](self, "clearCache");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_specifiers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "removePropertyForKey:", CFSTR("footerView"));
        objc_msgSend(v9, "removePropertyForKey:", CFSTR("cellObject"));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[PSListController _unloadBundleControllers](self, "_unloadBundleControllers");
  -[UITableView setDataSource:](self->_table, "setDataSource:", 0);
  -[UITableView setDelegate:](self->_table, "setDelegate:", 0);
  -[UITableView setDataSource:](self->_table, "setDataSource:", 0);
  v10.receiver = self;
  v10.super_class = (Class)PSListController;
  -[PSListController dealloc](&v10, sel_dealloc);
}

- (void)delayedContentSizeDidChange
{
  -[UITableView _purgeReuseQueues](self->_table, "_purgeReuseQueues");
  -[PSListController reload](self, "reload");
}

- (void)contentSizeDidChange:(id)a3
{
  if (-[PSListControllerNavigationCoordinator listControllerIsOnTopOfNavigationStack:searchTopMostViewControllerChildren:](self->_navigationCoordinator, "listControllerIsOnTopOfNavigationStack:searchTopMostViewControllerChildren:", self, 0))-[PSListController delayedContentSizeDidChange](self, "delayedContentSizeDidChange");
  else
    -[PSListController setContentSizeDidChange:](self, "setContentSizeDidChange:", 1);
}

- (void)viewDidUnload
{
  UITableView *table;
  objc_super v4;

  -[UITableView setDelegate:](self->_table, "setDelegate:", 0);
  -[UITableView setDataSource:](self->_table, "setDataSource:", 0);
  table = self->_table;
  self->_table = 0;

  -[PSListController _unloadBundleControllers](self, "_unloadBundleControllers");
  v4.receiver = self;
  v4.super_class = (Class)PSListController;
  -[PSListController viewDidUnload](&v4, sel_viewDidUnload);
}

- (void)loseFocus
{
  void *v3;
  id v4;

  -[UITableView indexPathForSelectedRow](self->_table, "indexPathForSelectedRow");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableView endEditing:](self->_table, "endEditing:", 0);
  v3 = v4;
  if (v4)
  {
    -[UITableView deselectRowAtIndexPath:animated:](self->_table, "deselectRowAtIndexPath:animated:", v4, 0);
    v3 = v4;
  }

}

- (id)specifierID
{
  return self->_specifierID;
}

- (id)cachedCellForSpecifier:(id)a3
{
  NSMutableDictionary *cells;
  void *v4;
  void *v5;

  cells = self->_cells;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cells, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cachedCellForSpecifierID:(id)a3
{
  void *v4;
  void *v5;

  -[PSListController specifierForID:](self, "specifierForID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isValidCellStyle:(int64_t)a3
{
  return (unint64_t)a3 < 4;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PSListController specifierAtIndex:](self, "specifierAtIndex:", -[PSListController indexForIndexPath:](self, "indexForIndexPath:", a4));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("enabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = !v6 || objc_msgSend(v6, "BOOLValue");
  return v7;
}

- (id)_customViewForSpecifier:(id)a3 class:(Class)a4 isHeader:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  __CFString **v10;
  __CFString *v11;
  void *v12;

  v5 = a5;
  v8 = a3;
  v9 = v8;
  v10 = PSHeaderViewKey;
  if (!v5)
    v10 = PSFooterViewKey;
  v11 = *v10;
  objc_msgSend(v8, "propertyForKey:", *v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = (void *)objc_msgSend([a4 alloc], "initWithSpecifier:", v9);
    objc_msgSend(v9, "setProperty:forKey:", v12, v11);
  }
  objc_msgSend(v12, "_accessibilitySetInterfaceStyleIntent:", -[UITableView _accessibilityInterfaceStyleIntent](self->_table, "_accessibilityInterfaceStyleIntent"));
  objc_msgSend(v12, "setAlpha:", 1.0);

  return v12;
}

uint64_t __35__PSListController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "deselectRowAtIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __35__PSListController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "selectRowAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);
  return result;
}

- (void)_scrollToSpecifierWithID:(id)a3 animated:(BOOL)a4
{
  void *v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  uint64_t v10;
  dispatch_time_t v11;
  id v12;
  _QWORD block[4];
  id v14;
  PSListController *v15;
  BOOL v16;

  -[PSListController specifierForID:](self, "specifierForID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[NSArray indexOfObject:](self->_specifiers, "indexOfObject:", v6);
    -[PSListController indexPathForIndex:](self, "indexPathForIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      if (objc_msgSend(v8, "row") == 0x7FFFFFFFFFFFFFFFLL
        && !-[PSListController _isEmptyGroup:](self, "_isEmptyGroup:", v7))
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, objc_msgSend(v9, "section"));
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v10;
      }
      v11 = dispatch_time(0, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__PSListController__scrollToSpecifierWithID_animated___block_invoke;
      block[3] = &unk_1E4A65540;
      v14 = v9;
      v15 = self;
      v16 = a4;
      v12 = v9;
      dispatch_after(v11, MEMORY[0x1E0C80D38], block);

    }
  }

}

void __54__PSListController__scrollToSpecifierWithID_animated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "section");
  if (v2 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1040), "numberOfSections"))
  {
    _PSLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v5 = objc_msgSend(*(id *)(a1 + 32), "section");
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1040), "numberOfSections");
    v13 = 134218240;
    v14 = v5;
    v15 = 2048;
    v16 = v6;
    v7 = "Scroll target index path section %ld is out of bounds. Current number of sections is %ld.";
    v8 = v4;
    v9 = 22;
LABEL_9:
    _os_log_error_impl(&dword_1A3819000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v13, v9);
    goto LABEL_7;
  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "row");
  if (v3 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1040), "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section")))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1040), "scrollToRowAtIndexPath:atScrollPosition:animated:", *(_QWORD *)(a1 + 32), 1, *(unsigned __int8 *)(a1 + 48));
    return;
  }
  _PSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "row");
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1040), "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
    v12 = objc_msgSend(*(id *)(a1 + 32), "section");
    v13 = 134218496;
    v14 = v10;
    v15 = 2048;
    v16 = v11;
    v17 = 2048;
    v18 = v12;
    v7 = "Scroll target index path row %ld is out of bounds. Current number of row is %ld for section %ld.";
    v8 = v4;
    v9 = 32;
    goto LABEL_9;
  }
LABEL_7:

}

- (BOOL)_isEmptyGroup:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  BOOL v6;

  v4 = a3 + 1;
  if (a3 + 1 >= -[NSArray count](self->_specifiers, "count"))
    return 1;
  -[NSArray objectAtIndexedSubscript:](self->_specifiers, "objectAtIndexedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cellType") == 0;

  return v6;
}

- (void)_scrollToSpecifierNamed:(id)a3
{
  -[PSListController _scrollToSpecifierWithID:animated:](self, "_scrollToSpecifierWithID:animated:", a3, 0);
}

- (id)findFirstVisibleResponder
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[UITableView visibleCells](self->_table, "visibleCells", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      v7 = v4;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v4 = *(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v6);

        if (objc_msgSend(v4, "canBecomeFirstResponder"))
        {
          v3 = v4;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
        v7 = v4;
      }
      while (v3 != v6);
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }

  }
LABEL_11:

  return v3;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PSListController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
    -[PSListController dismissConfirmationViewAnimated:](self, "dismissConfirmationViewAnimated:", v3);
  v5.receiver = self;
  v5.super_class = (Class)PSListController;
  -[PSViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSListController;
  -[PSViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  self->_isVisible = 0;
}

- (void)formSheetViewWillDisappear
{
  PSListControllerNavigationCoordinator *navigationCoordinator;
  id WeakRetained;
  UITableView *table;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSListController;
  -[PSViewController formSheetViewWillDisappear](&v7, sel_formSheetViewWillDisappear);
  self->_showingSetupController = 0;
  navigationCoordinator = self->_navigationCoordinator;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._rootController);
  LODWORD(navigationCoordinator) = -[PSListControllerNavigationCoordinator listControllerShouldDeselectAfterFormSheetDisappearance:givenRootController:](navigationCoordinator, "listControllerShouldDeselectAfterFormSheetDisappearance:givenRootController:", self, WeakRetained);

  if ((_DWORD)navigationCoordinator)
  {
    table = self->_table;
    -[UITableView indexPathForSelectedRow](table, "indexPathForSelectedRow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView deselectRowAtIndexPath:animated:](table, "deselectRowAtIndexPath:animated:", v6, 1);

  }
}

- (void)popupViewWillDisappear
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSListController;
  -[PSViewController popupViewWillDisappear](&v3, sel_popupViewWillDisappear);
  self->_showingSetupController = 0;
}

- (void)returnPressedAtEnd
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[PSListController navigationItem](self, "navigationItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightBarButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  if (v3)
  {
    objc_msgSend(v9, "rightBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "action");
    objc_msgSend(v9, "rightBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rightBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)SFPerformSelector();

  }
}

- (void)_returnKeyPressed:(id)a3
{
  void *v4;
  id v5;
  BOOL v6;
  id v7;

  if (-[UITableView _isAncestorOfFirstResponder](self->_table, "_isAncestorOfFirstResponder", a3))
  {
    objc_msgSend(MEMORY[0x1E0CEA6E8], "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    NSClassFromString(CFSTR("UIFieldEditor"));
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (NSClassFromString(CFSTR("UITextField")), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v7, "_nextKeyResponder");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (v5)
        v6 = v5 == v7;
      else
        v6 = 1;
      if (!v6 && TopToBottomLeftToRightViewCompare(v7, v5) == -1)
        objc_msgSend(v5, "becomeFirstResponder");
      else
        -[PSListController returnPressedAtEnd](self, "returnPressedAtEnd");

    }
  }
}

- (BOOL)performActionForSpecifier:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  const char *Name;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "performLegacyAction");
    v6 = 1;
  }
  else
  {
    Name = sel_getName(a2);
    NSLog(CFSTR("%s specifier is nil"), Name);
    v6 = 0;
  }

  return v6;
}

- (BOOL)performLoadActionForSpecifier:(id)a3
{
  id v4;
  void *v5;
  const char *Name;
  BOOL v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "controllerLoadAction"))
    {
      objc_msgSend(v5, "performControllerLoadAction");
    }
    else if (!CFPreferencesGetAppBooleanValue(CFSTR("kDontUseOldAction"), CFSTR("com.apple.Preferences"), 0))
    {
      objc_msgSend(v5, "performLegacyAction");
    }
    v7 = 1;
  }
  else
  {
    Name = sel_getName(a2);
    NSLog(CFSTR("%s specifier is nil"), Name);
    v7 = 0;
  }

  return v7;
}

- (BOOL)performButtonActionForSpecifier:(id)a3
{
  id v4;
  void *v5;
  const char *Name;
  BOOL v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "buttonAction"))
    {
      objc_msgSend(v5, "performButtonAction");
    }
    else if (!CFPreferencesGetAppBooleanValue(CFSTR("kDontUseOldAction"), CFSTR("com.apple.Preferences"), 0))
    {
      objc_msgSend(v5, "performLegacyAction");
    }
    v7 = 1;
  }
  else
  {
    Name = sel_getName(a2);
    NSLog(CFSTR("%s specifier is nil"), Name);
    v7 = 0;
  }

  return v7;
}

- (BOOL)performConfirmationActionForSpecifier:(id)a3
{
  id v4;
  void *v5;
  const char *Name;
  BOOL v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "confirmationAction"))
    {
      objc_msgSend(v5, "performConfirmationAction");
    }
    else if (objc_msgSend(v5, "buttonAction") && objc_msgSend(v5, "cellType") == 13)
    {
      objc_msgSend(v5, "performButtonAction");
    }
    else if (!CFPreferencesGetAppBooleanValue(CFSTR("kDontUseOldAction"), CFSTR("com.apple.Preferences"), 0))
    {
      objc_msgSend(v5, "performLegacyAction");
    }
    v7 = 1;
  }
  else
  {
    Name = sel_getName(a2);
    NSLog(CFSTR("%s specifier is nil"), Name);
    v7 = 0;
  }

  return v7;
}

- (BOOL)performConfirmationAlternateActionForSpecifier:(id)a3
{
  id v4;
  void *v5;
  const char *Name;
  BOOL v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "confirmationAlternateAction"))
    {
      objc_msgSend(v5, "performConfirmationAlternateAction");
    }
    else if (objc_msgSend(v5, "buttonAction") && objc_msgSend(v5, "cellType") == 13)
    {
      objc_msgSend(v5, "performButtonAction");
    }
    else if (!CFPreferencesGetAppBooleanValue(CFSTR("kDontUseOldAction"), CFSTR("com.apple.Preferences"), 0))
    {
      objc_msgSend(v5, "performLegacyAction");
    }
    v7 = 1;
  }
  else
  {
    Name = sel_getName(a2);
    NSLog(CFSTR("%s specifier is nil"), Name);
    v7 = 0;
  }

  return v7;
}

- (BOOL)performConfirmationCancelActionForSpecifier:(id)a3
{
  id *v4;
  id *v5;
  BOOL v6;
  const char *Name;
  id WeakRetained;
  id v10;

  v4 = (id *)a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "confirmationCancelAction"))
    {
      objc_msgSend(v5, "performConfirmationCancelAction");
    }
    else if (objc_msgSend(v5, "legacyCancel")
           && !CFPreferencesGetAppBooleanValue(CFSTR("kDontUseOldAction"), CFSTR("com.apple.Preferences"), 0))
    {
      objc_msgSend(v5, "legacyCancel");
      WeakRetained = objc_loadWeakRetained(v5 + 1);
      v10 = (id)SFPerformSelector();

    }
    v6 = 1;
  }
  else
  {
    Name = sel_getName(a2);
    NSLog(CFSTR("%s specifier is nil"), Name);
    v6 = 0;
  }

  return v6;
}

- (void)showConfirmationViewForSpecifier:(id)a3 useAlert:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  const char *Name;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;

  v4 = a4;
  v7 = a3;
  -[PSListController presentedViewController](self, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    Name = sel_getName(a2);
    -[PSListController presentedViewController](self, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s on %@ while already presenting a controller: %@"), Name, self, v10);

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CEA2E8];
    if (v4)
    {
      objc_msgSend(v7, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "prompt");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0CEA2E0];
      objc_msgSend(v7, "okButton");
    }
    else
    {
      objc_msgSend(v7, "prompt");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v16, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0CEA2E0];
      objc_msgSend(v7, "title");
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v7, "isDestructive");
    v19 = MEMORY[0x1E0C809B0];
    if (v18)
      v20 = 2;
    else
      v20 = 0;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __62__PSListController_showConfirmationViewForSpecifier_useAlert___block_invoke;
    v36[3] = &unk_1E4A65568;
    v36[4] = self;
    v21 = v7;
    v37 = v21;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v17, v20, v36);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v22);

    objc_msgSend(v21, "alternateButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = (void *)MEMORY[0x1E0CEA2E0];
      objc_msgSend(v21, "alternateButton");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isAlternateDestructive"))
        v26 = 2;
      else
        v26 = 0;
      v34[0] = v19;
      v34[1] = 3221225472;
      v34[2] = __62__PSListController_showConfirmationViewForSpecifier_useAlert___block_invoke_2;
      v34[3] = &unk_1E4A65568;
      v34[4] = self;
      v35 = v21;
      objc_msgSend(v24, "actionWithTitle:style:handler:", v25, v26, v34);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAction:", v27);

    }
    objc_msgSend(v21, "cancelButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = (void *)MEMORY[0x1E0CEA2E0];
      objc_msgSend(v21, "cancelButton");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v19;
      v32[1] = 3221225472;
      v32[2] = __62__PSListController_showConfirmationViewForSpecifier_useAlert___block_invoke_3;
      v32[3] = &unk_1E4A65568;
      v32[4] = self;
      v33 = v21;
      objc_msgSend(v29, "actionWithTitle:style:handler:", v30, 1, v32);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAction:", v31);

    }
    -[PSListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

  }
}

uint64_t __62__PSListController_showConfirmationViewForSpecifier_useAlert___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "confirmationViewAcceptedForSpecifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__PSListController_showConfirmationViewForSpecifier_useAlert___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "confirmationViewAlternateAcceptedForSpecifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__PSListController_showConfirmationViewForSpecifier_useAlert___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "confirmationViewCancelledForSpecifier:", *(_QWORD *)(a1 + 40));
}

- (void)showConfirmationViewForSpecifier:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CEA508];
  v5 = a3;
  objc_msgSend(v4, "currentDevice");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PSListController showConfirmationViewForSpecifier:useAlert:](self, "showConfirmationViewForSpecifier:useAlert:", v5, objc_msgSend(v6, "sf_isiPad"));

}

- (void)dismissConfirmationViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char isKindOfClass;

  v3 = a3;
  -[PSListController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[PSListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3, 0);
}

- (void)confirmationViewAcceptedForSpecifier:(id)a3
{
  if (-[PSListController performConfirmationActionForSpecifier:](self, "performConfirmationActionForSpecifier:", a3))
    -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_table, "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);
}

- (void)confirmationViewAlternateAcceptedForSpecifier:(id)a3
{
  if (-[PSListController performConfirmationAlternateActionForSpecifier:](self, "performConfirmationAlternateActionForSpecifier:", a3))
  {
    -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_table, "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);
  }
}

- (void)confirmationViewCancelledForSpecifier:(id)a3
{
  if (-[PSListController performConfirmationCancelActionForSpecifier:](self, "performConfirmationCancelActionForSpecifier:", a3))
  {
    -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_table, "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);
  }
}

- (void)lazyLoadBundle:(id)a3
{
  id *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSString *v14;
  NSString *v15;
  Class v16;
  Class v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  PSListController *v23;
  __int16 v24;
  id *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  PKLogForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, "PSListController.lazyLoadBundle");

  PKLogForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v22 = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v4;
    _os_signpost_emit_with_name_impl(&dword_1A3819000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PSListController.lazyLoadBundle", "%{public}@: lazyLoadBundleWithSpecifier '%{public}@'", (uint8_t *)&v22, 0x16u);
  }

  objc_msgSend(v4, "propertyForKey:", CFSTR("lazy-bundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyForKey:", CFSTR("overridePrincipalClass"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      objc_msgSend(v4, "propertyForKey:", CFSTR("detail"));
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = v14;
        v16 = NSClassFromString(v14);
        if (v16)
        {
          v17 = v16;

LABEL_14:
          v4[6] = v17;
          if (!v4[8])
          {
            objc_msgSend(v4, "propertyForKey:", CFSTR("pane"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v4[8] = (id)-[NSObject classNamed:](v11, "classNamed:", v19);

          }
          objc_msgSend(v4, "setLegacyAction:", 0);
          objc_msgSend(v4, "setControllerLoadAction:", 0);
          objc_msgSend(v4, "removePropertyForKey:", CFSTR("lazy-bundle"));
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v4[6], "validateSpecifier:", v4);
          PKLogForCategory(6);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
          {
            v22 = 138543362;
            v23 = self;
            _os_signpost_emit_with_name_impl(&dword_1A3819000, v21, OS_SIGNPOST_INTERVAL_END, v6, "PSListController.lazyLoadBundle", "%{public}@: Loaded bundle successfully.", (uint8_t *)&v22, 0xCu);
          }

          goto LABEL_22;
        }
        -[NSObject load](v11, "load");
        v17 = NSClassFromString(v15);

        if (v17)
          goto LABEL_14;
      }
    }
    v17 = (Class)-[NSObject principalClass](v11, "principalClass");
    goto LABEL_14;
  }
  objc_msgSend(v4, "setLegacyAction:", 0);
  objc_msgSend(v4, "setControllerLoadAction:", 0);
  PKLogForCategory(6);
  v18 = objc_claimAutoreleasedReturnValue();
  v11 = v18;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v22 = 138543362;
    v23 = self;
    _os_signpost_emit_with_name_impl(&dword_1A3819000, v11, OS_SIGNPOST_INTERVAL_END, v6, "PSListController.lazyLoadBundle", "%{public}@: No bundle path found.", (uint8_t *)&v22, 0xCu);
  }
LABEL_22:

}

- (id)controllerForRowAtIndexPath:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;

  v4 = -[PSListController indexForIndexPath:](self, "indexForIndexPath:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || self->_showingSetupController)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_specifiers, "objectAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSListController selectSpecifier:](self, "selectSpecifier:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)selectSpecifier:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSListController viewIfLoaded](self, "viewIfLoaded");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSListController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSListController parentViewController](self, "parentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController parentController](self, "parentController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138546178;
    v18 = v8;
    v19 = 2114;
    v20 = v9;
    v21 = 2160;
    v22 = 1752392040;
    v23 = 2112;
    v24 = v5;
    v25 = 2160;
    v26 = 1752392040;
    v27 = 2112;
    v28 = v11;
    v29 = 2160;
    v30 = 1752392040;
    v31 = 2112;
    v32 = v12;
    v33 = 2160;
    v34 = 1752392040;
    v35 = 2112;
    v36 = v13;
    v37 = 2160;
    v38 = 1752392040;
    v39 = 2112;
    v40 = v14;
    _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Was called with { specifier: %{mask.hash}@, window of viewIfLoaded: %{mask.hash}@, navigationController: %{mask.hash}@, parentViewController: %{mask.hash}@, parentPreferencesController: %{mask.hash}@ }.", (uint8_t *)&v17, 0x7Au);

  }
  -[PSListController controllerForSpecifier:](self, "controllerForSpecifier:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)controllerForSpecifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  char isKindOfClass;
  id WeakRetained;
  NSObject *v25;
  NSObject *v26;
  _BOOL4 showingSetupController;
  NSObject *v29;
  uint64_t v30;
  _BYTE buf[12];
  __int16 v32;
  id v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  PSListController *v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!CFPreferencesGetAppBooleanValue(CFSTR("kDontUseOldAction"), CFSTR("com.apple.Preferences"), 0)
    && !objc_msgSend(v4, "confirmationAction")
    && !objc_msgSend(v4, "controllerLoadAction")
    && !objc_msgSend(v4, "buttonAction"))
  {
    if (*((_QWORD *)v4 + 7) == 4 && !objc_msgSend(v4, "legacyAction"))
    {
      PKLogForCategory(7);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[PSListController controllerForSpecifier:].cold.1();

      goto LABEL_16;
    }
    if (objc_msgSend(v4, "legacyAction")
      && -[PSListController performActionForSpecifier:](self, "performActionForSpecifier:", v4)
      && objc_msgSend(v4, "legacyAction"))
    {
      PKLogForCategory(7);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[PSListController controllerForSpecifier:].cold.8();
      goto LABEL_9;
    }
  }
  if (!objc_msgSend(v4, "buttonAction")
    || !-[PSListController performButtonActionForSpecifier:](self, "performButtonActionForSpecifier:", v4))
  {
    if (objc_msgSend(v4, "controllerLoadAction")
      && -[PSListController performLoadActionForSpecifier:](self, "performLoadActionForSpecifier:", v4))
    {
      v6 = objc_msgSend(v4, "controllerLoadAction");
      PKLogForCategory(7);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[PSListController controllerForSpecifier:].cold.6(v4, v8);

        goto LABEL_16;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[PSListController controllerForSpecifier:].cold.5();

    }
    v10 = objc_msgSend(v4, "cellType");
    -[PSListController table](self, "table");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSListController indexPathForSpecifier:](self, "indexPathForSpecifier:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForRowAtIndexPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 8)
      objc_msgSend(v13, "becomeFirstResponder");
    if (v10 <= 0xB && ((1 << v10) & 0xC0E) != 0)
    {
      v14 = v10 == 3;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = objc_msgSend(v13, "canBeChecked");
      if (v13 && v14)
      {
        v30 = 0;
        *(_QWORD *)buf = 0;
        if (-[PSListController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", buf, &v30, v4))
        {
          -[NSArray objectAtIndex:](self->_specifiers, "objectAtIndex:", -[PSListController indexOfGroup:](self, "indexOfGroup:", *(_QWORD *)buf));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "propertyForKey:", CFSTR("isRadioGroup"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "BOOLValue"))
          {
            objc_msgSend(v15, "propertyForKey:", CFSTR("radioGroupCheckedSpecifier"));
            v17 = (id)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v17 != v4)
            {
              objc_msgSend(v17, "propertyForKey:", CFSTR("cellObject"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setChecked:", 0);
              objc_msgSend(v19, "setValue:", 0);
              objc_msgSend(v4, "propertyForKey:", CFSTR("cellObject"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setChecked:", 1);

            }
            objc_msgSend(v15, "setProperty:forKey:", v4, CFSTR("radioGroupCheckedSpecifier"));

          }
        }
        PKLogForCategory(7);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[PSListController controllerForSpecifier:].cold.3();

        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_49;
      }
      if (!v13 || (objc_msgSend(v13, "isUserInteractionEnabled") & 1) != 0)
      {
        CreateDetailControllerInstanceWithClass(*((objc_class **)v4 + 6));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PSListController appearance](PSListController, "appearance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setExtendedLayoutIncludesOpaqueBars:", objc_msgSend(v22, "extendedLayoutIncludesOpaqueBars"));

        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        self->_showingSetupController = isKindOfClass & 1;
        if ((isKindOfClass & 1) == 0)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->super._rootController);
          objc_msgSend(v9, "setRootController:", WeakRetained);

        }
        objc_msgSend(v9, "setParentController:", self);
        objc_msgSend(v9, "setSpecifier:", v4);
        PKLogForCategory(7);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          showingSetupController = self->_showingSetupController;
          *(_DWORD *)buf = 141559554;
          *(_QWORD *)&buf[4] = 1752392040;
          v32 = 2112;
          v33 = v4;
          v34 = 2160;
          v35 = 1752392040;
          v36 = 2112;
          v37 = v9;
          v38 = 2160;
          v39 = 1752392040;
          v40 = 2112;
          v41 = self;
          v42 = 1024;
          v43 = showingSetupController;
          _os_log_debug_impl(&dword_1A3819000, v25, OS_LOG_TYPE_DEBUG, "%{mask.hash}@: Action created target controller %{mask.hash}@, set showingSetupController of presenting controller %{mask.hash}@ to %{BOOL}d.", buf, 0x44u);
        }

        goto LABEL_49;
      }
      PKLogForCategory(7);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[PSListController controllerForSpecifier:].cold.4();
    }
    else
    {
      PKLogForCategory(7);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[PSListController controllerForSpecifier:].cold.2();
    }

    v9 = 0;
LABEL_49:

    goto LABEL_50;
  }
  PKLogForCategory(7);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PSListController controllerForSpecifier:].cold.7();
LABEL_9:

  -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_table, "selectRowAtIndexPath:animated:scrollPosition:", 0, 0, 0);
LABEL_16:
  v9 = 0;
LABEL_50:

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  int64_t v5;
  UITableView *table;
  void *v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int v13;
  id v14;

  v5 = -[PSListController indexForIndexPath:](self, "indexForIndexPath:", a4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && !self->_showingSetupController)
  {
    -[NSArray objectAtIndex:](self->_specifiers, "objectAtIndex:", v5);
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    v10 = v9[7];
    if (v10 == 4)
    {
      if (!objc_msgSend(v9, "controllerLoadAction"))
      {
        v14 = 0;
        if (CFPreferencesGetAppBooleanValue(CFSTR("kDontUseOldAction"), CFSTR("com.apple.Preferences"), 0))
          goto LABEL_19;
      }
    }
    else if (v10 == 13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PSListController showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", v7);
        v14 = 0;
        goto LABEL_5;
      }
      -[PSListController performButtonActionForSpecifier:](self, "performButtonActionForSpecifier:", v7);
LABEL_17:
      v14 = 0;
LABEL_19:

      goto LABEL_4;
    }
    -[PSListController selectSpecifier:](self, "selectSpecifier:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v14 = (id)v11;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 == v12)
      {

      }
      else
      {
        v13 = -[PSListControllerNavigationCoordinator listControllerIsOnTopOfNavigationStack:searchTopMostViewControllerChildren:](self->_navigationCoordinator, "listControllerIsOnTopOfNavigationStack:searchTopMostViewControllerChildren:", self, 1);

        if (v13)
        {
          -[PSListController showController:](self, "showController:", v14);
          goto LABEL_5;
        }
      }
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  v14 = 0;
LABEL_4:
  table = self->_table;
  -[UITableView indexPathForSelectedRow](table, "indexPathForSelectedRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableView deselectRowAtIndexPath:animated:](table, "deselectRowAtIndexPath:animated:", v7, v14 == v8);

LABEL_5:
}

- (id)specifiersForIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[PSListController specifierForID:](self, "specifierForID:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  objc_class *v14;
  char *v15;
  void *v16;
  PSListControllerNavigationCoordinator *navigationCoordinator;
  id WeakRetained;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    -[PSListController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "childViewControllers");
    v9 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject containsObject:](v9, "containsObject:", v7))
    {
      _PSLoggingFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[PSListController showController:animate:].cold.3(v10);

      _PSLoggingFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[PSListController showController:animate:].cold.2();

      _PSLoggingFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[PSListController showController:animate:].cold.1();

    }
    PKLogForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v22 = v15;
      v23 = 2114;
      v24 = v16;
      v25 = 2160;
      v26 = 1752392040;
      v27 = 2112;
      v28 = v7;
      v29 = 1024;
      v30 = v4;
      _os_log_impl(&dword_1A3819000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ called with %{mask.hash}@, %{BOOL}d", buf, 0x30u);

    }
    objc_initWeak((id *)buf, self);
    navigationCoordinator = self->_navigationCoordinator;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._rootController);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __43__PSListController_showController_animate___block_invoke;
    v19[3] = &unk_1E4A65590;
    objc_copyWeak(&v20, (id *)buf);
    -[PSListControllerNavigationCoordinator listController:pushViewController:givenRootController:withModalStylePopupStateApplicator:animated:](navigationCoordinator, "listController:pushViewController:givenRootController:withModalStylePopupStateApplicator:animated:", self, v7, WeakRetained, v19, v4);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    _PSLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[PSListController showController:animate:]";
      _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_DEFAULT, "%s: attempted to push nil controller", buf, 0xCu);
    }
  }

}

void __43__PSListController_showController_animate___block_invoke(uint64_t a1, char a2)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[1090] = a2;

}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  return !self->_popupIsModal;
}

- (void)dismissPopover
{
  -[PSListController dismissPopoverAnimated:completion:](self, "dismissPopoverAnimated:completion:", 1, 0);
}

- (void)dismissPopoverAnimated:(BOOL)a3
{
  -[PSListController dismissPopoverAnimated:completion:](self, "dismissPopoverAnimated:completion:", a3, 0);
}

- (void)dismissPopoverWithCompletion:(id)a3
{
  -[PSListController dismissPopoverAnimated:completion:](self, "dismissPopoverAnimated:completion:", 1, a3);
}

- (void)dismissPopoverAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a4;
  -[PSListController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "modalPresentationStyle");

  if (v6 == 7)
  {
    -[PSListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);
    self->_popupIsModal = 0;
  }

}

- (void)showController:(id)a3
{
  -[PSListController showController:animate:](self, "showController:animate:", a3, 1);
}

- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5 withCompletion:(id)a6
{
  id v10;
  BOOL v11;

  v10 = a6;
  v11 = -[PSListController prepareHandlingURLForSpecifierID:resourceDictionary:animatePush:](self, "prepareHandlingURLForSpecifierID:resourceDictionary:animatePush:", a3, a4, a5);
  if (!v11)
    -[PSListController setUrlHandlingCompletion:](self, "setUrlHandlingCompletion:", v10);

  return v11;
}

- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = -[PSListController shouldDeferPushForSpecifierID:urlDictionary:](self, "shouldDeferPushForSpecifierID:urlDictionary:", v8, v9);
  if (v10)
  {
    -[PSListController setPendingURLResourceDictionary:](self, "setPendingURLResourceDictionary:", v9);
    -[PSListController setSpecifierIDPendingPush:](self, "setSpecifierIDPendingPush:", v8);
    if (a5)
      *a5 = 1;
    v11 = -[PSListController specifiers](self, "specifiers");
  }

  return !v10;
}

- (void)clearPendingURL
{
  -[PSListController setPendingURLResourceDictionary:](self, "setPendingURLResourceDictionary:", 0);
  -[PSListController setSpecifierIDPendingPush:](self, "setSpecifierIDPendingPush:", 0);
  -[PSListController setUrlHandlingCompletion:](self, "setUrlHandlingCompletion:", 0);
}

- (BOOL)handlePendingURL
{
  NSDictionary *pendingURLResourceDictionary;
  void *v4;

  pendingURLResourceDictionary = self->_pendingURLResourceDictionary;
  if (pendingURLResourceDictionary)
  {
    -[PSListController urlHandlingCompletion](self, "urlHandlingCompletion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSListController handleURL:withCompletion:](self, "handleURL:withCompletion:", pendingURLResourceDictionary, v4);

    -[PSListController clearPendingURL](self, "clearPendingURL");
  }
  return pendingURLResourceDictionary != 0;
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  return 0;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (-[PSViewController isURLHandlingDeferredForViewControllerContainment](self, "isURLHandlingDeferredForViewControllerContainment")&& (-[PSListController viewIfLoaded](self, "viewIfLoaded"), v7 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v7, "window"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v7, !v8))
  {
    -[PSViewController setUrlResourceDictionaryPendingViewControllerContainment:](self, "setUrlResourceDictionaryPendingViewControllerContainment:", v10);
    -[PSViewController setUrlCompletionHandlerPendingViewControllerContainment:](self, "setUrlCompletionHandlerPendingViewControllerContainment:", v6);
  }
  else
  {
    -[PSListController urlHandler](self, "urlHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleURL:withCompletion:", v10, v6);

  }
}

- (void)reloadIconForSpecifierForBundle:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *WeakRetained;
  void *v9;
  int v10;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = self->_specifiers;
  v5 = -[NSArray count](v4, "count");
  if (v5 < 1)
  {
LABEL_5:
    WeakRetained = objc_loadWeakRetained((id *)&self->super._parentController);
    objc_msgSend(WeakRetained, "reloadIconForSpecifierForBundle:", v14);
  }
  else
  {
    v6 = v5;
    v7 = 1;
    while (1)
    {
      -[NSArray objectAtIndex:](v4, "objectAtIndex:", v7 - 1);
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "propertyForKey:", CFSTR("bundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", v14);

      if (v10)
        break;

      if (v7++ >= v6)
        goto LABEL_5;
    }
    -[PSListController bundle](self, "bundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resourcePath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setupIconImageWithPath:", v13);

    -[PSListController reload](self, "reload");
  }

}

- (double)_getKeyboardIntersectionHeightFromUserInfo:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  BOOL IsEmpty;
  double result;
  void *v25;
  double MaxY;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CEB890]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (void *)MEMORY[0x1E0CEA950];
  -[PSListController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:toView:", v14, v6, v8, v10, v12);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v28.origin.x = v16;
  v28.origin.y = v18;
  v28.size.width = v20;
  v28.size.height = v22;
  IsEmpty = CGRectIsEmpty(v28);
  result = 0.0;
  if (!IsEmpty)
  {
    -[PSListController view](self, "view", 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    MaxY = CGRectGetMaxY(v29);
    v30.origin.x = v16;
    v30.origin.y = v18;
    v30.size.width = v20;
    v30.size.height = v22;
    v27 = MaxY - CGRectGetMinY(v30);

    return fmax(v27, 0.0);
  }
  return result;
}

- (void)_setContentInset:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[UITableView contentInset](self->_table, "contentInset");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UITableView setContentInset:](self->_table, "setContentInset:");
  -[UITableView setScrollIndicatorInsets:](self->_table, "setScrollIndicatorInsets:", v6, v8, a3, v10);
}

- (void)_keyboardWillShow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGPoint *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  double v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  UITableView *table;
  void *v43;
  CGPoint *p_contentOffsetWithKeyboard;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  id v51;
  _BYTE v52[128];
  uint64_t v53;
  CGPoint v54;
  CGRect v55;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UITableView superview](self->_table, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CEB890]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(MEMORY[0x1E0CEA950], "convertRect:toView:", self->_table, v9, v11, v13, v15);
    v17 = v16;
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CEB888]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "CGRectValue");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    objc_msgSend(MEMORY[0x1E0CEA950], "convertRect:toView:", self->_table, v20, v22, v24, v26);
    v27 = (CGPoint *)MEMORY[0x1E0C9D538];
    if (v28 == v17)
    {
      -[PSListController _getKeyboardIntersectionHeightFromUserInfo:](self, "_getKeyboardIntersectionHeightFromUserInfo:", v6);
      -[PSListController _setContentInset:](self, "_setContentInset:");
      p_contentOffsetWithKeyboard = &self->_contentOffsetWithKeyboard;
      if (self->_contentOffsetWithKeyboard.x != v27->x || self->_contentOffsetWithKeyboard.y != v27->y)
      {
        -[UITableView frame](self->_table, "frame");
        v54.x = p_contentOffsetWithKeyboard->x;
        v54.y = self->_contentOffsetWithKeyboard.y;
        if (CGRectContainsPoint(v55, v54))
          -[UITableView setContentOffset:](self->_table, "setContentOffset:", p_contentOffsetWithKeyboard->x, self->_contentOffsetWithKeyboard.y);
      }
    }
    else
    {
      -[UITableView visibleCells](self->_table, "visibleCells");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0CEABB0];
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CEB7F0]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "floatValue");
      v33 = v32;
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CEB7E8]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = PSAnimationOptionsFromAnimationCurve(objc_msgSend(v34, "integerValue"));
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __38__PSListController__keyboardWillShow___block_invoke;
      v50[3] = &unk_1E4A655B8;
      v50[4] = self;
      v51 = v6;
      objc_msgSend(v30, "animateWithDuration:delay:options:animations:completion:", v35, v50, 0, v33, 0.0);

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v36 = v29;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v47;
        while (2)
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v47 != v39)
              objc_enumerationMutation(v36);
            v41 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            if (objc_msgSend(v41, "_isAncestorOfFirstResponder", (_QWORD)v46))
            {
              table = self->_table;
              -[UITableView indexPathForCell:](table, "indexPathForCell:", v41);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](table, "scrollToRowAtIndexPath:atScrollPosition:animated:", v43, 3, 1);

              goto LABEL_13;
            }
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
          if (v38)
            continue;
          break;
        }
      }
LABEL_13:

    }
    self->_contentOffsetWithKeyboard = *v27;

  }
}

uint64_t __38__PSListController__keyboardWillShow___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_getKeyboardIntersectionHeightFromUserInfo:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_setContentInset:");
}

- (void)_keyboardWillHide:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  float v30;
  double v31;
  void *v32;
  uint64_t v33;
  CGFloat v34;
  CGFloat v35;
  _QWORD v36[5];

  v4 = a3;
  -[UITableView superview](self->_table, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CEB890]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(MEMORY[0x1E0CEA950], "convertRect:toView:", self->_table, v9, v11, v13, v15);
    v17 = v16;
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CEB888]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "CGRectValue");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    objc_msgSend(MEMORY[0x1E0CEA950], "convertRect:toView:", self->_table, v20, v22, v24, v26);
    if (v27 == v17)
    {
      -[UITableView contentOffset](self->_table, "contentOffset");
      self->_contentOffsetWithKeyboard.x = v34;
      self->_contentOffsetWithKeyboard.y = v35;
    }
    else
    {
      v28 = (void *)MEMORY[0x1E0CEABB0];
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CEB7F0]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "floatValue");
      v31 = v30;
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CEB7E8]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = PSAnimationOptionsFromAnimationCurve(objc_msgSend(v32, "integerValue"));
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __38__PSListController__keyboardWillHide___block_invoke;
      v36[3] = &unk_1E4A654F0;
      v36[4] = self;
      objc_msgSend(v28, "animateWithDuration:delay:options:animations:completion:", v33, v36, 0, v31, 0.0);

    }
  }

}

uint64_t __38__PSListController__keyboardWillHide___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setContentInset:", 0.0);
}

- (void)_keyboardDidHide:(id)a3
{
  -[PSListController _setContentInset:](self, "_setContentInset:", a3, 0.0);
}

- (void)selectRowForSpecifier:(id)a3
{
  id v4;

  if (a3)
  {
    -[PSListController indexPathForIndex:](self, "indexPathForIndex:", -[NSArray indexOfObject:](self->_specifiers, "indexOfObject:"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_table, "selectRowAtIndexPath:animated:scrollPosition:", v4, 0, 0);

  }
}

- (float)verticalContentOffset
{
  void *v2;
  double v3;
  float v4;

  -[PSListController table](self, "table");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;

  return v4;
}

- (void)setDesiredVerticalContentOffset:(float)a3
{
  self->_verticalContentOffset = a3;
}

- (void)setDesiredVerticalContentOffsetItemNamed:(id)a3
{
  NSString *v4;
  NSString *offsetItemName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  offsetItemName = self->_offsetItemName;
  self->_offsetItemName = v4;

}

- (void)highlightSpecifierWithID:(id)a3
{
  NSString *v4;
  NSString *highlightItemName;

  if (self->_isVisible)
  {
    -[PSListController _performHighlightForSpecifierWithID:tryAgainIfFailed:](self, "_performHighlightForSpecifierWithID:tryAgainIfFailed:", a3, 1);
  }
  else
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    highlightItemName = self->_highlightItemName;
    self->_highlightItemName = v4;

  }
}

- (void)_performHighlightForSpecifierWithID:(id)a3
{
  -[PSListController _performHighlightForSpecifierWithID:tryAgainIfFailed:](self, "_performHighlightForSpecifierWithID:tryAgainIfFailed:", a3, 0);
}

- (void)_performHighlightForSpecifierWithID:(id)a3 tryAgainIfFailed:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  int v13;
  id v14;

  v4 = a4;
  v14 = a3;
  -[PSListController indexPathForIndex:](self, "indexPathForIndex:", -[PSListController indexOfSpecifierID:](self, "indexOfSpecifierID:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(v6, "row") == 0x7FFFFFFFFFFFFFFFLL
      && !-[PSListController _isEmptyGroup:](self, "_isEmptyGroup:", -[PSListController indexForIndexPath:](self, "indexForIndexPath:", v7)))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, objc_msgSend(v7, "section"));
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    -[UITableView cellForRowAtIndexPath:](self->_table, "cellForRowAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIAnimationDragCoefficient();
    v11 = v10 * 0.5;
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_12:

        goto LABEL_13;
      }
      -[UITableView visibleCells](self->_table, "visibleCells");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v9);

      if (v13)
      {
        objc_msgSend(v9, "highlightCellForDuration:animateUnighlight:", 1, 0.5);
        goto LABEL_12;
      }
    }
    else
    {
      -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](self->_table, "scrollToRowAtIndexPath:atScrollPosition:animated:", v7, 2, 1);
    }
    if (v4)
      -[PSListController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__performHighlightForSpecifierWithID_, v14, v11);
    goto LABEL_12;
  }
LABEL_13:

}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (void)_setNotShowingSetupController
{
  self->_showingSetupController = 0;
}

- (void)_moveSpecifierAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  PSListController *v8;
  void *v9;
  NSArray *v10;
  void *v11;
  NSArray *specifiers;
  uint64_t v13;
  id v14;

  v5 = a5;
  v8 = self;
  objc_sync_enter(v8);
  if (-[NSArray count](v8->_specifiers, "count") > a3 && -[NSArray count](v8->_specifiers, "count") >= a4)
  {
    -[PSListController indexPathForIndex:](v8, "indexPathForIndex:", a3);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[PSListController indexPathForIndex:](v8, "indexPathForIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && v9)
    {
      v10 = (NSArray *)-[NSArray mutableCopy](v8->_specifiers, "mutableCopy");
      -[NSArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray removeObjectAtIndex:](v10, "removeObjectAtIndex:", a3);
      -[NSArray insertObject:atIndex:](v10, "insertObject:atIndex:", v11, a4);
      specifiers = v8->_specifiers;
      v8->_specifiers = v10;

      objc_sync_exit(v8);
      v13 = objc_msgSend(MEMORY[0x1E0CEABB0], "areAnimationsEnabled");
      objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", v5);
      -[UITableView moveRowAtIndexPath:toIndexPath:](v8->_table, "moveRowAtIndexPath:toIndexPath:", v14, v9);
      objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationsEnabled:", v13);
      goto LABEL_5;
    }
  }
  else
  {
    v9 = 0;
    v14 = 0;
  }
  objc_sync_exit(v8);

LABEL_5:
}

- (int64_t)observerType
{
  return 1;
}

- (void)dataSource:(id)a3 performUpdates:(id)a4
{
  if (!self->_requestingSpecifiersFromDataSource)
    -[PSListController performSpecifierUpdates:](self, "performSpecifierUpdates:", a4);
}

- (void)performSpecifierUpdates:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  NSArray *v10;
  NSArray *specifiers;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSArray *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  char v21;
  _QWORD v22[6];
  _QWORD v23[3];
  char v24;

  v4 = a3;
  objc_msgSend(v4, "originalSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", self->_specifiers);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "updateModelOnly");

    if (v8)
    {
      objc_msgSend(v4, "currentSpecifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (NSArray *)objc_msgSend(v9, "mutableCopy");
      specifiers = self->_specifiers;
      self->_specifiers = v10;

      -[PSListController createGroupIndices](self, "createGroupIndices");
    }
    else
    {
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x2020000000;
      v24 = 0;
      v12 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __44__PSListController_performSpecifierUpdates___block_invoke;
      v22[3] = &unk_1E4A655E0;
      v22[4] = self;
      v22[5] = v23;
      v13 = (void *)MEMORY[0x1A8594D10](v22);
      objc_msgSend(v4, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "animated");

      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __44__PSListController_performSpecifierUpdates___block_invoke_2;
      v19[3] = &unk_1E4A65608;
      v16 = v13;
      v19[4] = self;
      v20 = v16;
      v21 = v15;
      objc_msgSend(v4, "enumerateUpdatesUsingBlock:", v19);
      v17 = self->_specifiers;
      objc_msgSend(v4, "currentSpecifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v17) = -[NSArray isEqual:](v17, "isEqual:", v18);

      if ((v17 & 1) != 0)
        (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
      else
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Specifier updates resulted in inconsistent specifier arrays."));

      _Block_object_dispose(v23, 8);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Attempting to perform specifier updates on list controller with inconsistent specifiers."));
  }

}

uint64_t __44__PSListController_performSpecifierUpdates___block_invoke(uint64_t result, int a2)
{
  char v2;
  uint64_t v3;
  void *v4;

  if (*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) != a2)
  {
    v2 = a2;
    v3 = result;
    v4 = *(void **)(result + 32);
    if (a2)
      result = objc_msgSend(v4, "beginUpdates");
    else
      result = objc_msgSend(v4, "endUpdates");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24) = v2;
  }
  return result;
}

void __44__PSListController_performSpecifierUpdates___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v11, "operation") != 2);
  switch(objc_msgSend(v11, "operation"))
  {
    case 1:
      v3 = *(void **)(a1 + 32);
      objc_msgSend(v11, "specifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "index");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "insertSpecifier:atIndex:animated:", v4, objc_msgSend(v5, "integerValue"), *(unsigned __int8 *)(a1 + 48));

      goto LABEL_6;
    case 2:
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v11, "index");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "integerValue");
      objc_msgSend(v11, "toIndex");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_moveSpecifierAtIndex:toIndex:animated:", v7, objc_msgSend(v8, "integerValue"), *(unsigned __int8 *)(a1 + 48));

      goto LABEL_6;
    case 3:
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v11, "index");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reloadSpecifierAtIndex:animated:", objc_msgSend(v4, "integerValue"), *(unsigned __int8 *)(a1 + 48));
      goto LABEL_6;
    case 4:
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v11, "index");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeSpecifierAtIndex:animated:", objc_msgSend(v4, "integerValue"), *(unsigned __int8 *)(a1 + 48));
LABEL_6:

      break;
    default:
      break;
  }

}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[PSListController specifierAtIndexPath:](self, "specifierAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          -[PSListController prefetchResourcesFor:](self, "prefetchResourcesFor:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)setPrefetchingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  UITableView *table;
  PSListController *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = a3;
  self->_prefetchingEnabled = a3;
  _PSLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "background prefetching enabled", buf, 2u);
    }

    table = self->_table;
    v8 = self;
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "background prefetching disabled", v9, 2u);
    }

    table = self->_table;
    v8 = 0;
  }
  -[UITableView setPrefetchDataSource:](table, "setPrefetchDataSource:", v8);
}

- (BOOL)forceSynchronousIconLoadForCreatedCells
{
  return self->_forceSynchronousIconLoadForCreatedCells;
}

- (BOOL)isShowingSetupController
{
  return self->_showingSetupController;
}

- (void)setShowingSetupController:(BOOL)a3
{
  self->_showingSetupController = a3;
}

- (NSDictionary)pendingURLResourceDictionary
{
  return self->_pendingURLResourceDictionary;
}

- (void)setPendingURLResourceDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_pendingURLResourceDictionary, a3);
}

- (void)setSpecifierIDPendingPush:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1216);
}

- (id)urlHandlingCompletion
{
  return self->_urlHandlingCompletion;
}

- (void)setUrlHandlingCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (BOOL)isPrefetchingEnabled
{
  return self->_prefetchingEnabled;
}

- (void)setContentSizeDidChange:(BOOL)a3
{
  self->_contentSizeDidChange = a3;
}

- (UIColor)padSelectionColor
{
  return self->_padSelectionColor;
}

- (UIColor)cellAccessoryColor
{
  return self->_cellAccessoryColor;
}

- (UIColor)cellAccessoryHighlightColor
{
  return self->_cellAccessoryHighlightColor;
}

- (void)setCellAccessoryHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_cellAccessoryHighlightColor, a3);
}

- (UIColor)editableTextColor
{
  return self->_editableTextColor;
}

- (UIColor)editablePlaceholderTextColor
{
  return self->_editablePlaceholderTextColor;
}

- (UIColor)editableInsertionPointColor
{
  return self->_editableInsertionPointColor;
}

- (UIColor)editableSelectionBarColor
{
  return self->_editableSelectionBarColor;
}

- (UIColor)editableSelectionHighlightColor
{
  return self->_editableSelectionHighlightColor;
}

- (UIColor)segmentedSliderTrackColor
{
  return self->_segmentedSliderTrackColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedSliderTrackColor, 0);
  objc_storeStrong((id *)&self->_footerHyperlinkColor, 0);
  objc_storeStrong((id *)&self->_editableSelectionHighlightColor, 0);
  objc_storeStrong((id *)&self->_editableSelectionBarColor, 0);
  objc_storeStrong((id *)&self->_editableInsertionPointColor, 0);
  objc_storeStrong((id *)&self->_editablePlaceholderTextColor, 0);
  objc_storeStrong((id *)&self->_editableTextColor, 0);
  objc_storeStrong((id *)&self->_buttonTextColor, 0);
  objc_storeStrong((id *)&self->_altTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_cellAccessoryHighlightColor, 0);
  objc_storeStrong((id *)&self->_cellAccessoryColor, 0);
  objc_storeStrong((id *)&self->_padSelectionColor, 0);
  objc_storeStrong((id *)&self->_cellHighlightColor, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_urlHandler, 0);
  objc_storeStrong(&self->_urlHandlingCompletion, 0);
  objc_storeStrong((id *)&self->_specifierIDPendingPush, 0);
  objc_storeStrong((id *)&self->_pendingURLResourceDictionary, 0);
  objc_storeStrong((id *)&self->_navigationCoordinator, 0);
  objc_storeStrong((id *)&self->_appearanceProvider, 0);
  objc_storeStrong((id *)&self->_savedSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_highlightItemName, 0);
  objc_storeStrong((id *)&self->_offsetItemName, 0);
  objc_storeStrong((id *)&self->_bundleControllers, 0);
  objc_storeStrong((id *)&self->_specifierID, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_specifiersByID, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_prequeuedReusablePSTableCells, 0);
}

- (void)showPINSheet:(id)a3 allowOptionsButton:(BOOL)a4
{
  _BOOL8 v4;
  DevicePINSetupController *v6;
  id *v7;

  v4 = a4;
  v7 = (id *)a3;
  if (-[PSListControllerNavigationCoordinator listControllerIsOnTopOfNavigationStack:searchTopMostViewControllerChildren:](self->_navigationCoordinator, "listControllerIsOnTopOfNavigationStack:searchTopMostViewControllerChildren:", self, 0))
  {
    v6 = objc_alloc_init(DevicePINSetupController);
    -[DevicePINSetupController setAllowOptionsButton:](v6, "setAllowOptionsButton:", v4);
    self->_showingSetupController = 1;
    -[PSSetupController setParentController:](v6, "setParentController:", self);
    objc_msgSend(v7, "setProperty:forKey:", self, CFSTR("PINControllerDelegate"));
    -[PSRootController setSpecifier:](v6, "setSpecifier:", v7);
    objc_storeWeak(v7 + 1, self);
    -[PSListController showController:](self, "showController:", v6);

  }
}

- (void)showPINSheet:(id)a3
{
  -[PSListController showPINSheet:allowOptionsButton:](self, "showPINSheet:allowOptionsButton:", a3, 0);
}

- (id)popupStylePopoverController
{
  return 0;
}

+ (void)registerDefaultAppearanceProviderClass:(Class)a3
{
  if (ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken != -1)
    dispatch_once(&ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken, &__block_literal_global_851);
  defaultAppearanceProviderClass = (uint64_t)a3;
}

- (void)setAppearanceProvider:(id)a3
{
  PSListControllerAppearanceProvider *v4;
  PSListControllerAppearanceProvider *appearanceProvider;

  v4 = (PSListControllerAppearanceProvider *)a3;
  if (ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken != -1)
    dispatch_once(&ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken, &__block_literal_global_851);
  appearanceProvider = self->_appearanceProvider;
  self->_appearanceProvider = v4;

}

- (PSListControllerAppearanceProvider)appearanceProvider
{
  if (ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken != -1)
    dispatch_once(&ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken, &__block_literal_global_851);
  return self->_appearanceProvider;
}

+ (void)registerDefaultNavigationCoordinatorClass:(Class)a3
{
  if (ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken != -1)
    dispatch_once(&ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken, &__block_literal_global_851);
  defaultNavigationCoordinatorClass = (uint64_t)a3;
}

- (void)setNavigationCoordinator:(id)a3
{
  PSListControllerNavigationCoordinator *v4;
  PSListControllerNavigationCoordinator *navigationCoordinator;

  v4 = (PSListControllerNavigationCoordinator *)a3;
  if (ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken != -1)
    dispatch_once(&ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken, &__block_literal_global_851);
  navigationCoordinator = self->_navigationCoordinator;
  self->_navigationCoordinator = v4;

}

- (PSListControllerNavigationCoordinator)navigationCoordinator
{
  if (ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken != -1)
    dispatch_once(&ensureDefaultAppearanceProviderAndNavigationRegistration_onceToken, &__block_literal_global_851);
  return self->_navigationCoordinator;
}

- (void)handleScrollPPTTestName:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_opt_class() && objc_opt_class() && objc_msgSend(MEMORY[0x1E0D83C78], "isRecapAvailable"))
  {
    -[PSListController table](self, "table");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D83C70]), "initWithTestName:scrollView:completionHandler:", v6, v4, 0);
    objc_msgSend(MEMORY[0x1E0D83C78], "runTestWithParameters:", v5);

  }
}

- (void)_insertContiguousSpecifiers:(uint64_t)a3 atIndex:(uint64_t)a4 animated:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1A3819000, a1, a3, "Inserting specifier off of main thread", a5, a6, a7, a8, 0);
}

- (void)_removeContiguousSpecifiers:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1A3819000, a1, a3, "Removing specifier off of main thread", a5, a6, a7, a8, 0);
}

- (void)controllerForSpecifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A3819000, v0, v1, "%{mask.hash}@: No Action, legacyAction is nil, returning nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)controllerForSpecifier:.cold.2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8();
  +[PSTableCell reuseIdentifierForClassAndType:](PSTableCell, "reuseIdentifierForClassAndType:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A3819000, v2, v3, "%{mask.hash}@: Cell type %{public}@ does not expect navigation semantics. Returning nil.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)controllerForSpecifier:.cold.3()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8();
  +[PSTableCell reuseIdentifierForClassAndType:](PSTableCell, "reuseIdentifierForClassAndType:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A3819000, v2, v3, "%{mask.hash}@: Cell type %{public}@ supports being checked, returning non-nil value.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)controllerForSpecifier:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[14];
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v4 = v0;
  OUTLINED_FUNCTION_10();
  v5 = v1;
  _os_log_debug_impl(&dword_1A3819000, v2, OS_LOG_TYPE_DEBUG, "%{mask.hash}@: Cell %{mask.hash}@ has interactivity disabled. Returning nil.", v3, 0x2Au);
}

- (void)controllerForSpecifier:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A3819000, v0, v1, "%{mask.hash}@: Performed controllerLoadAction, continuing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)controllerForSpecifier:(void *)a1 .cold.6(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[14];
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v7 = a1;
  OUTLINED_FUNCTION_10();
  v8 = v5;
  _os_log_error_impl(&dword_1A3819000, a2, OS_LOG_TYPE_ERROR, "%{mask.hash}@: Performed controllerLoadAction but target %{mask.hash}@ did not unset controllerLoadAction. Returning nil", v6, 0x2Au);

}

- (void)controllerForSpecifier:.cold.7()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8();
  objc_msgSend(*(id *)(v0 + 1040), "indexPathForSelectedRow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A3819000, v2, v3, "%{mask.hash}@: Performed buttonAction, deselecting any selected row %{public}@ and returning nil.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)controllerForSpecifier:.cold.8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8();
  objc_msgSend(*(id *)(v0 + 1040), "indexPathForSelectedRow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A3819000, v2, v3, "%{mask.hash}@: Performed legacyAction, deselecting any selected row %{public}@ and returning nil.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)showController:animate:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4(&dword_1A3819000, v1, v2, "%{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_9();
}

- (void)showController:animate:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CEABB8], "_printHierarchy");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4(&dword_1A3819000, v1, v2, "%{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_9();
}

- (void)showController:(os_log_t)log animate:.cold.3(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[PSListController showController:animate:]";
  _os_log_error_impl(&dword_1A3819000, log, OS_LOG_TYPE_ERROR, "%s: pushing a view controller that's already in the stack.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_11();
}

@end
