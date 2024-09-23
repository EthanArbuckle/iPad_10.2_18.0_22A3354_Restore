@implementation _PASLowValueCardinalityMutableDictionaryEnumerator

- (BOOL)_loadNextKeyEnumerator
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v1 - 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectEnumerator");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v4;

    *(_QWORD *)(a1 + 16) -= 2;
  }
  return v1 != 0;
}

- (id)allObjects
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self)
    return 0;
  v3 = (void *)objc_opt_new();
  -[NSEnumerator nextObject](self->_keyEnumerator, "nextObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_msgSend(v3, "addObject:", v5);
      -[NSEnumerator nextObject](self->_keyEnumerator, "nextObject");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }
  for (i = self->_i; i; i = self->_i)
  {
    -[NSArray objectAtIndexedSubscript:](self->_objectsAndKeys, "objectAtIndexedSubscript:", i - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        v14 = v11;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v8);
          v11 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v13);

          objc_msgSend(v3, "addObject:", v11);
          ++v13;
          v14 = v11;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);

    }
    self->_i -= 2;

  }
  return v3;
}

- (id)nextObject
{
  _PASLowValueCardinalityMutableDictionaryEnumerator *v2;

  if (self)
  {
    v2 = self;
    -[NSEnumerator nextObject](self->_keyEnumerator, "nextObject");
    self = (_PASLowValueCardinalityMutableDictionaryEnumerator *)objc_claimAutoreleasedReturnValue();
    if (!self)
    {
      if (-[_PASLowValueCardinalityMutableDictionaryEnumerator _loadNextKeyEnumerator]((uint64_t)v2))
      {
        -[NSEnumerator nextObject](v2->_keyEnumerator, "nextObject");
        self = (_PASLowValueCardinalityMutableDictionaryEnumerator *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        self = 0;
      }
    }
  }
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyEnumerator, 0);
  objc_storeStrong((id *)&self->_objectsAndKeys, 0);
}

@end
