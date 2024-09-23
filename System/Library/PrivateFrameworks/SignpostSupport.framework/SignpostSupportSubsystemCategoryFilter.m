@implementation SignpostSupportSubsystemCategoryFilter

- (BOOL)matchesSubsystem:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a4;
  v7 = a3;
  -[SignpostSupportSubsystemCategoryFilter subsystemsDict](self, "subsystemsDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
      v11 = 1;
    else
      v11 = objc_msgSend(v9, "containsObject:", v6);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSMutableDictionary)subsystemsDict
{
  return self->_subsystemsDict;
}

- (void)addSubsystem:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  SignpostSupportSubsystemCategoryFilterEntry *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[SignpostSupportSubsystemCategoryFilterEntry initWithSubsystem:category:]([SignpostSupportSubsystemCategoryFilterEntry alloc], "initWithSubsystem:category:", v7, v6);

  -[SignpostSupportSubsystemCategoryFilter addEntry:](self, "addEntry:", v8);
}

- (void)addEntry:(id)a3
{
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *subsystemsDict;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[SignpostSupportSubsystemCategoryFilter subsystemsDict](self, "subsystemsDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    subsystemsDict = self->_subsystemsDict;
    self->_subsystemsDict = v5;

  }
  v7 = v17;
  if (v17)
  {
    objc_msgSend(v17, "category");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[SignpostSupportSubsystemCategoryFilter subsystemsDict](self, "subsystemsDict");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "subsystem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v12)
      {
LABEL_11:

        v7 = v17;
        goto LABEL_12;
      }
      v11 = v11;
      v13 = v11;
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostSupportSubsystemCategoryFilter subsystemsDict](self, "subsystemsDict");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "subsystem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

      }
      objc_msgSend(v17, "category");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[SignpostSupportSubsystemCategoryFilter subsystemsDict](self, "subsystemsDict");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "subsystem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v16);
    }

    goto LABEL_11;
  }
LABEL_12:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsystemsDict, 0);
}

- (BOOL)passesSubsystem:(id)a3 category:(id)a4
{
  return 0;
}

- (BOOL)_wantsNotSubsystem
{
  return 0;
}

- (void)_fixupToSupportFramerateCalculation
{
  if (!-[SignpostSupportSubsystemCategoryFilter passesSubsystem:category:](self, "passesSubsystem:category:", CFSTR("com.apple.SkyLight"), CFSTR("performance_instrumentation")))-[SignpostSupportSubsystemCategoryFilter _forceInclusionOfSubsystem:category:](self, "_forceInclusionOfSubsystem:category:", CFSTR("com.apple.SkyLight"), CFSTR("performance_instrumentation"));
}

- (unint64_t)_compoundPredicateType
{
  return 1;
}

- (id)_subpredicatesForSubsystems
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id obj;
  uint64_t v25;
  SignpostSupportSubsystemCategoryFilter *v26;
  id v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = self;
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[SignpostSupportSubsystemCategoryFilter subsystemsDict](self, "subsystemsDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v28 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v28)
  {
    v25 = *(_QWORD *)v35;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v5);
        -[SignpostSupportSubsystemCategoryFilter subsystemsDict](v26, "subsystemsDict");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("subsystem == %@"), v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 == v10)
        {
          v22 = v9;
        }
        else
        {
          v29 = v9;
          v11 = v8;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v13 = v11;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v31;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v31 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("category == %@"), *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v17));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addObject:", v18);

                ++v17;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
            }
            while (v15);
          }

          objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v12);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)MEMORY[0x1E0CB3528];
          v9 = v29;
          v38[0] = v29;
          v38[1] = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "andPredicateWithSubpredicates:", v21);
          v22 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v27, "addObject:", v22);

        ++v5;
      }
      while (v5 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v28);
  }

  return v27;
}

- (id)_predicateEquivalent
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SignpostSupportSubsystemCategoryFilter _subpredicatesForSubsystems](self, "_subpredicatesForSubsystems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SignpostSupportSubsystemCategoryFilter _wantsNotSubsystem](self, "_wantsNotSubsystem"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = v3;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", -[SignpostSupportSubsystemCategoryFilter _compoundPredicateType](self, "_compoundPredicateType"), v4);

  return v11;
}

- (id)_initWithEntries:(id)a3
{
  id v4;
  void *v5;
  SignpostSupportSubsystemCategoryFilter *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SignpostSupportSubsystemCategoryFilter *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v18.receiver = self;
    v18.super_class = (Class)SignpostSupportSubsystemCategoryFilter;
    v6 = -[SignpostSupportSubsystemCategoryFilter init](&v18, sel_init);
    if (v6)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            -[SignpostSupportSubsystemCategoryFilter addEntry:](v6, "addEntry:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++), (_QWORD)v14);
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        }
        while (v9);
      }

    }
    self = v6;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)addFilter:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "subsystemsDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SignpostSupportSubsystemCategoryFilter_addFilter___block_invoke;
  v5[3] = &unk_1E4601090;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __52__SignpostSupportSubsystemCategoryFilter_addFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "subsystemsDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 8);
    *(_QWORD *)(v8 + 8) = v7;

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "subsystemsDict");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, v17);
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "subsystemsDict");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v17);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 != v13)
  {
    v12 = v12;
    v14 = v5;
    v15 = v12;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "subsystemsDict");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

    }
    objc_msgSend(v15, "unionSet:", v14);

    goto LABEL_9;
  }
LABEL_10:

}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableDictionary *obj;
  uint64_t v20;
  SignpostSupportSubsystemCategoryFilter *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v21 = self;
  obj = self->_subsystemsDict;
  v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v22)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v7);
        objc_msgSend(v6, "appendString:", CFSTR("\n\t"));
        objc_msgSend(v6, "appendString:", v8);
        -[SignpostSupportSubsystemCategoryFilter subsystemsDict](v21, "subsystemsDict");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 == v11)
        {
          objc_msgSend(v6, "appendString:", CFSTR(" *"));
        }
        else
        {
          v12 = v10;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v24;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v24 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\t\t%@"), *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "appendString:", v17);

                ++v16;
              }
              while (v14 != v16);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v14);
          }

        }
        ++v7;
      }
      while (v7 != v22);
      v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v22);
  }

  return v6;
}

@end
