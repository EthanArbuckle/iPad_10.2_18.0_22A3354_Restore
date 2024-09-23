@implementation ServiceURLsDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Service URLs");
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ServiceURLsDebugController tableView](self, "tableView", *(_QWORD *)&a3.var0, a3.var1));
  objc_msgSend(v3, "reloadData");

}

- (ServiceURLsDebugController)init
{
  ServiceURLsDebugController *v2;
  uint64_t v3;
  NSArray *serviceURLs;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  ServiceURLsDebugController *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];

  v18.receiver = self;
  v18.super_class = (Class)ServiceURLsDebugController;
  v2 = -[AuxiliaryDebugViewController init](&v18, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[ServiceURLList defaultServiceURLLists](ServiceURLList, "defaultServiceURLLists"));
    serviceURLs = v2->_serviceURLs;
    v2->_serviceURLs = (NSArray *)v3;

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v2->_serviceURLs;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), "defaultsKey", (_QWORD)v14);
          _GEOConfigAddDelegateListenerForKey(v10, v11, &_dispatch_main_q, v2);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v7);
    }

    v12 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForAllKeys(self, a2);
  v3.receiver = self;
  v3.super_class = (Class)ServiceURLsDebugController;
  -[MapsDebugValuesViewController dealloc](&v3, "dealloc");
}

- (id)title
{
  return CFSTR("Service URLs");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_serviceURLs, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  char *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_serviceURLs, "objectAtIndexedSubscript:", a4));
  v5 = (char *)objc_msgSend(v4, "count") + 2;

  return (int64_t)v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_serviceURLs, "objectAtIndexedSubscript:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceName"));

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return &stru_1011EB268;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t ValueWithSourceString;
  void *v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  unint64_t v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ServiceURLCell")));
  if (!v7)
    v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("ServiceURLCell"));
  objc_msgSend(v7, "setAccessoryView:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
  objc_msgSend(v8, "setText:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_serviceURLs, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));
  ValueWithSourceString = GEOConfigGetValueWithSourceString(objc_msgSend(v9, "defaultsKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(ValueWithSourceString);
  if (!objc_msgSend(v6, "row"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
    objc_msgSend(v18, "setText:", CFSTR("Default"));

    v19 = 3;
    v20 = v7;
LABEL_23:
    objc_msgSend(v20, "setAccessoryType:", v19);
    goto LABEL_26;
  }
  v12 = (char *)objc_msgSend(v6, "row") - 1;
  if (v12 >= objc_msgSend(v9, "count"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
    objc_msgSend(v21, "setText:", CFSTR("Custom"));

    v22 = 0;
    if (objc_msgSend(v9, "count"))
    {
      v23 = 0;
      do
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLAtIndex:", v23));
        v25 = v24;
        if (v11)
          v26 = objc_msgSend(v24, "isEqualToString:", v11);
        else
          v26 = 0;
        v22 &= v26 ^ 1;

        ++v23;
      }
      while (v23 < (unint64_t)objc_msgSend(v9, "count"));
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
    v28 = v27;
    if (v22)
      v29 = v11;
    else
      v29 = 0;
    if (v22)
      v30 = 3;
    else
      v30 = 0;
    objc_msgSend(v27, "setText:", v29);

    v20 = v7;
    v19 = v30;
    goto LABEL_23;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nameAtIndex:", (char *)objc_msgSend(v6, "row") - 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v14, "setText:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLAtIndex:", (char *)objc_msgSend(v6, "row") - 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
  objc_msgSend(v16, "setText:", v15);

  if (v11)
  {
    if (objc_msgSend(v15, "isEqualToString:", v11))
      v17 = 3;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v7, "setAccessoryType:", v17);

LABEL_26:
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  char *v7;
  CustomServiceURLDebugController *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  CustomServiceURLDebugController *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v26, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_serviceURLs, "objectAtIndexedSubscript:", objc_msgSend(v26, "section")));
  if (objc_msgSend(v26, "row"))
  {
    v7 = (char *)objc_msgSend(v26, "row") - 1;
    if (v7 >= objc_msgSend(v6, "count"))
    {
      v19 = [CustomServiceURLDebugController alloc];
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceURLsDebugController tableView](self, "tableView"));
      v8 = -[CustomServiceURLDebugController initWithStyle:](v19, "initWithStyle:", objc_msgSend(v20, "style"));

      v21 = objc_msgSend(v6, "defaultsKey");
      -[CustomServiceURLDebugController setDefaultsKey:](v8, "setDefaultsKey:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultCustomURLString"));
      -[CustomServiceURLDebugController setDefaultURLString:](v8, "setDefaultURLString:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callback"));
      -[CustomServiceURLDebugController setCallback:](v8, "setCallback:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceURLsDebugController navigationController](self, "navigationController"));
      objc_msgSend(v25, "pushViewController:animated:", v8, 1);

    }
    else
    {
      v8 = (CustomServiceURLDebugController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLAtIndex:", (char *)objc_msgSend(v26, "row") - 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "infoAtIndex:", (char *)objc_msgSend(v26, "row") - 1));
      v10 = objc_msgSend(v6, "defaultsKey");
      GEOConfigSetString(v10, v11, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v12, "postNotificationName:object:userInfo:", GEOCountryConfigurationProvidersDidChangeNotification, self, 0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callback"));
      if (v13)
      {
        v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callback"));
        ((void (**)(_QWORD, CustomServiceURLDebugController *, void *))v14)[2](v14, v8, v9);

      }
    }
    goto LABEL_9;
  }
  v15 = objc_msgSend(v6, "defaultsKey");
  _GEOConfigRemoveValue(v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v17, "postNotificationName:object:userInfo:", GEOCountryConfigurationProvidersDidChangeNotification, self, 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callback"));
  if (v18)
  {
    v8 = (CustomServiceURLDebugController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callback"));
    (*(void (**)(CustomServiceURLDebugController *, _QWORD, _QWORD))&v8->_defaultsKey.key.identifier)(v8, 0, 0);
LABEL_9:

  }
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
  objc_storeStrong((id *)&self->_serviceURLs, 0);
}

@end
