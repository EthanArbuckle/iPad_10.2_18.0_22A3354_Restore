@implementation PXDebugDictionaryViewController

- (PXDebugDictionaryViewController)initWithDebugDictionary:(id)a3
{
  id v5;
  PXDebugDictionaryViewController *v6;
  PXDebugDictionaryViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXDebugDictionaryViewController;
  v6 = -[PXDebugDictionaryViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_debugDictionary, a3);
    objc_msgSend(v5, "objectForKey:", CFSTR("PXDiagnosticsTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDebugDictionaryViewController setTitle:](v7, "setTitle:", v8);

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UISegmentedControl *v7;
  UISegmentedControl *segmentedControl;
  void *v9;
  id v10;
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
  id v22;
  UITableView *v23;
  UITableView *tableView;
  void *v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PXDebugDictionaryViewController;
  -[PXDebugDictionaryViewController viewDidLoad](&v27, sel_viewDidLoad);
  -[PXDebugDictionaryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDebugDictionaryViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[PXDebugDictionaryViewController segmentedTitles](self, "segmentedTitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (UISegmentedControl *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", v6);
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v7;

  -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", self, sel__switchLogsAction_, 4096);
  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", 0);
  -[PXDebugDictionaryViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_segmentedControl);

  v10 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[PXDebugDictionaryViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

  -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UISegmentedControl topAnchor](self->_segmentedControl, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDebugDictionaryViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeAreaLayoutGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v15, 10.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  _NSDictionaryOfVariableBindings(CFSTR("_segmentedControl, contentView"), self->_segmentedControl, v10, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_segmentedControl(<=44)]-10-[contentView]-0-|"), 0, 0, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v19);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_segmentedControl]-|"), 0, 0, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v20);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[contentView]|"), 0, 0, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v21);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v18);
  v22 = objc_alloc(MEMORY[0x1E0DC3D48]);
  objc_msgSend(v10, "frame");
  v23 = (UITableView *)objc_msgSend(v22, "initWithFrame:style:", 1);
  tableView = self->_tableView;
  self->_tableView = v23;

  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 0);
  objc_msgSend(v10, "addSubview:", self->_tableView);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Close"), 2, self, sel__closeAction_);
  -[PXDebugDictionaryViewController navigationItem](self, "navigationItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLeftBarButtonItem:", v25);

  -[PXDebugDictionaryViewController _switchLogsAction:](self, "_switchLogsAction:", 0);
}

- (id)segmentedTitles
{
  void *v2;
  void *v3;

  -[NSDictionary allKeys](self->_debugDictionary, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXFilter();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_switchLogsAction:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[PXDebugDictionaryViewController segmentedTitles](self, "segmentedTitles", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXDebugDictionaryViewController segmentedControl](self, "segmentedControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedSegmentIndex");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDebugDictionaryViewController _updateWithSegmentedTitle:](self, "_updateWithSegmentedTitle:", v6);
  -[PXDebugDictionaryViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (void)_updateWithSegmentedTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_debugDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDebugDictionaryViewController setSectionTitles:](self, "setSectionTitles:", v6);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v4;
    objc_msgSend(v5, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDebugDictionaryViewController setSectionTitles:](self, "setSectionTitles:", v7);

    v19 = v5;
    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    if (!v10)
      goto LABEL_14;
    v11 = v10;
    v12 = *(_QWORD *)v22;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[PXDebugDictionaryViewController _flattenDictionary:](self, "_flattenDictionary:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_12;
          v30 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
          v16 = objc_claimAutoreleasedReturnValue();
        }
        v17 = (void *)v16;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v14);

LABEL_12:
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      if (!v11)
      {
LABEL_14:

        v5 = v19;
        v4 = v20;
        goto LABEL_18;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v4;
    v29 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = v5;
    v26 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_18:
  -[PXDebugDictionaryViewController setTableContent:](self, "setTableContent:", v8);

}

- (id)_flattenDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PXDebugDictionaryViewController__flattenDictionary___block_invoke;
  v8[3] = &unk_1E5144E20;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

- (id)_sanitizedTextForTitle:(id)a3 value:(id)a4
{
  __CFString *v5;
  void *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = (__CFString *)a4;
  objc_msgSend(a3, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("location"));

  v8 = v5;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v5;
      if ((unint64_t)-[__CFString count](v9, "count") < 2)
      {
        v8 = CFSTR("Invalid location");
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        -[__CFString objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        -[__CFString objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("(%@, %@)"), v11, v12);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v9 = (__CFString *)v11;
      }

    }
    else
    {
      v8 = CFSTR("Invalid location");
    }

  }
  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PXDebugDictionaryViewController sectionTitles](self, "sectionTitles", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  -[PXDebugDictionaryViewController sectionTitles](self, "sectionTitles", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXDebugDictionaryViewController tableContent](self, "tableContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("KeywordsCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("KeywordsCell"));
  -[PXDebugDictionaryViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v7, objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXDebugDictionaryViewController tableContent](self, "tableContent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "row");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXDebugDictionaryViewController _sanitizedTextForTitle:value:](self, "_sanitizedTextForTitle:value:", v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "setAttributedText:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v14);
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setText:", v16);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v17);

    v14 = (void *)v16;
  }
  objc_msgSend(v15, "setNumberOfLines:", 0);
  objc_msgSend(v15, "sizeToFit");

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;

  -[PXDebugDictionaryViewController sectionTitles](self, "sectionTitles", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_closeAction:(id)a3
{
  -[PXDebugDictionaryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (NSDictionary)debugDictionary
{
  return self->_debugDictionary;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSArray)sectionTitles
{
  return self->_sectionTitles;
}

- (void)setSectionTitles:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTitles, a3);
}

- (NSDictionary)tableContent
{
  return self->_tableContent;
}

- (void)setTableContent:(id)a3
{
  objc_storeStrong((id *)&self->_tableContent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableContent, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_debugDictionary, 0);
}

void __54__PXDebugDictionaryViewController__flattenDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

uint64_t __50__PXDebugDictionaryViewController_segmentedTitles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", CFSTR("PXDiagnosticsTitle")) ^ 1;
}

@end
