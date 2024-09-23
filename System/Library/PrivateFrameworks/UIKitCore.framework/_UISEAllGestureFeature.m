@implementation _UISEAllGestureFeature

- (_UISEAllGestureFeature)initWithSubfeatures:(id)a3
{
  _UISEAllGestureFeature *v4;
  _UISEAllGestureFeature *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableIndexSet *unrecognizedIndexes;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)_UISEAllGestureFeature;
  v4 = -[_UISEAllGestureFeature init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_subfeatures, a3);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = a3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10++), "setDelegate:", v5, (_QWORD)v14);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v8);
    }

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v6, "count"));
    unrecognizedIndexes = v5->_unrecognizedIndexes;
    v5->_unrecognizedIndexes = (NSMutableIndexSet *)v11;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subfeatures, 0);
  objc_storeStrong((id *)&self->_unrecognizedIndexes, 0);
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  unint64_t var0;
  BOOL v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  var0 = a3->var0;
  if (a3->var0)
    v6 = var0 == 2;
  else
    v6 = 1;
  if (v6)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = self->_subfeatures;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
LABEL_8:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        if (-[_UISEGestureFeature state](self, "state", (_QWORD)v18))
          break;
        objc_msgSend(v12, "incorporateSample:", a3);
        if (v9 == ++v11)
        {
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v9)
            goto LABEL_8;
          break;
        }
      }
    }

  }
  else if (var0 == 1 && !-[_UISEGestureFeature state](self, "state"))
  {
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v14 = -[NSMutableIndexSet firstIndex](self->_unrecognizedIndexes, "firstIndex");
      if (v14 == 0x7FFFFFFFFFFFFFFFLL || v14 == v13)
        break;
      v16 = v14;
      -[NSArray objectAtIndexedSubscript:](self->_subfeatures, "objectAtIndexedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "incorporateSample:", a3);

      v13 = v16;
    }
    while (!-[_UISEGestureFeature state](self, "state"));
  }
}

- (void)featureDidChangeState:(id)a3
{
  uint64_t v5;
  _UISEAllGestureFeature *v6;
  uint64_t v7;
  NSUInteger v8;

  if (!-[_UISEGestureFeature state](self, "state"))
  {
    v5 = objc_msgSend(a3, "state");
    if (v5 == 1)
    {
      v8 = -[NSArray indexOfObject:](self->_subfeatures, "indexOfObject:", a3);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        return;
      -[NSMutableIndexSet removeIndex:](self->_unrecognizedIndexes, "removeIndex:", v8);
      if (-[NSMutableIndexSet count](self->_unrecognizedIndexes, "count"))
        return;
      v6 = self;
      v7 = 1;
    }
    else
    {
      if (v5 != 2)
        return;
      v6 = self;
      v7 = 2;
    }
    -[_UISEGestureFeature _setState:](v6, "_setState:", v7);
  }
}

- (id)debugDictionary
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_subfeatures;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "debugDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v13.receiver = self;
  v13.super_class = (Class)_UISEAllGestureFeature;
  -[_UISEGestureFeature debugDictionary](&v13, sel_debugDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v3, CFSTR("subfeatures"));
  return v11;
}

- (NSArray)subfeatures
{
  return self->_subfeatures;
}

@end
