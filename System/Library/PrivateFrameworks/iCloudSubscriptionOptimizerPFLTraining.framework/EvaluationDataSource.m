@implementation EvaluationDataSource

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.iCloudSubscriptionOptimizerCore.PFLPlugin", "EvaluationDataSource");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;

  }
}

+ (id)defaultRecipeParams
{
  _QWORD v3[21];
  _QWORD v4[22];

  v4[21] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("NumLocalIterations");
  v3[1] = CFSTR("LearningRate");
  v4[0] = &unk_24F959850;
  v4[1] = &unk_24F9598C8;
  v3[2] = CFSTR("LearningRateDecay");
  v3[3] = CFSTR("TrainLayers");
  v4[2] = &unk_24F9598D8;
  v4[3] = MEMORY[0x24BDBD1A8];
  v3[4] = CFSTR("GradientNormFactor");
  v3[5] = CFSTR("BatchSize");
  v4[4] = &unk_24F9598E8;
  v4[5] = &unk_24F959850;
  v3[6] = CFSTR("L2NormBound");
  v3[7] = CFSTR("GradientNormType");
  v4[6] = &unk_24F9598F8;
  v4[7] = CFSTR("NoGradNorm");
  v3[8] = CFSTR("ObjectiveFunction");
  v3[9] = CFSTR("FrozenComponentIds");
  v4[8] = CFSTR("xent");
  v4[9] = &stru_24F957D88;
  v3[10] = CFSTR("ModelFeatures");
  v3[11] = CFSTR("MinsUntil");
  v4[10] = &stru_24F957D88;
  v4[11] = &unk_24F959868;
  v3[12] = CFSTR("MinDaemonVersion");
  v3[13] = CFSTR("DoDummyDataFilter");
  v4[12] = &unk_24F959880;
  v4[13] = &unk_24F959880;
  v3[14] = CFSTR("ModelOutputName");
  v3[15] = CFSTR("MinBatchSize");
  v4[14] = CFSTR("propensity");
  v4[15] = &unk_24F959850;
  v3[16] = CFSTR("NegativeSamplingRate");
  v3[17] = CFSTR("LabelKeyName");
  v4[16] = &unk_24F9598D8;
  v4[17] = &unk_24F959850;
  v3[18] = CFSTR("ModelInputSchemaInputName");
  v3[19] = CFSTR("ModelInputSchemaLabelName");
  v4[18] = CFSTR("input_1");
  v4[19] = CFSTR("label_input_0");
  v3[20] = CFSTR("UseNewTrainingAPI");
  v4[20] = &unk_24F959880;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 21);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (EvaluationDataSource)initWithRecipe:(id)a3 infos:(id)a4 datas:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  EvaluationDataSource *v12;
  uint64_t v13;
  NSArray *recordInfos;
  uint64_t v15;
  NSArray *recordDatas;
  void *v17;
  void *v18;
  uint64_t v19;
  NSDictionary *recipe;
  EvaluationDataSource *v21;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)EvaluationDataSource;
  v12 = -[EvaluationDataSource init](&v23, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    recordInfos = v12->_recordInfos;
    v12->_recordInfos = (NSArray *)v13;

    v15 = objc_msgSend(v11, "copy");
    recordDatas = v12->_recordDatas;
    v12->_recordDatas = (NSArray *)v15;

    +[EvaluationDataSource defaultRecipeParams](EvaluationDataSource, "defaultRecipeParams");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v18, "addEntriesFromDictionary:", v9);
    v19 = objc_msgSend(v18, "copy");
    recipe = v12->_recipe;
    v12->_recipe = (NSDictionary *)v19;

    v21 = v12;
  }

  return v12;
}

- (int)numLocalIterations
{
  void *v2;
  void *v3;
  int v4;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NumLocalIterations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (float)learningRate
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LearningRate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (float)learningRateDecay
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LearningRateDecay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (NSArray)layersToTrain
{
  void *v2;
  void *v3;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("TrainLayers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (float)gradNormFactor
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("GradientNormFactor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (int)batchSize
{
  void *v3;
  void *v4;
  int v5;
  int result;

  -[EvaluationDataSource recipe](self, "recipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BatchSize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  result = -[EvaluationDataSource recordCount](self, "recordCount");
  if (v5 < result)
    return v5;
  return result;
}

- (float)l2NormBound
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("L2NormBound"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (NSString)gradNormType
{
  void *v2;
  void *v3;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("GradientNormType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)objectiveFunction
{
  void *v2;
  void *v3;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ObjectiveFunction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)freezeComponents
{
  void *v2;
  void *v3;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FrozenComponentIds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)modelFeatures
{
  void *v2;
  void *v3;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ModelFeatures"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int)minsUntil
{
  void *v2;
  void *v3;
  int v4;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MinsUntil"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (int)minDaemonVersion
{
  void *v2;
  void *v3;
  int v4;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MinDaemonVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)doDummyDataFilter
{
  void *v2;
  void *v3;
  char v4;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DoDummyDataFilter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSString)modelOutputName
{
  void *v2;
  void *v3;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ModelOutputName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)modelInputSchemaInputName
{
  void *v2;
  void *v3;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ModelInputSchemaInputName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)modelInputSchemaLabelName
{
  void *v2;
  void *v3;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ModelInputSchemaLabelName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int)minBatchSize
{
  void *v2;
  void *v3;
  int v4;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MinBatchSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (float)negativeSamplingRate
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NegativeSamplingRate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (int)labelKeyName
{
  void *v2;
  void *v3;
  int v4;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LabelKeyName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)useNewTrainingAPI
{
  void *v2;
  void *v3;
  char v4;

  -[EvaluationDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("UseNewTrainingAPI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (unint64_t)recordCount
{
  return -[NSArray count](self->_recordInfos, "count");
}

- (id)dataForRecord:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_recordDatas, "objectAtIndexedSubscript:", a3);
}

- (void)filteroutDummyData
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *recordInfos;
  NSArray *v14;
  NSArray *recordDatas;
  id v16;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_recordInfos, "count"))
  {
    v4 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_recordInfos, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("isDummyData"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[NSArray objectAtIndexedSubscript:](self->_recordInfos, "objectAtIndexedSubscript:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("isDummyData"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "BOOLValue");

        if ((v9 & 1) == 0)
        {
          -[NSArray objectAtIndexedSubscript:](self->_recordInfos, "objectAtIndexedSubscript:", v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v10);

          -[NSArray objectAtIndexedSubscript:](self->_recordDatas, "objectAtIndexedSubscript:", v4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      ++v4;
    }
    while (-[NSArray count](self->_recordInfos, "count") > v4);
  }
  v12 = (NSArray *)objc_msgSend(v16, "copy");
  recordInfos = self->_recordInfos;
  self->_recordInfos = v12;

  v14 = (NSArray *)objc_msgSend(v3, "copy");
  recordDatas = self->_recordDatas;
  self->_recordDatas = v14;

}

- (void)selectDaemonVersion:(int)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *recordInfos;
  NSArray *v16;
  NSArray *recordDatas;
  id v18;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_recordInfos, "count"))
  {
    v6 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_recordInfos, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("daemonVersion"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[NSArray objectAtIndexedSubscript:](self->_recordInfos, "objectAtIndexedSubscript:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("daemonVersion"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "intValue");

        if (v11 >= a3)
        {
          -[NSArray objectAtIndexedSubscript:](self->_recordInfos, "objectAtIndexedSubscript:", v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v12);

          -[NSArray objectAtIndexedSubscript:](self->_recordDatas, "objectAtIndexedSubscript:", v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      ++v6;
    }
    while (-[NSArray count](self->_recordInfos, "count") > v6);
  }
  v14 = (NSArray *)objc_msgSend(v18, "copy");
  recordInfos = self->_recordInfos;
  self->_recordInfos = v14;

  v16 = (NSArray *)objc_msgSend(v5, "copy");
  recordDatas = self->_recordDatas;
  self->_recordDatas = v16;

}

- (void)filteringOperation
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("MinDaemonVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if ((int)v4 >= 1)
  {
    v5 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109120;
      v13[1] = v4;
      _os_log_impl(&dword_22D863000, v5, OS_LOG_TYPE_INFO, "About to select samples with daemon version >= %d only.", (uint8_t *)v13, 8u);
    }
    -[EvaluationDataSource selectDaemonVersion:](self, "selectDaemonVersion:", v4);
  }
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("DoDummyDataFilter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    v8 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_22D863000, v8, OS_LOG_TYPE_INFO, "About to select samples with isDummyData == false", (uint8_t *)v13, 2u);
    }
    -[EvaluationDataSource filteroutDummyData](self, "filteroutDummyData");
  }
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("LabelKeyName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  v11 = CFSTR("buyLabel");
  if (v10 == 2)
    v11 = CFSTR("openLabelSubStream");
  if (v10 == 1)
    v12 = CFSTR("icloudNotificationActionLabel");
  else
    v12 = v11;
  -[EvaluationDataSource filterInMatchedLabelData:](self, "filterInMatchedLabelData:", v12);
}

- (id)vectorForClassification:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    v6 = &unk_24F9598C8;
  else
    v6 = &unk_24F959908;
  objc_msgSend(v4, "addObject:", v6);
  if (a3 == 1)
    v7 = &unk_24F959908;
  else
    v7 = &unk_24F9598C8;
  objc_msgSend(v5, "addObject:", v7);
  return v5;
}

- (int64_t)classificationForRecord:(unint64_t)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  int v11;
  int64_t v12;

  -[EvaluationDataSource getRecordInfo:](self, "getRecordInfo:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EvaluationDataSource validateRecordInfo:](self, "validateRecordInfo:", v4);
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("LabelKeyName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (v6 == 2)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("openLabelSubStream"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "intValue") != 1)
      goto LABEL_11;
    v8 = CFSTR("minsUntilICloudOpenedSubStream");
  }
  else
  {
    if (v6 == 1)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("icloudNotificationActionLabel"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "intValue") == 1)
      {
        v8 = CFSTR("minsUntilICloudNotificationOpened");
        goto LABEL_9;
      }
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buyLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "intValue") != 1)
      goto LABEL_11;
    v8 = CFSTR("minsUntilICloudBuy");
  }
LABEL_9:
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");
  v11 = -[EvaluationDataSource minsUntil](self, "minsUntil");

  if (v10 >= v11)
  {
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v12 = 1;
LABEL_13:

  return v12;
}

- (id)getRecordInfo:(unint64_t)a3
{
  NSArray *records;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  records = self->_records;
  if (records)
  {
    -[NSArray objectAtIndexedSubscript:](records, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/mobile/Library/DES/Records/com.apple.iCloudSubscriptionOptimizerCore.PFLPlugin"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathExtension:", CFSTR("json"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v9, 0, &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_recordInfos, "objectAtIndexedSubscript:", a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)validateRecordInfo:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("LabelKeyName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (v6 == 2)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("openLabelSubStream"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9 && os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[EvaluationDataSource validateRecordInfo:].cold.6();
    objc_msgSend(v4, "objectForKey:", CFSTR("minsUntilICloudOpenedSubStream"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 && os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[EvaluationDataSource validateRecordInfo:].cold.5();
  }
  else if (v6 == 1)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("icloudNotificationActionLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7 && os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[EvaluationDataSource validateRecordInfo:].cold.4();
    objc_msgSend(v4, "objectForKey:", CFSTR("minsUntilICloudNotificationOpened"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8 && os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[EvaluationDataSource validateRecordInfo:].cold.3();
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("buyLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11 && os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[EvaluationDataSource validateRecordInfo:].cold.2();
    objc_msgSend(v4, "objectForKey:", CFSTR("minsUntilICloudBuy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12 && os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[EvaluationDataSource validateRecordInfo:].cold.1();
  }

}

- (void)filterInMatchedLabelData:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *recordInfos;
  NSArray *v13;
  NSArray *recordDatas;
  id v15;

  v15 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_recordInfos, "count"))
  {
    v6 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_recordInfos, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[NSArray objectAtIndexedSubscript:](self->_recordInfos, "objectAtIndexedSubscript:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v9);

        -[NSArray objectAtIndexedSubscript:](self->_recordDatas, "objectAtIndexedSubscript:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

      }
      ++v6;
    }
    while (-[NSArray count](self->_recordInfos, "count") > v6);
  }
  v11 = (NSArray *)objc_msgSend(v4, "copy");
  recordInfos = self->_recordInfos;
  self->_recordInfos = v11;

  v13 = (NSArray *)objc_msgSend(v5, "copy");
  recordDatas = self->_recordDatas;
  self->_recordDatas = v13;

}

- (BOOL)allNegativeSamples
{
  unint64_t v3;
  int64_t v4;
  BOOL v5;

  if (!-[EvaluationDataSource recordCount](self, "recordCount"))
    return 1;
  v3 = 0;
  do
  {
    v4 = -[EvaluationDataSource classificationForRecord:](self, "classificationForRecord:", v3);
    v5 = v4 != 1;
    if (v4 == 1)
      break;
    ++v3;
  }
  while (-[EvaluationDataSource recordCount](self, "recordCount") > v3);
  return v5;
}

- (void)performDownSampling
{
  float v3;
  float v4;
  float v5;
  NSArray *v6;
  NSArray *recordInfos;
  NSArray *v8;
  NSArray *recordDatas;

  if (-[EvaluationDataSource allNegativeSamples](self, "allNegativeSamples"))
  {
    -[EvaluationDataSource negativeSamplingRate](self, "negativeSamplingRate");
    if (v3 < 1.0)
    {
      v4 = (float)arc4random() * 2.3283e-10;
      -[EvaluationDataSource negativeSamplingRate](self, "negativeSamplingRate");
      if (v4 > v5)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
        recordInfos = self->_recordInfos;
        self->_recordInfos = v6;

        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
        recordDatas = self->_recordDatas;
        self->_recordDatas = v8;

      }
    }
  }
}

- (id)extractFullFeatureListForRecord:(unint64_t)a3
{
  NSArray *records;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  records = self->_records;
  if (records)
  {
    -[NSArray objectAtIndexedSubscript:](records, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/mobile/Library/DES/Records/com.apple.iCloudSubscriptionOptimizerCore.PFLPlugin"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathExtension:", CFSTR("json"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v9, 0, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_recordInfos, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("features"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 && os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
    -[EvaluationDataSource extractFullFeatureListForRecord:].cold.1();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("features"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)extractFeatureDataForRecord:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v25;
  void *v26;
  id obj;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
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
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  -[EvaluationDataSource dataForRecord:](self, "dataForRecord:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[EvaluationDataSource modelFeatures](self, "modelFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EvaluationDataSource extractFullFeatureListForRecord:](self, "extractFullFeatureListForRecord:", a3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v5;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v6;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v10 = v29;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        if (v11)
        {
          v12 = v11;
          v13 = 0;
          v14 = *(_QWORD *)v36;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v36 != v14)
                objc_enumerationMutation(v10);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "isEqualToString:", v9))
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13 + j);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObject:", v16);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
            v13 += j;
          }
          while (v12);
        }

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v30);
  }

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = v7;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v26, "subdataWithRange:", 4 * objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * k), "unsignedIntValue"), 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "appendData:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v20);
  }

  return v17;
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_storeStrong((id *)&self->_records, a3);
}

- (NSArray)recordInfos
{
  return self->_recordInfos;
}

- (void)setRecordInfos:(id)a3
{
  objc_storeStrong((id *)&self->_recordInfos, a3);
}

- (NSArray)recordDatas
{
  return self->_recordDatas;
}

- (void)setRecordDatas:(id)a3
{
  objc_storeStrong((id *)&self->_recordDatas, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordDatas, 0);
  objc_storeStrong((id *)&self->_recordInfos, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

- (void)validateRecordInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D863000, v0, v1, "Failed to find minsUntilICloudBuy from recordInfo.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)validateRecordInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D863000, v0, v1, "Failed to find buyLabel from recordInfo.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)validateRecordInfo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D863000, v0, v1, "Failed to find minsUntilICloudNotificationOpened from recordInfo.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)validateRecordInfo:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D863000, v0, v1, "Failed to find icloudNotificationActionLabel from recordInfo.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)validateRecordInfo:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D863000, v0, v1, "Failed to find minsUntilIcloudOpenedSubStream from recordInfo.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)validateRecordInfo:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D863000, v0, v1, "Failed to find openLabelSubStream from recordInfo.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)extractFullFeatureListForRecord:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D863000, v0, v1, "Failed to find features from recordInfo.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
