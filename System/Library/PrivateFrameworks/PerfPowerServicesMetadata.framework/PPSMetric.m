@implementation PPSMetric

- (int)datatype
{
  return self->_datatype;
}

- (double)version
{
  return self->_version;
}

- (BOOL)filterEntryLogging
{
  return self->_filterEntryLogging;
}

+ (id)metricsWithPlist:(id)a3 subsystem:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v35[4];
  id v36;
  id v37;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v5);
    v8 = v7;
    if (v7)
    {
      -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("metrics"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x24BDAC760];
          v35[1] = 3221225472;
          v35[2] = __47__PPSMetric_Plist__metricsWithPlist_subsystem___block_invoke;
          v35[3] = &unk_25141DBD8;
          v36 = v6;
          v11 = v10;
          v37 = v11;
          -[NSObject enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", v35);
          v12 = v37;
          v13 = v11;

LABEL_15:
          goto LABEL_16;
        }
      }
      PPSStorageLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[PPSMetric(Plist) metricsWithPlist:subsystem:].cold.3((uint64_t)v9, v21, v22, v23, v24, v25, v26, v27);

    }
    else
    {
      PPSStorageLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[PPSMetric(Plist) metricsWithPlist:subsystem:].cold.2((uint64_t)v5, v9, v28, v29, v30, v31, v32, v33);
    }
    v13 = 0;
    goto LABEL_15;
  }
  PPSStorageLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[PPSMetric(Plist) metricsWithPlist:subsystem:].cold.1(v8, v14, v15, v16, v17, v18, v19, v20);
  v13 = 0;
LABEL_16:

  return v13;
}

- (PPSMetric)initWithName:(id)a3 subsystem:(id)a4 category:(id)a5 version:(double)a6 datatype:(int)a7 unit:(id)a8 cadence:(id)a9 directionality:(int)a10 storage:(int)a11 timeToLive:(unsigned int)a12 mode:(int)a13 deviceCapability:(int)a14 population:(int)a15 obfuscation:(int)a16 privacyClassification:(int)a17 optionalPayload:(id)a18
{
  uint64_t v20;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  PPSMetric *v31;
  PPSMetric *v32;
  PPSMetric *v33;
  PPSMetric *v34;
  int v36;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v20 = *(_QWORD *)&a7;
  v25 = a3;
  v26 = a4;
  v27 = a5;
  v40 = a8;
  v39 = a9;
  v38 = a18;
  if (!+[PPSMetric isValidName:](PPSMetric, "isValidName:", v25)
    || !+[PPSMetric isValidSubsystem:](PPSMetric, "isValidSubsystem:", v26)
    || !+[PPSMetric isValidCategory:](PPSMetric, "isValidCategory:", v27)
    || !+[PPSMetric isValidDatatype:](PPSMetric, "isValidDatatype:", v20)
    || !+[PPSMetric isValidDirectionality:](PPSMetric, "isValidDirectionality:")
    || !+[PPSMetric isValidStorage:](PPSMetric, "isValidStorage:")
    || !+[PPSMetric isValidMode:](PPSMetric, "isValidMode:")
    || !+[PPSMetric isValidPopulation:](PPSMetric, "isValidPopulation:")
    || !+[PPSMetric isValidDeviceCapability:](PPSMetric, "isValidDeviceCapability:")
    || !+[PPSMetric isValidObfuscation:](PPSMetric, "isValidObfuscation:"))
  {
    v28 = v25;
    goto LABEL_21;
  }
  v36 = v20;
  v28 = v25;
  if (!+[PPSMetric isValidPrivacyClassification:](PPSMetric, "isValidPrivacyClassification:", a17))
  {
LABEL_21:
    v29 = v26;
    goto LABEL_22;
  }
  v29 = v26;
  if (!+[PPSMetric isValidVersion:](PPSMetric, "isValidVersion:", a6))
  {
LABEL_22:
    v30 = v27;
    goto LABEL_23;
  }
  v30 = v27;
  if (!+[PPSMetric isValidTTL:](PPSMetric, "isValidTTL:", a12))
    goto LABEL_23;
  v31 = 0;
  if (!v40 || !v39)
    goto LABEL_24;
  if (!+[PPSMetric isValidOptionalPayload:](PPSMetric, "isValidOptionalPayload:", v38))
  {
LABEL_23:
    v31 = 0;
LABEL_24:
    v34 = self;
    goto LABEL_25;
  }
  v41.receiver = self;
  v41.super_class = (Class)PPSMetric;
  v32 = -[PPSMetric init](&v41, sel_init);
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_name, a3);
    objc_storeStrong((id *)&v33->_subsystem, a4);
    objc_storeStrong((id *)&v33->_category, a5);
    v33->_version = a6;
    v33->_datatype = v36;
    objc_storeStrong((id *)&v33->_unit, a8);
    objc_storeStrong((id *)&v33->_cadence, a9);
    v33->_directionality = a10;
    v33->_storage = a11;
    v33->_timeToLive = a12;
    v33->_mode = a13;
    v33->_deviceCapability = a14;
    v33->_enabledPopulation = a15;
    v33->_obfuscation = a16;
    v33->_privacyClassification = a17;
    -[PPSMetric addOptionalFields:](v33, "addOptionalFields:", v38);
  }
  v34 = v33;
  v31 = v34;
LABEL_25:

  return v31;
}

- (PPSMetric)initWithName:(id)a3 version:(double)a4 datatype:(int)a5 unit:(id)a6 baseMetric:(id)a7 optionalPayload:(id)a8
{
  uint64_t v11;
  id v15;
  id v16;
  id v17;
  id v18;
  _BOOL4 v19;
  PPSMetric *v20;
  PPSMetric *v21;
  PPSMetric *v22;
  uint64_t v23;
  NSString *subsystem;
  uint64_t v25;
  NSString *category;
  uint64_t v27;
  PPSCadence *cadence;
  uint64_t v29;
  NSString *source;
  objc_super v32;

  v11 = *(_QWORD *)&a5;
  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!v17
    || !+[PPSMetric isValidName:](PPSMetric, "isValidName:", v15)
    || !+[PPSMetric isValidDatatype:](PPSMetric, "isValidDatatype:", v11))
  {
    goto LABEL_10;
  }
  v19 = +[PPSMetric isValidVersion:](PPSMetric, "isValidVersion:", a4);
  v20 = 0;
  if (!v16 || !v19)
    goto LABEL_11;
  if (!+[PPSMetric isValidOptionalPayload:](PPSMetric, "isValidOptionalPayload:", v18))
  {
LABEL_10:
    v20 = 0;
    goto LABEL_11;
  }
  v32.receiver = self;
  v32.super_class = (Class)PPSMetric;
  v21 = -[PPSMetric init](&v32, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_name, a3);
    objc_msgSend(v17, "subsystem");
    v23 = objc_claimAutoreleasedReturnValue();
    subsystem = v22->_subsystem;
    v22->_subsystem = (NSString *)v23;

    objc_msgSend(v17, "category");
    v25 = objc_claimAutoreleasedReturnValue();
    category = v22->_category;
    v22->_category = (NSString *)v25;

    v22->_version = a4;
    v22->_datatype = v11;
    objc_storeStrong((id *)&v22->_unit, a6);
    objc_msgSend(v17, "cadence");
    v27 = objc_claimAutoreleasedReturnValue();
    cadence = v22->_cadence;
    v22->_cadence = (PPSCadence *)v27;

    v22->_directionality = objc_msgSend(v17, "directionality");
    v22->_storage = objc_msgSend(v17, "storage");
    v22->_timeToLive = objc_msgSend(v17, "timeToLive");
    v22->_mode = objc_msgSend(v17, "mode");
    objc_msgSend(v17, "source");
    v29 = objc_claimAutoreleasedReturnValue();
    source = v22->_source;
    v22->_source = (NSString *)v29;

    v22->_deviceCapability = objc_msgSend(v17, "deviceCapability");
    v22->_enabledPopulation = objc_msgSend(v17, "enabledPopulation");
    v22->_obfuscation = 1;
    v22->_privacyClassification = objc_msgSend(v17, "privacyClassification");
    -[PPSMetric addOptionalFields:](v22, "addOptionalFields:", v18);
  }
  self = v22;
  v20 = self;
LABEL_11:

  return v20;
}

- (int)storage
{
  return self->_storage;
}

- (int)mode
{
  return self->_mode;
}

- (unsigned)timeToLive
{
  return self->_timeToLive;
}

- (void)addOptionalFields:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int auxiliaryType;
  void *v24;

  v4 = a3;
  if (v4)
  {
    v24 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EnumMapping"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("EnumMapping"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addEnumMapping:](self, "addEnumMapping:", v6);

    }
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Source"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Source"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addSource:](self, "addSource:", v8);

    }
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Rounding"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Rounding"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addRounding:](self, "addRounding:", v10);

    }
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("GroupingDimensions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("GroupingDimensions"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addGroupingDimensions:](self, "addGroupingDimensions:", v12);

    }
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("MetricType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("MetricType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addMetricType:](self, "addMetricType:", v14);

    }
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AuxiliaryType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AuxiliaryType"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addAuxiliaryType:](self, "addAuxiliaryType:", v16);

    }
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FilterEntryLogging"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FilterEntryLogging"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addFilterEntryLogging:](self, "addFilterEntryLogging:", v18);

    }
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("DMACompliant"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("DMACompliant"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addDMACompliant:](self, "addDMACompliant:", v20);

    }
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FixedArraySize"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FixedArraySize"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetric addFixedArraySize:](self, "addFixedArraySize:", v22);

    }
    auxiliaryType = self->_auxiliaryType;
    if (auxiliaryType <= 1)
      auxiliaryType = 1;
    self->_auxiliaryType = auxiliaryType;

  }
  else
  {
    self->_auxiliaryType = 1;
    self->_filterEntryLogging = 0;

  }
}

+ (BOOL)isValidVersion:(double)a3
{
  void *v4;
  double v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  if (v6 != a3)
  {
    PPSMetricLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidVersion:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  return v6 == a3;
}

+ (BOOL)isValidOptionalPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_11;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EnumMapping"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PPSMetric isValidEnumDeclaration:](PPSMetric, "isValidEnumDeclaration:", v5);

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Rounding"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PPSMetric isValidRounding:](PPSMetric, "isValidRounding:", v7);

    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Source"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = +[PPSMetric isValidSource:](PPSMetric, "isValidSource:", v8);

      if (v6)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GroupingDimensions"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = +[PPSMetric isValidGroupingDimensions:](PPSMetric, "isValidGroupingDimensions:", v9);

        if (v6)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MetricType"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = +[PPSMetric isValidMetricType:](PPSMetric, "isValidMetricType:", v10);

          if (v6)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AuxiliaryType"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = +[PPSMetric isValidAuxiliaryType:](PPSMetric, "isValidAuxiliaryType:", v11);

            if (v6)
            {
              objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FilterEntryLogging"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = +[PPSMetric isValidFilterEntryLogging:](PPSMetric, "isValidFilterEntryLogging:", v12);

              if (v6)
              {
                objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DMACompliant"));
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v6 = +[PPSMetric isValidDMACompliant:](PPSMetric, "isValidDMACompliant:", v13);

                if (v6)
                {
                  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FixedArraySize"));
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  v6 = +[PPSMetric isValidFixedArraySize:](PPSMetric, "isValidFixedArraySize:", v14);

                  if (v6)
LABEL_11:
                    LOBYTE(v6) = 1;
                }
              }
            }
          }
        }
      }
    }
  }

  return v6;
}

+ (BOOL)isValidName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  BOOL v8;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    if ((objc_msgSend(v4, "canBeConvertedToEncoding:", 1) & 1) != 0)
    {
      objc_msgSend(v4, "lowercaseString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("timestamp"));

      if (!v6)
      {
        v8 = 1;
        goto LABEL_12;
      }
      PPSMetricLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[PPSMetric isValidName:].cold.2();
    }
    else
    {
      PPSMetricLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[PPSMetric isValidName:].cold.3();
    }
  }
  else
  {
    PPSMetricLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidName:].cold.1();
  }

  v8 = 0;
LABEL_12:

  return v8;
}

void __47__PPSMetric_Plist__metricsWithPlist_subsystem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(a1 + 32)
    || (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subsystem")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)),
        v5,
        v6))
  {
    +[PPSMetric metricWithJSONObject:](PPSMetric, "metricWithJSONObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    }
    else
    {
      PPSStorageLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __47__PPSMetric_Plist__metricsWithPlist_subsystem___block_invoke_cold_1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

    }
  }

}

+ (BOOL)isValidDatatype:(int)a3
{
  unsigned int v3;
  NSObject *v4;

  v3 = a3 - 1;
  if ((a3 - 1) >= 9)
  {
    PPSMetricLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidDatatype:].cold.1();

  }
  return v3 < 9;
}

- (NSString)source
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (int)privacyClassification
{
  return self->_privacyClassification;
}

- (int)enabledPopulation
{
  return self->_enabledPopulation;
}

- (int)directionality
{
  return self->_directionality;
}

- (int)deviceCapability
{
  return self->_deviceCapability;
}

- (PPSCadence)cadence
{
  return (PPSCadence *)objc_getProperty(self, a2, 104, 1);
}

- (void)addMetricType:(id)a3
{
  objc_storeStrong((id *)&self->_metricType, a3);
}

+ (BOOL)isValidSource:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PPSMetricLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSMetric(JSON) isValidSourceJSON:].cold.1();

    v4 = 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidRounding:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PPSMetricLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidRounding:].cold.1();

    v4 = 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidMetricType:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PPSMetricLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidMetricType:].cold.1();

    v4 = 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidGroupingDimensions:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v4 = v3;
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v4);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              PPSMetricLog();
              v10 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
                +[PPSMetric(JSON) isValidGroupingDimensionsJSON:].cold.1();

              goto LABEL_18;
            }
          }
          v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          v9 = 1;
          if (v6)
            continue;
          break;
        }
      }
      else
      {
        v9 = 1;
      }
    }
    else
    {
      PPSMetricLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        +[PPSMetric isValidGroupingDimensions:].cold.2();
LABEL_18:
      v9 = 0;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (BOOL)isValidFilterEntryLogging:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PPSMetricLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidFilterEntryLogging:].cold.1();

    v4 = 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidEnumDeclaration:(id)a3
{
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  if (!v3)
    goto LABEL_4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 1;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __36__PPSMetric_isValidEnumDeclaration___block_invoke;
    v6[3] = &unk_25141D6F8;
    v6[4] = &v7;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
    LODWORD(v4) = *((unsigned __int8 *)v8 + 24);
    _Block_object_dispose(&v7, 8);
    if ((_DWORD)v4)
LABEL_4:
      LOBYTE(v4) = 1;
  }
  else
  {
    PPSMetricLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidEnumDeclaration:].cold.1();

    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

+ (BOOL)isValidAuxiliaryType:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;

  v3 = a3;
  if (!v3)
    goto LABEL_4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSMetricLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidAuxiliaryType:].cold.2();
    goto LABEL_9;
  }
  if ((unint64_t)(objc_msgSend(v3, "unsignedLongValue") - 1) >= 3)
  {
    PPSMetricLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidAuxiliaryType:].cold.1();
LABEL_9:

    v4 = 0;
    goto LABEL_10;
  }
LABEL_4:
  v4 = 1;
LABEL_10:

  return v4;
}

- (void)addEnumMapping:(id)a3
{
  objc_storeStrong((id *)&self->_enumMapping, a3);
}

+ (BOOL)isValidTTL:(unsigned int)a3
{
  unsigned int v3;
  NSObject *v4;

  v3 = a3 - 1;
  if (a3 - 1 >= 0xE42)
  {
    PPSMetricLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidTTL:].cold.1();

  }
  return v3 < 0xE42;
}

+ (BOOL)isValidSubsystem:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithRange:", 65, 26);
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject addCharactersInRange:](v5, "addCharactersInRange:", 97, 26);
    -[NSObject addCharactersInRange:](v5, "addCharactersInRange:", 48, 10);
    -[NSObject addCharactersInString:](v5, "addCharactersInString:", CFSTR("-_."));
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", &stru_25141F2F8);

    if ((v7 & 1) == 0)
    {
      PPSMetricLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[PPSMetric isValidSubsystem:].cold.2();

    }
  }
  else
  {
    PPSMetricLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidSubsystem:].cold.1();
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isValidStorage:(int)a3
{
  unsigned int v3;
  NSObject *v4;

  v3 = a3 - 1;
  if ((a3 - 1) >= 5)
  {
    PPSMetricLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidStorage:].cold.1();

  }
  return v3 < 5;
}

+ (BOOL)isValidPrivacyClassification:(int)a3
{
  unsigned int v3;
  NSObject *v4;

  v3 = a3 - 1;
  if ((a3 - 1) >= 3)
  {
    PPSMetricLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidPrivacyClassification:].cold.1();

  }
  return v3 < 3;
}

+ (BOOL)isValidPopulation:(int)a3
{
  unsigned int v3;
  NSObject *v4;

  v3 = a3 - 1;
  if ((a3 - 1) >= 3)
  {
    PPSMetricLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidPopulation:].cold.1();

  }
  return v3 < 3;
}

+ (BOOL)isValidObfuscation:(int)a3
{
  unsigned int v3;
  NSObject *v4;

  v3 = a3 - 1;
  if ((a3 - 1) >= 3)
  {
    PPSMetricLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidObfuscation:].cold.1();

  }
  return v3 < 3;
}

+ (BOOL)isValidMode:(int)a3
{
  unsigned int v3;
  NSObject *v4;

  v3 = a3 - 1;
  if ((a3 - 1) >= 7)
  {
    PPSMetricLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidMode:].cold.1();

  }
  return v3 < 7;
}

+ (BOOL)isValidDirectionality:(int)a3
{
  unsigned int v3;
  NSObject *v4;

  v3 = a3 - 1;
  if ((a3 - 1) >= 6)
  {
    PPSMetricLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidDirectionality:].cold.1();

  }
  return v3 < 6;
}

+ (BOOL)isValidDeviceCapability:(int)a3
{
  unsigned int v3;
  NSObject *v4;

  v3 = a3 - 1;
  if ((a3 - 1) >= 0x15)
  {
    PPSMetricLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidDeviceCapability:].cold.1();

  }
  return v3 < 0x15;
}

+ (BOOL)isValidCategory:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1690], "alphanumericCharacterSet");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject addCharactersInString:](v5, "addCharactersInString:", CFSTR("-_."));
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", &stru_25141F2F8);

    if ((v7 & 1) == 0)
    {
      PPSMetricLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[PPSMetric isValidCategory:].cold.2();

    }
  }
  else
  {
    PPSMetricLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidCategory:].cold.1();
    v7 = 0;
  }

  return v7;
}

void __36__PPSMetric_isValidEnumDeclaration___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSMetricLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_2();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSMetricLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (NSString)subsystem
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)addGroupingDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_groupBy, a3);
}

+ (id)metricWithJSONObject:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  PPSMetric *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
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
  void *v34;
  void *v35;
  void *v36;
  PPSMetric *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  unsigned int v42;
  unsigned int v43;
  void *v44;
  unsigned int v45;
  void *v46;
  unint64_t v48;
  unsigned int v49;
  void *v50;
  unsigned int v51;
  void *v52;
  unsigned int v53;
  void *v54;
  unsigned int v55;
  void *v56;
  unsigned int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  if (+[PPSMetric isValidMetricJSON:](PPSMetric, "isValidMetricJSON:", v4))
  {
    v5 = v4;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("unit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSUnit unitWithJSONObject:](PPSUnit, "unitWithJSONObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cadence"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cadence"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSCadence cadenceWithJSONObject:](PPSCadence, "cadenceWithJSONObject:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        PPSStorageLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          +[PPSMetric(JSON) metricWithJSONObject:].cold.4();
        v12 = 0;
        goto LABEL_43;
      }
    }
    else
    {
      PPSStorageLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        +[PPSMetric(JSON) metricWithJSONObject:].cold.3();

      +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v67 = v10;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rounding"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rounding"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSRounding roundingWithJSONObject:](PPSRounding, "roundingWithJSONObject:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        PPSStorageLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          +[PPSMetric(JSON) metricWithJSONObject:].cold.2();

LABEL_22:
        v12 = 0;
        v11 = v67;
LABEL_43:

        goto LABEL_44;
      }
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metricType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metricType"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSMetricType metricTypeWithJSONObject:](PPSMetricType, "metricTypeWithJSONObject:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        PPSStorageLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          +[PPSMetric(JSON) metricWithJSONObject:].cold.1();

        goto LABEL_22;
      }
    }
    else
    {
      v20 = 0;
    }
    v22 = (void *)objc_opt_new();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enumMapping"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enumMapping"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("EnumMapping"));

    }
    if (v16)
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, CFSTR("Rounding"));
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, CFSTR("Source"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("groupBy"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("groupBy"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, CFSTR("GroupingDimensions"));

    }
    if (v20)
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, CFSTR("MetricType"));
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("auxiliaryType"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("auxiliaryType"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v30, CFSTR("AuxiliaryType"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("filterEntryLogging"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("filterEntryLogging"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v32, CFSTR("FilterEntryLogging"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dmaCompliant"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dmaCompliant"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v34, CFSTR("DMACompliant"));

    }
    v63 = (void *)v20;
    v64 = v16;
    v65 = v7;
    v66 = v4;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fixedArraySize"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fixedArraySize"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v36, CFSTR("FixedArraySize"));

    }
    v37 = [PPSMetric alloc];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subsystem"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("category"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "doubleValue");
    v41 = v40;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("datatype"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v61, "unsignedIntValue");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("directionality"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v60, "unsignedIntValue");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("storage"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v58, "unsignedIntValue");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeToLive"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v56, "unsignedIntValue");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mode"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v54, "unsignedIntValue");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceCapability"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v52, "unsignedIntValue");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enabledPopulation"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v50, "unsignedIntValue");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("obfuscation"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "unsignedIntValue");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("privacyClassification"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = __PAIR64__(v43, v42);
    v11 = v67;
    v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v37, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", v38, v39, v59, v57, v65, v67, v41, __PAIR64__(v53, v55), __PAIR64__(v49, v51), v48, __PAIR64__(objc_msgSend(v46, "unsignedIntValue"), v45), v22);

    v7 = v65;
    v4 = v66;
    goto LABEL_43;
  }
  v12 = 0;
  v5 = v3;
LABEL_44:

  return v12;
}

- (id)json
{
  return +[PPSMetric dictionaryWithPropertiesOfPPSMetric:](PPSMetric, "dictionaryWithPropertiesOfPPSMetric:", self);
}

+ (id)dictionaryWithPropertiesOfPPSMetric:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  objc_property_t *v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int outCount;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    outCount = 0;
    v5 = (objc_class *)objc_opt_class();
    v6 = class_copyPropertyList(v5, &outCount);
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", property_getName(v6[i]));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "valueForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          if ((objc_msgSend(v8, "isEqualToString:", CFSTR("cadence")) & 1) != 0
            || (objc_msgSend(v8, "isEqualToString:", CFSTR("rounding")) & 1) != 0
            || (objc_msgSend(v8, "isEqualToString:", CFSTR("unit")) & 1) != 0
            || objc_msgSend(v8, "isEqualToString:", CFSTR("metricType")))
          {
            objc_msgSend(v3, "valueForKey:", v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "json");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v8);

          }
          else
          {
            objc_msgSend(v3, "valueForKey:", v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v8);
          }

        }
      }
    }
    free(v6);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)metricsWithJSONData:(id)a3
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _QWORD v11[4];
  NSObject *v12;
  id v13;

  if (a3)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 4, &v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v13;
    if (v4)
    {
      PPSStorageLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[PPSMetric(JSON) metricsWithJSONData:].cold.4();
    }
    else if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v3) & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __39__PPSMetric_JSON__metricsWithJSONData___block_invoke;
        v11[3] = &unk_25141D668;
        v8 = v9;
        v12 = v8;
        objc_msgSend(v3, "enumerateObjectsUsingBlock:", v11);
        v5 = v12;
LABEL_16:

        goto LABEL_17;
      }
      PPSStorageLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[PPSMetric(JSON) metricsWithJSONData:].cold.2();
    }
    else
    {
      PPSStorageLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[PPSMetric(JSON) metricsWithJSONData:].cold.3();
    }
    v8 = 0;
    goto LABEL_16;
  }
  PPSStorageLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[PPSMetric(JSON) metricsWithJSONData:].cold.1(v4, v6, v7);
  v8 = 0;
LABEL_17:

  return v8;
}

void __39__PPSMetric_JSON__metricsWithJSONData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  +[PPSMetric metricWithJSONObject:](PPSMetric, "metricWithJSONObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }
  else
  {
    PPSStorageLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __39__PPSMetric_JSON__metricsWithJSONData___block_invoke_cold_1();

  }
}

+ (id)jsonDataWithMetrics:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  NSObject *v12;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __39__PPSMetric_JSON__jsonDataWithMetrics___block_invoke;
    v11[3] = &unk_25141D6D0;
    v5 = v4;
    v12 = v5;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v11);
    if (-[NSObject count](v5, "count") && objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v5))
    {
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 1, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PPSStorageLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[PPSMetric(JSON) jsonDataWithMetrics:].cold.2();

      v6 = 0;
    }

  }
  else
  {
    PPSStorageLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSMetric(JSON) jsonDataWithMetrics:].cold.1(v5, v8, v9);
    v6 = 0;
  }

  return v6;
}

void __39__PPSMetric_JSON__jsonDataWithMetrics___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "json");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

+ (BOOL)isValidMetricJSON:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  NSObject *v28;
  void *v29;
  char v30;
  void *v31;
  NSObject *v32;
  void *v33;
  char v34;
  void *v35;
  NSObject *v36;
  void *v37;
  char v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  char v48;
  uint64_t v49;
  void *v50;
  void *v51;
  char v52;
  uint64_t v53;
  void *v54;
  void *v55;
  char v56;
  uint64_t v57;
  void *v58;
  void *v59;
  char v60;
  uint64_t v61;
  void *v62;
  void *v63;
  char v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  char v68;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subsystem"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v8 = objc_opt_isKindOfClass();

      if ((v8 & 1) != 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("category"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v10 = objc_opt_isKindOfClass();

        if ((v10 & 1) != 0)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v12 = objc_opt_isKindOfClass();

          if ((v12 & 1) != 0)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("datatype"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v14 = objc_opt_isKindOfClass();

            if ((v14 & 1) != 0)
            {
              objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("directionality"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v15)
              {
                PPSStorageLog();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
                  +[PPSMetric(JSON) isValidMetricJSON:].cold.17();

                objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_2514282A8, CFSTR("directionality"));
              }
              objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("directionality"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v18 = objc_opt_isKindOfClass();

              if ((v18 & 1) != 0)
              {
                objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storage"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v20 = objc_opt_isKindOfClass();

                if ((v20 & 1) != 0)
                {
                  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeToLive"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v22 = objc_opt_isKindOfClass();

                  if ((v22 & 1) != 0)
                  {
                    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mode"));
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v24 = objc_opt_isKindOfClass();

                    if ((v24 & 1) != 0)
                    {
                      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enabledPopulation"));
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      v26 = objc_opt_isKindOfClass();

                      if ((v26 & 1) != 0)
                      {
                        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceCapability"));
                        v27 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v27)
                        {
                          PPSStorageLog();
                          v28 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                            +[PPSMetric(JSON) isValidMetricJSON:].cold.11();

                          objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_2514282C0, CFSTR("deviceCapability"));
                        }
                        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceCapability"));
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        v30 = objc_opt_isKindOfClass();

                        if ((v30 & 1) != 0)
                        {
                          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("obfuscation"));
                          v31 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v31)
                          {
                            PPSStorageLog();
                            v32 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                              +[PPSMetric(JSON) isValidMetricJSON:].cold.9();

                            objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_2514282C0, CFSTR("obfuscation"));
                          }
                          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("obfuscation"));
                          v33 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          v34 = objc_opt_isKindOfClass();

                          if ((v34 & 1) != 0)
                          {
                            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("privacyClassification"));
                            v35 = (void *)objc_claimAutoreleasedReturnValue();

                            if (!v35)
                            {
                              PPSStorageLog();
                              v36 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                                +[PPSMetric(JSON) isValidMetricJSON:].cold.7();

                              objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_2514282D8, CFSTR("privacyClassification"));
                            }
                            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("privacyClassification"));
                            v37 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            v38 = objc_opt_isKindOfClass();

                            if ((v38 & 1) != 0)
                            {
                              objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enumMapping"));
                              v39 = (void *)objc_claimAutoreleasedReturnValue();
                              v40 = objc_msgSend(a1, "isValidEnumDeclarationJSON:", v39);

                              if (!v40)
                                goto LABEL_77;
                              objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("source"));
                              v41 = (void *)objc_claimAutoreleasedReturnValue();
                              v42 = objc_msgSend(a1, "isValidSourceJSON:", v41);

                              if (!v42
                                || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupBy")),
                                    v43 = (void *)objc_claimAutoreleasedReturnValue(),
                                    v44 = objc_msgSend(a1, "isValidGroupingDimensionsJSON:", v43),
                                    v43,
                                    !v44))
                              {
LABEL_77:
                                v68 = 0;
                                goto LABEL_76;
                              }
                              objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("auxiliaryType"));
                              v45 = objc_claimAutoreleasedReturnValue();
                              if (v45
                                && (v46 = (void *)v45,
                                    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("auxiliaryType")),
                                    v47 = (void *)objc_claimAutoreleasedReturnValue(),
                                    objc_opt_class(),
                                    v48 = objc_opt_isKindOfClass(),
                                    v47,
                                    v46,
                                    (v48 & 1) == 0))
                              {
                                PPSStorageLog();
                                v66 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                                  +[PPSMetric(JSON) isValidMetricJSON:].cold.5();
                              }
                              else
                              {
                                objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("filterEntryLogging"));
                                v49 = objc_claimAutoreleasedReturnValue();
                                if (v49
                                  && (v50 = (void *)v49,
                                      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("filterEntryLogging")),
                                      v51 = (void *)objc_claimAutoreleasedReturnValue(),
                                      objc_opt_class(),
                                      v52 = objc_opt_isKindOfClass(),
                                      v51,
                                      v50,
                                      (v52 & 1) == 0))
                                {
                                  PPSStorageLog();
                                  v66 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                                    +[PPSMetric(JSON) isValidMetricJSON:].cold.4();
                                }
                                else
                                {
                                  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dmaCompliant"));
                                  v53 = objc_claimAutoreleasedReturnValue();
                                  if (v53
                                    && (v54 = (void *)v53,
                                        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dmaCompliant")),
                                        v55 = (void *)objc_claimAutoreleasedReturnValue(),
                                        objc_opt_class(),
                                        v56 = objc_opt_isKindOfClass(),
                                        v55,
                                        v54,
                                        (v56 & 1) == 0))
                                  {
                                    PPSStorageLog();
                                    v66 = objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                                      +[PPSMetric(JSON) isValidMetricJSON:].cold.3();
                                  }
                                  else
                                  {
                                    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exampleValue"));
                                    v57 = objc_claimAutoreleasedReturnValue();
                                    if (v57
                                      && (v58 = (void *)v57,
                                          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exampleValue")),
                                          v59 = (void *)objc_claimAutoreleasedReturnValue(),
                                          objc_opt_class(),
                                          v60 = objc_opt_isKindOfClass(),
                                          v59,
                                          v58,
                                          (v60 & 1) == 0))
                                    {
                                      PPSStorageLog();
                                      v66 = objc_claimAutoreleasedReturnValue();
                                      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                                        +[PPSMetric(JSON) isValidMetricJSON:].cold.2();
                                    }
                                    else
                                    {
                                      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metricDescription"));
                                      v61 = objc_claimAutoreleasedReturnValue();
                                      if (!v61
                                        || (v62 = (void *)v61,
                                            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metricDescription")),
                                            v63 = (void *)objc_claimAutoreleasedReturnValue(),
                                            objc_opt_class(),
                                            v64 = objc_opt_isKindOfClass(),
                                            v63,
                                            v62,
                                            (v64 & 1) != 0))
                                      {
                                        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fixedArraySize"));
                                        v65 = objc_claimAutoreleasedReturnValue();
                                        if (!v65)
                                        {
                                          v68 = 1;
                                          goto LABEL_76;
                                        }
                                        v66 = v65;
                                        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fixedArraySize"));
                                        v67 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_opt_class();
                                        v68 = objc_opt_isKindOfClass();

                                        goto LABEL_75;
                                      }
                                      PPSStorageLog();
                                      v66 = objc_claimAutoreleasedReturnValue();
                                      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                                        +[PPSMetric(JSON) isValidMetricJSON:].cold.1();
                                    }
                                  }
                                }
                              }
                            }
                            else
                            {
                              PPSStorageLog();
                              v66 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                                +[PPSMetric(JSON) isValidMetricJSON:].cold.6();
                            }
                          }
                          else
                          {
                            PPSStorageLog();
                            v66 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                              +[PPSMetric(JSON) isValidMetricJSON:].cold.8();
                          }
                        }
                        else
                        {
                          PPSStorageLog();
                          v66 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                            +[PPSMetric(JSON) isValidMetricJSON:].cold.10();
                        }
                      }
                      else
                      {
                        PPSStorageLog();
                        v66 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                          +[PPSMetric(JSON) isValidMetricJSON:].cold.12();
                      }
                    }
                    else
                    {
                      PPSStorageLog();
                      v66 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                        +[PPSMetric(JSON) isValidMetricJSON:].cold.13();
                    }
                  }
                  else
                  {
                    PPSStorageLog();
                    v66 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                      +[PPSMetric(JSON) isValidMetricJSON:].cold.14();
                  }
                }
                else
                {
                  PPSStorageLog();
                  v66 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                    +[PPSMetric(JSON) isValidMetricJSON:].cold.15();
                }
              }
              else
              {
                PPSStorageLog();
                v66 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                  +[PPSMetric(JSON) isValidMetricJSON:].cold.16();
              }
            }
            else
            {
              PPSStorageLog();
              v66 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                +[PPSMetric(JSON) isValidMetricJSON:].cold.18();
            }
          }
          else
          {
            PPSStorageLog();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              +[PPSMetric(JSON) isValidMetricJSON:].cold.19();
          }
        }
        else
        {
          PPSStorageLog();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            +[PPSMetric(JSON) isValidMetricJSON:].cold.20();
        }
      }
      else
      {
        PPSStorageLog();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          +[PPSMetric(JSON) isValidMetricJSON:].cold.21();
      }
    }
    else
    {
      PPSStorageLog();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        +[PPSMetric(JSON) isValidMetricJSON:].cold.22();
    }
  }
  else
  {
    PPSStorageLog();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      +[PPSMetric(JSON) isValidMetricJSON:].cold.23();
  }
  v68 = 0;
LABEL_75:

LABEL_76:
  return v68 & 1;
}

+ (BOOL)isValidEnumDeclarationJSON:(id)a3
{
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  if (!v3)
    goto LABEL_4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 1;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke;
    v6[3] = &unk_25141D6F8;
    v6[4] = &v7;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
    LODWORD(v4) = *((unsigned __int8 *)v8 + 24);
    _Block_object_dispose(&v7, 8);
    if ((_DWORD)v4)
LABEL_4:
      LOBYTE(v4) = 1;
  }
  else
  {
    PPSStorageLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[PPSMetric(JSON) isValidEnumDeclarationJSON:].cold.1();

    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

void __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSStorageLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_2();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSStorageLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

+ (BOOL)isValidSourceJSON:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PPSStorageLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSMetric(JSON) isValidSourceJSON:].cold.1();

    v4 = 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidGroupingDimensionsJSON:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v4 = v3;
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v4);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              PPSMetricLog();
              v10 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
                +[PPSMetric(JSON) isValidGroupingDimensionsJSON:].cold.1();

              goto LABEL_18;
            }
          }
          v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          v9 = 1;
          if (v6)
            continue;
          break;
        }
      }
      else
      {
        v9 = 1;
      }
    }
    else
    {
      PPSStorageLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        +[PPSMetric(JSON) isValidGroupingDimensionsJSON:].cold.2();
LABEL_18:
      v9 = 0;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (id)metricWithProto:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  PPSMetric *v15;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PPSMetric *v25;

  v4 = a3;
  objc_msgSend(a1, "setOptionalFields:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSMetric setMetadataDefaults:](PPSMetric, "setMetadataDefaults:", v4);
  v25 = [PPSMetric alloc];
  objc_msgSend(v4, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subsystem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "category");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v6 = v5;
  v19 = objc_msgSend(v4, "datatype");
  objc_msgSend(v4, "unit");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit unitWithProto:](PPSUnit, "unitWithProto:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cadence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceWithProto:](PPSCadence, "cadenceWithProto:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v4, "directionality");
  v9 = objc_msgSend(v4, "storage");
  v10 = objc_msgSend(v4, "timeToLive");
  v11 = objc_msgSend(v4, "mode");
  v12 = objc_msgSend(v4, "deviceCapability");
  v13 = objc_msgSend(v4, "enabledPopulation");
  v14 = objc_msgSend(v4, "obfuscation");
  LODWORD(a1) = objc_msgSend(v4, "privacyClassification");

  v15 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v25, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", v23, v22, v21, v19, v18, v8, v6, __PAIR64__(v9, v17), __PAIR64__(v11, v10), __PAIR64__(v13, v12), __PAIR64__(a1, v14), v24);
  return v15;
}

+ (id)metricWithProto:(id)a3 withBuild:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "metricWithProto:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v6, CFSTR("build"));

  return v7;
}

- (id)proto
{
  PPSPBMetric *v3;
  void *v4;
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

  v3 = objc_alloc_init(PPSPBMetric);
  -[PPSMetric name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSPBMetric setName:](v3, "setName:", v4);

  -[PPSMetric subsystem](self, "subsystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSPBMetric setSubsystem:](v3, "setSubsystem:", v5);

  -[PPSMetric category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSPBMetric setCategory:](v3, "setCategory:", v6);

  -[PPSMetric version](self, "version");
  -[PPSPBMetric setVersion:](v3, "setVersion:");
  -[PPSPBMetric setDatatype:](v3, "setDatatype:", -[PPSMetric datatype](self, "datatype"));
  -[PPSMetric unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "proto");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSPBMetric setUnit:](v3, "setUnit:", v8);

  -[PPSMetric cadence](self, "cadence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "proto");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSPBMetric setCadence:](v3, "setCadence:", v10);

  -[PPSPBMetric setDirectionality:](v3, "setDirectionality:", -[PPSMetric directionality](self, "directionality"));
  -[PPSPBMetric setStorage:](v3, "setStorage:", -[PPSMetric storage](self, "storage"));
  -[PPSPBMetric setTimeToLive:](v3, "setTimeToLive:", -[PPSMetric timeToLive](self, "timeToLive"));
  -[PPSPBMetric setMode:](v3, "setMode:", -[PPSMetric mode](self, "mode"));
  -[PPSPBMetric setDeviceCapability:](v3, "setDeviceCapability:", -[PPSMetric deviceCapability](self, "deviceCapability"));
  -[PPSPBMetric setEnabledPopulation:](v3, "setEnabledPopulation:", -[PPSMetric enabledPopulation](self, "enabledPopulation"));
  -[PPSPBMetric setObfuscation:](v3, "setObfuscation:", -[PPSMetric obfuscation](self, "obfuscation"));
  -[PPSPBMetric setPrivacyClassification:](v3, "setPrivacyClassification:", -[PPSMetric privacyClassification](self, "privacyClassification"));
  -[PPSMetric rounding](self, "rounding");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PPSMetric rounding](self, "rounding");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "proto");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSPBMetric setRounding:](v3, "setRounding:", v13);

  }
  -[PPSMetric enumMapping](self, "enumMapping");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PPSMetric enumMapping](self, "enumMapping");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetric enumMappingToProto:](PPSMetric, "enumMappingToProto:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSPBMetric setEnumMapping:](v3, "setEnumMapping:", v16);

  }
  -[PPSMetric source](self, "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PPSMetric source](self, "source");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetric sourceToProto:](PPSMetric, "sourceToProto:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSPBMetric setSource:](v3, "setSource:", v19);

  }
  -[PPSMetric groupBy](self, "groupBy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PPSMetric groupBy](self, "groupBy");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetric groupByToProto:](PPSMetric, "groupByToProto:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSPBMetric setGroupBy:](v3, "setGroupBy:", v22);

  }
  -[PPSMetric metricType](self, "metricType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[PPSMetric metricType](self, "metricType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "proto");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSPBMetric setMetricType:](v3, "setMetricType:", v25);

  }
  if (-[PPSMetric auxiliaryType](self, "auxiliaryType"))
    -[PPSPBMetric setAuxiliaryType:](v3, "setAuxiliaryType:", -[PPSMetric auxiliaryType](self, "auxiliaryType"));
  if (-[PPSMetric filterEntryLogging](self, "filterEntryLogging"))
    -[PPSPBMetric setFilterEntryLogging:](v3, "setFilterEntryLogging:", -[PPSMetric filterEntryLogging](self, "filterEntryLogging"));
  if (-[PPSMetric DMACompliant](self, "DMACompliant"))
    -[PPSPBMetric setDmaCompliant:](v3, "setDmaCompliant:", -[PPSMetric DMACompliant](self, "DMACompliant"));
  if (-[PPSMetric fixedArraySize](self, "fixedArraySize"))
    -[PPSPBMetric setFixedArraySize:](v3, "setFixedArraySize:", -[PPSMetric fixedArraySize](self, "fixedArraySize"));
  return v3;
}

- (id)protoData
{
  void *v2;
  void *v3;

  -[PPSMetric proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)enumMappingWithProto:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "enumMaps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v3, "enumMaps", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v12, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "key");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)enumMappingToProto:(id)a3
{
  id v3;
  PPSPBEnumMapping *v4;
  PPSPBEnumMapping *v5;
  _QWORD v7[4];
  PPSPBEnumMapping *v8;

  v3 = a3;
  v4 = objc_alloc_init(PPSPBEnumMapping);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__PPSMetric_Protobuf__enumMappingToProto___block_invoke;
  v7[3] = &unk_25141D720;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __42__PPSMetric_Protobuf__enumMappingToProto___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a2;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setKey:", v6);

  objc_msgSend(v7, "setValue:", v5);
  objc_msgSend(*(id *)(a1 + 32), "addEnumMap:", v7);

}

+ (id)sourceWithProto:(id)a3
{
  return (id)objc_msgSend(a3, "source");
}

+ (id)sourceToProto:(id)a3
{
  id v3;
  PPSPBSource *v4;

  v3 = a3;
  v4 = objc_alloc_init(PPSPBSource);
  -[PPSPBSource setSource:](v4, "setSource:", v3);

  return v4;
}

+ (id)groupByWithProto:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v3, "groupBysCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v3, "groupByAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

    }
  }

  return v4;
}

+ (id)groupByToProto:(id)a3
{
  id v3;
  PPSPBGroupingDimensions *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(PPSPBGroupingDimensions);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[PPSPBGroupingDimensions addGroupBy:](v4, "addGroupBy:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

+ (void)setMetadataDefaults:(id)a3
{
  id v3;

  v3 = a3;
  if (!objc_msgSend(v3, "privacyClassification"))
    objc_msgSend(v3, "setPrivacyClassification:", 1);

}

+ (id)setOptionalFields:(id)a3
{
  id v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "enumMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "enumMapping");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetric enumMappingWithProto:](PPSMetric, "enumMappingWithProto:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("EnumMapping"));
  }
  objc_msgSend(v3, "rounding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "rounding");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSRounding roundingWithProto:](PPSRounding, "roundingWithProto:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("Rounding"));

  }
  objc_msgSend(v3, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetric sourceWithProto:](PPSMetric, "sourceWithProto:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("Source"));

  }
  objc_msgSend(v3, "groupBy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v3, "groupBy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetric groupByWithProto:](PPSMetric, "groupByWithProto:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("GroupingDimensions"));

  }
  objc_msgSend(v3, "metricType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v3, "metricType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetricType metricTypeWithProto:](PPSMetricType, "metricTypeWithProto:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("MetricType"));

  }
  if (objc_msgSend(v3, "auxiliaryType"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v3, "auxiliaryType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("AuxiliaryType"));

  }
  if (objc_msgSend(v3, "filterEntryLogging"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "filterEntryLogging"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("FilterEntryLogging"));

  }
  if (objc_msgSend(v3, "dmaCompliant"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "dmaCompliant"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("DMACompliant"));

  }
  if (objc_msgSend(v3, "fixedArraySize"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v3, "fixedArraySize"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("FixedArraySize"));

  }
  return v4;
}

- (PPSMetric)init
{

  return 0;
}

- (id)data
{
  if (self)
  {
    -[PPSMetric protoData](self, "protoData");
    self = (PPSMetric *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (void)setBuild:(id)a3
{
  id v5;

  v5 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isValidBuild:", v5))
    objc_storeStrong((id *)&self->_build, a3);

}

- (void)addSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void)addRounding:(id)a3
{
  objc_storeStrong((id *)&self->_rounding, a3);
}

- (void)addAuxiliaryType:(id)a3
{
  self->_auxiliaryType = objc_msgSend(a3, "unsignedLongValue");
}

- (void)addFilterEntryLogging:(id)a3
{
  self->_filterEntryLogging = objc_msgSend(a3, "BOOLValue");
}

- (void)addDMACompliant:(id)a3
{
  self->_DMACompliant = objc_msgSend(a3, "BOOLValue");
}

- (void)addFixedArraySize:(id)a3
{
  self->_fixedArraySize = objc_msgSend(a3, "intValue");
}

+ (BOOL)isValidDMACompliant:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PPSMetricLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidDMACompliant:].cold.1();

    v4 = 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidFixedArraySize:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PPSMetricLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSMetric isValidFixedArraySize:].cold.1();

    v4 = 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (BOOL)isValidBuild:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  NSObject *v9;
  id v11;

  v3 = a3;
  if (v3)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^([0-9]+)([A-Z])([0-9]+)([a-z]?)$"), 1, &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    v6 = objc_msgSend(v4, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    if (v5)
      v7 = 0;
    else
      v7 = v6 == 1;
    v8 = v7;
    if (!v7)
    {
      PPSMetricLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[PPSMetric isValidBuild:].cold.1();

      v4 = v5;
    }

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (NSString)build
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (PPSUnit)unit
{
  return (PPSUnit *)objc_getProperty(self, a2, 96, 1);
}

- (int)obfuscation
{
  return self->_obfuscation;
}

- (PPSRounding)rounding
{
  return (PPSRounding *)objc_getProperty(self, a2, 112, 1);
}

- (NSDictionary)enumMapping
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)groupBy
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (PPSMetricType)metricType
{
  return (PPSMetricType *)objc_getProperty(self, a2, 144, 1);
}

- (int)auxiliaryType
{
  return self->_auxiliaryType;
}

- (BOOL)DMACompliant
{
  return self->_DMACompliant;
}

- (unsigned)fixedArraySize
{
  return self->_fixedArraySize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricType, 0);
  objc_storeStrong((id *)&self->_groupBy, 0);
  objc_storeStrong((id *)&self->_enumMapping, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_rounding, 0);
  objc_storeStrong((id *)&self->_cadence, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

void __39__PPSMetric_JSON__metricsWithJSONData___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_24399D000, v0, v1, "Could not construct PPSMetric from JSON object: %@", v2);
  OUTLINED_FUNCTION_6();
}

void __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_24399D000, v2, v3, "Enum Map expects String : String map, found value %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __46__PPSMetric_JSON__isValidEnumDeclarationJSON___block_invoke_cold_2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_24399D000, v2, v3, "Enum Map expects String : String map, found key %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidSubsystem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_24399D000, v0, v1, "Null or empty subsystem %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)isValidSubsystem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_24399D000, v0, v1, "Invalid characters found in subsystem %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)isValidCategory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_24399D000, v0, v1, "Null or empty metric category %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)isValidCategory:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_24399D000, v0, v1, "Invalid characters found in category %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)isValidName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_24399D000, v0, v1, "Null or empty metric name %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)isValidName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_24399D000, v0, v1, "Metric name %@ conflicts with reserved keywords", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)isValidName:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_24399D000, v0, v1, "Metric name %@ is not a pure ASCII string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)isValidDatatype:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3(&dword_24399D000, v0, v1, "Invalid datatype %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)isValidDirectionality:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3(&dword_24399D000, v0, v1, "Invalid directionality %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)isValidStorage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3(&dword_24399D000, v0, v1, "Invalid storage %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)isValidMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3(&dword_24399D000, v0, v1, "Invalid mode %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)isValidPopulation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3(&dword_24399D000, v0, v1, "Invalid enabledPopulation %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)isValidTTL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3(&dword_24399D000, v0, v1, "Invalid timeToLive %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)isValidVersion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_24399D000, a1, a3, "Invalid version %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

+ (void)isValidDeviceCapability:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3(&dword_24399D000, v0, v1, "Invalid deviceCapability %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)isValidObfuscation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3(&dword_24399D000, v0, v1, "Invalid obfuscation %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)isValidPrivacyClassification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3(&dword_24399D000, v0, v1, "Invalid privacy classification %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)isValidAuxiliaryType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_24399D000, v0, v1, "Invalid auxiliaryType %llu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)isValidAuxiliaryType:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_24399D000, v2, v3, "auxiliaryType not a NSNumber type %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidFilterEntryLogging:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_24399D000, v2, v3, "filterEntryLogging not a NSNumber type %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidDMACompliant:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_24399D000, v2, v3, "dmaCompliant not a NSNumber type %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidFixedArraySize:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_24399D000, v2, v3, "fixedArraySize not a NSNumber type %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidEnumDeclaration:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_24399D000, v2, v3, "Enum Map not a dictionary %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidRounding:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_24399D000, v2, v3, "Rounding not a PPSRounding type %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidGroupingDimensions:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_24399D000, v2, v3, "Grouping dimensions not an array %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricType:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_24399D000, v2, v3, "MetricType not a PPSMetricType type %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidBuild:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_24399D000, v0, v1, "Invalid build %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __47__PPSMetric_Plist__metricsWithPlist_subsystem___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_24399D000, a2, a3, "Could not construct PPSMetric from plist obj: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

@end
