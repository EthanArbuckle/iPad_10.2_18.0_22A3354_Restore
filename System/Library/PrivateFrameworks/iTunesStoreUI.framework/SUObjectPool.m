@implementation SUObjectPool

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUObjectPool;
  -[SUObjectPool dealloc](&v3, sel_dealloc);
}

- (void)addObjects:(id)a3 forClass:(Class)a4
{
  NSMutableDictionary *poolObjects;
  id v8;
  id v9;
  id v10;

  poolObjects = self->_poolObjects;
  if (!poolObjects)
  {
    poolObjects = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    self->_poolObjects = poolObjects;
  }
  v8 = (id)-[NSMutableDictionary objectForKey:](poolObjects, "objectForKey:", a4);
  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NSMutableDictionary setObject:forKey:](self->_poolObjects, "setObject:forKey:", v9, a4);
    v8 = v9;
  }
  v10 = v8;
  objc_msgSend(v8, "addObjectsFromArray:", a3);

}

- (id)addObjectsOfClass:(Class)a3 count:(int64_t)a4 forClass:(Class)a5
{
  id v9;
  id v10;

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!a3)
    a3 = a5;
  if (a4 >= 1)
  {
    do
    {
      v10 = objc_alloc_init(a3);
      objc_msgSend(v9, "addObject:", v10);

      --a4;
    }
    while (a4);
  }
  -[SUObjectPool addObjects:forClass:](self, "addObjects:forClass:", v9, a5);
  return v9;
}

- (id)copyPoppedObjectForClass:(Class)a3
{
  void *v5;
  id v6;
  NSMutableArray *vendedObjects;

  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_poolObjects, "objectForKey:");
  if (objc_msgSend(v5, "count"))
  {
    v6 = (id)objc_msgSend(v5, "lastObject");
    objc_msgSend(v5, "removeLastObject");
  }
  else
  {
    v6 = objc_alloc_init(a3);
  }
  vendedObjects = self->_vendedObjects;
  if (!vendedObjects)
  {
    vendedObjects = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_vendedObjects = vendedObjects;
  }
  -[NSMutableArray addObject:](vendedObjects, "addObject:", v6);
  return v6;
}

- (NSArray)vendedObjects
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_vendedObjects, "copy");
}

@end
