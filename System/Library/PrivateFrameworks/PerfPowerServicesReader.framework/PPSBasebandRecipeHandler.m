@implementation PPSBasebandRecipeHandler

+ (id)eventRecipes
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)metricRecipes
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)timeSeriesRecipes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("BasebandMetrics::Events");
  objc_msgSend(a1, "basebandEventRecipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("BasebandMetrics::Histogram");
  v8[0] = v3;
  objc_msgSend(a1, "basebandHistogramRecipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)basebandEventRecipe
{
  return &__block_literal_global_5;
}

PPSTimeSeries *__47__PPSBasebandRecipeHandler_basebandEventRecipe__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  PPSTimeSeries *v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v28 = a3;
  v26 = objc_alloc_init(PPSTimeSeries);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v9, "metrics");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("data"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v9, "metrics");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("data"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("data"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPSBasebandDecoder decodeValue:withMetric:](PPSBasebandDecoder, "decodeValue:withMetric:", v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "mutableCopy");

          if (v16)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("metric_name"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "removeObjectForKey:", CFSTR("metric_name"));
            objc_msgSend(v9, "monotonicTimestamp");
            v19 = v18;
            objc_msgSend(v9, "timeOffset");
            v21 = v20;
            v22 = objc_msgSend(v9, "groupId");
            objc_msgSend(v9, "label");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[PPSEvent eventWithMonotonicTimestamp:timeOffset:dictionary:groupId:label:](PPSEvent, "eventWithMonotonicTimestamp:timeOffset:dictionary:groupId:label:", v16, v22, v23, v19, v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v24, "setLabel:", v17);
            -[PPSTimeSeries addEvent:](v26, "addEvent:", v24);

          }
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v6);
  }

  return v26;
}

+ (id)basebandHistogramRecipe
{
  return &__block_literal_global_11;
}

PPSTimeSeries *__51__PPSBasebandRecipeHandler_basebandHistogramRecipe__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  PPSTimeSeries *v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v42 = a3;
  v39 = objc_alloc_init(PPSTimeSeries);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v4;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v56;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v56 != v36)
          objc_enumerationMutation(obj);
        v38 = v5;
        v6 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v5);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        objc_msgSend(v6, "metrics");
        v44 = (id)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v52;
          v40 = *(_QWORD *)v52;
          v41 = v6;
          do
          {
            v10 = 0;
            v43 = v8;
            do
            {
              if (*(_QWORD *)v52 != v9)
                objc_enumerationMutation(v44);
              v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v10);
              if (objc_msgSend(v11, "hasPrefix:", CFSTR("data")))
              {
                v46 = v10;
                objc_msgSend(v6, "metrics");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "objectForKeyedSubscript:", v11);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("data"));
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                +[PPSBasebandDecoder decodeValue:withMetric:](PPSBasebandDecoder, "decodeValue:withMetric:", v13, v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = (void *)objc_msgSend(v15, "mutableCopy");

                if (v16)
                {
                  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("metric_name"));
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "removeObjectForKey:", CFSTR("metric_name"));
                  v49 = 0u;
                  v50 = 0u;
                  v47 = 0u;
                  v48 = 0u;
                  v17 = (void *)objc_msgSend(v16, "copy");
                  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
                  if (v18)
                  {
                    v19 = v18;
                    v20 = *(_QWORD *)v48;
                    do
                    {
                      for (i = 0; i != v19; ++i)
                      {
                        if (*(_QWORD *)v48 != v20)
                          objc_enumerationMutation(v17);
                        v22 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
                        objc_msgSend(v16, "objectForKeyedSubscript:", v22);
                        v23 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        isKindOfClass = objc_opt_isKindOfClass();

                        if ((isKindOfClass & 1) != 0)
                        {
                          objc_msgSend(v16, "objectForKeyedSubscript:", v22);
                          v25 = (void *)objc_claimAutoreleasedReturnValue();
                          +[PPSBasebandRecipeHandler formatBins:](PPSBasebandRecipeHandler, "formatBins:", v25);
                          v26 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v16, "setValuesForKeysWithDictionary:", v26);

                          objc_msgSend(v16, "removeObjectForKey:", v22);
                        }
                      }
                      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
                    }
                    while (v19);
                  }

                  v6 = v41;
                  objc_msgSend(v41, "monotonicTimestamp");
                  v28 = v27;
                  objc_msgSend(v41, "timeOffset");
                  v30 = v29;
                  v31 = objc_msgSend(v41, "groupId");
                  objc_msgSend(v41, "label");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PPSEvent eventWithMonotonicTimestamp:timeOffset:dictionary:groupId:label:](PPSEvent, "eventWithMonotonicTimestamp:timeOffset:dictionary:groupId:label:", v16, v31, v32, v28, v30);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v33, "setLabel:", v45);
                  -[PPSTimeSeries addEvent:](v39, "addEvent:", v33);

                  v9 = v40;
                }

                v8 = v43;
                v10 = v46;
              }
              ++v10;
            }
            while (v10 != v8);
            v8 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          }
          while (v8);
        }

        v5 = v38 + 1;
      }
      while (v38 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v37);
  }

  return v39;
}

+ (id)formatBins:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __39__PPSBasebandRecipeHandler_formatBins___block_invoke;
  v15[3] = &unk_25142CC08;
  v16 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v15);
  v17[0] = CFSTR("bin_size");
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v4, "count");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("duration_bins");
  v18[0] = v9;
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("[%@]"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __39__PPSBasebandRecipeHandler_formatBins___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasPrefix:", CFSTR("duration")))
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((int)objc_msgSend(v9, "intValue") < 1)
          {
            v12 = CFSTR("-");
          }
          else
          {
            v10 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v3, "objectForKeyedSubscript:", v8);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v11, "intValue"));
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

@end
