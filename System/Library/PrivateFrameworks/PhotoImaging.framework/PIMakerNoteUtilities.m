@implementation PIMakerNoteUtilities

+ (void)addAssetIdentifier:(id)a3 toMetadataDictionary:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v5 = *MEMORY[0x1E0CBCF70];
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C89C70]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v5);

}

+ (void)addAssetIdentifier:(id)a3 toMetadataArray:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "removeAssetIdentifierFromMetadataArray:", v6);
  objc_msgSend(MEMORY[0x1E0C8B278], "metadataItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", *MEMORY[0x1E0C8A948]);
  objc_msgSend(v8, "setValue:", v7);

  objc_msgSend(v6, "addObject:", v8);
}

+ (void)removeAssetIdentifierFromMetadataArray:(id)a3
{
  uint64_t v3;
  id v4;

  v4 = a3;
  v3 = objc_msgSend(v4, "indexOfObjectPassingTest:", &__block_literal_global_4856);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "removeObjectAtIndex:", v3);

}

uint64_t __63__PIMakerNoteUtilities_removeAssetIdentifierFromMetadataArray___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0C8A948]);

  return v3;
}

@end
