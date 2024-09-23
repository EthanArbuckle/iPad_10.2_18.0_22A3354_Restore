@implementation PGPublicEventTemporalClusterComparator

- (double)distanceFromPublicEvent:(id)a3 toTemporalEvents:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  double v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v10)
    {
      v11 = v10;
      v22 = v7;
      v12 = 0;
      v13 = *(_QWORD *)v24;
      v14 = 1.0;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v16, "category"))
          {
            objc_msgSend(v16, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "length"))
            {
              -[PGPublicEventTemporalClusterComparator _distanceFromString:toString:](self, "_distanceFromString:toString:", v8, v17);
              if (v18 < v14)
              {
                v19 = v18;
                v20 = v16;

                v12 = v20;
                v14 = v19;
              }
            }

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      }
      while (v11);

      if (!v12)
      {
        v7 = v22;
        goto LABEL_22;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478339;
        v28 = v12;
        v29 = 2113;
        v30 = v6;
        v31 = 2048;
        v32 = v14;
        _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Found matching temporal cluster %{private}@ for public event: %{private}@, distance: %.3lf", buf, 0x20u);
      }
      v9 = v12;
      v7 = v22;
    }
    else
    {
      v14 = 1.0;
    }

  }
  else
  {
    v14 = 1.0;
  }
LABEL_22:

  return v14;
}

- (double)_distanceFromString:(id)a3 toString:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  double v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  v9 = objc_msgSend(v7, "length");
  v10 = 1.0;
  if (v8)
  {
    v11 = v9;
    if (v9)
    {
      objc_msgSend(v6, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "lowercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) != 0)
      {
        v7 = v13;
        v6 = v12;
LABEL_6:
        v10 = 0.0;
        goto LABEL_7;
      }
      -[PGPublicEventTemporalClusterComparator _removeDateFromString:](self, "_removeDateFromString:", v12);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      -[PGPublicEventTemporalClusterComparator _removeDateFromString:](self, "_removeDateFromString:", v13);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
        goto LABEL_6;
      if (v8 != v11)
      {
        if (v8 >= v11)
          v15 = v7;
        else
          v15 = v6;
        if (v8 >= v11)
          v16 = v6;
        else
          v16 = v7;
        if (objc_msgSend(v16, "containsString:", v15))
          v10 = 0.0;
        else
          v10 = 1.0;
      }
    }
  }
LABEL_7:

  return v10;
}

- (id)_removeDateFromString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v36 = 0;
    objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 8, &v36);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v36;
    v6 = v5;
    if (v4)
    {
      v26 = v5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v4;
      objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v33 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            if (objc_msgSend(v13, "resultType") == 8)
              objc_msgSend(v7, "addObject:", v13);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v10);
      }
      objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_31414);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v3;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v25 = v14;
      objc_msgSend(v14, "reverseObjectEnumerator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v29;
        do
        {
          v20 = 0;
          v21 = v15;
          do
          {
            if (*(_QWORD *)v29 != v19)
              objc_enumerationMutation(v16);
            v22 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v20), "range");
            objc_msgSend(v21, "stringByReplacingCharactersInRange:withString:", v22, v23, &stru_1E8436F28);
            v15 = (id)objc_claimAutoreleasedReturnValue();

            ++v20;
            v21 = v15;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        }
        while (v18);
      }

      v6 = v26;
      v4 = v27;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v6;
        _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to initialize DataDetector, error: %@", buf, 0xCu);
      }
      v15 = v3;
    }

  }
  else
  {
    v15 = v3;
  }

  return v15;
}

uint64_t __64__PGPublicEventTemporalClusterComparator__removeDateFromString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "range");
  v6 = objc_msgSend(v4, "range");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

@end
