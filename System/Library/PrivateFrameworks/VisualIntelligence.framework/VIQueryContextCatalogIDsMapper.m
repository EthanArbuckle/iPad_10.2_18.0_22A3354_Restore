@implementation VIQueryContextCatalogIDsMapper

- (id)updateBuilder:(id)a3 withDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.query_context_key.catalog_ids"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_16;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.query_context_key.catalog_ids"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_14;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.query_context_key.catalog_ids"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_14:
    _VIQueryContextMapperError((uint64_t)CFSTR("VIQueryContextCatalogIDsKey"), CFSTR("NSArray<NSString *>"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          _VIQueryContextMapperError((uint64_t)CFSTR("VIQueryContextCatalogIDsKey"), CFSTR("NSArray<NSString *>"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }

  v15 = (id)objc_msgSend(v5, "setCatalogIDs:", v10, v17);
  v7 = 0;
LABEL_16:

  return v7;
}

@end
