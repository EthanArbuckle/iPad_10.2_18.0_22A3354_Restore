@implementation VUIDebugMetricsArrayViewController

- (VUIDebugMetricsArrayViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIDebugMetricsArrayViewController;
  return -[VUIDebugMetricsArrayViewController initWithStyle:](&v3, sel_initWithStyle_, 1);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIDebugMetricsArrayViewController;
  -[VUIDebugMetricsArrayViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[VUIDebugMetricsArrayViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("cell"));

  -[VUIDebugMetricsArrayViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("detail"));

}

- (void)setArray:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_array, a3);
  -[VUIDebugMetricsArrayViewController generateCachedKeys](self, "generateCachedKeys");
  -[VUIDebugMetricsArrayViewController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

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

- (void)generateCachedKeys
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_opt_new();
  v3 = -[NSArray count](self->_array, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "allKeys");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, v9);

      }
    }
  }
  -[VUIDebugMetricsArrayViewController setCachedKeysOrder:](self, "setCachedKeysOrder:", v10);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  int64_t v5;

  -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSArray count](self->_array, "count");
  else
    v5 = 1;

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

  }
  else
  {
    v7 = -[NSArray count](self->_array, "count");
  }

  return v7;
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
  void *v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VUIDebugMetricsArrayViewController cachedKeysOrder](self, "cachedKeysOrder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("cell"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v15);

      objc_msgSend(v14, "setAccessoryType:", 1);
    }
    else
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("detail"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setText:", v21);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "detailTextLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setText:", v23);

    }
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("cell"), v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

    objc_msgSend(v14, "setAccessoryType:", 0);
  }

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VUIDebugMetricsArrayViewController *v11;
  void *v12;
  id v13;

  v13 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", objc_msgSend(v13, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VUIDebugMetricsArrayViewController cachedKeysOrder](self, "cachedKeysOrder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v13, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(VUIDebugMetricsArrayViewController);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VUIDebugMetricsArrayViewController setArray:](v11, "setArray:", v10);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      -[VUIDebugMetricsArrayViewController setObject:](v11, "setObject:", v10);
    }
    -[VUIDebugMetricsArrayViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v11, 1);

    goto LABEL_7;
  }
LABEL_8:

}

- (NSArray)array
{
  return self->_array;
}

- (NSDictionary)cachedKeysOrder
{
  return self->_cachedKeysOrder;
}

- (void)setCachedKeysOrder:(id)a3
{
  objc_storeStrong((id *)&self->_cachedKeysOrder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedKeysOrder, 0);
  objc_storeStrong((id *)&self->_array, 0);
}

@end
