@implementation SBModifierTimelineDetailViewController

- (void)viewDidLoad
{
  id v3;
  UITableView *v4;
  UITableView *tableView;
  void *v6;
  SBModifierTimelineModifierDetailViewController *v7;
  SBModifierTimelineModifierDetailViewController *modifierDetailViewController;
  SBModifierTimelineTextDetailViewController *v9;
  SBModifierTimelineTextDetailViewController *textDetailViewController;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBModifierTimelineDetailViewController;
  -[SBModifierTimelineDetailViewController viewDidLoad](&v13, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0CEAA58]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView contentInset](self->_tableView, "contentInset");
  -[UITableView setContentInset:](self->_tableView, "setContentInset:");
  -[SBModifierTimelineDetailViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_tableView);

  v7 = -[SBModifierTimelineModifierDetailViewController initWithNibName:bundle:]([SBModifierTimelineModifierDetailViewController alloc], "initWithNibName:bundle:", 0, 0);
  modifierDetailViewController = self->_modifierDetailViewController;
  self->_modifierDetailViewController = v7;

  v9 = -[SBModifierTimelineTextDetailViewController initWithNibName:bundle:]([SBModifierTimelineTextDetailViewController alloc], "initWithNibName:bundle:", 0, 0);
  textDetailViewController = self->_textDetailViewController;
  self->_textDetailViewController = v9;

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithTitle:style:target:action:", CFSTR("Done"), 2, self, sel__done);
  -[SBModifierTimelineDetailViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRightBarButtonItem:", v11);

}

- (void)setEntry:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_entry, a3);
  v5 = a3;
  -[SBModifierTimelineDetailViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[UITableView reloadData](self->_tableView, "reloadData");

}

- (void)viewWillLayoutSubviews
{
  UITableView *tableView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBModifierTimelineDetailViewController;
  -[SBModifierTimelineDetailViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  tableView = self->_tableView;
  -[SBModifierTimelineDetailViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UITableView setFrame:](tableView, "setFrame:");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 2)
    return &stru_1E8EC7EC0;
  else
    return off_1E8EC0260[a4];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;

  v6 = a3;
  if (a4)
  {
    if (a4 == 2)
    {
      -[SBSwitcherModifierTimelineEntry responseSnapshot](self->_entry, "responseSnapshot");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "responseNames");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "count");

    }
    else
    {
      if (a4 != 1)
      {
        v8 = 0;
        goto LABEL_9;
      }
      -[SBSwitcherModifierTimelineEntry stackSnapshotAfterEvent](self->_entry, "stackSnapshotAfterEvent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[SBModifierTimelineDetailViewController _numberOfModifiersInStackSnapshot:](self, "_numberOfModifiersInStackSnapshot:", v7);
    }

  }
  else
  {
    v8 = 1;
  }
LABEL_9:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("Cell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("Cell"));
  objc_msgSend(v7, "setAccessoryType:", 1);
  if (!objc_msgSend(v6, "section"))
  {
    objc_msgSend(v7, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherModifierTimelineEntry eventSnapshot](self->_entry, "eventSnapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eventName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "section") == 1)
  {
    -[SBModifierTimelineDetailViewController _stackSnapshotAtIndex:](self, "_stackSnapshotAtIndex:", objc_msgSend(v6, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modifierName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
LABEL_7:
    objc_msgSend(v11, "setText:", v10);
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "section") != 2)
    goto LABEL_9;
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherModifierTimelineEntry responseSnapshot](self->_entry, "responseSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "responseNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v6, "row"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v13);

LABEL_8:
LABEL_9:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  uint64_t v7;
  SBModifierTimelineModifierDetailViewController *modifierDetailViewController;
  void *v9;
  SBModifierTimelineTextDetailViewController *textDetailViewController;
  void *v11;
  SBModifierTimelineTextDetailViewController *v12;
  void *v13;
  void *v14;
  SBModifierTimelineTextDetailViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  SBModifierTimelineTextDetailViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v23, 1);
  if (!objc_msgSend(v23, "section"))
  {
    -[SBSwitcherModifierTimelineEntry eventSnapshot](self->_entry, "eventSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 984;
    -[SBModifierTimelineTextDetailViewController prepareForReuse](self->_textDetailViewController, "prepareForReuse");
    textDetailViewController = self->_textDetailViewController;
    objc_msgSend(v6, "eventName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModifierTimelineTextDetailViewController setTitle:](textDetailViewController, "setTitle:", v11);

    v12 = self->_textDetailViewController;
    -[SBModifierTimelineDetailViewController _prettyStringForEventPredicateDetails:](self, "_prettyStringForEventPredicateDetails:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModifierTimelineTextDetailViewController setAttributedText:](v12, "setAttributedText:", v13);

    goto LABEL_5;
  }
  if (objc_msgSend(v23, "section") == 1)
  {
    -[SBModifierTimelineDetailViewController _stackSnapshotAtIndex:](self, "_stackSnapshotAtIndex:", objc_msgSend(v23, "row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 976;
    modifierDetailViewController = self->_modifierDetailViewController;
    objc_msgSend(v6, "modifierName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModifierTimelineModifierDetailViewController setTitle:](modifierDetailViewController, "setTitle:", v9);

    -[SBModifierTimelineModifierDetailViewController setStackSnapshot:](self->_modifierDetailViewController, "setStackSnapshot:", v6);
LABEL_5:
    -[SBModifierTimelineDetailViewController navigationController](self, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pushViewController:animated:", *(Class *)((char *)&self->super.super.super.isa + v7), 1);

    goto LABEL_6;
  }
  if (objc_msgSend(v23, "section") != 2)
    goto LABEL_7;
  -[SBModifierTimelineTextDetailViewController prepareForReuse](self->_textDetailViewController, "prepareForReuse");
  v15 = self->_textDetailViewController;
  -[SBSwitcherModifierTimelineEntry responseSnapshot](self->_entry, "responseSnapshot");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "responseNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v23, "row"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBModifierTimelineTextDetailViewController setTitle:](v15, "setTitle:", v18);

  v19 = self->_textDetailViewController;
  -[SBSwitcherModifierTimelineEntry responseSnapshot](self->_entry, "responseSnapshot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "responseDescriptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v23, "row"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBModifierTimelineTextDetailViewController setText:](v19, "setText:", v22);

  -[SBModifierTimelineDetailViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", self->_textDetailViewController, 1);
LABEL_6:

LABEL_7:
}

- (void)_done
{
  -[SBModifierTimelineDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)_numberOfModifiersInStackSnapshot:(id)a3
{
  id v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__SBModifierTimelineDetailViewController__numberOfModifiersInStackSnapshot___block_invoke;
  v6[3] = &unk_1E8EBE898;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateModifierSnapshots:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __76__SBModifierTimelineDetailViewController__numberOfModifiersInStackSnapshot___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (id)_stackSnapshotAtIndex:(int64_t)a3
{
  void *v4;
  id v5;
  _QWORD v7[7];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__125;
  v13 = __Block_byref_object_dispose__125;
  v14 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  -[SBSwitcherModifierTimelineEntry stackSnapshotAfterEvent](self->_entry, "stackSnapshotAfterEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__SBModifierTimelineDetailViewController__stackSnapshotAtIndex___block_invoke;
  v7[3] = &unk_1E8EC0240;
  v7[5] = &v9;
  v7[6] = a3;
  v7[4] = v8;
  objc_msgSend(v4, "enumerateModifierSnapshots:", v7);

  v5 = (id)v10[5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __64__SBModifierTimelineDetailViewController__stackSnapshotAtIndex___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = a2;
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v8 == a1[6])
  {
    v9 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    v6 = v9;
    *a3 = 1;
    v7 = *(_QWORD *)(a1[4] + 8);
    v8 = *(_QWORD *)(v7 + 24);
  }
  *(_QWORD *)(v7 + 24) = v8 + 1;

}

- (id)_prettyStringForEventPredicateDetails:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v19 = v3;
  objc_msgSend(v3, "eventDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    v10 = *MEMORY[0x1E0CEA0A0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v12, "hasSuffix:", CFSTR("YES")) & 1) != 0)
          objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
        else
          objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc(MEMORY[0x1E0CB3498]);
        v25 = v10;
        v26 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v12, v15);
        objc_msgSend(v4, "appendAttributedString:", v16);

        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
        objc_msgSend(v4, "appendAttributedString:", v17);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v8);
  }

  return v4;
}

- (SBSwitcherModifierTimelineEntry)entry
{
  return self->_entry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_textDetailViewController, 0);
  objc_storeStrong((id *)&self->_modifierDetailViewController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
