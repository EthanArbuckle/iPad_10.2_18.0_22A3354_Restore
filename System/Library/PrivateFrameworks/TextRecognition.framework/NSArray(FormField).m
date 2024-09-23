@implementation NSArray(FormField)

- (id)_flattenedFields
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        v8 = &unk_1EFF19038;
        v9 = v7;
        if (objc_msgSend(v9, "conformsToProtocol:", v8, (_QWORD)v15))
          v10 = v9;
        else
          v10 = 0;

        if (v10)
        {
          CRCastAsClass<CROutputRegion>(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 && !objc_msgSend(v10, "fieldType"))
          {
            objc_msgSend(v11, "formFieldRegions");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "_flattenedFields");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addObjectsFromArray:", v13);

          }
          else
          {
            objc_msgSend(v2, "addObject:", v10);
          }

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  return v2;
}

- (id)_fieldsOfSource:()FormField
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__NSArray_FormField___fieldsOfSource___block_invoke;
  v7[3] = &__block_descriptor_40_e49_B24__0___CRFormFieldProviding__8__NSDictionary_16l;
  v7[4] = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_fieldsOfType:()FormField
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__NSArray_FormField___fieldsOfType___block_invoke;
  v7[3] = &__block_descriptor_40_e49_B24__0___CRFormFieldProviding__8__NSDictionary_16l;
  v7[4] = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_nonFieldRegions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_122_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredArrayUsingPredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
