@implementation PPSCountGenerator

+ (id)countWithTimeSeries:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    v19 = &unk_25143FEF8;
    objc_msgSend(v5, "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __47__PPSCountGenerator_countWithTimeSeries_block___block_invoke;
    v11[3] = &unk_25142A0B0;
    v12 = v7;
    v13 = &v14;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

    v8 = (id)v15[5];
    _Block_object_dispose(&v14, 8);

  }
  return v8;
}

void __47__PPSCountGenerator_countWithTimeSeries_block___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v2 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "doubleValue");
    v4 = v3;
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v2, "numberWithDouble:", v4 + v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

+ (id)countMapWithTimeSeries:(id)a3 block:(id)a4 groupingDimensions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v8 && v9 && v10)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __69__PPSCountGenerator_countMapWithTimeSeries_block_groupingDimensions___block_invoke;
    v15[3] = &unk_25142A128;
    v16 = v11;
    v19 = &v21;
    v20 = a1;
    v17 = v8;
    v18 = v9;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

    v12 = (void *)objc_msgSend((id)v22[5], "copy");
    _Block_object_dispose(&v21, 8);

  }
  return v12;
}

void __69__PPSCountGenerator_countMapWithTimeSeries_block_groupingDimensions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = *(void **)(a1 + 32);
  v6 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __69__PPSCountGenerator_countMapWithTimeSeries_block_groupingDimensions___block_invoke_2;
  v18[3] = &unk_25142A0D8;
  v7 = v3;
  v19 = v7;
  v8 = v4;
  v20 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v18);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (void *)MEMORY[0x24BDD1758];
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __69__PPSCountGenerator_countMapWithTimeSeries_block_groupingDimensions___block_invoke_3;
    v16[3] = &unk_25142A100;
    v11 = v8;
    v17 = v11;
    objc_msgSend(v10, "predicateWithBlock:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "filteredTimeSeriesUsingPredicate:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "countWithTimeSeries:block:", v14, *(_QWORD *)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v15, v11);

  }
}

void __69__PPSCountGenerator_countMapWithTimeSeries_block_groupingDimensions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "metricKeysAndValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "groupBy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v10, "groupBy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
}

uint64_t __69__PPSCountGenerator_countMapWithTimeSeries_block_groupingDimensions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        objc_msgSend(v3, "metricKeysAndValues", (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
        {
          v14 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_11:

  return v14;
}

@end
