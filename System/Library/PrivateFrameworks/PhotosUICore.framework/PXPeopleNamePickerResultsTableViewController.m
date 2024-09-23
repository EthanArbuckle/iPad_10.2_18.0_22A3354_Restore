@implementation PXPeopleNamePickerResultsTableViewController

- (PXPeopleNamePickerResultsTableViewController)initWithStyle:(int64_t)a3 person:(id)a4 face:(id)a5
{
  id v9;
  id v10;
  PXPeopleNamePickerResultsTableViewController *v11;
  NSMutableArray *v12;
  NSMutableArray *items;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXPeopleNamePickerResultsTableViewController;
  v11 = -[PXPeopleNamePickerResultsTableViewController initWithStyle:](&v15, sel_initWithStyle_, a3);
  if (v11)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    items = v11->_items;
    v11->_items = v12;

    objc_storeStrong((id *)&v11->_person, a4);
    objc_storeStrong((id *)&v11->_face, a5);
  }

  return v11;
}

- (PXPeopleNamePickerResultsTableViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerResultsTableViewController.m"), 61, CFSTR("%s is not available as initializer"), "-[PXPeopleNamePickerResultsTableViewController initWithCoder:]");

  abort();
}

- (PXPeopleNamePickerResultsTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerResultsTableViewController.m"), 65, CFSTR("%s is not available as initializer"), "-[PXPeopleNamePickerResultsTableViewController initWithNibName:bundle:]");

  abort();
}

- (PXPeopleNamePickerResultsTableViewController)initWithStyle:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerResultsTableViewController.m"), 69, CFSTR("%s is not available as initializer"), "-[PXPeopleNamePickerResultsTableViewController initWithStyle:]");

  abort();
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPeopleNamePickerResultsTableViewController;
  -[PXPeopleNamePickerResultsTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PXPeopleNamePickerResultsTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PXPeopleNamePickerPersonCellReuseID"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PXPeopleNamePickerContactCellReuseID"));
  objc_msgSend(v3, "setRowHeight:", 64.0);
  v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setTableFooterView:", v5);

}

- (void)updateItemsForSearchString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PXPeopleNamePickerResultsTableViewController person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleNamePickerResultsTableViewController face](self, "face");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleNamingUtilities itemsForSearchString:person:face:](PXPeopleNamingUtilities, "itemsForSearchString:person:face:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v7, "mutableCopy");
  -[PXPeopleNamePickerResultsTableViewController setItems:](self, "setItems:", v9);
  -[PXPeopleNamePickerResultsTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (BOOL)hasResults
{
  void *v2;
  uint64_t v3;

  -[PXPeopleNamePickerResultsTableViewController items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3 > 0;
}

- (id)contactAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PXPeopleNamePickerResultsTableViewController items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)personAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PXPeopleNamePickerResultsTableViewController items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PXPeopleNamePickerResultsTableViewController items](self, "items", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;

  v7 = a3;
  v8 = a4;
  -[PXPeopleNamePickerResultsTableViewController items](self, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "contact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "person");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PXPeopleNamePickerContactCellReuseID"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "subtitleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subtitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAttributedText:", v16);

    objc_msgSend(v14, "contactAvatarView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContact:", v11);

  }
  else
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerResultsTableViewController.m"), 138, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PXPeopleNamePickerPersonCellReuseID"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPerson:", v13);
  }
  objc_msgSend(v14, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAttributedText:", v19);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v20);

  return v14;
}

- (PHPerson)person
{
  return (PHPerson *)objc_getProperty(self, a2, 1016, 1);
}

- (PHFace)face
{
  return (PHFace *)objc_getProperty(self, a2, 1024, 1);
}

- (NSMutableArray)items
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end
