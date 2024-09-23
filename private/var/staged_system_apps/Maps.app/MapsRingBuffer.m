@implementation MapsRingBuffer

- (MapsRingBuffer)initWithLength:(unint64_t)a3
{
  MapsRingBuffer *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSMutableArray *array;
  objc_super v10;
  uint8_t buf[4];
  MapsRingBuffer *v12;
  __int16 v13;
  unint64_t v14;

  v10.receiver = self;
  v10.super_class = (Class)MapsRingBuffer;
  v4 = -[MapsRingBuffer init](&v10, "init");
  if (v4)
  {
    v5 = sub_100B951C4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v12 = v4;
      v13 = 2048;
      v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%p] Creating ring buffer with length: %lu", buf, 0x16u);
    }

    v4->_length = a3;
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a3));
    array = v4->_array;
    v4->_array = (NSMutableArray *)v7;

  }
  return v4;
}

- (void)push:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  NSObject *v11;
  unint64_t v12;
  int v13;
  MapsRingBuffer *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;

  v4 = a3;
  v5 = -[MapsRingBuffer length](self, "length");
  v6 = sub_100B951C4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
    {
      v13 = 134218499;
      v14 = self;
      v15 = 2113;
      v16 = (unint64_t)v4;
      v17 = 2048;
      v18 = -[MapsRingBuffer position](self, "position");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%p] Pushing object %{private}@ at position %lu", (uint8_t *)&v13, 0x20u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRingBuffer array](self, "array"));
    objc_msgSend(v9, "setObject:atIndexedSubscript:", v4, -[MapsRingBuffer position](self, "position"));

    -[MapsRingBuffer setPosition:](self, "setPosition:", (-[MapsRingBuffer position](self, "position") + 1) % -[MapsRingBuffer length](self, "length"));
    v10 = sub_100B951C4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = -[MapsRingBuffer position](self, "position");
      v13 = 134218240;
      v14 = self;
      v15 = 2048;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%p] Updated position: %lu", (uint8_t *)&v13, 0x16u);
    }

    -[MapsRingBuffer setMutation:](self, "setMutation:", (char *)-[MapsRingBuffer mutation](self, "mutation") + 1);
  }
  else
  {
    if (v8)
    {
      v13 = 134218243;
      v14 = self;
      v15 = 2113;
      v16 = (unint64_t)v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%p] Length is 0; ignoring push of object %{private}@",
        (uint8_t *)&v13,
        0x16u);
    }

  }
}

- (void)removeAllObjects
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_100B951C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Removing all objects", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRingBuffer array](self, "array"));
  objc_msgSend(v5, "removeAllObjects");

  -[MapsRingBuffer setPosition:](self, "setPosition:", 0);
  -[MapsRingBuffer setMutation:](self, "setMutation:", (char *)-[MapsRingBuffer mutation](self, "mutation") + 1);
}

- (unint64_t)count
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRingBuffer array](self, "array"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (id)firstObject
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;

  if (-[MapsRingBuffer count](self, "count"))
  {
    v3 = -[MapsRingBuffer count](self, "count");
    v4 = -[MapsRingBuffer length](self, "length");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRingBuffer array](self, "array"));
    if (v3 >= v4)
      v6 = -[MapsRingBuffer position](self, "position");
    else
      v6 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)lastObject
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;

  if (-[MapsRingBuffer count](self, "count"))
  {
    v3 = -[MapsRingBuffer position](self, "position");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRingBuffer array](self, "array"));
    if (v3)
      v5 = -[MapsRingBuffer position](self, "position");
    else
      v5 = -[MapsRingBuffer count](self, "count");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v5 - 1));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)debugDescription
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRingBuffer _orderedObjects](self, "_orderedObjects"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p\norderedObjects:%@\nlength:%lu\ncount:%lu>"), v5, self, v6, -[MapsRingBuffer length](self, "length"), -[MapsRingBuffer count](self, "count")));

  return v7;
}

- (id)_orderedObjects
{
  void *v3;
  MapsRingBuffer *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self;
  v5 = -[MapsRingBuffer countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), (_QWORD)v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[MapsRingBuffer countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t result;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;

  result = -[MapsRingBuffer count](self, "count", a3, a4, a5);
  if (result)
  {
    if (a3->var0)
    {
      if (a3->var3[3] == 1 && a3->var3[0] == a3->var3[1])
        return 0;
    }
    else
    {
      v9 = -[MapsRingBuffer count](self, "count");
      if (v9 >= -[MapsRingBuffer length](self, "length"))
        v10 = -[MapsRingBuffer position](self, "position");
      else
        v10 = 0;
      a3->var3[0] = v10;
      a3->var3[1] = v10;
      v11 = -[MapsRingBuffer count](self, "count");
      if (v11 >= -[MapsRingBuffer length](self, "length"))
        v12 = -[MapsRingBuffer length](self, "length");
      else
        v12 = -[MapsRingBuffer count](self, "count");
      a3->var3[2] = v12;
      a3->var3[3] = 0;
      a3->var2 = &self->_mutation;
      a3->var0 = 1;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRingBuffer array](self, "array"));
    *a4 = objc_msgSend(v13, "objectAtIndexedSubscript:", a3->var3[0]);

    a3->var1 = a4;
    v14 = a3->var3[0] + 1;
    a3->var3[0] = v14;
    if (v14 == a3->var3[2])
    {
      a3->var3[0] = 0;
      result = 1;
      a3->var3[3] = 1;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (NSMutableArray)array
{
  return self->_array;
}

- (void)setArray:(id)a3
{
  objc_storeStrong((id *)&self->_array, a3);
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (unint64_t)mutation
{
  return self->_mutation;
}

- (void)setMutation:(unint64_t)a3
{
  self->_mutation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
