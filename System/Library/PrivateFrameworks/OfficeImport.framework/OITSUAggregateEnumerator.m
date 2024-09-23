@implementation OITSUAggregateEnumerator

- (OITSUAggregateEnumerator)initWithFirstObject:(id)a3 argumentList:(char *)a4
{
  OITSUAggregateEnumerator *v5;
  NSMutableArray *objects;
  id v7;
  char *v8;
  objc_super v10;
  char *v11;

  v10.receiver = self;
  v10.super_class = (Class)OITSUAggregateEnumerator;
  v11 = a4;
  v5 = -[OITSUAggregateEnumerator init](&v10, sel_init);
  if (v5)
  {
    objects = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5->_objects = objects;
    if (a3)
    {
      v7 = a3;
      while (1)
      {
        -[NSMutableArray addObject:](objects, "addObject:", v7);
        v8 = v11;
        v11 += 8;
        v7 = *(id *)v8;
        if (!*(_QWORD *)v8)
          break;
        objects = v5->_objects;
      }
    }
  }
  return v5;
}

- (OITSUAggregateEnumerator)initWithObjects:(id)a3
{
  uint64_t v4;

  return -[OITSUAggregateEnumerator initWithFirstObject:argumentList:](self, "initWithFirstObject:argumentList:", a3, &v4);
}

+ (id)aggregateEnumeratorWithObjects:(id)a3
{
  uint64_t v4;

  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithFirstObject:argumentList:", a3, &v4);
}

- (OITSUAggregateEnumerator)init
{
  return -[OITSUAggregateEnumerator initWithObjects:](self, "initWithObjects:", 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OITSUAggregateEnumerator;
  -[OITSUAggregateEnumerator dealloc](&v3, sel_dealloc);
}

- (void)addObject:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_objects, "addObject:");
}

- (id)nextObject
{
  void *v3;

  while (-[NSMutableArray count](self->_objects, "count"))
  {
    v3 = (void *)-[NSMutableArray objectAtIndex:](self->_objects, "objectAtIndex:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (v3 = (void *)objc_msgSend(v3, "nextObject")) == 0)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_objects, "removeObjectAtIndex:", 0);
      if (!v3)
        continue;
    }
    return v3;
  }
  return 0;
}

@end
