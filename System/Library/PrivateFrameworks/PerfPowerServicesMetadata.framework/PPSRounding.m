@implementation PPSRounding

- (id)json
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PPSRounding type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("value");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[PPSRounding value](self, "value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (PPSRounding)roundingWithJSONObject:(id)a3
{
  id v3;
  PPSRounding *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PPSRounding *v8;

  v3 = a3;
  if (+[PPSRounding isValidRoundingJSON:](PPSRounding, "isValidRoundingJSON:", v3))
  {
    v4 = [PPSRounding alloc];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntValue");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PPSRounding initWithType:value:](v4, "initWithType:value:", v6, objc_msgSend(v7, "unsignedIntegerValue"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isValidRoundingJSON:(id)a3
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
  NSObject *v14;
  BOOL v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  unint64_t v23;

  v3 = a3;
  if (!v3)
    goto LABEL_24;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSStorageLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[PPSRounding(JSON) isValidRoundingJSON:].cold.6();
    goto LABEL_17;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    PPSStorageLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[PPSRounding(JSON) isValidRoundingJSON:].cold.5(v3);
    goto LABEL_17;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "unsignedIntValue"))
  {

LABEL_15:
    PPSMetricLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[PPSRounding(JSON) isValidRoundingJSON:].cold.1(v3);
    goto LABEL_17;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  if (v8 >= 6)
    goto LABEL_15;
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
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[PPSRounding(JSON) isValidRoundingJSON:].cold.4(v3);
      goto LABEL_17;
    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "unsignedIntValue") == 4)
  {

  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntValue");

    if (v17 != 5)
      goto LABEL_20;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    PPSStorageLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[PPSRounding(JSON) isValidRoundingJSON:].cold.2(v3);
    goto LABEL_17;
  }
LABEL_20:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntegerValue");

  if (v21 >= 0.0 && round(v21) == (double)v23)
  {
LABEL_24:
    v15 = 1;
    goto LABEL_25;
  }
  PPSStorageLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    +[PPSRounding(JSON) isValidRoundingJSON:].cold.3(v3);
LABEL_17:

  v15 = 0;
LABEL_25:

  return v15;
}

+ (PPSRounding)roundingWithProto:(id)a3
{
  id v3;
  PPSRounding *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v4 = [PPSRounding alloc];
  v5 = objc_msgSend(v3, "type");
  v6 = objc_msgSend(v3, "value");

  return -[PPSRounding initWithType:value:](v4, "initWithType:value:", v5, v6);
}

- (id)proto
{
  PPSPBRounding *v3;

  v3 = objc_alloc_init(PPSPBRounding);
  -[PPSPBRounding setType:](v3, "setType:", -[PPSRounding type](self, "type"));
  -[PPSPBRounding setValue:](v3, "setValue:", -[PPSRounding value](self, "value"));
  return v3;
}

- (PPSRounding)initWithType:(int)a3 value:(unint64_t)a4
{
  uint64_t v5;
  PPSRounding *v7;
  PPSRounding *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v5 = *(_QWORD *)&a3;
  if (+[PPSRounding isValidRounding:value:](PPSRounding, "isValidRounding:value:"))
  {
    v17.receiver = self;
    v17.super_class = (Class)PPSRounding;
    v7 = -[PPSRounding init](&v17, sel_init);
    if (v7)
    {
      v7->_type = v5;
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
      -[PPSRounding initWithType:value:].cold.1(v5, v9, v10, v11, v12, v13, v14, v15);

    v8 = 0;
  }

  return v8;
}

+ (BOOL)isValidRounding:(int)a3 value:(unint64_t)a4
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a3;
  if ((a3 - 6) <= 0xFFFFFFFA)
  {
    PPSMetricLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PPSRounding initWithType:value:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
LABEL_8:

    return 0;
  }
  result = 1;
  if ((a3 & 0xFFFFFFFE) == 4 && !a4)
  {
    PPSMetricLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PPSRounding isValidRounding:value:].cold.2(v4, v5, v13, v14, v15, v16, v17, v18);
    goto LABEL_8;
  }
  return result;
}

+ (id)roundNearest
{
  if (roundNearest_onceToken != -1)
    dispatch_once(&roundNearest_onceToken, &__block_literal_global_5);
  return (id)roundNearest__nearest;
}

void __27__PPSRounding_roundNearest__block_invoke()
{
  PPSRounding *v0;
  void *v1;

  v0 = -[PPSRounding initWithType:value:]([PPSRounding alloc], "initWithType:value:", 3, 0);
  v1 = (void *)roundNearest__nearest;
  roundNearest__nearest = (uint64_t)v0;

}

+ (id)roundDown
{
  if (roundDown_onceToken != -1)
    dispatch_once(&roundDown_onceToken, &__block_literal_global_1_0);
  return (id)roundDown__down;
}

void __24__PPSRounding_roundDown__block_invoke()
{
  PPSRounding *v0;
  void *v1;

  v0 = -[PPSRounding initWithType:value:]([PPSRounding alloc], "initWithType:value:", 1, 0);
  v1 = (void *)roundDown__down;
  roundDown__down = (uint64_t)v0;

}

+ (id)roundUp
{
  if (roundUp_onceToken != -1)
    dispatch_once(&roundUp_onceToken, &__block_literal_global_2_0);
  return (id)roundUp__up;
}

void __22__PPSRounding_roundUp__block_invoke()
{
  PPSRounding *v0;
  void *v1;

  v0 = -[PPSRounding initWithType:value:]([PPSRounding alloc], "initWithType:value:", 2, 0);
  v1 = (void *)roundUp__up;
  roundUp__up = (uint64_t)v0;

}

- (int)type
{
  return self->_type;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)initWithType:(uint64_t)a3 value:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_24399D000, a2, a3, "Invalid round type %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

+ (void)isValidRounding:(uint64_t)a3 value:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_24399D000, a2, a3, "Value required for specified rounding type: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
