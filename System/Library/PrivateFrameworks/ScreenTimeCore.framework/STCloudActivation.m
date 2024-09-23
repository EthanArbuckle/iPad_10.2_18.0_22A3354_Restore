@implementation STCloudActivation

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("activationPlist")))
    -[STUniquedManagedObject updateUniqueIdentifier](self, "updateUniqueIdentifier");
  v5.receiver = self;
  v5.super_class = (Class)STCloudActivation;
  -[STCloudActivation didChangeValueForKey:](&v5, sel_didChangeValueForKey_, v4);

}

- (id)computeUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  -[STCloudActivation activationPlist](self, "activationPlist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    -[STCloudActivation activationPlist](self, "activationPlist");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v4, "propertyListWithData:options:format:error:", v5, 0, 0, &v26);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v26;

    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueIdentifier"));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[STLog cloudkit](STLog, "cloudkit");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[STCloudActivation computeUniqueIdentifier].cold.2((uint64_t)v7, v18, v19, v20, v21, v22, v23, v24);

      -[STCloudActivation identifier](self, "identifier");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v8;

    return v25;
  }
  else
  {
    +[STLog cloudkit](STLog, "cloudkit");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[STCloudActivation computeUniqueIdentifier].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    -[STCloudActivation identifier](self, "identifier");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (BOOL)reconcileWithManagedObjectContext:(id)a3 andUpdateLosers:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  NSObject *v36;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint8_t buf;
  _BYTE v46[15];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[STCloudActivation fetchRequest](STCloudActivation, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  objc_msgSend(v7, "execute:", &v59);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v59;
  v10 = v9;
  if (v9)
  {
    if (a5)
    {
      v11 = 0;
      *a5 = objc_retainAutorelease(v9);
      goto LABEL_38;
    }
LABEL_35:
    v11 = 0;
    goto LABEL_38;
  }
  if (!objc_msgSend(v8, "count"))
    goto LABEL_35;
  v39 = v7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v38 = v8;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v56 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (objc_msgSend(v18, "activationType", v38))
        {
          objc_msgSend(v18, "uniqueIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "valueForKey:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            v20 = (void *)objc_opt_new();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v19);
          }
          objc_msgSend(v20, "addObject:", v18);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v15);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v21 = v12;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v52;
    v40 = *(_QWORD *)v52;
    v41 = v21;
    do
    {
      v26 = 0;
      v42 = v23;
      do
      {
        if (*(_QWORD *)v52 != v25)
          objc_enumerationMutation(v21);
        objc_msgSend(v21, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v26), v38);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v27, "count") >= 2)
        {
          v44 = v27;
          objc_msgSend(v27, "sortedArrayUsingComparator:", &__block_literal_global_3);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v28, "mutableCopy");

          objc_msgSend(v29, "firstObject");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "removeObject:");
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v30 = v29;
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v48;
            do
            {
              for (j = 0; j != v32; ++j)
              {
                if (*(_QWORD *)v48 != v33)
                  objc_enumerationMutation(v30);
                v35 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
                +[STLog cloudkit](STLog, "cloudkit");
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                  +[STCloudActivation reconcileWithManagedObjectContext:andUpdateLosers:error:].cold.1(&buf, v46, v36);

                objc_msgSend(v6, "addObject:", v35);
              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
            }
            while (v32);
          }

          v24 = 1;
          v25 = v40;
          v21 = v41;
          v23 = v42;
          v27 = v44;
        }

        ++v26;
      }
      while (v26 != v23);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v23);
  }
  else
  {
    v24 = 0;
  }

  v11 = v24 & 1;
  v10 = 0;
  v7 = v39;
  v8 = v38;
LABEL_38:

  return v11;
}

uint64_t __77__STCloudActivation_reconcileWithManagedObjectContext_andUpdateLosers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "sortKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  v4 = a3;
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v5)
  {
    -[STCloudActivation setActivationPlist:](self, "setActivationPlist:", v5);
  }
  else
  {
    +[STLog cloudkit](STLog, "cloudkit");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[STCloudActivation updateWithDictionaryRepresentation:].cold.1((uint64_t)v4, (uint64_t)v6, v7);

  }
  return v5 != 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;

  -[STCloudActivation activationPlist](self, "activationPlist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    -[STCloudActivation activationPlist](self, "activationPlist");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v4, "propertyListWithData:options:format:error:", v5, 0, 0, &v24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v24;

    if (v6)
    {
      v8 = v6;
    }
    else
    {
      +[STLog cloudkit](STLog, "cloudkit");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[STCloudActivation dictionaryRepresentation].cold.2((uint64_t)v7, v16, v17, v18, v19, v20, v21, v22);

      v8 = (id)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    +[STLog cloudkit](STLog, "cloudkit");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[STCloudActivation dictionaryRepresentation].cold.1(v7, v9, v10, v11, v12, v13, v14, v15);
    v8 = (id)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

- (void)computeUniqueIdentifier
{
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, a2, a3, "Cannot computeUniqueIdentifier, unable to deserialize activation plist: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)reconcileWithManagedObjectContext:(uint8_t *)buf andUpdateLosers:(_BYTE *)a2 error:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1D22E7000, log, OS_LOG_TYPE_DEBUG, "Reconciling away an activation", buf, 2u);
}

- (void)updateWithDictionaryRepresentation:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_fault_impl(&dword_1D22E7000, log, OS_LOG_TYPE_FAULT, "Unable to update cloud activation with dictionary: %{public}@\n%{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)dictionaryRepresentation
{
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, a2, a3, "Cannot deserialize activation plist: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
