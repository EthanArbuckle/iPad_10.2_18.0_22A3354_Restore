@implementation SUSimpleTableDataSource

- (void)dealloc
{
  objc_super v3;

  self->_cellConfigurationClass = 0;
  self->_objects = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUSimpleTableDataSource;
  -[SUTableDataSource dealloc](&v3, sel_dealloc);
}

- (id)objectForIndexPath:(id)a3
{
  return -[NSArray objectAtIndex:](self->_objects, "objectAtIndex:", objc_msgSend(-[SUTableDataSource cellReuseSource](self, "cellReuseSource"), "globalRowForRowAtIndexPath:", a3));
}

- (id)cellForIndexPath:(id)a3
{
  id result;

  result = (id)objc_msgSend(-[SUTableDataSource cellReuseSource](self, "cellReuseSource", a3), "dequeueReusableCellWithIdentifier:", CFSTR("0"));
  if (!result)
    return -[SUTableCell initWithStyle:reuseIdentifier:]([SUTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("0"));
  return result;
}

- (double)cellHeightForIndexPath:(id)a3
{
  double result;

  -[objc_class rowHeightForContext:representedObject:](self->_cellConfigurationClass, "rowHeightForContext:representedObject:", 0, 0);
  return result;
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4
{
  uint64_t v6;
  id v7;

  v6 = objc_msgSend(-[SUTableDataSource cellReuseSource](self, "cellReuseSource"), "globalRowForRowAtIndexPath:", a4);
  v7 = -[SUTableDataSource cachedConfigurationForClass:index:](self, "cachedConfigurationForClass:index:", self->_cellConfigurationClass, v6);
  objc_msgSend(v7, "setRepresentedObject:", -[NSArray objectAtIndex:](self->_objects, "objectAtIndex:", v6));
  objc_msgSend(a3, "setConfiguration:", v7);
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  return -[NSArray count](self->_objects, "count", a3);
}

- (void)reloadCellContexts
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUSimpleTableDataSource;
  -[SUTableDataSource reloadCellContexts](&v5, sel_reloadCellContexts);
  v3 = -[SUVariableCellConfigurationCache cacheForClass:](self->super._configurationCache, "cacheForClass:", self->_cellConfigurationClass);
  v4 = (void *)-[objc_class copyDefaultContext](self->_cellConfigurationClass, "copyDefaultContext");
  objc_msgSend(v3, "setCellContext:", v4);

}

- (Class)cellConfigurationClass
{
  return self->_cellConfigurationClass;
}

- (void)setCellConfigurationClass:(Class)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
