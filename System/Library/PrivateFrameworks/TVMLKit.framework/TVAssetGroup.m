@implementation TVAssetGroup

void __43___TVAssetGroup_setAssetInfo_forKey_queue___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  int8x16_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  _QWORD v35[4];
  id v36;
  int8x16_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[7], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      objc_msgSend(*(id *)(a1 + 40), "_removeAssetInfoForKey:removeFile:", *(_QWORD *)(a1 + 32), 0);
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("ATVAssetSize"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("ATVAssetSize"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3[6] = (char *)v3[6] + objc_msgSend(v5, "unsignedLongLongValue");

    }
    objc_msgSend(v3[7], "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("ATVAssetTags"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v39 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v3[8], "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3[8], "setObject:forKeyedSubscript:", v12, v11);
          }
          objc_msgSend(v12, "addObject:", *(_QWORD *)(a1 + 32));

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      }
      while (v8);
    }

    v13 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __43___TVAssetGroup_setAssetInfo_forKey_queue___block_invoke_2;
    v35[3] = &unk_24EB865E0;
    v36 = *(id *)(a1 + 48);
    v27 = *(int8x16_t *)(a1 + 32);
    v14 = (id)v27.i64[0];
    v37 = vextq_s8(v27, v27, 8uLL);
    objc_msgSend(v3, "_updateManifestWithChange:", v35);
    if (v3[6] > v3[4])
    {
      v15 = TVMLKitImageLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222D98000, v15, OS_LOG_TYPE_DEFAULT, "Current cache size exceeds maximum cache size.  Starting to prune.", buf, 2u);
      }
      objc_msgSend(v3[7], "allKeys", v27.i64[0]);
      v34[0] = v13;
      v34[1] = 3221225472;
      v34[2] = __43___TVAssetGroup_setAssetInfo_forKey_queue___block_invoke_14;
      v34[3] = &unk_24EB87CD8;
      v34[4] = v3;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sortedArrayUsingComparator:", v34);
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v31;
        while (2)
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v31 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
            objc_msgSend(v3[7], "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if ((double)(unint64_t)v3[4] * 0.95 > (double)(unint64_t)v3[6])
            {

              goto LABEL_30;
            }
            objc_msgSend(v22, "objectForKey:", CFSTR("ATVAssetPath"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v24, "length"))
              objc_msgSend(*(id *)(a1 + 40), "_removeAssetInfoForKey:", v21);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
          if (v18)
            continue;
          break;
        }
      }
LABEL_30:

      v25 = TVMLKitImageLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v43 = v26;
        _os_log_impl(&dword_222D98000, v25, OS_LOG_TYPE_DEFAULT, "Done freeing up cache space. %@", buf, 0xCu);
      }

    }
  }

}

void __43___TVAssetGroup_setAssetInfo_forKey_queue___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("ATVAsset"));
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("ATVAssetLastAccessedDate"));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ATVAssetTags"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ATVAssetTags"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("ATVAssetTags"));

  }
  v5 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(*(id *)(a1 + 40), "manifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 48));

}

uint64_t __43___TVAssetGroup_setAssetInfo_forKey_queue___block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("ATVAssetLastAccessedDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "valueForKeyPath:", CFSTR("ATVAssetLastAccessedDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "compare:", v10);
  return v11;
}

void __39___TVAssetGroup_assetInfoForKey_queue___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[7], "objectForKey:", *(_QWORD *)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    WeakRetained = v6;
  }

}

void __39___TVAssetGroup_assetInfoForKey_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeAssetInfoForKey:", *(_QWORD *)(a1 + 32));

}

void __39___TVAssetGroup_assetInfoForKey_queue___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained[7], "objectForKey:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v8;
    if (v3)
    {
      v4 = (void *)MEMORY[0x24BDBCED8];
      objc_msgSend(v8[7], "objectForKey:", *(_QWORD *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dictionaryWithDictionary:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("ATVAssetLastAccessedDate"));

      objc_msgSend(v8[7], "setObject:forKey:", v6, *(_QWORD *)(a1 + 32));
      WeakRetained = v8;
    }
  }

}

void __45___TVAssetGroup_removeAssetInfoForKey_queue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeAssetInfoForKey:", *(_QWORD *)(a1 + 32));

}

void __42___TVAssetGroup_removeAllAssetsWithQueue___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[7], "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v2, "_removeAssetInfoForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

void __43___TVAssetGroup_infoForAllAssetsWithQueue___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_msgSend(WeakRetained[7], "copy");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    WeakRetained = v6;
  }

}

void __48___TVAssetGroup_infoForAllAssetsWithTags_queue___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v3);
          objc_msgSend(WeakRetained[8], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (!v9)
          {

            v6 = 0;
LABEL_16:

            goto LABEL_18;
          }
          if (v6)
          {
            objc_msgSend(v6, "intersectSet:", v9);
            if (!objc_msgSend(v6, "count"))
              goto LABEL_16;
          }
          else
          {
            v6 = (void *)objc_msgSend(v9, "mutableCopy");
          }

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v5)
          continue;
        break;
      }
    }
    else
    {
      v6 = 0;
    }
LABEL_18:

    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v12 = v6;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v23;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
            objc_msgSend(WeakRetained[7], "objectForKeyedSubscript:", v17, (_QWORD)v22);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v17);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        }
        while (v14);
      }

      v19 = objc_msgSend(v11, "copy");
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

    }
  }

}

void __51___TVAssetGroup__removeAssetInfoForKey_removeFile___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "manifest");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

id __38___TVAssetGroup_updateAssetsFromFiles__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("ATVAssetSize"));

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("ATVAssetLastAccessedDate"));

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ATVAssetTags"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ATVAssetTags"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("ATVAssetTags"));

    }
    v15 = (void *)objc_msgSend(v8, "copy");
  }
  else
  {
    v18[0] = CFSTR("ATVAssetSize");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v19[1] = v5;
    v18[1] = CFSTR("ATVAssetPath");
    v18[2] = CFSTR("ATVAssetLastAccessedDate");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

void __43___TVAssetGroup__updateManifestWithChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_saveManifest");
    WeakRetained = v2;
  }

}

@end
