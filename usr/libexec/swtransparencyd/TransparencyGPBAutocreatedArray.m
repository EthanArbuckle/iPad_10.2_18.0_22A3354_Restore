@implementation TransparencyGPBAutocreatedArray

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBAutocreatedArray;
  -[TransparencyGPBAutocreatedArray dealloc](&v3, "dealloc");
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_array, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_array, "objectAtIndex:", a3);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  NSMutableArray *array;
  TransparencyGPBMessage *autocreator;

  array = self->_array;
  if (!array)
  {
    array = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_array = array;
  }
  -[NSMutableArray insertObject:atIndex:](array, "insertObject:atIndex:", a3, a4);
  autocreator = self->_autocreator;
  if (autocreator)
    sub_1000BEFA4(autocreator, (uint64_t)self);
}

- (void)removeObject:(id)a3
{
  -[NSMutableArray removeObject:](self->_array, "removeObject:", a3);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->_array, "removeObjectAtIndex:", a3);
}

- (void)addObject:(id)a3
{
  NSMutableArray *array;
  TransparencyGPBMessage *autocreator;

  array = self->_array;
  if (!array)
  {
    array = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_array = array;
  }
  -[NSMutableArray addObject:](array, "addObject:", a3);
  autocreator = self->_autocreator;
  if (autocreator)
    sub_1000BEFA4(autocreator, (uint64_t)self);
}

- (void)removeLastObject
{
  -[NSMutableArray removeLastObject](self->_array, "removeLastObject");
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_array, "replaceObjectAtIndex:withObject:", a3, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSMutableArray *array;

  array = self->_array;
  if (array)
    return -[NSMutableArray copyWithZone:](array, "copyWithZone:", a3);
  else
    return -[NSMutableArray init](+[NSMutableArray allocWithZone:](NSMutableArray, "allocWithZone:", a3), "init");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSMutableArray *array;

  array = self->_array;
  if (array)
    return -[NSMutableArray mutableCopyWithZone:](array, "mutableCopyWithZone:", a3);
  else
    return -[NSMutableArray init](+[NSMutableArray allocWithZone:](NSMutableArray, "allocWithZone:", a3), "init");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)-[NSMutableArray countByEnumeratingWithState:objects:count:](self->_array, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_array, "enumerateObjectsUsingBlock:", a3);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](self->_array, "enumerateObjectsWithOptions:usingBlock:", a3, a4);
}

@end
