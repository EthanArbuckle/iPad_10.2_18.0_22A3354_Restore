@implementation HTOrderedNSDict

- (HTOrderedNSDict)init
{
  HTOrderedNSDict *v2;
  NSMutableArray *v3;
  NSMutableArray *values;
  NSMutableArray *v5;
  NSMutableArray *keys;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HTOrderedNSDict;
  v2 = -[HTOrderedNSDict init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableArray);
    values = v2->_values;
    v2->_values = v3;

    v5 = objc_opt_new(NSMutableArray);
    keys = v2->_keys;
    v2->_keys = v5;

  }
  return v2;
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_keys, "count");
}

- (id)keyEnumerator
{
  return -[NSMutableArray objectEnumerator](self->_keys, "objectEnumerator");
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = -[NSMutableArray indexOfObject:](self->_keys, "indexOfObject:", a3);
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", v4));
  return v5;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = -[NSMutableArray indexOfObject:](self->_keys, "indexOfObject:", v6);
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray addObject:](self->_keys, "addObject:", v6);
    -[NSMutableArray addObject:](self->_values, "addObject:", v8);
  }
  else
  {
    -[NSMutableArray setObject:atIndexedSubscript:](self->_values, "setObject:atIndexedSubscript:", v8, v7);
  }

}

- (void)print:(id)a3
{
  NSMutableArray *keys;
  id v5;
  id v6;

  keys = self->_keys;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", -[NSMutableArray indexOfObject:](keys, "indexOfObject:", v5)));
  NSLog(CFSTR(" key = %@, value  = %@"), v5, v6);

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  id v5;

  v4 = -[NSMutableArray indexOfObject:](self->_keys, "indexOfObject:", a3);
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[NSMutableArray removeObjectAtIndex:](self->_values, "removeObjectAtIndex:", v4);
    -[NSMutableArray removeObjectAtIndex:](self->_keys, "removeObjectAtIndex:", v5);
  }
}

- (HTOrderedNSDict)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  HTOrderedNSDict *v8;
  NSMutableArray *v9;
  NSMutableArray *values;
  NSMutableArray *v11;
  NSMutableArray *keys;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  id v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HTOrderedNSDict;
  v8 = -[HTOrderedNSDict init](&v19, "init");
  if (v8)
  {
    v9 = objc_opt_new(NSMutableArray);
    values = v8->_values;
    v8->_values = v9;

    v11 = objc_opt_new(NSMutableArray);
    keys = v8->_keys;
    v8->_keys = v11;

  }
  for (; a5; --a5)
  {
    v13 = (id)*a4;
    v14 = (id)*a3;
    if (v13)
      v15 = v14 == 0;
    else
      v15 = 1;
    if (v15)
      objc_exception_throw(objc_retainAutorelease(NSInvalidArgumentException));
    v16 = v14;
    v17 = -[NSMutableArray indexOfObject:](v8->_keys, "indexOfObject:", v13);
    if (v17 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray addObject:](v8->_keys, "addObject:", v13);
      -[NSMutableArray addObject:](v8->_values, "addObject:", v16);
    }
    else
    {
      -[NSMutableArray setObject:atIndexedSubscript:](v8->_values, "setObject:atIndexedSubscript:", v16, v17);
    }

    ++a3;
    ++a4;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HTOrderedNSDict initWithObjects:forKeys:](+[HTOrderedNSDict allocWithZone:](HTOrderedNSDict, "allocWithZone:", a3), "initWithObjects:forKeys:", self->_values, self->_keys);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[HTOrderedNSDict copyWithZone:](self, "copyWithZone:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end
