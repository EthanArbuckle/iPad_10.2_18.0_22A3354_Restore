@implementation REGroupClassLoader

- (void)enumerateObjectsWithBlock:(id)a3
{
  id v4;
  NSOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_loaders;
  v6 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "enumerateObjectsWithBlock:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_enumerateClassesWithBlock:(id)a3
{
  id v4;
  NSOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_loaders;
  v6 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "enumerateClassesWithBlock:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_enumerateBundleConfigurations:(id)a3
{
  id v4;
  NSOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_loaders;
  v6 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "enumerateBundleConfigurations:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (REGroupClassLoader)initWithLoaders:(id)a3
{
  id v4;
  REGroupClassLoader *v5;
  uint64_t v6;
  NSOrderedSet *loaders;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REGroupClassLoader;
  v5 = -[REClassLoader init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    loaders = v5->_loaders;
    v5->_loaders = (NSOrderedSet *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSOrderedSet copyWithZone:](self->_loaders, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  REGroupClassLoader *v4;
  NSOrderedSet *loaders;
  NSOrderedSet *v6;
  NSOrderedSet *v7;
  NSOrderedSet *v8;
  char v9;

  v4 = (REGroupClassLoader *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      loaders = self->_loaders;
      v6 = v4->_loaders;
      v7 = loaders;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[NSOrderedSet isEqual:](v7, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loaders, 0);
}

@end
