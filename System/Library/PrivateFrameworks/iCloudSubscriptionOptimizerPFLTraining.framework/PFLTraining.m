@implementation PFLTraining

- (id)runTask:(id)a3 recordSet:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValueForKey:defaultValue:", CFSTR("ModelType"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "parameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Logging task parameters: %@"), v12);

  NSLog(CFSTR("Logging modelType: %@"), v11);
  -[PFLTraining loadRecordsForRecordSet:](self, "loadRecordsForRecordSet:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    NSLog(CFSTR("Loaded %ld DESRecords to train on."), objc_msgSend(v13, "count"));
    objc_msgSend(v8, "parameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attachments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "datas");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "infos");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFLTraining createDataSourceForRecipe:attachments:recordDatas:recordInfos:error:](self, "createDataSourceForRecipe:attachments:recordDatas:recordInfos:error:", v14, v15, v16, v17, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && !*a5)
    {
      -[PFLTraining createEvaluatorForModelType:newAPI:error:](self, "createEvaluatorForModelType:newAPI:error:", v11, objc_msgSend(v18, "useNewTrainingAPI"), a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 && !*a5)
      {
        objc_msgSend(v8, "parameters");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringValueForKey:defaultValue:", CFSTR("ModelFileName"), 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          NSLog(CFSTR("modelFile: %@"), v23);
          objc_msgSend(v8, "attachments");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "attachmentURLsForBasename:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v25, "count") == 1)
          {
            v33 = v23;
            NSLog(CFSTR("modelURLs: %@"), v25);
            objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "evaluateWithModelURL:dataSource:error:", v26, v18, a5);
            v27 = objc_claimAutoreleasedReturnValue();

            v28 = (void *)v27;
            if (v27 && !*a5)
            {
              -[PFLTraining taskResultFromDict:newAPI:](self, "taskResultFromDict:newAPI:", v27, objc_msgSend(v18, "useNewTrainingAPI"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v19 = 0;
            }
            v23 = v33;

          }
          else
          {
            NSLog(CFSTR("Error: No modelURL is found"));
            v30 = (void *)MEMORY[0x24BDD1540];
            v34 = *MEMORY[0x24BDD0FC8];
            v35 = CFSTR("No modelURL is found.");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("PFL Evaluator"), 0, v31);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

            v19 = 0;
          }
        }
        else
        {
          NSLog(CFSTR("Error: No modelFile is found"));
          v29 = (void *)MEMORY[0x24BDD1540];
          v36 = *MEMORY[0x24BDD0FC8];
          v37 = CFSTR("No modelFile is found.");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("PFL Evaluator"), 0, v25);
          v19 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    NSLog(CFSTR("No DESRecords to train on."));
    v20 = (void *)MEMORY[0x24BDD1540];
    v38 = *MEMORY[0x24BDD0FC8];
    v39[0] = CFSTR("No DESRecords to train on.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("PFL Evaluator"), 0, v18);
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)loadRecordsForRecordSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  BOOL v24;
  InMemoryRecordSet *v25;
  void *v27;
  id obj;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v3;
  objc_msgSend(v3, "nativeRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.iCloudSubscriptionOptimizerCore.PFLPlugin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v8;
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  v10 = 0;
  if (v32)
  {
    v30 = v4;
    v31 = *(_QWORD *)v40;
    obj = v9;
    v29 = v5;
    while (2)
    {
      v11 = 0;
      v12 = v10;
      do
      {
        if (*(_QWORD *)v40 != v31)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v11);
        objc_msgSend(v33, "nativeRecordInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = v12;
        objc_msgSend(v33, "nativeRecordDataForRecordUUID:error:", v13, &v38);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v38;

        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v17 = v15;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v35 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
              objc_msgSend(v17, "objectForKey:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              NSLog(CFSTR("nativeRecordInfo: %@, nativeRecordData: %@ \n"), v22, v23);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          }
          while (v19);
        }

        NSLog(CFSTR("nativeRecordData: %@"), v16);
        if (v17)
          v24 = v16 == 0;
        else
          v24 = 1;
        if (v24)
        {

          v9 = obj;
          v25 = 0;
          v5 = v29;
          v4 = v30;
          goto LABEL_21;
        }
        v4 = v30;
        objc_msgSend(v30, "addObject:", v16);
        v5 = v29;
        objc_msgSend(v29, "addObject:", v17);

        ++v11;
        v12 = v10;
      }
      while (v11 != v32);
      v9 = obj;
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v32)
        continue;
      break;
    }
  }

  v25 = -[InMemoryRecordSet initWithRecordInfos:recordDatas:]([InMemoryRecordSet alloc], "initWithRecordInfos:recordDatas:", v5, v4);
LABEL_21:

  return v25;
}

- (id)createEvaluatorForModelType:(id)a3 newAPI:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  __objc2_class *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v6 = a4;
  v12[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Espresso")) && !v6)
  {
    NSLog(CFSTR("Initialising Espresso evaluator"));
    v7 = EspressoEvaluator;
    return objc_alloc_init(v7);
  }
  if (v6)
  {
    NSLog(CFSTR("Initialising CoreMLTrainer evaluator"));
    v7 = CoreMLTrainer;
    return objc_alloc_init(v7);
  }
  NSLog(CFSTR("Invalid ModelType value specified in the recipe"));
  v9 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BDD0FC8];
  v12[0] = CFSTR("Invalid ModelType value specified in the recipe");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PFLTraining Evaluator"), 0, v10);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  return 0;
}

- (id)createDataSourceForRecipe:(id)a3 attachments:(id)a4 recordDatas:(id)a5 recordInfos:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  EvaluationDataSource *v17;
  float v18;
  unint64_t v19;
  EvaluationDataSource *v20;
  _QWORD v22[4];
  id v23;
  id v24;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  NSLog(CFSTR("PFLPlugin recipe: %@"), v10);
  v13 = (void *)objc_opt_new();
  +[EvaluationDataSource defaultRecipeParams](EvaluationDataSource, "defaultRecipeParams");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __83__PFLTraining_createDataSourceForRecipe_attachments_recordDatas_recordInfos_error___block_invoke;
  v22[3] = &unk_24F9577A8;
  v15 = v10;
  v23 = v15;
  v16 = v13;
  v24 = v16;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v22);

  v17 = -[EvaluationDataSource initWithRecipe:infos:datas:error:]([EvaluationDataSource alloc], "initWithRecipe:infos:datas:error:", v16, v11, v12, a7);
  NSLog(CFSTR("%ld DESRecords before performing filtering on isDummyData and Daemon version."), -[EvaluationDataSource recordCount](v17, "recordCount"));
  -[EvaluationDataSource filteringOperation](v17, "filteringOperation");
  NSLog(CFSTR("%ld DESRecords after performing filtering on isDummyData and Daemon version."), -[EvaluationDataSource recordCount](v17, "recordCount"));
  -[EvaluationDataSource negativeSamplingRate](v17, "negativeSamplingRate");
  if (v18 < 1.0)
  {
    NSLog(CFSTR("About to perform downsampling for negative samples."));
    -[EvaluationDataSource performDownSampling](v17, "performDownSampling");
    if (!-[EvaluationDataSource recordCount](v17, "recordCount"))
    {
      NSLog(CFSTR("No DESRecords to train after performing downsampling."));
      goto LABEL_11;
    }
  }
  if (!-[EvaluationDataSource recordCount](v17, "recordCount"))
  {
    NSLog(CFSTR("No DESRecords to train after performing filtering on isDummyData and Daemon version."));
    goto LABEL_11;
  }
  v19 = -[EvaluationDataSource recordCount](v17, "recordCount");
  if (v19 < -[EvaluationDataSource minBatchSize](v17, "minBatchSize"))
  {
    NSLog(CFSTR("Sample size is smaller than minimum batch size and skip this device for training."));
LABEL_11:
    v20 = 0;
    goto LABEL_12;
  }
  if (!v17)
  {
    NSLog(CFSTR("Error: No EvaluatorDataSource"));
    goto LABEL_11;
  }
  NSLog(CFSTR("EvaluatorDataSource: %@"), v17);
  NSLog(CFSTR("EvaluatorDataSource is created: %@"), v17);
  v20 = v17;
LABEL_12:

  return v20;
}

void __83__PFLTraining_createDataSourceForRecipe_attachments_recordDatas_recordInfos_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v10 = (id)v8;
  if (v8)
    v9 = (id)v8;
  else
    v9 = v6;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v7);

}

- (id)taskResultFromDict:(id)a3 newAPI:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  size_t v13;
  _DWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  int v26;
  void *v27;
  size_t v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ModelDeltas"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("ModelDeltas"));
  if (!a4)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    v30 = v5;
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(v7);
          v10 += objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "count");
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v9);
      v13 = 4 * v10;
    }
    else
    {
      v13 = 0;
    }

    v29 = v13;
    v14 = malloc_type_malloc(v13, 0x100004052888210uLL);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v7;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v21 = v20;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v33;
            do
            {
              for (k = 0; k != v23; ++k)
              {
                if (*(_QWORD *)v33 != v24)
                  objc_enumerationMutation(v21);
                objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "floatValue");
                v14[v17 + k] = v26;
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
              v17 += k;
            }
            while (v23);
          }

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v14, v29, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v30;
  }
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63328]), "initWithJSONResult:unprivatizedVector:", v5, v6);

  return v27;
}

@end
