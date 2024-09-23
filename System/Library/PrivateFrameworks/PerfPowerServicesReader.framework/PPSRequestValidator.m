@implementation PPSRequestValidator

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  return (id)sharedInstance__sharedValidator;
}

void __37__PPSRequestValidator_sharedInstance__block_invoke()
{
  PPSRequestValidator *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[10];
  _QWORD v5[11];

  v5[10] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(PPSRequestValidator);
  v1 = (void *)sharedInstance__sharedValidator;
  sharedInstance__sharedValidator = (uint64_t)v0;

  v4[0] = &unk_25143FFB8;
  v5[0] = objc_opt_class();
  v4[1] = &unk_25143FFD0;
  v5[1] = objc_opt_class();
  v4[2] = &unk_25143FFE8;
  v5[2] = objc_opt_class();
  v4[3] = &unk_251440000;
  v5[3] = objc_opt_class();
  v4[4] = &unk_251440018;
  v5[4] = objc_opt_class();
  v4[5] = &unk_251440030;
  v5[5] = objc_opt_class();
  v4[6] = &unk_251440048;
  v5[6] = objc_opt_class();
  v4[7] = &unk_251440060;
  v5[7] = objc_opt_class();
  v4[8] = &unk_251440078;
  v5[8] = objc_opt_class();
  v4[9] = &unk_251440090;
  v5[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 10);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)kMetricDataTypeToClass;
  kMetricDataTypeToClass = v2;

}

- (BOOL)validateDataRequest:(id)a3 filepath:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  _BOOL4 v15;
  id v16;
  _BOOL4 v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  unint64_t v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id obj;
  id obja;
  id *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  id v75;
  id v76;
  id v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;
  _QWORD v81[3];

  v81[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "subsystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "category");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueFilter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSPredicateUtilities keyPathsAndValuesForPredicate:](PPSPredicateUtilities, "keyPathsAndValuesForPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[PPSEntitlementChecker checkForEntitlement:](PPSEntitlementChecker, "checkForEntitlement:", CFSTR("com.apple.PerfPowerServices.data-read")))
  {
    v27 = (void *)MEMORY[0x24BDD1540];
    v80 = *MEMORY[0x24BDD0FC8];
    v81[0] = CFSTR("Missing read entitlement");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, &v80, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerServicesReader.request"), 257, v28);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_20;
    goto LABEL_16;
  }
  v64 = a5;
  if (!v7)
  {
    v29 = (void *)MEMORY[0x24BDD1540];
    v30 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Null request."));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dictionaryWithObject:forKey:", v31, *MEMORY[0x24BDD0FC8]);
    v32 = v12;
    v33 = v11;
    v34 = v8;
    v35 = v9;
    v36 = v10;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerServicesReader.request"), 1, v37);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v10 = v36;
    v9 = v35;
    v8 = v34;
    v11 = v33;
    v12 = v32;

    goto LABEL_15;
  }
  v77 = 0;
  v13 = +[PPSRequestValidator _validateFilepath:error:](PPSRequestValidator, "_validateFilepath:error:", v8, &v77);
  v14 = v77;
  if (!v13)
    goto LABEL_15;
  v76 = v14;
  v15 = +[PPSRequestValidator _validateRequestType:error:](PPSRequestValidator, "_validateRequestType:error:", objc_msgSend(v7, "requestType"), &v76);
  v16 = v76;

  if (!v15)
    goto LABEL_14;
  v75 = v16;
  v17 = +[PPSRequestValidator _validatePredicateRequiredKey:value:error:](PPSRequestValidator, "_validatePredicateRequiredKey:value:error:", CFSTR("subsystem"), v9, &v75);
  v14 = v75;

  if (!v17)
    goto LABEL_15;
  v74 = v14;
  v18 = +[PPSRequestValidator _validatePredicateRequiredKey:value:error:](PPSRequestValidator, "_validatePredicateRequiredKey:value:error:", CFSTR("category"), v10, &v74);
  v16 = v74;

  if (!v18)
  {
LABEL_14:
    v14 = v16;
LABEL_15:
    a5 = v64;
    if (!v14)
      goto LABEL_20;
    goto LABEL_16;
  }
  v57 = v16;
  if (objc_msgSend(v7, "requestType") == 2)
  {
    objc_msgSend(v7, "metrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v10;
    v21 = objc_msgSend(v19, "count");

    v22 = v21 >= 2;
    v10 = v20;
    if (v22)
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v24 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Interval-set requests only support a single metric."));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dictionaryWithObject:forKey:", v25, *MEMORY[0x24BDD0FC8]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v20;
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerServicesReader.request"), 5, v26);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
  }
  v56 = v12;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  objc_msgSend(v7, "metrics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v71;
    while (2)
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v71 != v42)
          objc_enumerationMutation(obj);
        v44 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
        if (!objc_msgSend((id)objc_opt_class(), "_isMetricDefinedForFilepath:subsystem:category:name:", v8, v9, v10, v44))
        {
          v52 = (void *)MEMORY[0x24BDD1540];
          v53 = (void *)MEMORY[0x24BDBCE70];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Select metric '%@' is not defined for subsystem='%@', category='%@'"), v44, v9, v10);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "dictionaryWithObject:forKey:", v54, *MEMORY[0x24BDD0FC8]);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerServicesReader.request"), 3, v55);
          v14 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_45;
        }
      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
      if (v41)
        continue;
      break;
    }
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v61 = v56;
  v60 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
  if (v60)
  {
    v58 = v10;
    v59 = *(_QWORD *)v67;
    v45 = v57;
    while (2)
    {
      v46 = 0;
      v47 = v45;
      do
      {
        if (*(_QWORD *)v67 != v59)
          objc_enumerationMutation(v61);
        v48 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v46);
        obja = (id)MEMORY[0x2494FEED8]();
        if (v8)
          +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:subsystem:category:metricName:](PPSOffDeviceIngesterUtilities, "metricDefinitionForFilepath:subsystem:category:metricName:", v8, v9, v10, v48);
        else
          +[PPSOnDeviceIngesterUtilities metricDefinitionForSubsystem:category:metricName:](PPSOnDeviceIngesterUtilities, "metricDefinitionForSubsystem:category:metricName:", v9, v10, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "objectForKeyedSubscript:", v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v47;
        v51 = +[PPSRequestValidator _validatePredicateValue:metricDefinition:error:](PPSRequestValidator, "_validatePredicateValue:metricDefinition:error:", v50, v49, &v65);
        v45 = v65;

        objc_autoreleasePoolPop(obja);
        if (!v51)
        {
          v10 = v58;
          goto LABEL_44;
        }
        ++v46;
        v47 = v45;
        v10 = v58;
      }
      while (v60 != v46);
      v60 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
      if (v60)
        continue;
      break;
    }
  }
  else
  {
    v45 = v57;
  }
LABEL_44:

  v14 = v45;
LABEL_45:
  a5 = v64;
  v12 = v56;
  if (v14)
  {
LABEL_16:
    PPSReaderLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      -[PPSRequestValidator validateDataRequest:filepath:withError:].cold.1((uint64_t)v14, v38);

    if (a5)
      *a5 = objc_retainAutorelease(v14);
  }
LABEL_20:

  return v14 == 0;
}

+ (BOOL)_isMetricDefinedForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("BLD")) & 1) != 0
    || (objc_msgSend(v12, "isEqualToString:", CFSTR("timestamp")) & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    if (v9)
      +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:subsystem:category:metricName:](PPSOffDeviceIngesterUtilities, "metricDefinitionForFilepath:subsystem:category:metricName:", v9, v10, v11, v12);
    else
      +[PPSOnDeviceIngesterUtilities metricDefinitionForSubsystem:category:metricName:](PPSOnDeviceIngesterUtilities, "metricDefinitionForSubsystem:category:metricName:", v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14 != 0;

  }
  return v13;
}

+ (BOOL)_validateFilepath:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByExpandingTildeInPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

    if (a4 && (v8 & 1) == 0)
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File doesn't exist: '%@'"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dictionaryWithObject:forKey:", v11, *MEMORY[0x24BDD0FC8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerServicesReader.request"), 5, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)_validatePredicateRequiredKey:(id)a3 value:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (!a4 && a5)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing required field in predicate: '%@'."), a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithObject:forKey:", v9, *MEMORY[0x24BDD0FC8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerServicesReader.request"), 3, v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return a4 != 0;
}

+ (BOOL)_validatePredicateValue:(id)a3 metricDefinition:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  objc_class *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 1;
  if (v7 && v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "datatype"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)(id)objc_msgSend((id)kMetricDataTypeToClass, "objectForKey:", v11);
    objc_opt_class();
    if (((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v7, "isEqualToString:", &stru_251431358) & 1) == 0)
      && (objc_opt_isKindOfClass() & 1) == 0)
    {
      PPSReaderLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v9, "subsystem");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "category");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v12);
        *(_DWORD *)buf = 138413314;
        v28 = v26;
        v29 = 2112;
        v30 = v21;
        v31 = 2112;
        v32 = v25;
        v33 = 2114;
        v34 = v23;
        v35 = 2114;
        v36 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v36;
        _os_log_debug_impl(&dword_2439D9000, v13, OS_LOG_TYPE_DEBUG, "Validation: Type mismatch for metric '%@::%@::%@' -- %{public}@ != %{public}@ (expected)", buf, 0x34u);

      }
      if (a5)
      {
        v14 = (void *)MEMORY[0x24BDD1540];
        v15 = (void *)MEMORY[0x24BDBCE70];
        v16 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v9, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("Mismatch between value type of '%@' in predicate and its metric definition."), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dictionaryWithObject:forKey:", v18, *MEMORY[0x24BDD0FC8]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerServicesReader.request"), 3, v19);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v10 = 0;
    }

  }
  return v10;
}

+ (BOOL)_validateRequestType:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if ((unint64_t)a3 >= 3 && a4)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid request type."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithObject:forKey:", v8, *MEMORY[0x24BDD0FC8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerServicesReader.request"), 2, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (unint64_t)a3 < 3;
}

- (void)validateDataRequest:(uint64_t)a1 filepath:(NSObject *)a2 withError:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_2439D9000, a2, OS_LOG_TYPE_DEBUG, "Request validation error: %@", (uint8_t *)&v2, 0xCu);
}

@end
