@implementation PHAsset

uint64_t __62__PHAsset_Curation__prefetchOnAssets_options_curationContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __85__PHAsset_Curation___populateAsset_withPersonUUIDs_consolidatedPersonUUIDs_petUUIDs___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDE35E0], "localIdentifierWithUUID:", a2);
}

uint64_t __85__PHAsset_Curation___populateAsset_withPersonUUIDs_consolidatedPersonUUIDs_petUUIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDE35E0], "localIdentifierWithUUID:", a2);
}

uint64_t __85__PHAsset_Curation___populateAsset_withPersonUUIDs_consolidatedPersonUUIDs_petUUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDE35E0], "localIdentifierWithUUID:", a2);
}

void __98__PHAsset_Curation___filterPersonUUIDs_fromPersonUUIDsByAssetUUID_personUUIDByMergeCandidateUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "intersectsSet:", *(_QWORD *)(a1 + 32)))
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "intersectSet:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 40))
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v14, (_QWORD)v20);
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v15)
              v17 = (void *)v15;
            else
              v17 = v14;
            v18 = v17;

            objc_msgSend(v8, "addObject:", v18);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v11);
      }

    }
    else
    {
      v8 = v7;
    }
    objc_msgSend(v8, "allObjects", (_QWORD)v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v19, v5);

  }
}

void __73__PHAsset_Curation__verifiedPersonLocalIdentifiersByAssetUUIDWithAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "_pl_map:", &__block_literal_global_1365);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

uint64_t __73__PHAsset_Curation__verifiedPersonLocalIdentifiersByAssetUUIDWithAssets___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDE35E0], "localIdentifierWithUUID:", a2);
}

@end
