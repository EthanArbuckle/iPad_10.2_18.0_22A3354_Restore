@implementation MTFetchedTableViewController

- (MTFetchedTableViewController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  id v9;
  id v10;
  id v11;
  MTFetchedTableViewController *v12;
  MTFetchedTableViewController *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  MTFetchedTableViewController *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[MTFetchedTableViewController init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fetchPredicate, a4);
    objc_storeStrong((id *)&v13->_sortDescriptors, a5);
    objc_storeStrong((id *)&v13->_fetchEntityName, a3);
    v13->_rowAnimation = 0;
    v14 = (objc_class *)objc_opt_class(v13);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[MTFetchedTableViewController setRestorationIdentifier:](v13, "setRestorationIdentifier:", v16);

    v17 = v13;
  }

  return v13;
}

- (MTFetchedTableViewController)initWithEntityName:(id)a3
{
  return -[MTFetchedTableViewController initWithEntityName:predicate:sortDescriptors:](self, "initWithEntityName:predicate:sortDescriptors:", a3, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[UIBarButtonItem setTarget:](self->_editButtonItem_localIvar, "setTarget:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MTFetchedTableViewController;
  -[MTFetchedTableViewController dealloc](&v3, "dealloc");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTFetchedTableViewController;
  -[MTFetchedTableViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)initializeFrc
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  id v10;

  if (!self->_frc)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainQueueContext"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController fetchRequestInManagedObjectContext:](self, "fetchRequestInManagedObjectContext:", v4));
    v6 = objc_msgSend(objc_alloc((Class)NSFetchedResultsController), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v5, v4, self->_sectionNameKeyPath, 0);
    objc_msgSend(v6, "setDelegate:", self);
    v10 = 0;
    v7 = objc_msgSend(v6, "performFetch:", &v10);
    v8 = v10;
    v9 = v8;
    if (v7)
      -[MTFetchedTableViewController setFrc:](self, "setFrc:", v6);
    else
      objc_msgSend(v8, "logAndThrow:", 1);

  }
}

- (NSFetchedResultsController)frc
{
  return self->_frc;
}

- (void)setChangeIsUserDriven:(BOOL)a3
{
  int64_t userDrivenCounter;
  int64_t v4;

  userDrivenCounter = self->_userDrivenCounter;
  if (a3)
    v4 = userDrivenCounter + 1;
  else
    v4 = userDrivenCounter - 1;
  self->_userDrivenCounter = v4;
}

- (BOOL)changeIsUserDriven
{
  return self->_userDrivenCounter > 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MTFetchedTableViewController initializeFrc](self, "initializeFrc");
  v5.receiver = self;
  v5.super_class = (Class)MTFetchedTableViewController;
  -[MTFetchedTableViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTFetchedTableViewController;
  -[MTFetchedTableViewController viewWillDisappear:](&v3, "viewWillDisappear:", a3);
}

- (void)viewDidLoad
{
  void *v3;
  UIBarButtonItem *v4;
  UIBarButtonItem *editButtonItem_localIvar;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setRestorationIdentifier:", CFSTR("FetchedResultsTableView"));

  v6.receiver = self;
  v6.super_class = (Class)MTFetchedTableViewController;
  -[MTFetchedTableViewController viewDidLoad](&v6, "viewDidLoad");
  v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController editButtonItem](self, "editButtonItem"));
  editButtonItem_localIvar = self->_editButtonItem_localIvar;
  self->_editButtonItem_localIvar = v4;

}

- (void)refetchWithSortDescriptors:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fetchRequest"));
  objc_msgSend(v7, "setSortDescriptors:", v6);

  -[MTFetchedTableViewController setSortDescriptors:](self, "setSortDescriptors:", v6);
  -[MTFetchedTableViewController _updateTableAnimated:](self, "_updateTableAnimated:", v4);

}

- (void)refetchWithPredicate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchRequest"));
  objc_msgSend(v5, "setPredicate:", v4);

  -[MTFetchedTableViewController setFetchPredicate:](self, "setFetchPredicate:", v4);
  -[MTFetchedTableViewController _updateTableAnimated:](self, "_updateTableAnimated:", 1);

}

- (void)refetchWithPredicate:(id)a3 sortDescriptors:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fetchRequest"));
  objc_msgSend(v10, "setPredicate:", v9);

  -[MTFetchedTableViewController setFetchPredicate:](self, "setFetchPredicate:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fetchRequest"));
  objc_msgSend(v11, "setSortDescriptors:", v8);

  -[MTFetchedTableViewController setSortDescriptors:](self, "setSortDescriptors:", v8);
  -[MTFetchedTableViewController _updateTableAnimated:](self, "_updateTableAnimated:", v5);

}

- (id)reuseIdentifierForRow:(id)a3
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v3);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (a4 == 1)
  {
    v6 = a5;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexPath:", v6));

    if (v8)
    {
      objc_msgSend(v7, "deleteObject:", v8);
      objc_msgSend(v7, "saveInCurrentBlock");
    }

  }
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  self->_inSwipeToDeleteMode = 1;
  -[MTFetchedTableViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  -[MTFetchedTableViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  self->_inSwipeToDeleteMode = 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sections"));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", a4));

  v8 = objc_msgSend(v7, "numberOfObjects");
  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController reuseIdentifierForRow:](self, "reuseIdentifierForRow:", v6));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v8));

  if (!v9)
    v9 = -[MTFetchedTableViewController newCellInstanceWithReuseIdentifier:](self, "newCellInstanceWithReuseIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexPath:", v6));

  -[MTFetchedTableViewController configureCell:withObject:atIndexPath:](self, "configureCell:withObject:atIndexPath:", v9, v11, v6);
  return v9;
}

- (id)newCellInstanceWithReuseIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, v3);

  return v4;
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4;

  if (!-[MTFetchedTableViewController changeIsUserDriven](self, "changeIsUserDriven", a3))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
    objc_msgSend(v4, "beginUpdates");

  }
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;

  if (!-[MTFetchedTableViewController changeIsUserDriven](self, "changeIsUserDriven", a3))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
    objc_msgSend(v4, "endUpdates");

  }
}

- (void)setRefreshControl:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  objc_super v10;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController refreshControl](self, "refreshControl"));
  v6 = v4;
  if ((id)v5 == v4)
    goto LABEL_4;
  v7 = (void *)v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController refreshControl](self, "refreshControl"));
  v9 = objc_msgSend(v8, "isRefreshing");

  if (v9)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController refreshControl](self, "refreshControl"));
    objc_msgSend(v6, "endRefreshing");
LABEL_4:

  }
  v10.receiver = self;
  v10.super_class = (Class)MTFetchedTableViewController;
  -[MTFetchedTableViewController setRefreshControl:](&v10, "setRefreshControl:", v4);

}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v11 = a5;
  v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
  if (!-[MTFetchedTableViewController changeIsUserDriven](self, "changeIsUserDriven"))
  {
    switch(a6)
    {
      case 1uLL:
        goto LABEL_5;
      case 2uLL:
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v11));
        objc_msgSend(v13, "deleteRowsAtIndexPaths:withRowAnimation:", v14, 5);
        goto LABEL_8;
      case 3uLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v11));
        objc_msgSend(v13, "deleteRowsAtIndexPaths:withRowAnimation:", v15, 5);

LABEL_5:
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v12));
        objc_msgSend(v13, "insertRowsAtIndexPaths:withRowAnimation:", v14, 5);
        goto LABEL_8;
      case 4uLL:
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cellForRowAtIndexPath:", v11));
        if (v14)
          -[MTFetchedTableViewController configureCell:withObject:atIndexPath:](self, "configureCell:withObject:atIndexPath:", v14, v16, v11);
LABEL_8:

        break;
      default:
        break;
    }
  }

}

- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6
{
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView", a3, a4));
  if (!-[MTFetchedTableViewController changeIsUserDriven](self, "changeIsUserDriven"))
  {
    if (a6 == 2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", a5));
      objc_msgSend(v10, "deleteSections:withRowAnimation:", v9, 5);
      goto LABEL_6;
    }
    if (a6 == 1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", a5));
      objc_msgSend(v10, "insertSections:withRowAnimation:", v9, 5);
LABEL_6:

    }
  }

}

- (id)fetchRequestInManagedObjectContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSFetchRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController sortDescriptors](self, "sortDescriptors"));
  if (v6)
  {
    objc_msgSend(v5, "setSortDescriptors:", v6);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    objc_msgSend(v5, "setSortDescriptors:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController fetchEntityName](self, "fetchEntityName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v8, v4));

  objc_msgSend(v5, "setEntity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController fetchPredicate](self, "fetchPredicate"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController fetchPredicate](self, "fetchPredicate"));
    objc_msgSend(v5, "setPredicate:", v11);

  }
  return v5;
}

- (BOOL)hasSectionNameKeyPathChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController sectionNameKeyPath](self->_frc, "sectionNameKeyPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController sectionNameKeyPath](self, "sectionNameKeyPath"));

  if (v3 == v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController sectionNameKeyPath](self->_frc, "sectionNameKeyPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController sectionNameKeyPath](self, "sectionNameKeyPath"));
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7 ^ 1;
}

- (void)_updateTableAnimated:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  NSFetchedResultsController *frc;
  NSFetchedResultsController *v7;
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  NSFetchedResultsController *v26;
  unsigned int v27;
  NSMutableArray *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  char *v35;
  char *v36;
  char *j;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  char v50;
  void *v51;
  NSMutableArray *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  id v58;
  _BYTE v59[128];

  v3 = a3;
  v5 = -[MTFetchedTableViewController hasSectionNameKeyPathChanged](self, "hasSectionNameKeyPathChanged");
  if (v5)
  {
    -[NSFetchedResultsController setDelegate:](self->_frc, "setDelegate:", 0);
    frc = self->_frc;
    self->_frc = 0;

    -[MTFetchedTableViewController initializeFrc](self, "initializeFrc");
  }
  if (v3 && (id)-[MTFetchedTableViewController rowAnimation](self, "rowAnimation") != (id)5)
  {
    if (v5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      objc_msgSend(v11, "beginUpdates");

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      v13 = objc_msgSend(v12, "numberOfSections");

      v14 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", 0, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      objc_msgSend(v15, "deleteSections:withRowAnimation:", v14, 0);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController frc](self, "frc"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sections"));
      v18 = objc_msgSend(v17, "count");

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      objc_msgSend(v20, "insertSections:withRowAnimation:", v19, 0);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      objc_msgSend(v21, "endUpdates");

      v9 = 0;
      goto LABEL_31;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchedObjects](self->_frc, "fetchedObjects"));
    v23 = objc_msgSend(v22, "copy");

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v23));
    v25 = objc_msgSend(v24, "mutableCopy");
    v26 = self->_frc;
    v57 = 0;
    v27 = -[NSFetchedResultsController performFetch:](v26, "performFetch:", &v57);
    v9 = v57;
    if (v27)
    {
      v50 = v27;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController fetchedObjects](self->_frc, "fetchedObjects"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:"));
      objc_msgSend(v25, "minusSet:");
      v28 = objc_opt_new(NSMutableArray);
      v52 = objc_opt_new(NSMutableArray);
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v49 = v25;
      v29 = v25;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(_QWORD *)v54 != v32)
              objc_enumerationMutation(v29);
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v23, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i)), 0));
            -[NSMutableArray addObject:](v28, "addObject:", v34);

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
        }
        while (v31);
      }

      v35 = (char *)objc_msgSend(v51, "count");
      if (v35)
      {
        v36 = v35;
        for (j = 0; j != v36; ++j)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectAtIndex:", j));
          v39 = objc_msgSend(v23, "containsObject:", v38);

          if ((v39 & 1) == 0)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", j, 0));
            -[NSMutableArray addObject:](v52, "addObject:", v40);

          }
        }
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      objc_msgSend(v41, "beginUpdates");

      if (-[NSMutableArray count](v52, "count")
        || -[NSMutableArray count](v28, "count")
        || (objc_msgSend(v48, "isEqualToArray:", v23) & 1) != 0)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
        objc_msgSend(v42, "insertRowsAtIndexPaths:withRowAnimation:", v52, -[MTFetchedTableViewController rowAnimation](self, "rowAnimation"));

        v43 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
        objc_msgSend(v43, "deleteRowsAtIndexPaths:withRowAnimation:", v28, -[MTFetchedTableViewController rowAnimation](self, "rowAnimation"));
      }
      else
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
        v46 = objc_msgSend(v45, "numberOfSections");

        v43 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", 0, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
        objc_msgSend(v47, "reloadSections:withRowAnimation:", v43, 0);

      }
      v25 = v49;

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      objc_msgSend(v44, "endUpdates");

      LOBYTE(v27) = v50;
    }

    if ((v27 & 1) == 0)
      goto LABEL_8;
  }
  else
  {
    -[MTFetchedTableViewController setChangeIsUserDriven:](self, "setChangeIsUserDriven:", 1);
    v7 = self->_frc;
    v58 = 0;
    v8 = -[NSFetchedResultsController performFetch:](v7, "performFetch:", &v58);
    v9 = v58;
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
      objc_msgSend(v10, "reloadData");

    }
    -[MTFetchedTableViewController setChangeIsUserDriven:](self, "setChangeIsUserDriven:", 0);
    if ((v8 & 1) == 0)
    {
LABEL_8:
      if (v9)
        objc_msgSend(v9, "logAndThrow:", 1);
    }
  }
LABEL_31:

}

- (void)reloadVisibleCellsWithAnimation:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedTableViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForVisibleRows"));
  objc_msgSend(v7, "reloadRowsAtIndexPaths:withRowAnimation:", v6, a3);

}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTFetchedTableViewController;
  -[MTFetchedTableViewController encodeRestorableStateWithCoder:](&v3, "encodeRestorableStateWithCoder:", a3);
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTFetchedTableViewController;
  -[MTFetchedTableViewController decodeRestorableStateWithCoder:](&v4, "decodeRestorableStateWithCoder:", a3);
  -[MTFetchedTableViewController initializeFrc](self, "initializeFrc");
}

- (NSString)fetchEntityName
{
  return self->_fetchEntityName;
}

- (void)setFetchEntityName:(id)a3
{
  objc_storeStrong((id *)&self->_fetchEntityName, a3);
}

- (NSPredicate)fetchPredicate
{
  return self->_fetchPredicate;
}

- (void)setFetchPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_fetchPredicate, a3);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_sortDescriptors, a3);
}

- (NSString)sectionName
{
  return self->_sectionName;
}

- (void)setSectionName:(id)a3
{
  objc_storeStrong((id *)&self->_sectionName, a3);
}

- (int64_t)rowAnimation
{
  return self->_rowAnimation;
}

- (void)setRowAnimation:(int64_t)a3
{
  self->_rowAnimation = a3;
}

- (void)setFrc:(id)a3
{
  objc_storeStrong((id *)&self->_frc, a3);
}

- (BOOL)inSwipeToDeleteMode
{
  return self->_inSwipeToDeleteMode;
}

- (void)setInSwipeToDeleteMode:(BOOL)a3
{
  self->_inSwipeToDeleteMode = a3;
}

- (NSString)sectionNameKeyPath
{
  return self->_sectionNameKeyPath;
}

- (void)setSectionNameKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_sectionNameKeyPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionNameKeyPath, 0);
  objc_storeStrong((id *)&self->_frc, 0);
  objc_storeStrong((id *)&self->_sectionName, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_fetchPredicate, 0);
  objc_storeStrong((id *)&self->_fetchEntityName, 0);
  objc_storeStrong((id *)&self->_editButtonItem_localIvar, 0);
}

@end
