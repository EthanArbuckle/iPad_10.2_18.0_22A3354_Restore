@implementation _UISEAnyGestureFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subfeatures, 0);
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_subfeatures;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
      if (-[_UISEGestureFeature state](self, "state", (_QWORD)v11))
        break;
      objc_msgSend(v10, "incorporateSample:", a3);
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (_UISEAnyGestureFeature)initWithSubfeatures:(id)a3
{
  _UISEAnyGestureFeature *v4;
  _UISEAnyGestureFeature *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)_UISEAnyGestureFeature;
  v4 = -[_UISEAnyGestureFeature init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_subfeatures, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = a3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "setDelegate:", v5, (_QWORD)v12);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (void)featureDidChangeState:(id)a3
{
  -[_UISEGestureFeature _setState:](self, "_setState:", objc_msgSend(a3, "state"));
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
  v13.super_class = (Class)_UISEAnyGestureFeature;
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
