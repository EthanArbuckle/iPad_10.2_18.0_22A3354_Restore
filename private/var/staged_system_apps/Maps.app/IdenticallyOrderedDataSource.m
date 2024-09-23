@implementation IdenticallyOrderedDataSource

- (IdenticallyOrderedDataSource)initWithObjects:(id)a3
{
  id v4;
  IdenticallyOrderedDataSource *v5;
  NSArray *v6;
  NSArray *orderedObjects;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IdenticallyOrderedDataSource;
  v5 = -[IdenticallyOrderedDataSource init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    orderedObjects = v5->_orderedObjects;
    v5->_orderedObjects = v6;

  }
  return v5;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IdenticallyOrderedDataSource orderedObjects](self, "orderedObjects", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdenticallyOrderedDataSource orderedObjects](self, "orderedObjects"));
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    v9 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdenticallyOrderedDataSource orderedObjects](self, "orderedObjects"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

  }
  return v9;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  return 0;
}

- (id)viewForHeaderInSection:(int64_t)a3 isFirstNonEmptySection:(BOOL)a4
{
  return 0;
}

- (NSArray)orderedObjects
{
  return self->_orderedObjects;
}

- (void)setOrderedObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedObjects, 0);
}

@end
