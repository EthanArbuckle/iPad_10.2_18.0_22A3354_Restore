@implementation TIMetricDescriptorParser

- (TIMetricDescriptorParser)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIMetricDescriptorParser;
  return -[TIDescriptorParser initWithErrorCode:](&v3, sel_initWithErrorCode_, 0);
}

- (void)parseMetricDescriptors:(id)a3 andInvalidMetricNames:(id)a4 fromConfig:(id)a5 errors:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id obj;
  id obja;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v10 = a4;
  v11 = a5;
  v38 = a6;
  v12 = (void *)objc_opt_new();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v11, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v52 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        -[TIDescriptorParser context](self, "context", v38);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v17, CFSTR("metric"));

        -[TIDescriptorParser parseDictionaryForKey:fromConfig:required:errors:](self, "parseDictionaryForKey:fromConfig:required:errors:", v17, v11, 1, v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19
          && (-[TIMetricDescriptorParser parseMetricDescriptorWithName:fromConfig:errors:](self, "parseMetricDescriptorWithName:fromConfig:errors:", v17, v19, v12), (v20 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v21 = (void *)v20;
          objc_msgSend(v42, "setObject:forKey:", v20, v17);

        }
        else
        {
          objc_msgSend(v10, "addObject:", v17);
        }

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v14);
  }
  v39 = v11;

  v22 = (void *)objc_opt_new();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v42, "allValues");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v48 != v25)
          objc_enumerationMutation(obja);
        v27 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        -[TIDescriptorParser context](self, "context", v38, v39);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "metricName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKey:", v29, CFSTR("metric"));

        -[TIMetricDescriptorParser findInvalidDependencyChain:forMetricDescriptor:fromMetricDescriptors:andInvalidMetricNames:invalidMetricDescriptors:errors:](self, "findInvalidDependencyChain:forMetricDescriptor:fromMetricDescriptors:andInvalidMetricNames:invalidMetricDescriptors:errors:", MEMORY[0x1E0C9AA60], v27, v42, v10, v22, v12);
      }
      v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v24);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v30 = v22;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v44;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v44 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
        objc_msgSend(v35, "metricName", v38);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "removeObjectForKey:", v36);

        objc_msgSend(v35, "metricName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v37);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v32);
  }

  objc_msgSend(v38, "addObjectsFromArray:", v12);
}

- (id)parseMetricDescriptorWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  -[TIDescriptorParser parseStringForKey:fromConfig:required:errors:](self, "parseStringForKey:fromConfig:required:errors:", CFSTR("metricType"), v9, 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("numericValue")))
  {
    -[TIMetricDescriptorParser parseNumericValueDescriptorWithName:fromConfig:errors:](self, "parseNumericValueDescriptorWithName:fromConfig:errors:", v8, v9, v11);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v14 = (void *)v13;
    goto LABEL_10;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("featureUsage")))
  {
    -[TIMetricDescriptorParser parseFeatureUsageDescriptorWithName:fromConfig:errors:](self, "parseFeatureUsageDescriptorWithName:fromConfig:errors:", v8, v9, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("contextValue")))
  {
    -[TIMetricDescriptorParser parseContextValueDescriptorWithName:fromConfig:errors:](self, "parseContextValueDescriptorWithName:fromConfig:errors:", v8, v9, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("settingValue")))
  {
    -[TIMetricDescriptorParser parseSettingValueDescriptorWithName:fromConfig:errors:](self, "parseSettingValueDescriptorWithName:fromConfig:errors:", v8, v9, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[TIDescriptorParser invalidValueErrorForKey:withValue:](self, "invalidValueErrorForKey:withValue:", CFSTR("metricType"), v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v17);

  v14 = 0;
LABEL_10:
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v10, "addObjectsFromArray:", v11);
    v15 = 0;
  }
  else
  {
    v15 = v14;
  }

  return v15;
}

- (id)parseNumericValueDescriptorWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_opt_new();
  -[TIDescriptorParser parseStringForKey:fromConfig:required:errors:](self, "parseStringForKey:fromConfig:required:errors:", CFSTR("calculationExpression"), v10, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMetricDescriptorParser parseCalculationPreconditionFromConfig:forExpression:errors:](self, "parseCalculationPreconditionFromConfig:forExpression:errors:", v10, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMetricDescriptorParser parseCalculationDefaultValueFromConfig:forExpression:andPrecondition:errors:](self, "parseCalculationDefaultValueFromConfig:forExpression:andPrecondition:errors:", v10, v12, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMetricDescriptorParser parseCalculationDependenciesFromConfig:forExpression:errors:](self, "parseCalculationDependenciesFromConfig:forExpression:errors:", v10, v12, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMetricDescriptorParser parseBucketThresholdsFromConfig:isFeatureUsageDescriptor:errors:](self, "parseBucketThresholdsFromConfig:isFeatureUsageDescriptor:errors:", v10, 0, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMetricDescriptorParser parseBucketValuesFromConfig:forBucketThresholds:isFeatureUsageDescriptor:errors:](self, "parseBucketValuesFromConfig:forBucketThresholds:isFeatureUsageDescriptor:errors:", v10, v16, 0, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v9, "addObjectsFromArray:", v11);
    v18 = 0;
  }
  else
  {
    +[TINumericValueDescriptor numericValueDescriptorWithMetricName:calculationExpression:calculationPrecondition:calculationDefaultValue:calculationDependencies:bucketThresholds:bucketValues:](TINumericValueDescriptor, "numericValueDescriptorWithMetricName:calculationExpression:calculationPrecondition:calculationDefaultValue:calculationDependencies:bucketThresholds:bucketValues:", v8, v12, v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)parseFeatureUsageDescriptorWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;

  v28 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  -[TIDescriptorParser parseStringForKey:fromConfig:required:errors:](self, "parseStringForKey:fromConfig:required:errors:", CFSTR("discoveryCounter"), v8, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDescriptorParser parseNumberForKey:fromConfig:required:errors:](self, "parseNumberForKey:fromConfig:required:errors:", CFSTR("discoveryThreshold"), v8, 0, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDescriptorParser parseStringForKey:fromConfig:required:errors:](self, "parseStringForKey:fromConfig:required:errors:", CFSTR("configString"), v8, 0, v10);
  v26 = objc_claimAutoreleasedReturnValue();
  -[TIDescriptorParser parseStringForKey:fromConfig:required:errors:](self, "parseStringForKey:fromConfig:required:errors:", CFSTR("calculationExpression"), v8, 0, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMetricDescriptorParser parseCalculationPreconditionFromConfig:forExpression:errors:](self, "parseCalculationPreconditionFromConfig:forExpression:errors:", v8, v13, v10);
  v14 = objc_claimAutoreleasedReturnValue();
  -[TIMetricDescriptorParser parseCalculationDefaultValueFromConfig:forExpression:andPrecondition:errors:](self, "parseCalculationDefaultValueFromConfig:forExpression:andPrecondition:errors:", v8, v13, v14, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMetricDescriptorParser parseCalculationDependenciesFromConfig:forExpression:errors:](self, "parseCalculationDependenciesFromConfig:forExpression:errors:", v8, v13, v10);
  v25 = objc_claimAutoreleasedReturnValue();
  -[TIMetricDescriptorParser parseBucketThresholdsFromConfig:isFeatureUsageDescriptor:errors:](self, "parseBucketThresholdsFromConfig:isFeatureUsageDescriptor:errors:", v8, 1, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[TIMetricDescriptorParser parseBucketValuesFromConfig:forBucketThresholds:isFeatureUsageDescriptor:errors:](self, "parseBucketValuesFromConfig:forBucketThresholds:isFeatureUsageDescriptor:errors:", v8, v16, 1, v10);
  v27 = v12;
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v9, "addObjectsFromArray:", v10);
    v24 = 0;
    v18 = (void *)v14;
    v20 = (void *)v25;
    v19 = (void *)v26;
  }
  else
  {
    v23 = (void *)v14;
    if (v12)
      v21 = objc_msgSend(v12, "integerValue");
    else
      v21 = 0;
    v20 = (void *)v25;
    v19 = (void *)v26;
    v18 = v23;
    +[TIFeatureUsageDescriptor featureUsageDescriptorWithMetricName:discoveryCounter:discoveryThreshold:configString:calculationExpression:calculationPrecondition:calculationDefaultValue:calculationDependencies:bucketThresholds:](TIFeatureUsageDescriptor, "featureUsageDescriptorWithMetricName:discoveryCounter:discoveryThreshold:configString:calculationExpression:calculationPrecondition:calculationDefaultValue:calculationDependencies:bucketThresholds:", v28, v11, v21, v26, v13, v23, v15, v25, v16);
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (id)parseContextValueDescriptorWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_opt_new();
  -[TIDescriptorParser parseStringForKey:fromConfig:required:errors:](self, "parseStringForKey:fromConfig:required:errors:", CFSTR("contextFieldName"), v10, 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v9, "addObjectsFromArray:", v11);
    v13 = 0;
  }
  else
  {
    +[TIContextValueDescriptor contextValueDescriptorWithMetricName:contextFieldName:](TIContextValueDescriptor, "contextValueDescriptorWithMetricName:contextFieldName:", v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)parseSettingValueDescriptorWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_opt_new();
  -[TIDescriptorParser parseStringForKey:fromConfig:required:errors:](self, "parseStringForKey:fromConfig:required:errors:", CFSTR("settingName"), v10, 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v9, "addObjectsFromArray:", v11);
    v13 = 0;
  }
  else
  {
    +[TISettingValueDescriptor settingValueDescriptorWithMetricName:settingName:](TISettingValueDescriptor, "settingValueDescriptorWithMetricName:settingName:", v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)parseCalculationPreconditionFromConfig:(id)a3 forExpression:(id)a4 errors:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  -[TIDescriptorParser parseStringForKey:fromConfig:required:errors:](self, "parseStringForKey:fromConfig:required:errors:", CFSTR("calculationPrecondition"), v9, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4 && v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' cannot be specified without key '%@'."), CFSTR("calculationPrecondition"), CFSTR("calculationExpression"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDescriptorParser errorWithMessage:andValue:](self, "errorWithMessage:andValue:", v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);

  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v8, "addObjectsFromArray:", v10);
    v14 = 0;
  }
  else
  {
    v14 = v11;
  }

  return v14;
}

- (id)parseCalculationDefaultValueFromConfig:(id)a3 forExpression:(id)a4 andPrecondition:(id)a5 errors:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  TIMetricDescriptorParser *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v10 = a5;
  v11 = a6;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  -[TIDescriptorParser parseNumberForKey:fromConfig:required:errors:](self, "parseNumberForKey:fromConfig:required:errors:", CFSTR("calculationDefaultValue"), v12, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (a4)
    {
      if (v10)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' cannot be specified without key '%@'."), CFSTR("calculationDefaultValue"), CFSTR("calculationPrecondition"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self;
      v17 = v15;
      v18 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' cannot be specified without key '%@'."), CFSTR("calculationDefaultValue"), CFSTR("calculationExpression"));
  }
  else
  {
    if (!v10)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' must be specified with key '%@'."), CFSTR("calculationDefaultValue"), CFSTR("calculationPrecondition"));
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v15;
  v18 = v10;
LABEL_9:
  -[TIDescriptorParser errorWithMessage:andValue:](v16, "errorWithMessage:andValue:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v19);

LABEL_10:
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v11, "addObjectsFromArray:", v13);
    v20 = 0;
  }
  else
  {
    v20 = v14;
  }

  return v20;
}

- (id)parseCalculationDependenciesFromConfig:(id)a3 forExpression:(id)a4 errors:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  -[TIDescriptorParser parseArrayForKey:fromConfig:required:errors:](self, "parseArrayForKey:fromConfig:required:errors:", CFSTR("calculationDependencies"), v8, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    goto LABEL_18;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' cannot be specified without key '%@'."), CFSTR("calculationDependencies"), CFSTR("calculationExpression"));
LABEL_17:
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDescriptorParser errorWithMessage:andValue:](self, "errorWithMessage:andValue:", v21, v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v22);

    goto LABEL_18;
  }
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' must contain at least one value."), CFSTR("calculationDependencies"), v25);
    goto LABEL_17;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    v26 = v9;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (!objc_msgSend(MEMORY[0x1E0DBDB38], "isString:", v18) || !objc_msgSend(v18, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' values must all be strings."), CFSTR("calculationDependencies"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIDescriptorParser errorWithMessage:andValue:](self, "errorWithMessage:andValue:", v19, v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v20);

          v9 = v26;
          goto LABEL_18;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v9 = v26;
      if (v15)
        continue;
      break;
    }
  }

LABEL_18:
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v9, "addObjectsFromArray:", v10);
    v23 = 0;
  }
  else
  {
    v23 = v12;
  }

  return v23;
}

- (id)parseBucketThresholdsFromConfig:(id)a3 isFeatureUsageDescriptor:(BOOL)a4 errors:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v6 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  -[TIDescriptorParser parseArrayForKey:fromConfig:required:errors:](self, "parseArrayForKey:fromConfig:required:errors:", CFSTR("bucketThresholds"), v8, v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    goto LABEL_19;
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' must contain at least one value."), CFSTR("bucketThresholds"), v25);
LABEL_18:
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDescriptorParser errorWithMessage:andValue:](self, "errorWithMessage:andValue:", v21, v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v22);

    goto LABEL_19;
  }
  if (v6)
  {
    v13 = objc_msgSend(v12, "count");
    if (v13 != *MEMORY[0x1E0DBEB38])
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' must contain %lu values for feature usage descriptors."), CFSTR("bucketThresholds"), *MEMORY[0x1E0DBEB38]);
      goto LABEL_18;
    }
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        if ((objc_msgSend(MEMORY[0x1E0DBDB38], "isNumber:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i)) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' values must all be numbers."), CFSTR("bucketThresholds"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIDescriptorParser errorWithMessage:andValue:](self, "errorWithMessage:andValue:", v19, v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v20);

          goto LABEL_16;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_16:

LABEL_19:
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v9, "addObjectsFromArray:", v10);
    v23 = 0;
  }
  else
  {
    v23 = v12;
  }

  return v23;
}

- (id)parseBucketValuesFromConfig:(id)a3 forBucketThresholds:(id)a4 isFeatureUsageDescriptor:(BOOL)a5 errors:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  TIMetricDescriptorParser *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v7 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  -[TIDescriptorParser parseArrayForKey:fromConfig:required:errors:](self, "parseArrayForKey:fromConfig:required:errors:", CFSTR("bucketValues"), v10, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    goto LABEL_25;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' cannot be specified for feature usage descriptors."), CFSTR("bucketValues"), v32);
LABEL_23:
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = self;
    v25 = v23;
    v26 = v11;
    goto LABEL_24;
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' cannot be specified without key '%@'."), CFSTR("bucketValues"), CFSTR("bucketThresholds"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = self;
    v25 = v23;
    v26 = 0;
LABEL_24:
    -[TIDescriptorParser errorWithMessage:andValue:](v24, "errorWithMessage:andValue:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v27);

    goto LABEL_25;
  }
  v16 = objc_msgSend(v14, "count");
  if (v16 != objc_msgSend(v11, "count") + 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' must contain one more value than key '%@'."), CFSTR("bucketValues"), CFSTR("bucketThresholds"));
    goto LABEL_23;
  }
  v33 = v10;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v15;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if ((!objc_msgSend(MEMORY[0x1E0DBDB38], "isString:", v22)
           || !objc_msgSend(v22, "length")
           || v19 && v19 != objc_opt_class())
          && (!objc_msgSend(MEMORY[0x1E0DBDB38], "isNumber:", v22) || v19 && v19 != objc_opt_class()))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' must contain values of the same data type."), CFSTR("bucketValues"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIDescriptorParser errorWithMessage:andValue:](self, "errorWithMessage:andValue:", v30, v11);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v31);

          goto LABEL_30;
        }
        v19 = objc_opt_class();
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v18)
        continue;
      break;
    }
  }
LABEL_30:

  v10 = v33;
LABEL_25:
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v12, "addObjectsFromArray:", v13);
    v28 = 0;
  }
  else
  {
    v28 = v15;
  }

  return v28;
}

- (void)findInvalidDependencyChain:(id)a3 forMetricDescriptor:(id)a4 fromMetricDescriptors:(id)a5 andInvalidMetricNames:(id)a6 invalidMetricDescriptors:(id)a7 errors:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  TIMetricDescriptorParser *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v40 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v19, "addObject:", v15);
  v39 = v17;
  if (objc_msgSend(v14, "containsObject:", v15))
  {
    -[TIMetricDescriptorParser descriptionFromDependencyChain:andDependencyName:](self, "descriptionFromDependencyChain:andDependencyName:", v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Circular dependency: %@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDescriptorParser errorWithMessage:](self, "errorWithMessage:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v22);

    objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v23);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = v18;
      v43 = v19;
      v41 = self;
      v37 = v15;
      v38 = v14;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend(v15, "calculationDependencies");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      v27 = v17;
      v26 = v40;
      if (v25)
      {
        v28 = v25;
        v29 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v45 != v29)
              objc_enumerationMutation(v24);
            v31 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend(v16, "objectForKey:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              -[TIMetricDescriptorParser findInvalidDependencyChain:forMetricDescriptor:fromMetricDescriptors:andInvalidMetricNames:invalidMetricDescriptors:errors:](v41, "findInvalidDependencyChain:forMetricDescriptor:fromMetricDescriptors:andInvalidMetricNames:invalidMetricDescriptors:errors:", v43, v32, v16, v26, v27, v42);
            }
            else if (objc_msgSend(v26, "containsObject:", v31))
            {
              -[TIMetricDescriptorParser descriptionFromDependencyChain:andDependencyName:](v41, "descriptionFromDependencyChain:andDependencyName:", v43, v31);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid dependency: %@"), v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[TIDescriptorParser errorWithMessage:](v41, "errorWithMessage:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "addObject:", v35);

              v27 = v39;
              objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "addObject:", v36);

              v26 = v40;
            }

          }
          v28 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v28);
      }

      v15 = v37;
      v14 = v38;
      v18 = v42;
      v19 = v43;
    }
  }

}

- (id)descriptionFromDependencyChain:(id)a3 andDependencyName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "metricName", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  if (v6)
    objc_msgSend(v7, "addObject:", v6);
  objc_msgSend(v7, "removeObjectAtIndex:", 0, (_QWORD)v16);
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" -> "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
