@implementation PLObjectSnapshot

- (PLObjectSnapshot)init
{

  return 0;
}

- (void)dealloc
{
  __CFDictionary *indexMaps;
  objc_super v4;

  indexMaps = self->_indexMaps;
  if (indexMaps)
    CFRelease(indexMaps);
  v4.receiver = self;
  v4.super_class = (Class)PLObjectSnapshot;
  -[PLObjectSnapshot dealloc](&v4, sel_dealloc);
}

- (PLObjectSnapshot)initWithManagedObject:(id)a3 properties:(id)a4 toOneRelationships:(id)a5 indexMaps:(__CFDictionary *)a6 useCommitedValues:(BOOL)a7
{
  _BOOL4 v7;
  id v13;
  id v14;
  id v15;
  PLObjectSnapshot *v16;
  PLObjectSnapshot *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSKnownKeysDictionary *snapshotValues;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  __CFString *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  void *v42;
  __CFDictionary *v44;
  id v45;
  void *v46;
  id obj;
  void *v48;
  PLObjectSnapshot *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v7 = a7;
  v62 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v59.receiver = self;
  v59.super_class = (Class)PLObjectSnapshot;
  v16 = -[PLObjectSnapshot init](&v59, sel_init);
  v17 = v16;
  if (v16)
  {
    v46 = v15;
    objc_storeStrong((id *)&v16->_managedObject, a3);
    objc_msgSend(v13, "managedObjectContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLChangeNotificationCenter allManagedObjectKeysStrategyWithContext:](PLChangeNotificationCenter, "allManagedObjectKeysStrategyWithContext:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v50 = (void *)v19;
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97B70]), "initWithSearchStrategy:", v19);
    snapshotValues = v17->_snapshotValues;
    v17->_snapshotValues = (NSKnownKeysDictionary *)v20;

    v44 = a6;
    v49 = v17;
    if (v7)
    {
      objc_msgSend(v13, "committedValuesForKeys:", v14);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = 0;
    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v45 = v14;
    obj = v14;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v56 != v24)
            objc_enumerationMutation(obj);
          v26 = (__CFString *)*(id *)(*((_QWORD *)&v55 + 1) + 8 * i);
          v27 = v13;
          objc_msgSend(v13, "entity");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "name");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLManagedAsset entityName](PLManagedAsset, "entityName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v29, "isEqualToString:", v30);

          v32 = v26;
          if (v31)
          {
            v33 = CFSTR("orderedCloudComments");
            if ((-[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("cloudComments")) & 1) != 0
              || (v33 = CFSTR("orderedLikeComments"),
                  v32 = v26,
                  -[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("likeComments"))))
            {

              v32 = (__CFString *)v33;
            }
          }
          if (v7)
          {
            objc_msgSend(v48, "objectForKey:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v27;
          }
          else
          {
            v13 = v27;
            objc_msgSend(v27, "valueForKey:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v35 = (void *)objc_msgSend(v34, "copy");

          if (!v35)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[NSKnownKeysDictionary setValue:atIndex:](v49->_snapshotValues, "setValue:atIndex:", v35, objc_msgSend(v50, "fastIndexForKnownKey:", v26));

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v23);
    }

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v36 = v46;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    v17 = v49;
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v52 != v39)
            objc_enumerationMutation(v36);
          v41 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
          if (v7)
            objc_msgSend(v48, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
          else
            objc_msgSend(v13, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v42)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[NSKnownKeysDictionary setValue:atIndex:](v49->_snapshotValues, "setValue:atIndex:", v42, objc_msgSend(v50, "fastIndexForKnownKey:", v41));

        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v38);
    }

    if (v44)
      v49->_indexMaps = (__CFDictionary *)CFRetain(v44);

    v14 = v45;
    v15 = v46;
  }

  return v17;
}

- (id)snapshotValueForProperty:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PLObjectSnapshot _snapshotValueForProperty:](self, "_snapshotValueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
    v5 = 0;
  else
    v5 = v3;
  v6 = v5;

  return v6;
}

- (BOOL)hasSnapshotValueForProperty:(id)a3
{
  void *v3;
  BOOL v4;

  -[PLObjectSnapshot _snapshotValueForProperty:](self, "_snapshotValueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)indexMapStateForDerivedObject:(id)a3
{
  const __CFDictionary *indexMaps;

  indexMaps = self->_indexMaps;
  if (indexMaps)
  {
    CFDictionaryGetValue(indexMaps, a3);
    indexMaps = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return indexMaps;
}

- (id)filteredIndexesForFilter:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PLObjectSnapshot indexMapStateForDerivedObject:](self, "indexMapStateForDerivedObject:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFDictionary *indexMaps;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  -[NSKnownKeysDictionary allKeys](self->_snapshotValues, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37A0];
  v6 = objc_opt_class();
  -[PLManagedObject entity](self->_managedObject, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectClassName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p> class: %@, keys: {%@}"), v6, self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  indexMaps = self->_indexMaps;
  if (indexMaps)
    CFDictionaryApplyFunction(indexMaps, (CFDictionaryApplierFunction)myIndexMapDescriptionApplier, v10);

  objc_autoreleasePoolPop(v3);
  return v10;
}

- (id)_snapshotValueForProperty:(id)a3
{
  NSKnownKeysDictionary *snapshotValues;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  snapshotValues = self->_snapshotValues;
  v5 = a3;
  -[NSKnownKeysDictionary mapping](snapshotValues, "mapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fastIndexForKnownKey:", v5);

  -[NSKnownKeysDictionary valueAtIndex:](self->_snapshotValues, "valueAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_allSnapshotValuesDescription
{
  void *v3;
  NSKnownKeysDictionary *snapshotValues;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  snapshotValues = self->_snapshotValues;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PLObjectSnapshot__allSnapshotValuesDescription__block_invoke;
  v8[3] = &unk_1E3668EA8;
  v9 = v3;
  v5 = v3;
  -[NSKnownKeysDictionary enumerateKeysAndObjectsUsingBlock:](snapshotValues, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setAssetsSnapshot:(id)a3
{
  NSKnownKeysDictionary *snapshotValues;
  id v5;
  uint64_t v6;
  NSKnownKeysDictionary *v7;
  void *v8;
  id v9;

  if (a3)
  {
    snapshotValues = self->_snapshotValues;
    v5 = a3;
    -[NSKnownKeysDictionary mapping](snapshotValues, "mapping");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "fastIndexForKnownKey:", CFSTR("assets"));
    v7 = self->_snapshotValues;
    v8 = (void *)objc_msgSend(v5, "copy");

    -[NSKnownKeysDictionary setValue:atIndex:](v7, "setValue:atIndex:", v8, v6);
  }
}

- (PLManagedObject)managedObject
{
  return self->_managedObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotValues, 0);
  objc_storeStrong((id *)&self->_managedObject, 0);
}

void __49__PLObjectSnapshot__allSnapshotValuesDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "pl_shortDescription");
  else
    objc_msgSend(v5, "description");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\": {%@}"), v6, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v8);
}

+ (id)snapshotForManagedObject:(id)a3 changeNotificationCenter:(id)a4 useCommitedValues:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  const void *v35;
  void *v37;
  id v38;
  _BOOL4 v39;
  void *context;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v5 = a5;
  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isFault") & 1) == 0)
  {
    objc_msgSend(v9, "_orderedRelationshipsOfInterestForObject:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_attributesOfInterestForObject:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_toOneRelationshipsOfInterestForObject:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "count");
    v15 = objc_msgSend(v12, "count") + v14;
    if (!(v15 + objc_msgSend(v13, "count")))
    {
      v10 = 0;
LABEL_42:

      goto LABEL_43;
    }
    context = (void *)MEMORY[0x19AEC1554]();
    v41 = v13;
    v39 = v5;
    v38 = a1;
    if (v5)
    {
      objc_msgSend(v11, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v18 = v11;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v47 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
            if ((objc_msgSend(v8, "hasFaultForRelationshipNamed:", v23) & 1) == 0)
              objc_msgSend(v16, "addObject:", v23);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        }
        while (v20);
      }

      v37 = v11;
      if (v41)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v24 = v41;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v43 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
            if ((objc_msgSend(v8, "hasFaultForRelationshipNamed:", v29) & 1) == 0)
              objc_msgSend(v17, "addObject:", v29);
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        }
        while (v26);
      }

      v30 = objc_msgSend(v16, "count");
      v31 = objc_msgSend(v12, "count") + v30;
      if (!(v31 + objc_msgSend(v17, "count")))
      {
        v10 = 0;
        v11 = v37;
LABEL_41:
        v13 = v41;

        objc_autoreleasePoolPop(context);
        goto LABEL_42;
      }
      v11 = v37;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v16)
      objc_msgSend(v32, "addObjectsFromArray:", v16);
    if (v12)
    {
      objc_msgSend(v12, "allObjects");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObjectsFromArray:", v34);

    }
    v35 = (const void *)objc_msgSend(v38, "_createIndexMapsSnapshotForManagedObject:changeNotificationCenter:", v8, v9);
    v10 = (void *)objc_msgSend(objc_alloc((Class)v38), "initWithManagedObject:properties:toOneRelationships:indexMaps:useCommitedValues:", v8, v33, v17, v35, v39);
    if (v35)
      CFRelease(v35);

    goto LABEL_41;
  }
  v10 = 0;
LABEL_43:

  return v10;
}

+ (__CFDictionary)_createIndexMapsSnapshotForManagedObject:(id)a3 changeNotificationCenter:(id)a4
{
  id v5;
  id v6;
  __CFDictionary *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  v6 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__PLObjectSnapshot__createIndexMapsSnapshotForManagedObject_changeNotificationCenter___block_invoke;
  v9[3] = &unk_1E3668E80;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateIndexMappingCachesForObject:withBlock:", v5, v9);
  v7 = (__CFDictionary *)v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __86__PLObjectSnapshot__createIndexMapsSnapshotForManagedObject_changeNotificationCenter___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id key;

  key = a2;
  objc_msgSend(key, "cachedIndexMapState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryCreateMutable(0, 10, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v4 = (void *)objc_msgSend(v3, "copyWithZone:", 0);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), key, v4);

  }
}

@end
