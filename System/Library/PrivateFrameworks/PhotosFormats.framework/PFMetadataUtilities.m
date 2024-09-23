@implementation PFMetadataUtilities

+ (BOOL)addMakerApplePropertyWithKey:(id)a3 value:(id)a4 toProperties:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x1E0CBCF70];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, v10);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v8, "isEqualToString:", &stru_1E45A8128) & 1) == 0)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, v7);
  objc_msgSend(v12, "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 != 0;

  return v14;
}

+ (BOOL)addQuickTimeMetadataItemsWithIdentifier:(id)a3 value:(id)a4 toItems:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  char v13;
  void *v14;
  BOOL v15;
  int v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v9, "count");
  objc_msgSend(MEMORY[0x1E0C8B278], "metadataItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIdentifier:", v7);
  objc_msgSend(v11, "setValue:", v8);
  if (v11)
  {
    objc_msgSend(v9, "addObject:", v11);
    ++v10;
  }
  +[PFMetadataIdentifier quickTimeMetadataVariationIdentifier](PFMetadataIdentifier, "quickTimeMetadataVariationIdentifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", v12))
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  if ((objc_msgSend(v8, "isEqualToNumber:", &unk_1E45CA7C0) & 1) != 0)
  {

    goto LABEL_8;
  }
  v13 = objc_msgSend(v8, "isEqualToNumber:", &unk_1E45CA7D8);

  if ((v13 & 1) != 0)
  {
LABEL_8:
    v12 = objc_alloc_init(MEMORY[0x1E0C8B278]);
    objc_msgSend(v12, "setKey:", CFSTR("LOOP"));
    objc_msgSend(v12, "setKeySpace:", *MEMORY[0x1E0C8A9F0]);
    v17 = 0;
    objc_msgSend(v12, "setDataType:", *MEMORY[0x1E0CA2440]);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v17, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:", v14);

    if (v12)
    {
      objc_msgSend(v9, "addObject:", v12);
      v10 = 3;
    }
    else
    {
      v10 = 2;
    }
LABEL_11:

  }
  v15 = objc_msgSend(v9, "count") == v10;

  return v15;
}

+ (id)itemsByRemovingMetadataItemForIdentifier:(id)a3 fromArray:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:filteredByIdentifier:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v8, "removeObjectsInArray:", v6);
    v7 = (void *)objc_msgSend(v8, "copy");

  }
  return v7;
}

+ (id)mutableImagePropertyDictionaryForMetadata:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "cgImageProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

@end
