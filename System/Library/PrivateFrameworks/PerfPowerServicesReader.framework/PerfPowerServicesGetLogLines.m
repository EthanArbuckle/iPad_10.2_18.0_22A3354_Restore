@implementation PerfPowerServicesGetLogLines

void __PerfPowerServicesGetLogLines_block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE719D8], "getMetadataByCategoryForSubsystem:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __PerfPowerServicesGetLogLines_block_invoke_2;
  v6[3] = &unk_25142D030;
  v7 = v3;
  v8 = a1[4];
  v9 = a1[5];
  v10 = a1[6];
  v11 = a1[7];
  v12 = a1[8];
  v4 = v3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __PerfPowerServicesGetLogLines_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  PPSTimeSeriesRequest *v9;
  PPSRequestDispatcher *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PPSRequestDispatcher *v31;
  PPSTimeSeriesRequest *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id obj;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x2494FEED8]();
  PPSCreateSubsystemCategoryPredicate(*(_QWORD *)(a1 + 32), (uint64_t)v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSTimeSeriesRequest initWithMetrics:predicate:timeFilter:]([PPSTimeSeriesRequest alloc], "initWithMetrics:predicate:timeFilter:", 0, v8, *(_QWORD *)(a1 + 40));
  v10 = -[PPSRequestDispatcher initWithFilepath:]([PPSRequestDispatcher alloc], "initWithFilepath:", *(_QWORD *)(a1 + 48));
  v43 = 0;
  -[PPSRequestDispatcher dataForRequest:withError:](v10, "dataForRequest:withError:", v9, &v43);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v43;
  if (!v12)
  {
    v31 = v10;
    v32 = v9;
    v33 = v8;
    v34 = v7;
    v35 = v6;
    v36 = v5;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v30 = v11;
    obj = v11;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v13)
    {
      v14 = v13;
      v38 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v40 != v38)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x2494FEED8]();
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "logLine");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)MEMORY[0x24BDBCE60];
          v22 = *(void **)(a1 + 56);
          v21 = *(void **)(a1 + 64);
          objc_msgSend(v16, "monotonicTimestamp");
          objc_msgSend(v21, "localTimeFromMonotonicTime:");
          objc_msgSend(v20, "dateWithTimeIntervalSince1970:");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringFromDate:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v25 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v16, "monotonicTimestamp");
            objc_msgSend(v25, "numberWithDouble:");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v26);

            v27 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v16, "label");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR("%@ [%@] %@"), v24, v28, v19);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v29);

            objc_msgSend(*(id *)(a1 + 72), "addObject:", v18);
          }

          objc_autoreleasePoolPop(v17);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v14);
    }

    v6 = v35;
    v5 = v36;
    v8 = v33;
    v7 = v34;
    v10 = v31;
    v9 = v32;
    v11 = v30;
    v12 = 0;
  }

  objc_autoreleasePoolPop(v7);
}

@end
