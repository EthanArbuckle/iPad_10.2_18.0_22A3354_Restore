@implementation TUIErrorsViewController

- (TUIErrorsViewController)initWithErrors:(id)a3
{
  id v4;
  TUIErrorsViewController *v5;
  NSArray *v6;
  NSArray *errors;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIErrorsViewController;
  v5 = -[TUIErrorsViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    errors = v5->_errors;
    v5->_errors = v6;

  }
  return v5;
}

- (id)errorTextFromError:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("TUIErrorDomain"));

  if (v5)
  {
    v6 = TUIErrorToString((uint64_t)objc_msgSend(v3, "code"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)infoTextFromError:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("TUIErrorDomain"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TUIErrorInfoKey")));
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));
    v11 = v9;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_errors, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSArray *errors;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  errors = self->_errors;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](errors, "objectAtIndexedSubscript:", objc_msgSend(a4, "row")));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("cell")));

  if (!v9)
    v9 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("cell"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIErrorsViewController infoTextFromError:](self, "infoTextFromError:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
  objc_msgSend(v11, "setText:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIErrorsViewController errorTextFromError:](self, "errorTextFromError:", v8));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "detailTextLabel"));
  objc_msgSend(v13, "setText:", v12);

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_errors, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("TUIErrorDomain"));

  if (v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("TUIErrorLocationsKey")));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_17BB48;
    v21[3] = &unk_23DCC0;
    v12 = objc_alloc_init((Class)NSMutableString);
    v22 = v12;
    objc_msgSend(v11, "enumerateObjectsWithOptions:usingBlock:", 2, v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIErrorsViewController infoTextFromError:](self, "infoTextFromError:", v8));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v13, v12, 0));

    objc_initWeak(&location, self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_17BB74;
    v17[3] = &unk_243790;
    objc_copyWeak(&v19, &location);
    v18 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Done"), 0, v17));
    objc_msgSend(v14, "addAction:", v15);

    -[TUIErrorsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

- (NSArray)errors
{
  return self->_errors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
}

@end
