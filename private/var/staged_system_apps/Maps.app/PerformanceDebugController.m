@implementation PerformanceDebugController

- (PerformanceDebugController)init
{
  PerformanceDebugController *v2;
  void *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *tests;
  PerformanceDebugController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PerformanceDebugController;
  v2 = -[AuxiliaryDebugViewController init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.Maps")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("testDefinitions"), CFSTR("plist")));

    v5 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithContentsOfFile:", v4);
    tests = v2->_tests;
    v2->_tests = v5;

    v7 = v2;
  }

  return v2;
}

+ (id)navigationDestinationTitle
{
  return CFSTR("Performance Tests");
}

- (id)title
{
  return CFSTR("Performance Tests");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)-[NSMutableArray count](self->_tests, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableArray *tests;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PerformanceCell")));
  if (!v7)
    v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("PerformanceCell"));
  objc_msgSend(v7, "setAccessoryView:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
  objc_msgSend(v8, "setText:", 0);

  tests = self->_tests;
  v10 = objc_msgSend(v6, "row");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](tests, "objectAtIndexedSubscript:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("testName")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v13, "setText:", v12);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  NSMutableArray *tests;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[PerformanceDebugController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  tests = self->_tests;
  v8 = objc_msgSend(v6, "row");

  v12 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](tests, "objectAtIndexedSubscript:", v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("testName")));
  objc_msgSend(v9, "application:runTest:options:", v10, v11, v12);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.Maps"), a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathForResource:ofType:", CFSTR("testDefinitions"), CFSTR("plist")));

  return v5;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tests, 0);
}

@end
