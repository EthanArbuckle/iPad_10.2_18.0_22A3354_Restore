@implementation MODictionaryEncoder

+ (id)encodeDictionary:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;

  v3 = a3;
  if (!v3)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[MODictionaryEncoder encodeDictionary:].cold.2();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 0, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v6 || !v5)
    {
      _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[MODictionaryEncoder encodeDictionary:].cold.1((uint64_t)v6, v8);

      v7 = 0;
    }
    else
    {
      v7 = v5;
    }

  }
  else
  {
LABEL_10:
    v7 = 0;
  }

  return v7;
}

+ (id)decodeToDictionary:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;

  v3 = a3;
  if (!v3)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[MODictionaryEncoder decodeToDictionary:].cold.2();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v3, 0, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v6 || !v5)
    {
      _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        +[MODictionaryEncoder decodeToDictionary:].cold.1((uint64_t)v6, v8);

      v7 = 0;
    }
    else
    {
      v7 = v5;
    }

  }
  else
  {
LABEL_10:
    v7 = 0;
  }

  return v7;
}

+ (void)encodeDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_243AAA000, a2, OS_LOG_TYPE_ERROR, "Error when serialization to json, %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

+ (void)encodeDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_243AAA000, v0, v1, "Object is not of dictionary type (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)decodeToDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_243AAA000, a2, OS_LOG_TYPE_DEBUG, "Error when serialization to dictionary, %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

+ (void)decodeToDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_243AAA000, v0, v1, "Object is not of data type (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
