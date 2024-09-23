@implementation _UISEPerTypeEdgesFailGestureFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeTypeSubfeatures, 0);
}

- (_UISEPerTypeEdgesFailGestureFeature)initWithEdgeTypeSubfeatures:(id)a3
{
  _UISEPerTypeEdgesFailGestureFeature *v4;
  _UISEPerTypeEdgesFailGestureFeature *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)_UISEPerTypeEdgesFailGestureFeature;
  v4 = -[_UISEPerTypeEdgesFailGestureFeature init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_edgeTypeSubfeatures, a3);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = a3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setDelegate:", v5);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (unint64_t)touchedEdges
{
  NSDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
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
  v3 = self->_edgeTypeSubfeatures;
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        -[NSDictionary objectForKeyedSubscript:](self->_edgeTypeSubfeatures, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 |= objc_msgSend(v9, "touchedEdges");

      }
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)featureDidChangeState:(id)a3
{
  if (objc_msgSend(a3, "state") == 2)
    -[_UISEGestureFeature _setState:](self, "_setState:", 2);
}

- (id)debugDictionary
{
  id v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_edgeTypeSubfeatures;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_edgeTypeSubfeatures, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "debugDictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v9);

      }
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v15.receiver = self;
  v15.super_class = (Class)_UISEPerTypeEdgesFailGestureFeature;
  -[_UISEGestureFeature debugDictionary](&v15, sel_debugDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v3, CFSTR("edgeTypeSubfeatures"));
  return v13;
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  NSDictionary *edgeTypeSubfeatures;
  void *v6;
  id v7;

  if (!-[_UISEGestureFeature state](self, "state"))
  {
    edgeTypeSubfeatures = self->_edgeTypeSubfeatures;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->var3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](edgeTypeSubfeatures, "objectForKeyedSubscript:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "incorporateSample:", a3);

  }
}

- (NSDictionary)edgeTypeSubfeatures
{
  return self->_edgeTypeSubfeatures;
}

@end
