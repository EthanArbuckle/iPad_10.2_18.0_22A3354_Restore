@implementation RTRuntime

+ (id)subclassesOfClass:(Class)a3 images:(id)a4 includeParentClass:(BOOL)a5
{
  void *v6;
  void *v7;
  uint64_t *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;

  v6 = (void *)MEMORY[0x1E0CB3880];
  if (a5)
  {
    v15 = MEMORY[0x1E0C809B0];
    v7 = __57__RTRuntime_subclassesOfClass_images_includeParentClass___block_invoke;
    v8 = &v15;
  }
  else
  {
    v14 = MEMORY[0x1E0C809B0];
    v7 = __57__RTRuntime_subclassesOfClass_images_includeParentClass___block_invoke_2;
    v8 = &v14;
  }
  v8[1] = 3221225472;
  v8[2] = (uint64_t)v7;
  v8[3] = (uint64_t)&__block_descriptor_40_e25_B24__0_8__NSDictionary_16lu32l8;
  v8[4] = (uint64_t)a3;
  v9 = a4;
  objc_msgSend(v6, "predicateWithBlock:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "classesFromImages:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "filteredArrayUsingPredicate:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __57__RTRuntime_subclassesOfClass_images_includeParentClass___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSubclassOfClass:", *(_QWORD *)(a1 + 32));
}

BOOL __57__RTRuntime_subclassesOfClass_images_includeParentClass___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  if (objc_msgSend(v3, "isSubclassOfClass:", *(_QWORD *)(a1 + 32)))
    v4 = *(_QWORD *)(a1 + 32) != (_QWORD)v3;
  else
    v4 = 0;

  return v4;
}

+ (id)directSubclassesOfClass:(Class)a3 images:(id)a4 includeParentClass:(BOOL)a5
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  objc_class *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "subclassesOfClass:images:includeParentClass:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(objc_class **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (class_getSuperclass(v13) == a3)
          objc_msgSend(v7, "addObject:", v13, (_QWORD)v15);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)classesFromImages:(id)a3
{
  id v3;
  void *v4;
  const char **v5;
  unint64_t i;
  void *v7;
  void *v8;
  const char **v9;
  unint64_t j;
  NSString *v11;
  NSString *v12;
  Class v13;
  void *v14;
  unsigned int v16;
  unsigned int outCount;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  outCount = 0;
  v5 = objc_copyImageNames(&outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5[i]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v3, "containsObject:", v8))
      {
        v16 = 0;
        v9 = objc_copyClassNamesForImage(v5[i], &v16);
        if (v16)
        {
          for (j = 0; j < v16; ++j)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9[j]);
            v11 = (NSString *)objc_claimAutoreleasedReturnValue();
            v12 = v11;
            if (v11)
            {
              v13 = NSClassFromString(v11);
              if (v13)
                objc_msgSend(v4, "addObject:", v13);
            }

          }
        }
        free(v9);
      }

    }
  }
  free(v5);
  objc_msgSend(v4, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)objToString:(id)a3 filterProperties:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  objc_property_t *v9;
  unint64_t i;
  const char *Name;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  unsigned int outCount;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v8 = (objc_class *)objc_opt_class();
  v9 = class_copyPropertyList(v8, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      Name = property_getName(v9[i]);
      if (Name)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "valueForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v12);

      }
    }
  }
  free(v9);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v7, "allKeys", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        if ((objc_msgSend(v6, "containsObject:", v21) & 1) == 0)
        {
          objc_msgSend(v14, "addObject:", v21);
          objc_msgSend(v7, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v22);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v18);
  }

  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)objToDictionary:(id)a3 filterProperties:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  objc_property_t *v9;
  unint64_t i;
  const char *Name;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  unsigned int outCount;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v8 = (objc_class *)objc_opt_class();
  v9 = class_copyPropertyList(v8, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      Name = property_getName(v9[i]);
      if (Name)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "valueForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v12);

      }
    }
  }
  free(v9);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v7, "allKeys", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
        if ((objc_msgSend(v6, "containsObject:", v21) & 1) == 0)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, v21);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v18);
  }

  return v14;
}

+ (id)routineImageNames
{
  return &unk_1E932C430;
}

+ (id)routineClassStrings
{
  const char **v3;
  void *v4;
  unint64_t i;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char **v10;
  unint64_t j;
  void *v12;
  void *v13;
  unsigned int v15;
  unsigned int outCount;

  outCount = 0;
  v3 = objc_copyImageNames(&outCount);
  v4 = (void *)objc_opt_new();
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3[i]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "routineImageNames");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v7);

      if (v9)
      {
        v15 = 0;
        v10 = objc_copyClassNamesForImage(v3[i], &v15);
        if (v15)
        {
          for (j = 0; j < v15; ++j)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10[j]);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              objc_msgSend(v4, "addObject:", v12);

          }
        }
        free(v10);
      }

    }
  }
  free(v3);
  objc_msgSend(v4, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)routineSubclassesOfClass:(Class)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "routineImageNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTRuntime subclassesOfClass:images:includeParentClass:](RTRuntime, "subclassesOfClass:images:includeParentClass:", a3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)routineClasses
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "routineImageNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTRuntime classesFromImages:](RTRuntime, "classesFromImages:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (double)footprint
{
  pid_t v2;
  int v3;
  double result;
  _OWORD v5[4];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  memset(v5, 0, sizeof(v5));
  v2 = getpid();
  v3 = proc_pid_rusage(v2, 4, (rusage_info_t *)v5);
  result = (double)*((unint64_t *)&v6 + 1) * 0.0009765625 * 0.0009765625;
  if (v3)
    return 0.0;
  return result;
}

@end
