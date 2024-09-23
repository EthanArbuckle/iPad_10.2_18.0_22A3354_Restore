@implementation TIKBUserModelValues

- (TIKBUserModelValues)initWithInputMode:(id)a3 context:(id)a4 userModelDataStore:(id)a5 durableCounters:(id)a6 settingsDictionary:(id)a7
{
  id v12;
  id v13;
  TIKBUserModelValues *v14;
  id v15;
  uint64_t v16;
  NSMutableDictionary *stringValues;
  NSMutableDictionary *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  NSMutableDictionary *v28;
  void *v29;
  NSMutableDictionary *v30;
  void *v31;
  NSMutableDictionary *v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  objc_super v50;
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v50.receiver = self;
  v50.super_class = (Class)TIKBUserModelValues;
  v14 = -[TIUserModelValues initWithInputMode:context:userModelDataStore:durableCounters:settingsDictionary:](&v50, sel_initWithInputMode_context_userModelDataStore_durableCounters_settingsDictionary_, v12, v13, a5, a6, a7);
  if (v14)
  {
    v49 = v12;
    v15 = v13;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 8);
    v16 = objc_claimAutoreleasedReturnValue();
    stringValues = v14->_stringValues;
    v14->_stringValues = (NSMutableDictionary *)v16;

    v18 = v14->_stringValues;
    objc_msgSend(v15, "inputLanguage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v19, kFeatureStringKeyboardLanguage);

    v20 = v14->_stringValues;
    objc_msgSend(v15, "inputRegion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v21, kFeatureStringKeyboardRegion);

    v22 = v14->_stringValues;
    objc_msgSend(v15, "inputVariant");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v23, kFeatureStringKeyboardVariant);

    v24 = v14->_stringValues;
    objc_msgSend(v15, "secondaryLanguage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v25, kFeatureStringKeyboardSecondaryLanguage);

    v26 = v14->_stringValues;
    objc_msgSend(v15, "secondaryRegion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v27, kFeatureStringKeyboardSecondaryRegion);

    v28 = v14->_stringValues;
    objc_msgSend(v15, "layoutName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v29, kFeatureStringKeyboardLayout);

    v30 = v14->_stringValues;
    +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:](TIKBAnalyticsMetricsContext, "keyboardTypeEnumToString:", objc_msgSend(v15, "keyboardType"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v30, "setObject:forKey:", v31, kFeatureStringKeyboardType);

    v32 = v14->_stringValues;
    objc_msgSend(v15, "keyboardConfiguration");
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (!v33)
      v33 = CFSTR("None");
    v35 = (void *)-[__CFString copy](v33, "copy");
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v35, kFeatureStringKeyboardConfiguration);

    IXADefaultLogFacility();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v46 = (void *)MEMORY[0x1E0CB3940];
      -[NSMutableDictionary objectForKey:](v14->_stringValues, "objectForKey:", kFeatureStringKeyboardLanguage);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v14->_stringValues, "objectForKey:", kFeatureStringKeyboardRegion);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v14->_stringValues, "objectForKey:", kFeatureStringKeyboardVariant);
      v47 = v13;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v14->_stringValues, "objectForKey:", kFeatureStringKeyboardSecondaryLanguage);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v14->_stringValues, "objectForKey:", kFeatureStringKeyboardSecondaryRegion);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v14->_stringValues, "objectForKey:", kFeatureStringKeyboardLayout);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v14->_stringValues, "objectForKey:", kFeatureStringKeyboardType);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v14->_stringValues, "objectForKey:", kFeatureStringKeyboardConfiguration);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", CFSTR("%s TIKBUserModelValues created: %@ %@_%@-%@ %@_%@ %@ %@ %@"), "-[TIKBUserModelValues initWithInputMode:context:userModelDataStore:durableCounters:settingsDictionary:]", v49, v48, v37, v38, v39, v45, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v52 = v43;
      _os_log_impl(&dword_1DA6F2000, v36, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      v13 = v47;
    }

    v12 = v49;
  }

  return v14;
}

- (id)metricValue:(id)a3 userModel:(id)a4 forNumberOfDays:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  NSMutableDictionary *stringValues;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "isEqualToString:", kFeatureFloatingKeyboardUsage))
  {
    if (objc_msgSend(v8, "isEqualToString:", kFeatureStringTypingSpeed))
    {
      -[TIKBUserModelValues calcTypingSpeedFromUserModel:](self, "calcTypingSpeedFromUserModel:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    objc_msgSend(v9, "metricDescriptorRegistry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "metricDescriptorWithName:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (objc_msgSend(v13, "isMemberOfClass:", objc_opt_class()))
      {
        v14 = v13;
        objc_msgSend(v14, "configString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "configString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKBUserModelValues settingValueFromName:](self, "settingValueFromName:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v17, "BOOLValue"))
          {
            v11 = (id)*MEMORY[0x1E0DBEB00];

LABEL_25:
            goto LABEL_27;
          }

        }
        if (objc_msgSend(v14, "discoveryThreshold") < 1)
          goto LABEL_21;
        objc_msgSend(v14, "discoveryCounter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          goto LABEL_21;
        -[TIUserModelValues durableCounters](self, "durableCounters");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "discoveryCounter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "count");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "intValue");

        if (objc_msgSend(v14, "discoveryThreshold") > v23)
        {
          v24 = (id)*MEMORY[0x1E0DBEB08];
        }
        else
        {
LABEL_21:
          -[TIKBUserModelValues computeValueWithDescriptor:userModel:forNumberOfDays:](self, "computeValueWithDescriptor:userModel:forNumberOfDays:", v14, v9, *MEMORY[0x1E0DBEAB8]);
          v24 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_24:
        v11 = v24;
        goto LABEL_25;
      }
      if (objc_msgSend(v13, "isMemberOfClass:", objc_opt_class()))
      {
        -[TIKBUserModelValues computeValueWithDescriptor:userModel:forNumberOfDays:](self, "computeValueWithDescriptor:userModel:forNumberOfDays:", v13, v9, v5);
        v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

        goto LABEL_28;
      }
      if (objc_msgSend(v13, "isMemberOfClass:", objc_opt_class()))
      {
        stringValues = self->_stringValues;
        objc_msgSend(v13, "contextFieldName");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](stringValues, "objectForKey:", v14);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      if (objc_msgSend(v13, "isMemberOfClass:", objc_opt_class()))
      {
        objc_msgSend(v13, "settingName");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        -[TIKBUserModelValues settingValueFromName:](self, "settingValueFromName:", v14);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
    }
    v11 = 0;
    goto LABEL_27;
  }
  -[TIKBUserModelValues calcFloatingKeyboardUsageFromUserModel:](self, "calcFloatingKeyboardUsageFromUserModel:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v11 = (id)v10;
LABEL_28:

  return v11;
}

- (id)settingValueFromName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", kSettingValueAutocorrectionEnabled))
  {
    -[TIKBUserModelValues calcAutocorrectionEnabled](self, "calcAutocorrectionEnabled");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKBUserModelValues;
    -[TIUserModelValues settingValueFromName:](&v8, sel_settingValueFromName_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)persistForDate:(id)a3
{
  NSObject *v4;
  void *v5;
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
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)TIKBUserModelValues;
  -[TIUserModelValues persistForDate:](&v16, sel_persistForDate_, a3);
  IXADefaultLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[TIUserModelValues inputMode](self, "inputMode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_stringValues, "objectForKey:", kFeatureStringKeyboardLanguage);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_stringValues, "objectForKey:", kFeatureStringKeyboardRegion);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_stringValues, "objectForKey:", kFeatureStringKeyboardVariant);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_stringValues, "objectForKey:", kFeatureStringKeyboardSecondaryLanguage);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_stringValues, "objectForKey:", kFeatureStringKeyboardSecondaryRegion);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_stringValues, "objectForKey:", kFeatureStringKeyboardLayout);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_stringValues, "objectForKey:", kFeatureStringKeyboardType);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_stringValues, "objectForKey:", kFeatureStringKeyboardConfiguration);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%s TIKBUserModelValues persisted: %@ %@_%@-%@ %@_%@ %@ %@ %@"), "-[TIKBUserModelValues persistForDate:]", v15, v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v13;
    _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
}

- (id)metricValuesByWordLength:(id)a3 userModel:(id)a4 forNumberOfDays:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "metricDescriptorRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "metricDescriptorWithName:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v11, "isMemberOfClass:", objc_opt_class()))
  {
    -[TIKBUserModelValues computeValuesByWordLengthWithDescriptor:userModel:forNumberOfDays:](self, "computeValuesByWordLengthWithDescriptor:userModel:forNumberOfDays:", v11, v8, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)computeValueWithDescriptor:(id)a3 userModel:(id)a4 forNumberOfDays:(int)a5
{
  uint64_t v5;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v5 = *(_QWORD *)&a5;
  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "calculationExpression");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB35D0];
    objc_msgSend(v8, "calculationExpression");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "expressionWithFormat:", v12);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "calculationPrecondition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v8, "calculationPrecondition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "predicateWithFormat:", v15);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v34 = 0;
    }

    objc_msgSend(v8, "calculationDefaultValue");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v36 = v8;
    objc_msgSend(v8, "calculationDependencies");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          -[TIKBUserModelValues metricValue:userModel:forNumberOfDays:](self, "metricValue:userModel:forNumberOfDays:", v28, v9, v5, v33);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKey:", v29, v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v25);
    }

    v8 = v36;
    objc_msgSend(v36, "bucketThresholds");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bucketValues");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKBUserModelValues computeValueFromExpression:precondition:defaultValue:bindings:bucketThresholds:bucketValues:](self, "computeValueFromExpression:precondition:defaultValue:bindings:bucketThresholds:bucketValues:", v35, v34, v33, v22, v30, v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "metricName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadedDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIUserModelValues aggregatedCountFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:](self, "aggregatedCountFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v16, v5, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "bucketThresholds");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bucketValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKBUserModelValues computeValueFromCount:bucketThresholds:bucketValues:](self, "computeValueFromCount:bucketThresholds:bucketValues:", v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

- (id)computeValuesByWordLengthWithDescriptor:(id)a3 userModel:(id)a4 forNumberOfDays:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  TIKBUserModelValues *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  TIKBUserModelValues *v34;
  void *v35;
  uint64_t k;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  TIKBUserModelValues *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v5 = *(_QWORD *)&a5;
  v81 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v8, "calculationExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = v8;
  if (v11)
  {
    v65 = self;
    v63 = v10;
    v12 = (void *)objc_opt_new();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    objc_msgSend(v8, "calculationDependencies");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v71 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
          -[TIKBUserModelValues metricValuesByWordLength:userModel:forNumberOfDays:](v65, "metricValuesByWordLength:userModel:forNumberOfDays:", v18, v9, v5);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v19, v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
      }
      while (v15);
    }

    v20 = (void *)MEMORY[0x1E0CB35D0];
    objc_msgSend(v8, "calculationExpression");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "expressionWithFormat:", v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "calculationPrecondition");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v9;
    if (v23)
    {
      v24 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v8, "calculationPrecondition");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "predicateWithFormat:", v25);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v62 = 0;
    }

    objc_msgSend(v8, "calculationDefaultValue");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = *MEMORY[0x1E0DBEB38];
    if (*MEMORY[0x1E0DBEB38])
    {
      v41 = 0;
      v59 = v22;
      do
      {
        v42 = (void *)objc_opt_new();
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        objc_msgSend(v8, "calculationDependencies");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v67;
          do
          {
            for (j = 0; j != v45; ++j)
            {
              if (*(_QWORD *)v67 != v46)
                objc_enumerationMutation(v43);
              v48 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j);
              objc_msgSend(v12, "objectForKey:", v48, v57);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "objectAtIndexedSubscript:", v41);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "setObject:forKey:", v50, v48);

            }
            v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
          }
          while (v45);
        }

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v41);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKey:", v51, CFSTR("index"));

        v8 = v64;
        objc_msgSend(v64, "bucketThresholds");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "bucketValues");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v59;
        -[TIKBUserModelValues computeValueFromExpression:precondition:defaultValue:bindings:bucketThresholds:bucketValues:](v65, "computeValueFromExpression:precondition:defaultValue:bindings:bucketThresholds:bucketValues:", v59, v62, v61, v42, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v63, "addObject:", v54);
        ++v41;
      }
      while (v41 != v60);
    }

    v9 = v57;
    v10 = v63;
  }
  else
  {
    objc_msgSend(v8, "metricName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadedDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIUserModelValues countsFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:](self, "countsFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v26, v5, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = self;
    -[TIKBUserModelValues bucketCountsByWordLength:](self, "bucketCountsByWordLength:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v22 = v30;
    v31 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
    if (v31)
    {
      v32 = v31;
      v58 = v9;
      v33 = *(_QWORD *)v75;
      v34 = v29;
      do
      {
        v35 = v22;
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v75 != v33)
            objc_enumerationMutation(v35);
          v37 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * k);
          objc_msgSend(v8, "bucketThresholds", v58);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "bucketValues");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKBUserModelValues computeValueFromCount:bucketThresholds:bucketValues:](v34, "computeValueFromCount:bucketThresholds:bucketValues:", v37, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "addObject:", v40);
        }
        v22 = v35;
        v32 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
      }
      while (v32);
      v12 = v35;
      v9 = v58;
    }
    else
    {
      v12 = v22;
    }
  }

  v55 = (void *)objc_msgSend(v10, "copy");
  return v55;
}

- (id)bucketCountsByWordLength:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  -[TIKBUserModelValues kbContext](self, "kbContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("zh")))
    v7 = &unk_1EA1401E0;
  else
    v7 = &unk_1EA1401F8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1EA140210);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DBEB30];
  if (*MEMORY[0x1E0DBEB30])
  {
    v10 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");
      objc_msgSend(v4, "objectAtIndexedSubscript:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue") + v14;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:atIndexedSubscript:", v17, v12);

      ++v10;
    }
    while (v9 != v10);
  }

  return v8;
}

- (id)computeValueFromCount:(id)a3 bucketThresholds:(id)a4 bucketValues:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DBDB38], "bucketNumber:bucketThresholds:bucketValues:", a3, a4, a5);
}

- (id)computeValueFromExpression:(id)a3 precondition:(id)a4 defaultValue:(id)a5 bindings:(id)a6 bucketThresholds:(id)a7 bucketValues:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = v15;
  if (!v14 || (v20 = v19, objc_msgSend(v14, "evaluateWithObject:", v16)))
  {
    objc_msgSend(v13, "expressionValueWithObject:context:", v16, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DBDB38], "bucketNumber:bucketThresholds:bucketValues:", v20, v17, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)calcFloatingKeyboardUsageFromUserModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  int v67;
  id *v68;
  id obj;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TIKBUserModelValues kbContext](self, "kbContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 1)
  {
    -[TIKBUserModelValues kbContext](self, "kbContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "keyboardType");

    if (v8 == 3)
    {
      v9 = kFeatureCounterWithWordLenWordsTypedOnFloatingKeyboard;
      v10 = (unsigned int *)MEMORY[0x1E0DBEAB8];
      v11 = *MEMORY[0x1E0DBEAB8];
      objc_msgSend(v4, "loadedDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIUserModelValues aggregatedCountFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:](self, "aggregatedCountFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v9, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;

      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      objc_msgSend(v4, "contexts");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
      v17 = 0.0;
      if (v16)
      {
        v18 = v16;
        v19 = *(_QWORD *)v72;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v72 != v19)
              objc_enumerationMutation(obj);
            v21 = *(id *)(*((_QWORD *)&v71 + 1) + 8 * v20);
            if (objc_msgSend(v21, "userInterfaceIdiom") == 1)
            {
              objc_msgSend(v4, "valuesFromContext:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = kFeatureValueWithWordLenWholeWordsPathed;
              v24 = *v10;
              objc_msgSend(v4, "loadedDate");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "aggregatedCountFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v23, v24, v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "doubleValue");
              v28 = v17 + v27;

              v29 = kFeatureValueWithWordLenWordCompletionsPathed;
              v30 = *v10;
              objc_msgSend(v4, "loadedDate");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "aggregatedCountFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v29, v30, v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "doubleValue");
              v34 = v28 + v33;

              v35 = kFeatureValueWithWordLenPathEligibleWordsTapped;
              v36 = *v10;
              objc_msgSend(v4, "loadedDate");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "aggregatedCountFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v35, v36, v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "doubleValue");
              v40 = v34 + v39;

              v41 = kFeatureValueWithWordLenPathIneligibleWordsTapped;
              v42 = *v10;
              objc_msgSend(v4, "loadedDate");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "aggregatedCountFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v41, v42, v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "doubleValue");
              v17 = v40 + v45;

            }
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
        }
        while (v18);
      }

      v46 = v15 / v17;
      if (v17 == 0.0)
        v47 = 0.0;
      else
        v47 = v15 / v17;
      v48 = (void *)MEMORY[0x1E0C99D20];
      LODWORD(v46) = 1008981770;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v50) = 1045220557;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v52) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v54) = 1058642330;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v56) = 1061997773;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v58) = 1065185444;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "arrayWithObjects:", v49, v51, v53, v55, v57, v59, 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0DBEAF0], *MEMORY[0x1E0DBEAE8], *MEMORY[0x1E0DBEAC8], *MEMORY[0x1E0DBEAD0], *MEMORY[0x1E0DBEAC0], *MEMORY[0x1E0DBEAE0], *MEMORY[0x1E0DBEAD8], 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (void *)MEMORY[0x1E0DBDB38];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "bucketNumber:bucketThresholds:bucketValues:", v63, v60, v61);
      v64 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)*MEMORY[0x1E0DBEB40], "stringByAppendingString:", kFeatureCounterTotalWordsTypedOnFloatingKeyboard);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIUserModelValues userModelDataStore](self, "userModelDataStore");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "getDurableValueForKey:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v61, "value");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v63, "intValue");
      v68 = (id *)MEMORY[0x1E0DBEAF0];
      if (v67 <= 0)
        v68 = (id *)MEMORY[0x1E0DBEB08];
      v64 = *v68;
    }
    v65 = v64;

  }
  else
  {
    v65 = (id)*MEMORY[0x1E0DBEB10];
  }

  return v65;
}

- (id)calcTypingSpeedFromUserModel:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  int v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  int v73;
  int v74;

  v4 = a3;
  v5 = kFeatureCounterDurationPathedWords;
  v6 = (unsigned int *)MEMORY[0x1E0DBEAB8];
  v7 = *MEMORY[0x1E0DBEAB8];
  objc_msgSend(v4, "loadedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIUserModelValues countsFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:](self, "countsFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v5, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = kFeatureCounterDurationTappedWords;
  v11 = *v6;
  objc_msgSend(v4, "loadedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIUserModelValues countsFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:](self, "countsFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v10, v11, v12);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = kFeatureValueWithWordLenWholeWordsPathed;
  v14 = *v6;
  objc_msgSend(v4, "loadedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  v17 = (void *)v9;
  -[TIUserModelValues countsFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:](self, "countsFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v16, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = kFeatureValueWithWordLenWordCompletionsPathed;
  v20 = *v6;
  objc_msgSend(v4, "loadedDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIUserModelValues countsFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:](self, "countsFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = kFeatureValueWithWordLenPathEligibleWordsTapped;
  v24 = *v6;
  objc_msgSend(v4, "loadedDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIUserModelValues countsFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:](self, "countsFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v23, v24, v25);
  v26 = objc_claimAutoreleasedReturnValue();

  v27 = kFeatureValueWithWordLenPathIneligibleWordsTapped;
  v28 = *v6;
  v66 = v4;
  objc_msgSend(v4, "loadedDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIUserModelValues countsFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:](self, "countsFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(v17, "count");
  v69 = (void *)v26;
  v70 = v18;
  if (v31)
  {
    v32 = 0;
    v67 = v31;
    v68 = v30;
    v33 = 0;
    v34 = 0;
    do
    {
      objc_msgSend(v18, "objectAtIndex:", v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v35, "intValue");
      objc_msgSend(v22, "objectAtIndex:", v32);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v36, "intValue");

      objc_msgSend(v17, "objectAtIndex:", v32);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v37, "intValue");

      objc_msgSend(v69, "objectAtIndex:", v32);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "intValue");
      objc_msgSend(v68, "objectAtIndex:", v32);
      v40 = v17;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v22;
      v43 = objc_msgSend(v41, "intValue");

      objc_msgSend(v71, "objectAtIndex:", v32);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v41) = objc_msgSend(v44, "intValue");

      v45 = v39 + v43;
      v22 = v42;
      v33 += (v73 + v74 + v45) * (v32 + 1);
      v18 = v70;
      v34 += v72 + (_DWORD)v41;
      v17 = v40;
      ++v32;
    }
    while (v67 != v32);
    v46 = (double)v34;
    v47 = (double)v33;
    v30 = v68;
  }
  else
  {
    v46 = 0.0;
    v47 = 0.0;
  }
  v48 = v47 / (v46 / 1000.0) / 5.0;
  v49 = v48 * 60.0;
  v50 = (void *)MEMORY[0x1E0C99D20];
  LODWORD(v48) = 5.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v52) = 10.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v54) = 20.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v56) = 1109393408;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v58) = 1117782016;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "arrayWithObjects:", v51, v53, v55, v57, v59, 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", kFeatureStringTypingSpeedVerySlow, kFeatureStringTypingSpeedSlow, kFeatureStringTypingSpeedMedium, kFeatureStringTypingSpeedFast, kFeatureStringTypingSpeedVeryFast, kFeatureStringTypingSpeedUnusual, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)MEMORY[0x1E0DBDB38];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "bucketNumber:bucketThresholds:bucketValues:", v63, v60, v61);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  return v64;
}

- (id)calcAutocorrectionEnabled
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;

  -[TIKBUserModelValues kbContext](self, "kbContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyboardType");

  -[TIUserModelValues settingsDictionary](self, "settingsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = (_QWORD *)MEMORY[0x1E0DBDF70];
  if (v4 != 5)
    v7 = (_QWORD *)MEMORY[0x1E0DBE1D8];
  objc_msgSend(v5, "objectForKey:", *v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValues, 0);
}

@end
