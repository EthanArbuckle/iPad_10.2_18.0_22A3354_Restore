@implementation VUIMediaEntitiesToGroupsValueTransformer

- (id)transformedValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  VUIMediaEntitiesToGroupsValueTransformer *v22;
  id obj;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = self;
  -[VUIMediaEntitiesToGroupsValueTransformer identifierKeyPath](self, "identifierKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v34;
    v9 = *MEMORY[0x1E0C99778];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v11, "valueForKeyPath:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v12, "conformsToProtocol:", &unk_1F0275E98) & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v9, CFSTR("The group identifier for groups must be an NSObject which implements NSCopying"));
        v13 = v12;
        objc_msgSend(v5, "objectForKey:", v13);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v5, "setObject:forKey:", v14, v13);
        }
        objc_msgSend(v14, "addObject:", v11);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v7);
  }

  -[VUIMediaEntitiesToGroupsValueTransformer sortIndexKeyPath](v22, "sortIndexKeyPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__27;
  v31 = __Block_byref_object_dispose__27;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __61__VUIMediaEntitiesToGroupsValueTransformer_transformedValue___block_invoke;
  v24[3] = &unk_1E9FA24A0;
  v16 = v15;
  v25 = v16;
  v26 = &v27;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v24);
  -[VUIMediaEntitiesToGroupsValueTransformer groupsSortComparator](v22, "groupsSortComparator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    goto LABEL_14;
  if (!-[VUIMediaEntitiesToGroupsValueTransformer performDefaultSort](v22, "performDefaultSort"))
    goto LABEL_22;
  objc_msgSend((id)v28[5], "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = &__block_literal_global_19_3;
      goto LABEL_20;
    }

LABEL_22:
    v18 = (id)v28[5];
    goto LABEL_23;
  }
  v17 = &__block_literal_global_129;
LABEL_20:

LABEL_14:
  objc_msgSend((id)v28[5], "sortedArrayUsingComparator:", v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
  _Block_object_dispose(&v27, 8);

  return v18;
}

- (NSString)sortIndexKeyPath
{
  return self->_sortIndexKeyPath;
}

- (void)setSortIndexKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setPerformDefaultSort:(BOOL)a3
{
  self->_performDefaultSort = a3;
}

- (void)setGroupsSortComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)performDefaultSort
{
  return self->_performDefaultSort;
}

- (VUIMediaEntitiesToGroupsValueTransformer)initWithIdentifierKeyPath:(id)a3
{
  id v4;
  VUIMediaEntitiesToGroupsValueTransformer *v5;
  uint64_t v6;
  NSString *identifierKeyPath;
  objc_super v9;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("identifierKeyPath"));
  v9.receiver = self;
  v9.super_class = (Class)VUIMediaEntitiesToGroupsValueTransformer;
  v5 = -[VUIMediaEntitiesToGroupsValueTransformer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifierKeyPath = v5->_identifierKeyPath;
    v5->_identifierKeyPath = (NSString *)v6;

  }
  return v5;
}

- (NSString)identifierKeyPath
{
  return self->_identifierKeyPath;
}

- (id)groupsSortComparator
{
  return self->_groupsSortComparator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_groupsSortComparator, 0);
  objc_storeStrong((id *)&self->_sortIndexKeyPath, 0);
  objc_storeStrong((id *)&self->_identifierKeyPath, 0);
}

uint64_t __61__VUIMediaEntitiesToGroupsValueTransformer_transformedValue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC6A68], "ascendingTitleSortComparator");
  v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = ((uint64_t (**)(_QWORD, void *, void *))v7)[2](v7, v5, v6);

  return v8;
}

void __61__VUIMediaEntitiesToGroupsValueTransformer_transformedValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  VUIMediaEntityGroup *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a2;
  v6 = -[VUIMediaEntityGroup initWithIdentifier:]([VUIMediaEntityGroup alloc], "initWithIdentifier:", v5);

  -[VUIMediaEntityGroup setMediaEntities:](v6, "setMediaEntities:", v8);
  if (*(_QWORD *)(a1 + 32))
  {
    +[VUIMediaLibraryUtilities sortIndexesForMediaEntities:sortIndexPropertyKey:](VUIMediaLibraryUtilities, "sortIndexesForMediaEntities:sortIndexPropertyKey:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntityGroup setSortIndexes:](v6, "setSortIndexes:", v7);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);

}

- (VUIMediaEntitiesToGroupsValueTransformer)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

uint64_t __61__VUIMediaEntitiesToGroupsValueTransformer_transformedValue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)setIdentifierKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
