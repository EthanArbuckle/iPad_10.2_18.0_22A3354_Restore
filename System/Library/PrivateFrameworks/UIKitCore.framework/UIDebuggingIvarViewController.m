@implementation UIDebuggingIvarViewController

- (UIDebuggingIvarViewController)init
{
  UIDebuggingIvarViewController *v2;
  UIDebuggingIvarViewController *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIDebuggingIvarViewController;
  v2 = -[UITableViewController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UITableViewController tableView](v2, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kCellReuseIdentifier"));

    -[UITableViewController tableView](v3, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRowHeight:", 66.0);

  }
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[UITableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kCellReuseIdentifier"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDebuggingIvarViewController _ivarForIndexPath:](self, "_ivarForIndexPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setIvar:", v8);
  if (objc_msgSend(v8, "isObject"))
    objc_msgSend(v7, "setAccessoryType:", 1);

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[UIDebuggingIvarViewController _ivarsForInspectedObjectInClass:](self, "_ivarsForInspectedObjectInClass:", -[UIDebuggingIvarViewController _classForTableSection:](self, "_classForTableSection:", a4));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[UIDebuggingIvarViewController _classHierarchyForInspectedObject](self, "_classHierarchyForInspectedObject", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;

  -[UIDebuggingIvarViewController _classHierarchyForInspectedObject](self, "_classHierarchyForInspectedObject", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  UIDebuggingIvarViewController *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[UIDebuggingIvarViewController _ivarForIndexPath:](self, "_ivarForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isObject"))
  {
    v8 = objc_alloc_init(UIDebuggingIvarViewController);
    objc_msgSend(v7, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDebuggingIvarViewController setInspectedObject:](v8, "setInspectedObject:", v9);

    -[UIViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushViewController:animated:", v8, 1);

  }
  else
  {
    objc_msgSend(v11, "deselectRowAtIndexPath:animated:", v6, 0);
  }

}

- (id)_ivarForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[UIDebuggingIvarViewController _ivarsForInspectedObjectInClass:](self, "_ivarsForInspectedObjectInClass:", -[UIDebuggingIvarViewController _classForTableSection:](self, "_classForTableSection:", objc_msgSend(v4, "section")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (Class)_classForTableSection:(int64_t)a3
{
  void *v4;
  NSString *v5;
  void *v6;

  -[UIDebuggingIvarViewController _classHierarchyForInspectedObject](self, "_classHierarchyForInspectedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

- (id)_classHierarchyForInspectedObject
{
  void *v3;
  void *v4;
  uint64_t i;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingIvarViewController inspectedObject](self, "inspectedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = objc_opt_class(); ; i = objc_msgSend(v6, "superclass"))
  {
    v6 = (void *)i;

    if (!v6)
      break;
    NSStringFromClass((Class)v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);
  }
  return v3;
}

- (id)_ivarsForInspectedObjectInClass:(Class)a3
{
  void *v5;
  Ivar *v6;
  unint64_t i;
  Ivar v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int outCount;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v6 = class_copyIvarList(a3, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      v8 = v6[i];
      -[UIDebuggingIvarViewController inspectedObject](self, "inspectedObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIDebuggingIvar ivarWithObjcIvar:forObject:](UIDebuggingIvar, "ivarWithObjcIvar:forObject:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v10);
    }
  }
  free(v6);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)prepareForDisplayAsTopLevelDebuggingViewController
{
  -[UIDebuggingIvarViewController setInspectedObject:](self, "setInspectedObject:", UIApp);
}

- (void)setInspectedObject:(id)a3
{
  NSObject **p_inspectedObject;
  id v5;
  objc_class *v6;
  void *v7;
  id v8;

  p_inspectedObject = &self->_inspectedObject;
  v5 = a3;
  objc_storeWeak((id *)p_inspectedObject, v5);
  v6 = (objc_class *)objc_opt_class();

  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController setTitle:](self, "setTitle:", v7);

  -[UITableViewController tableView](self, "tableView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (NSObject)inspectedObject
{
  return objc_loadWeakRetained((id *)&self->_inspectedObject);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inspectedObject);
}

@end
