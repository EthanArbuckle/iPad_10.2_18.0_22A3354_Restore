@implementation VUIMediaLibraryUtilities

+ (id)groupingForMediaEntities:(id)a3 groupingKeyPath:(id)a4 groupingSortComparator:(id)a5 performDefaultSort:(BOOL)a6 sortIndexPropertyKey:(id)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  VUIMediaEntitiesToGroupsValueTransformer *v15;
  void *v16;

  v7 = a6;
  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[VUIMediaEntitiesToGroupsValueTransformer initWithIdentifierKeyPath:]([VUIMediaEntitiesToGroupsValueTransformer alloc], "initWithIdentifierKeyPath:", v13);

  -[VUIMediaEntitiesToGroupsValueTransformer setGroupsSortComparator:](v15, "setGroupsSortComparator:", v12);
  -[VUIMediaEntitiesToGroupsValueTransformer setPerformDefaultSort:](v15, "setPerformDefaultSort:", v7);
  -[VUIMediaEntitiesToGroupsValueTransformer setSortIndexKeyPath:](v15, "setSortIndexKeyPath:", v11);

  -[VUIMediaEntitiesToGroupsValueTransformer transformedValue:](v15, "transformedValue:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)sortIndexesForMediaEntities:(id)a3 sortIndexPropertyKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__VUIMediaLibraryUtilities_sortIndexesForMediaEntities_sortIndexPropertyKey___block_invoke;
  v10[3] = &unk_1E9FA4CA8;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a1, "_sortIndexesForObjects:titleForObjectBlock:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_sortIndexesForObjects:(id)a3 titleForObjectBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  _QWORD v18[3];
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v5 = a3;
  v6 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__35;
  v30 = __Block_byref_object_dispose__35;
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__35;
  v24 = __Block_byref_object_dispose__35;
  v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 1;
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__VUIMediaLibraryUtilities__sortIndexesForObjects_titleForObjectBlock___block_invoke;
  v12[3] = &unk_1E9FA4D30;
  v15 = v18;
  v8 = v6;
  v14 = v8;
  v16 = &v20;
  v9 = v7;
  v13 = v9;
  v17 = &v26;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);
  if (v21[5])
    objc_msgSend((id)v27[5], "addObject:");
  v10 = (void *)objc_msgSend((id)v27[5], "copy");

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v10;
}

+ (id)sortIndexesForGrouping:(id)a3
{
  return (id)objc_msgSend(a1, "_sortIndexesForObjects:titleForObjectBlock:", a3, &__block_literal_global_155);
}

uint64_t __51__VUIMediaLibraryUtilities_sortIndexesForGrouping___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __77__VUIMediaLibraryUtilities_sortIndexesForMediaEntities_sortIndexPropertyKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "valueForKey:", *(_QWORD *)(a1 + 32));
}

+ (id)mediaItemEntityTypesSortComparator
{
  if (mediaItemEntityTypesSortComparator___onceToken != -1)
    dispatch_once(&mediaItemEntityTypesSortComparator___onceToken, &__block_literal_global_3_3);
  return &__block_literal_global_14_1;
}

void __62__VUIMediaLibraryUtilities_mediaItemEntityTypesSortComparator__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v9[0] = &unk_1EA0BAA08;
  +[VUIMediaEntityType show](VUIMediaEntityType, "show");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v9[1] = &unk_1EA0BAA20;
  +[VUIMediaEntityType season](VUIMediaEntityType, "season");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v9[2] = &unk_1EA0BAA38;
  +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v9[3] = &unk_1EA0BAA50;
  +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  v9[4] = &unk_1EA0BAA68;
  +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[5] = v5;
  v9[5] = &unk_1EA0BAA80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)mediaItemEntityTypesSortComparator___mediaItemEntityTypeToSortOrder;
  mediaItemEntityTypesSortComparator___mediaItemEntityTypeToSortOrder = v6;

}

uint64_t __62__VUIMediaLibraryUtilities_mediaItemEntityTypesSortComparator__block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)mediaItemEntityTypesSortComparator___mediaItemEntityTypeToSortOrder;
  v5 = a3;
  objc_msgSend(v4, "objectForKey:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)mediaItemEntityTypesSortComparator___mediaItemEntityTypeToSortOrder, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "compare:", v7);
  return v8;
}

void __71__VUIMediaLibraryUtilities__sortIndexesForObjects_titleForObjectBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  VUIMediaEntitySortIndex *v10;
  uint64_t v11;
  void *v12;
  unsigned __int16 v13;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v13 = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v13 = objc_msgSend(v5, "characterAtIndex:", 0);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v13, 1);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &stru_1E9FF3598;
    }
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v7
      && (objc_msgSend(v7, "title"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = -[__CFString isEqualToString:](v6, "isEqualToString:", v8),
          v8,
          v9))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") + 1);
    }
    else
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "characterIsMember:", v13) & 1) == 0)
      {

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        v6 = CFSTR("#");
      }
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:");
      v10 = -[VUIMediaEntitySortIndex initWithTitle:startIndex:count:]([VUIMediaEntitySortIndex alloc], "initWithTitle:startIndex:count:", v6, a3, 1);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") + 1);
  }
}

@end
