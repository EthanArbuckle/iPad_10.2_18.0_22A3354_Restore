@implementation RTFixedSizeQueue

- (RTFixedSizeQueue)initWithCapacity:(unint64_t)a3
{
  void *v5;
  RTFixedSizeQueue *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
  v6 = -[RTFixedSizeQueue initWithCapacity:objects:](self, "initWithCapacity:objects:", a3, v5);

  return v6;
}

- (RTFixedSizeQueue)initWithCapacity:(unint64_t)a3 objects:(id)a4
{
  id v6;
  RTFixedSizeQueue *v7;
  RTFixedSizeQueue *v8;
  uint64_t v9;
  NSMutableArray *objects;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTFixedSizeQueue;
  v7 = -[RTFixedSizeQueue init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_capacity = a3;
    v9 = objc_msgSend(v6, "mutableCopy");
    objects = v8->_objects;
    v8->_objects = (NSMutableArray *)v9;

  }
  return v8;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_objects, "count");
}

- (id)enqueueObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    if (-[NSMutableArray count](self->_objects, "count") >= self->_capacity)
    {
      -[NSMutableArray objectAtIndex:](self->_objects, "objectAtIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_objects, "removeObjectAtIndex:", 0);
    }
    else
    {
      v5 = 0;
    }
    -[NSMutableArray addObject:](self->_objects, "addObject:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dequeueObject
{
  void *v3;

  if (-[NSMutableArray count](self->_objects, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_objects, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_objects, "removeObjectAtIndex:", 0);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)firstObject
{
  return (id)-[NSMutableArray firstObject](self->_objects, "firstObject");
}

- (id)lastObject
{
  return (id)-[NSMutableArray lastObject](self->_objects, "lastObject");
}

- (id)objectAtIndex:(int64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_objects, "objectAtIndex:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  RTFixedSizeQueue *v4;
  unint64_t v5;
  void *v6;
  RTFixedSizeQueue *v7;

  v4 = [RTFixedSizeQueue alloc];
  v5 = -[RTFixedSizeQueue capacity](self, "capacity");
  -[RTFixedSizeQueue objects](self, "objects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RTFixedSizeQueue initWithCapacity:objects:](v4, "initWithCapacity:objects:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTFixedSizeQueue)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  RTFixedSizeQueue *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("RTFixedSizeQueueCapacityKey"));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("RTFixedSizeQueueObjectsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = -[RTFixedSizeQueue initWithCapacity:objects:](self, "initWithCapacity:objects:", v5, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t capacity;
  id v5;

  capacity = self->_capacity;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", capacity, CFSTR("RTFixedSizeQueueCapacityKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_objects, CFSTR("RTFixedSizeQueueObjectsKey"));

}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
