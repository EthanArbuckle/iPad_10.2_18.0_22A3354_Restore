@implementation NSPersistentHistoryChange(PhotoLibraryServices)

- (id)_pl_prettyDescriptionWithIndent:()PhotoLibraryServices
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t i;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  uint64_t v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "changedObjectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pl_shortURI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "changeType") == 1)
  {
    objc_msgSend(a1, "updatedProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PLDescriptionForUpdateProperties(v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(a1, "changeType") != 2)
    {
      v5 = &stru_1E36789C0;
      goto LABEL_17;
    }
    objc_msgSend(a1, "tombstone");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v6;
    if (v6)
    {
      v25 = v3;
      objc_msgSend(v6, "allKeys");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendString:](v5, "appendString:", CFSTR(" {"));
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      obj = v8;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v28;
        v12 = &stru_1E36789C0;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            v14 = v5;
            if (*(_QWORD *)v28 != v11)
              objc_enumerationMutation(obj);
            v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(v4, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v15;
            v5 = v14;
            -[__CFString appendFormat:](v14, "appendFormat:", CFSTR("%@%@: %@"), v12, v24, v16);

            v12 = CFSTR(", ");
          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          v12 = CFSTR(", ");
        }
        while (v10);
      }

      -[__CFString appendString:](v5, "appendString:", CFSTR("}"));
      v3 = v25;
    }
    else
    {
      v5 = &stru_1E36789C0;
    }

  }
LABEL_17:
  v17 = (void *)MEMORY[0x1E0CB3940];
  PLIndentToString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(a1, "changeID");
  v20 = objc_msgSend(a1, "changeType");
  v21 = CFSTR("insert");
  if (v20 == 1)
    v21 = CFSTR("update");
  if (v20 == 2)
    v21 = CFSTR("delete");
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@Change %08lld: %@ %@%@\n"), v18, v19, v21, v3, v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
