@implementation _UIOpenInAppActivityDataProvider

+ (id)preparedActivityExtensionItemDataForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4
{
  id v5;
  id v6;
  UISUIActivityExtensionItemData *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(UISUIActivityExtensionItemData);
  _NSExtensionItemsFromActivityItemValuesForExtensionItemDataRequestWithProcessingBlock(v5, v6, &__block_literal_global_50);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityExtensionItemData setExtensionItems:](v7, "setExtensionItems:", v8);

  v19 = v6;
  objc_msgSend(v6, "activityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[_UIActivityItemMapping _openURLAnnotationForActivityItem:activityType:](_UIActivityItemMapping, "_openURLAnnotationForActivityItem:activityType:", v16, v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v16);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  -[UISUIActivityExtensionItemData setOpenURLAnnotationsByURL:](v7, "setOpenURLAnnotationsByURL:", v10);
  return v7;
}

@end
