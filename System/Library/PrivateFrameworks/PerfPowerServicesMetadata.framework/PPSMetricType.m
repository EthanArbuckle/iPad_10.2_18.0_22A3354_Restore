@implementation PPSMetricType

+ (id)stateDimension
{
  if (stateDimension_onceToken != -1)
    dispatch_once(&stateDimension_onceToken, &__block_literal_global_1);
  return (id)stateDimension__stateDimension;
}

+ (id)genericDimension
{
  if (genericDimension_onceToken != -1)
    dispatch_once(&genericDimension_onceToken, &__block_literal_global_3);
  return (id)genericDimension__genericDimension;
}

- (PPSMetricType)initWithCategory:(int)a3 value:(unint64_t)a4
{
  uint64_t v5;
  PPSMetricType *v7;
  PPSMetricType *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v5 = *(_QWORD *)&a3;
  if (+[PPSMetricType isValidMetricType:value:](PPSMetricType, "isValidMetricType:value:"))
  {
    v17.receiver = self;
    v17.super_class = (Class)PPSMetricType;
    v7 = -[PPSMetricType init](&v17, sel_init);
    if (v7)
    {
      v7->_category = v5;
      v7->_value = a4;
    }
    self = v7;
    v8 = self;
  }
  else
  {
    PPSMetricLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PPSMetricType initWithCategory:value:].cold.1(v5, v9, v10, v11, v12, v13, v14, v15);

    v8 = 0;
  }

  return v8;
}

+ (BOOL)isValidMetricType:(int)a3 value:(unint64_t)a4
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = *(_QWORD *)&a3;
  if ((a3 - 3) <= 0xFFFFFFFD)
  {
    PPSMetricLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSMetricType isValidMetricType:value:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
LABEL_4:

    return 0;
  }
  if (a3 == 1)
  {
    if (!a4)
    {
      PPSMetricLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[PPSMetricType isValidMetricType:value:].cold.2(v5, v13, v14, v15, v16, v17, v18, v19);
      goto LABEL_4;
    }
    if (a4 >= 3)
    {
      PPSMetricLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[PPSMetricType isValidMetricType:value:].cold.3();
      goto LABEL_4;
    }
  }
  else
  {
    if (!a4)
    {
      PPSMetricLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[PPSMetricType isValidMetricType:value:].cold.4(v5, v20, v21, v22, v23, v24, v25, v26);
      goto LABEL_4;
    }
    if (a4 >= 5)
    {
      PPSMetricLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[PPSMetricType isValidMetricType:value:].cold.5();
      goto LABEL_4;
    }
  }
  return 1;
}

void __33__PPSMetricType_genericDimension__block_invoke()
{
  PPSMetricType *v0;
  void *v1;

  v0 = -[PPSMetricType initWithCategory:value:]([PPSMetricType alloc], "initWithCategory:value:", 1, 1);
  v1 = (void *)genericDimension__genericDimension;
  genericDimension__genericDimension = (uint64_t)v0;

}

void __31__PPSMetricType_stateDimension__block_invoke()
{
  PPSMetricType *v0;
  void *v1;

  v0 = -[PPSMetricType initWithCategory:value:]([PPSMetricType alloc], "initWithCategory:value:", 1, 2);
  v1 = (void *)stateDimension__stateDimension;
  stateDimension__stateDimension = (uint64_t)v0;

}

- (id)json
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("category");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PPSMetricType category](self, "category"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("value");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[PPSMetricType value](self, "value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (PPSMetricType)metricTypeWithJSONObject:(id)a3
{
  id v3;
  PPSMetricType *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PPSMetricType *v8;

  v3 = a3;
  if (+[PPSMetricType isValidMetricTypeJSON:](PPSMetricType, "isValidMetricTypeJSON:", v3))
  {
    v4 = [PPSMetricType alloc];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("category"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntValue");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PPSMetricType initWithCategory:value:](v4, "initWithCategory:value:", v6, objc_msgSend(v7, "unsignedIntegerValue"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isValidMetricTypeJSON:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  unsigned int v22;
  BOOL v23;
  NSObject *v24;

  v3 = a3;
  if (!v3)
    goto LABEL_14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSStorageLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[PPSMetricType(JSON) isValidMetricTypeJSON:].cold.6();
    goto LABEL_22;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    PPSStorageLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[PPSMetricType(JSON) isValidMetricTypeJSON:].cold.5(v3);
    goto LABEL_22;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("category"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "unsignedIntValue"))
  {

LABEL_20:
    PPSMetricLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[PPSMetricType(JSON) isValidMetricTypeJSON:].cold.1(v3);
    goto LABEL_22;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  if (v8 >= 3)
    goto LABEL_20;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) == 0)
    {
      PPSStorageLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        +[PPSMetricType(JSON) isValidMetricTypeJSON:].cold.4(v3);
      goto LABEL_22;
    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("category"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntValue");

  if (v14 == 1)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "unsignedIntValue"))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntValue");

      if (v17 < 3)
        goto LABEL_11;
    }
    else
    {

    }
    PPSStorageLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[PPSMetricType(JSON) isValidMetricTypeJSON:].cold.2();
    goto LABEL_22;
  }
LABEL_11:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("category"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntValue");

  if (v19 == 2)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "unsignedIntValue"))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "unsignedIntValue");

      if (v22 < 5)
        goto LABEL_14;
    }
    else
    {

    }
    PPSStorageLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[PPSMetricType(JSON) isValidMetricTypeJSON:].cold.3();
LABEL_22:

    v23 = 0;
    goto LABEL_23;
  }
LABEL_14:
  v23 = 1;
LABEL_23:

  return v23;
}

+ (PPSMetricType)metricTypeWithProto:(id)a3
{
  id v3;
  PPSMetricType *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v4 = [PPSMetricType alloc];
  v5 = objc_msgSend(v3, "category");
  v6 = objc_msgSend(v3, "value");

  return -[PPSMetricType initWithCategory:value:](v4, "initWithCategory:value:", v5, v6);
}

- (id)proto
{
  PPSPBMetricType *v3;

  v3 = objc_alloc_init(PPSPBMetricType);
  -[PPSPBMetricType setCategory:](v3, "setCategory:", -[PPSMetricType category](self, "category"));
  -[PPSPBMetricType setValue:](v3, "setValue:", -[PPSMetricType value](self, "value"));
  return v3;
}

+ (id)absoluteMeasure
{
  if (absoluteMeasure_onceToken != -1)
    dispatch_once(&absoluteMeasure_onceToken, &__block_literal_global_2);
  return (id)absoluteMeasure__absoluteMeasure;
}

void __32__PPSMetricType_absoluteMeasure__block_invoke()
{
  PPSMetricType *v0;
  void *v1;

  v0 = -[PPSMetricType initWithCategory:value:]([PPSMetricType alloc], "initWithCategory:value:", 2, 1);
  v1 = (void *)absoluteMeasure__absoluteMeasure;
  absoluteMeasure__absoluteMeasure = (uint64_t)v0;

}

+ (id)accumulatedNegativeMeasure
{
  if (accumulatedNegativeMeasure_onceToken != -1)
    dispatch_once(&accumulatedNegativeMeasure_onceToken, &__block_literal_global_3_0);
  return (id)accumulatedNegativeMeasure__accumulatedNegativeMeasure;
}

void __43__PPSMetricType_accumulatedNegativeMeasure__block_invoke()
{
  PPSMetricType *v0;
  void *v1;

  v0 = -[PPSMetricType initWithCategory:value:]([PPSMetricType alloc], "initWithCategory:value:", 2, 2);
  v1 = (void *)accumulatedNegativeMeasure__accumulatedNegativeMeasure;
  accumulatedNegativeMeasure__accumulatedNegativeMeasure = (uint64_t)v0;

}

+ (id)accumulatedPositiveMeasure
{
  if (accumulatedPositiveMeasure_onceToken != -1)
    dispatch_once(&accumulatedPositiveMeasure_onceToken, &__block_literal_global_4);
  return (id)accumulatedPositiveMeasure__accumulatedPositiveMeasure;
}

void __43__PPSMetricType_accumulatedPositiveMeasure__block_invoke()
{
  PPSMetricType *v0;
  void *v1;

  v0 = -[PPSMetricType initWithCategory:value:]([PPSMetricType alloc], "initWithCategory:value:", 2, 3);
  v1 = (void *)accumulatedPositiveMeasure__accumulatedPositiveMeasure;
  accumulatedPositiveMeasure__accumulatedPositiveMeasure = (uint64_t)v0;

}

+ (id)deltaMeasure
{
  if (deltaMeasure_onceToken != -1)
    dispatch_once(&deltaMeasure_onceToken, &__block_literal_global_5_0);
  return (id)deltaMeasure__deltaMeasure;
}

void __29__PPSMetricType_deltaMeasure__block_invoke()
{
  PPSMetricType *v0;
  void *v1;

  v0 = -[PPSMetricType initWithCategory:value:]([PPSMetricType alloc], "initWithCategory:value:", 2, 4);
  v1 = (void *)deltaMeasure__deltaMeasure;
  deltaMeasure__deltaMeasure = (uint64_t)v0;

}

- (int)category
{
  return self->_category;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)initWithCategory:(uint64_t)a3 value:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_24399D000, a2, a3, "Invalid metric type %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

+ (void)isValidMetricType:(uint64_t)a3 value:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_24399D000, a2, a3, "Invalid metric category %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

+ (void)isValidMetricType:(uint64_t)a3 value:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_24399D000, a1, a3, "Value required for specified category %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

+ (void)isValidMetricType:value:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(&dword_24399D000, v0, v1, "Invalid value %llu for specified category %d", v2, v3, v4, v5, v6);
}

+ (void)isValidMetricType:(uint64_t)a3 value:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_24399D000, a1, a3, "Value required for specified category %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

+ (void)isValidMetricType:value:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(&dword_24399D000, v0, v1, "Invalid value %llu for specified category %d", v2, v3, v4, v5, v6);
}

@end
