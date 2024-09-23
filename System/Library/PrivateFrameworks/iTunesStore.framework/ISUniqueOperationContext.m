@implementation ISUniqueOperationContext

- (ISUniqueOperationContext)init
{
  ISUniqueOperationContext *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISUniqueOperationContext;
  v2 = -[ISUniqueOperationContext init](&v4, sel_init);
  if (v2)
  {
    v2->_operations = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v2->_uniqueOperations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_operations = 0;
  self->_uniqueOperations = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISUniqueOperationContext;
  -[ISUniqueOperationContext dealloc](&v3, sel_dealloc);
}

- (void)addOperation:(id)a3
{
  -[NSMutableSet addObject:](self->_operations, "addObject:", a3);
}

- (BOOL)containsOperation:(id)a3
{
  return -[NSMutableSet containsObject:](self->_operations, "containsObject:", a3);
}

- (unint64_t)countOfOperations
{
  return -[NSMutableSet count](self->_operations, "count");
}

- (void)removeOperation:(id)a3
{
  -[NSMutableSet removeObject:](self->_operations, "removeObject:", a3);
}

- (void)setUniqueOperation:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *uniqueOperations;

  uniqueOperations = self->_uniqueOperations;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](uniqueOperations, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](uniqueOperations, "removeObjectForKey:", a4);
}

- (id)uniqueOperationForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_uniqueOperations, "objectForKey:", a3);
}

@end
