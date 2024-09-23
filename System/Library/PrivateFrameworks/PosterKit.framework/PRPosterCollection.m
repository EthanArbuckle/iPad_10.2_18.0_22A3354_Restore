@implementation PRPosterCollection

- (PRPosterCollection)initWithSelectedPoster:(id)a3 posters:(id)a4 associatedPosterMap:(id)a5 attributeProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PRPosterCollection *v18;
  PRPosterCollection *v19;
  uint64_t v20;
  NSOrderedSet *orderedPosters;
  uint64_t v22;
  NSMapTable *associatedPosterMap;
  uint64_t v24;
  id attributeProvider;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v11;
  if (v15)
  {
    NSClassFromString(CFSTR("PRPosterConfiguration"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRPosterCollection initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:].cold.5();
LABEL_24:
      objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18B69E33CLL);
    }
  }

  v16 = v12;
  NSClassFromString(CFSTR("NSOrderedSet"));
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterCollection initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:].cold.1();
    goto LABEL_24;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSOrderedSetClass]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterCollection initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:].cold.1();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B69E3A0);
  }

  v17 = v13;
  NSClassFromString(CFSTR("NSMapTable"));
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterCollection initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:].cold.2();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B69E404);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSMapTableClass]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterCollection initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:].cold.2();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B69E468);
  }

  v31.receiver = self;
  v31.super_class = (Class)PRPosterCollection;
  v18 = -[PRPosterCollection init](&v31, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_selectedPoster, a3);
    v20 = objc_msgSend(v16, "copy");
    orderedPosters = v19->_orderedPosters;
    v19->_orderedPosters = (NSOrderedSet *)v20;

    v22 = objc_msgSend(v17, "copy");
    associatedPosterMap = v19->_associatedPosterMap;
    v19->_associatedPosterMap = (NSMapTable *)v22;

    v24 = objc_msgSend(v14, "copy");
    attributeProvider = v19->_attributeProvider;
    v19->_attributeProvider = (id)v24;

  }
  return v19;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterCollection selectedPoster](self, "selectedPoster");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("selectedPoster"), 1);

  -[PRPosterCollection orderedPosterUUIDs](self, "orderedPosterUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v3;
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v7, CFSTR("posterUUIDs"), 1);

  v21 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PRPosterCollection orderedPosterUUIDs](self, "orderedPosterUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[PRPosterCollection associatedPosterForUUID:](self, "associatedPosterForUUID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "serverIdentity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "posterUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  objc_msgSend(v20, "appendDictionarySection:withName:skipIfEmpty:", v21, CFSTR("parentToAssocPoster"), 1);
  objc_msgSend(v20, "build");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isEqualToCollection:(id)a3
{
  id v4;
  PRPosterCollectionDiffInspector *v5;
  BOOL v6;

  v4 = a3;
  v5 = -[PRPosterCollectionDiffInspector initWithCollection:newCollection:]([PRPosterCollectionDiffInspector alloc], "initWithCollection:newCollection:", self, v4);

  v6 = -[PRPosterCollectionDiffInspector isEqual](v5, "isEqual");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterCollection *v4;
  PRPosterCollection *v5;
  BOOL v6;

  v4 = (PRPosterCollection *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[PRPosterCollection isEqualToCollection:](self, "isEqualToCollection:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (id)posterWithUUID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSOrderedSet *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_orderedPosters;
  v5 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "_path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "serverIdentity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "posterUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
        {
          v14 = v9;
          goto LABEL_13;
        }
        -[PRPosterCollection associatedPosterForPoster:](self, "associatedPosterForPoster:", v9);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "serverIdentity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "posterUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqual:", v4);

        if ((v18 & 1) != 0)
          goto LABEL_13;

      }
      v6 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v14 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_13:

  return v14;
}

- (id)associatedPosterForUUID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSOrderedSet *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_orderedPosters;
  v5 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(obj);
      -[PRPosterCollection associatedPosterForPoster:](self, "associatedPosterForPoster:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serverIdentity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "posterUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", v4);

      if ((v13 & 1) != 0)
        break;

      if (v6 == ++v8)
      {
        v6 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  return v9;
}

- (NSSet)associatedPosters
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PRPosterCollection orderedPosters](self, "orderedPosters", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[PRPosterCollection associatedPosterForPoster:](self, "associatedPosterForPoster:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (BOOL)isPosterConfigurationAnAssociatedPoster:(id)a3 parentPoster:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  id *v22;
  id obj;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "_path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "posterUUID");
  v8 = objc_claimAutoreleasedReturnValue();

  -[PRPosterCollection associatedPosterUUIDs](self, "associatedPosterUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v8;
  LODWORD(v7) = objc_msgSend(v9, "containsObject:", v8);

  if ((_DWORD)v7)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[NSMapTable keyEnumerator](self->_associatedPosterMap, "keyEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v22 = a4;
      v12 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_associatedPosterMap, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_path");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "serverIdentity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "posterUUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqual:", v24);

          if (v19)
          {
            if (v22)
            {
              -[PRPosterCollection posterWithUUID:](self, "posterWithUUID:", v14);
              *v22 = (id)objc_claimAutoreleasedReturnValue();
            }

            v20 = 1;
            goto LABEL_15;
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v11)
          continue;
        break;
      }
    }
    v20 = 0;
LABEL_15:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)associatedHomeScreenConfigurationsMap
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterCollection orderedPosters](self, "orderedPosters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__PRPosterCollection_associatedHomeScreenConfigurationsMap__block_invoke;
  v9[3] = &unk_1E2185260;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __59__PRPosterCollection_associatedHomeScreenConfigurationsMap__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "associatedPosterForPoster:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isServerPosterPath");
  if (v5 && v6 && v9)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v5, "serverIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, v8);

  }
}

- (NSSet)posterExtensions
{
  PRPosterCollection *v2;
  NSSet *posterExtensions;
  NSSet *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSSet *v9;
  _QWORD v11[4];
  id v12;

  v2 = self;
  objc_sync_enter(v2);
  posterExtensions = v2->_posterExtensions;
  if (posterExtensions)
  {
    v4 = posterExtensions;
  }
  else
  {
    v5 = (void *)objc_opt_new();
    -[PRPosterCollection orderedPosters](v2, "orderedPosters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __38__PRPosterCollection_posterExtensions__block_invoke;
    v11[3] = &unk_1E2185288;
    v7 = v5;
    v12 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

    v8 = objc_msgSend(v7, "copy");
    v9 = v2->_posterExtensions;
    v2->_posterExtensions = (NSSet *)v8;

    v4 = v2->_posterExtensions;
  }
  objc_sync_exit(v2);

  return v4;
}

void __38__PRPosterCollection_posterExtensions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "_path");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

}

- (NSOrderedSet)orderedPosterUUIDs
{
  return (NSOrderedSet *)-[NSOrderedSet bs_map:](self->_orderedPosters, "bs_map:", &__block_literal_global_27);
}

id __40__PRPosterCollection_orderedPosterUUIDs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "_path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)associatedPosterUUIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if (-[NSMapTable count](self->_associatedPosterMap, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[NSMapTable keyEnumerator](self->_associatedPosterMap, "keyEnumerator", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
          -[NSMapTable objectForKey:](self->_associatedPosterMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_path");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "serverIdentity");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "posterUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v3, "addObject:", v12);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

  }
  return (NSSet *)v3;
}

- (id)associatedPosterForPoster:(id)a3
{
  NSMapTable *associatedPosterMap;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  associatedPosterMap = self->_associatedPosterMap;
  objc_msgSend(a3, "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "posterUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](associatedPosterMap, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)attributeForPoster:(id)a3 ofType:(id)a4
{
  id v6;
  id v7;
  PRPosterCollection *v8;
  NSMapTable *posterToAttributeMap;
  uint64_t v10;
  NSMapTable *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**attributeProvider)(id, id, void *);
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  -[PRPosterCollection orderedPosters](self, "orderedPosters");
  v8 = (PRPosterCollection *)objc_claimAutoreleasedReturnValue();
  if (!-[PRPosterCollection containsObject:](v8, "containsObject:", v6) || !self->_attributeProvider)
  {
    v14 = 0;
LABEL_16:

    goto LABEL_17;
  }

  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    posterToAttributeMap = v8->_posterToAttributeMap;
    if (!posterToAttributeMap)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v8->_posterToAttributeMap;
      v8->_posterToAttributeMap = (NSMapTable *)v10;

      posterToAttributeMap = v8->_posterToAttributeMap;
    }
    -[NSMapTable objectForKey:](posterToAttributeMap, "objectForKey:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = (void *)objc_opt_new();
      -[NSMapTable setObject:forKey:](v8->_posterToAttributeMap, "setObject:forKey:", v12, v6);
    }
    objc_msgSend(v12, "objectForKey:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "objectForKey:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      attributeProvider = (void (**)(id, id, void *))self->_attributeProvider;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      attributeProvider[2](attributeProvider, v6, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "objectForKey:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v7);

    }
    objc_sync_exit(v8);
    goto LABEL_16;
  }
  v14 = 0;
LABEL_17:

  return v14;
}

- (id)attributesForPoster:(id)a3 ofTypes:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id attributeProvider;
  PRPosterCollection *v12;
  NSMapTable *posterToAttributeMap;
  uint64_t v14;
  NSMapTable *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  void *v38;
  void *v39;
  PRPosterCollection *obj;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v41 = a4;
  v8 = v7;
  NSClassFromString(CFSTR("PRPosterConfiguration"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterCollection attributesForPoster:ofTypes:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B69F904);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterCollection attributesForPoster:ofTypes:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B69F968);
  }
  v42 = v8;

  -[PRPosterCollection orderedPosters](self, "orderedPosters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (objc_msgSend(v9, "containsObject:", v8))
  {
    attributeProvider = self->_attributeProvider;

    if (attributeProvider)
    {
      v12 = self;
      objc_sync_enter(v12);
      obj = v12;
      posterToAttributeMap = v12->_posterToAttributeMap;
      if (!posterToAttributeMap)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v12->_posterToAttributeMap;
        v12->_posterToAttributeMap = (NSMapTable *)v14;

        posterToAttributeMap = v12->_posterToAttributeMap;
      }
      -[NSMapTable objectForKey:](posterToAttributeMap, "objectForKey:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
        v16 = (void *)objc_opt_new();
      v17 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v16, "allKeys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqualToSet:", v41))
      {
        v20 = (void *)objc_msgSend(v16, "copy");

        if (v20)
        {
          v21 = v20;
LABEL_35:

          objc_sync_exit(obj);
          goto LABEL_36;
        }
      }
      else
      {

      }
      v22 = (void *)objc_opt_new();
      v23 = (void *)objc_opt_new();
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v24 = v41;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v48 != v26)
              objc_enumerationMutation(v24);
            v28 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(v16, "objectForKey:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
              objc_msgSend(v22, "setObject:forKey:", v29, v28);
            else
              objc_msgSend(v23, "addObject:", v28);

          }
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v25);
      }

      (*((void (**)(void))self->_attributeProvider + 2))();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      objc_msgSend(v30, "keyEnumerator");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v44;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v44 != v33)
              objc_enumerationMutation(v31);
            v35 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
            objc_msgSend(v30, "objectForKey:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v36, v35);
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v36, v35);
            }

          }
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        }
        while (v32);
      }

      v21 = (id)objc_msgSend(v30, "copy");
      goto LABEL_35;
    }
  }
  else
  {

  }
  v21 = 0;
LABEL_36:

  return v21;
}

- (id)configuredPropertiesForPoster:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v9;

  v4 = a3;
  NSClassFromString(CFSTR("PRPosterConfiguration"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterCollection configuredPropertiesForPoster:].cold.1();
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B69FAC8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterCollection configuredPropertiesForPoster:].cold.1();
    goto LABEL_12;
  }

  -[PRPosterCollection orderedPosters](self, "orderedPosters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    objc_msgSend(v4, "loadConfiguredPropertiesWithError:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)chargerIdentifierRelationships
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  -[PRPosterCollection orderedPosters](self, "orderedPosters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__PRPosterCollection_chargerIdentifierRelationships__block_invoke;
  v9[3] = &unk_1E2185260;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __52__PRPosterCollection_chargerIdentifierRelationships__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v5;
  objc_msgSend(v5, "posterUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v3;
  objc_msgSend(*(id *)(a1 + 32), "attributeForPoster:ofType:", v3, CFSTR("PRPosterRoleAttributeTypeAmbientChargerConfiguration"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "associatedChargerIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v14 = (void *)objc_opt_new();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v14, v13);
        }
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v21, "provider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "descriptorIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ %@ %@"), v7, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v18);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

}

- (id)fallbackSelectedForSortedConfigurations:(id)a3 reverse:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  _QWORD v29[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  v35 = 0;
  if (v4)
    v8 = 2;
  else
    v8 = 0;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __70__PRPosterCollection_fallbackSelectedForSortedConfigurations_reverse___block_invoke;
    v29[3] = &unk_1E21852D0;
    v29[4] = self;
    v29[5] = &v30;
    objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", v8, v29);
    if (!v31[5])
    {
      PRLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[PRPosterCollection fallbackSelectedForSortedConfigurations:reverse:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);

      if (v4)
        objc_msgSend(v7, "lastObject");
      else
        objc_msgSend(v7, "firstObject");
      v17 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v31[5];
      v31[5] = v17;

    }
    v26 = (id)v31[5];
  }
  else
  {
    PRLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[PRPosterCollection fallbackSelectedForSortedConfigurations:reverse:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

    v26 = 0;
  }
  _Block_object_dispose(&v30, 8);

  return v26;
}

void __70__PRPosterCollection_fallbackSelectedForSortedConfigurations_reverse___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "configuredPropertiesForPoster:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "focusConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    PRLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_18B634000, v10, OS_LOG_TYPE_DEFAULT, "Choosing selected configuration: choosing MRU unpaired configuration %{public}@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (PRPosterConfiguration)selectedPoster
{
  return (PRPosterConfiguration *)objc_getProperty(self, a2, 48, 1);
}

- (NSOrderedSet)orderedPosters
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedPosters, 0);
  objc_storeStrong((id *)&self->_selectedPoster, 0);
  objc_storeStrong((id *)&self->_posterToAttributeMap, 0);
  objc_storeStrong((id *)&self->_associatedPosterMap, 0);
  objc_storeStrong((id *)&self->_posterExtensions, 0);
  objc_storeStrong(&self->_configuredPropertiesProvider, 0);
  objc_storeStrong(&self->_attributeProvider, 0);
}

- (void)initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSelectedPoster:posters:associatedPosterMap:attributeProvider:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)attributesForPoster:(const char *)a1 ofTypes:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)attributesForPoster:(const char *)a1 ofTypes:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)configuredPropertiesForPoster:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)fallbackSelectedForSortedConfigurations:(uint64_t)a3 reverse:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18B634000, a1, a3, "Choosing selected configuration: sortedConfigurations is empty, no selected poster could be found.", a5, a6, a7, a8, 0);
}

- (void)fallbackSelectedForSortedConfigurations:(uint64_t)a3 reverse:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18B634000, a1, a3, "Choosing selected configuration: no unpaired configurations found, choosing MRU.", a5, a6, a7, a8, 0);
}

@end
