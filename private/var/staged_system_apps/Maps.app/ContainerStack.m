@implementation ContainerStack

- (ContainerStack)init
{
  ContainerStack *v2;
  uint64_t v3;
  NSMutableArray *array;
  uint64_t v5;
  NSMapTable *content;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ContainerStack;
  v2 = -[ContainerStack init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    array = v2->_array;
    v2->_array = (NSMutableArray *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    content = v2->_content;
    v2->_content = (NSMapTable *)v5;

  }
  return v2;
}

- (unint64_t)indexOfContainee:(id)a3
{
  return (unint64_t)-[NSMutableArray indexOfObject:](self->_array, "indexOfObject:", a3);
}

- (id)containeeStateAtIndex:(unint64_t)a3
{
  void *v5;
  NSMapTable *content;
  void *v7;

  if (-[NSMapTable count](self->_content, "count")
    && (char *)-[NSMapTable count](self->_content, "count") - 1 >= (char *)a3)
  {
    content = self->_content;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](content, "objectForKey:", v7));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)containeeStateForContainee:(id)a3
{
  return -[NSMapTable objectForKey:](self->_content, "objectForKey:", a3);
}

- (void)pushContaineeState:(id)a3
{
  NSMapTable *content;
  id v5;
  void *v6;
  NSMutableArray *array;
  id v8;

  content = self->_content;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewController"));
  -[NSMapTable setObject:forKey:](content, "setObject:forKey:", v5, v6);

  array = self->_array;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewController"));

  -[NSMutableArray addObject:](array, "addObject:", v8);
}

- (void)removeContaineeState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMapTable *content;
  void *v8;
  NSMutableArray *array;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardPresentationController"));
  objc_msgSend(v6, "wantsLayout:", 1);

  content = self->_content;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewController"));
  -[NSMapTable removeObjectForKey:](content, "removeObjectForKey:", v8);

  array = self->_array;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewController"));

  -[NSMutableArray removeObject:](array, "removeObject:", v10);
}

- (void)replaceLastOne:(id)a3
{
  id v4;
  NSMapTable *content;
  void *v6;
  NSMutableArray *array;
  void *v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ContainerStack lastState](self, "lastState"));
  content = self->_content;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewController"));
  -[NSMapTable removeObjectForKey:](content, "removeObjectForKey:", v6);

  array = self->_array;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewController"));
  -[NSMutableArray removeObject:](array, "removeObject:", v8);

  -[ContainerStack pushContaineeState:](self, "pushContaineeState:", v4);
}

- (id)popAll
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = -[NSMutableArray copy](self->_array, "copy");
  -[NSMutableArray removeObjectsInArray:](self->_array, "removeObjectsInArray:", v3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        -[NSMapTable removeObjectForKey:](self->_content, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), (_QWORD)v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)popFromIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (a3 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t)-[NSMutableArray count](self->_array, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray subarrayWithRange:](self->_array, "subarrayWithRange:", a3 + 1, (char *)-[NSMutableArray count](self->_array, "count") - a3 - 1));
    -[NSMutableArray removeObjectsInArray:](self->_array, "removeObjectsInArray:", v5);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[NSMapTable removeObjectForKey:](self->_content, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), (_QWORD)v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  return v6;
}

- (id)allObjects
{
  return -[NSMutableArray copy](self->_array, "copy");
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_array, "count");
}

- (id)lastState
{
  NSMapTable *content;
  void *v3;
  void *v4;

  content = self->_content;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_array, "lastObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](content, "objectForKey:", v3));

  return v4;
}

- (id)description
{
  return -[NSMutableArray description](self->_array, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_array, 0);
}

@end
