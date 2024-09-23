@implementation PPSCadenceTuple

- (PPSCadenceTuple)initWithCadenceType:(int)a3 value:(unint64_t)a4
{
  PPSCadenceTuple *v5;
  NSObject *v6;
  NSObject *v8;
  PPSCadenceTuple *v9;
  PPSCadenceTuple *v11;
  objc_super v12;

  v5 = self;
  if ((a3 - 6) <= 0xFFFFFFFA)
  {
    PPSMetricLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PPSCadenceTuple initWithCadenceType:value:].cold.1(a3, v6);
LABEL_4:

LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  if (a3 == 4 && a4)
  {
    PPSMetricLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PPSCadenceTuple initWithCadenceType:value:].cold.2();
LABEL_13:

    goto LABEL_14;
  }
  if (a3 == 3 && a4 - 12 <= 0xFFFFFFFFFFFFFFF4)
  {
    PPSMetricLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PPSCadenceTuple initWithCadenceType:value:].cold.3();
    goto LABEL_13;
  }
  if (a3 == 5 && !a4)
  {
    PPSMetricLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PPSCadenceTuple initWithCadenceType:value:].cold.4(v6);
    goto LABEL_4;
  }
  v12.receiver = self;
  v12.super_class = (Class)PPSCadenceTuple;
  v11 = -[PPSCadenceTuple init](&v12, sel_init);
  if (v11)
  {
    v11->_type = a3;
    v11->_value = a4;
  }
  v5 = v11;
  v9 = v5;
LABEL_15:

  return v9;
}

+ (id)cadenceTupleWithJSONObject:(id)a3
{
  id v3;
  PPSCadenceTuple *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PPSCadenceTuple *v8;

  v3 = a3;
  if (+[PPSCadenceTuple isValidCadenceTupleJSON:](PPSCadenceTuple, "isValidCadenceTupleJSON:", v3))
  {
    v4 = [PPSCadenceTuple alloc];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntValue");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PPSCadenceTuple initWithCadenceType:value:](v4, "initWithCadenceType:value:", v6, objc_msgSend(v7, "unsignedIntegerValue"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isValidCadenceTupleJSON:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  NSObject *v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSStorageLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[PPSCadenceTuple(JSON) isValidCadenceTupleJSON:].cold.4();
    goto LABEL_14;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    PPSStorageLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[PPSCadenceTuple(JSON) isValidCadenceTupleJSON:].cold.3(v3);
    goto LABEL_14;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = objc_opt_isKindOfClass();

  if ((v7 & 1) == 0)
  {
    PPSStorageLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[PPSCadenceTuple(JSON) isValidCadenceTupleJSON:].cold.2(v3);
    goto LABEL_14;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v9 < 0)
  {
    PPSStorageLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[PPSCadenceTuple(JSON) isValidCadenceTupleJSON:].cold.1(v3);
LABEL_14:

    v10 = 0;
    goto LABEL_15;
  }
  v10 = 1;
LABEL_15:

  return v10;
}

- (int)type
{
  return self->_type;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)initWithCadenceType:(int)a1 value:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_24399D000, a2, OS_LOG_TYPE_ERROR, "Invalid cadence type %d", (uint8_t *)v2, 8u);
}

- (void)initWithCadenceType:value:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(&dword_24399D000, v0, v1, "Non zero value %llu sent for %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)initWithCadenceType:value:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(&dword_24399D000, v0, v1, "Unknown event %llu sent for %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)initWithCadenceType:(os_log_t)log value:.cold.4(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = 0;
  _os_log_error_impl(&dword_24399D000, log, OS_LOG_TYPE_ERROR, "Invalid XPC cadence type  %llu", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_6();
}

@end
