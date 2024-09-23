@implementation VUIDebugMetricsImpressionViewController

- (VUIDebugMetricsImpressionViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIDebugMetricsImpressionViewController;
  return -[VUIDebugMetricsImpressionViewController initWithStyle:](&v3, sel_initWithStyle_, 1);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIDebugMetricsImpressionViewController;
  -[VUIDebugMetricsImpressionViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[VUIDebugMetricsImpressionViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("cell"));

  -[VUIDebugMetricsImpressionViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("VUIDebugImpressionTableViewCellReuseIdentifier"));

  -[VUIDebugMetricsImpressionViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("detail"));

}

- (void)setArray:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  VUIDebugMetricsImpression *v12;
  VUIDebugMetricsImpression *v13;
  NSArray *array;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSArray *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = [VUIDebugMetricsImpression alloc];
          v13 = -[VUIDebugMetricsImpression initWithDictionary:](v12, "initWithDictionary:", v11, (_QWORD)v16);
          -[NSArray addObject:](v5, "addObject:", v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  array = self->_array;
  self->_array = v5;

  -[VUIDebugMetricsImpressionViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reloadData");

}

- (void)setObject:(id)a3
{
  void *v4;
  id v5;
  NSArray *v6;
  NSArray *array;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v8, 1);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  array = self->_array;
  self->_array = v6;

}

- (id)object
{
  void *v3;

  if (-[NSArray count](self->_array, "count") != 1)
    goto LABEL_4;
  -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v3 = 0;
  }
  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_array, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedOtherKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;

  v6 = a3;
  v7 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "row"))
  {
    objc_msgSend(v8, "orderedOtherKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "row") - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("cell"), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v14);

      objc_msgSend(v12, "setAccessoryType:", 1);
    }
    else
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("detail"), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v10);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setText:", v26);

      objc_msgSend(v12, "detailTextLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setText:", v28);

    }
    objc_msgSend(v12, "layoutMargins");
    v30 = v29;
    objc_msgSend(v12, "layoutMargins");
    objc_msgSend(v12, "setLayoutMargins:", v30, 20.0);
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("VUIDebugImpressionTableViewCellReuseIdentifier"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setName:", v15);

    objc_msgSend(v8, "type");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setType:", v16);

    objc_msgSend(v8, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIdStr:", v17);

    objc_msgSend(v8, "idType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIdType:", v18);

    objc_msgSend(v8, "impressionId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImpressionId:", v19);

    objc_msgSend(v8, "impressionIndex");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImpressionIndex:", v20);

    objc_msgSend(v8, "parentId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_msgSend(v12, "setImpressionParentId:", CFSTR("none"));
      objc_msgSend(v12, "setImpressionParentName:", &stru_1E9FF3598);
      goto LABEL_10;
    }
    objc_msgSend(v8, "parentId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "integerValue");

    -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", v23 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parentId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImpressionParentId:", v24);

    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImpressionParentName:", v11);
  }

LABEL_10:
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VUIDebugMetricsArrayViewController *v11;
  void *v12;
  id v13;

  v13 = a4;
  v5 = objc_msgSend(v13, "row");
  v6 = v13;
  if (v5)
  {
    -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", objc_msgSend(v13, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orderedOtherKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v13, "row") - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(VUIDebugMetricsArrayViewController);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VUIDebugMetricsArrayViewController setArray:](v11, "setArray:", v10);
      -[VUIDebugMetricsImpressionViewController navigationController](self, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pushViewController:animated:", v11, 1);

    }
    v6 = v13;
  }

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4;
  double result;

  v4 = objc_msgSend(a4, "row", a3);
  result = 44.0;
  if (!v4)
    return 176.0;
  return result;
}

- (NSArray)array
{
  return self->_array;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
