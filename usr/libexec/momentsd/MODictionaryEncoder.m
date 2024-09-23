@implementation MODictionaryEncoder

+ (id)encodeDictionary:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id os_log;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v19;

  v6 = a3;
  if (!v6)
    goto LABEL_10;
  v7 = objc_opt_class(NSDictionary, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MODictionaryEncoder encodeDictionary:].cold.2();

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MODictionaryEncoder.m"), 23, CFSTR("Object is not of dictionary type (in %s:%d)"), "+[MODictionaryEncoder encodeDictionary:]", 23);

  }
  v12 = objc_opt_class(NSDictionary, v8);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    v19 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v6, 0, &v19));
    v14 = v19;
    if (v14 || !v13)
    {
      v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[MODictionaryEncoder encodeDictionary:].cold.1((uint64_t)v14, v17);

      v15 = 0;
    }
    else
    {
      v15 = v13;
    }

  }
  else
  {
LABEL_10:
    v15 = 0;
  }

  return v15;
}

+ (id)decodeToDictionary:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id os_log;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v19;

  v6 = a3;
  if (!v6)
    goto LABEL_10;
  v7 = objc_opt_class(NSData, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MODictionaryEncoder decodeToDictionary:].cold.2();

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MODictionaryEncoder.m"), 46, CFSTR("Object is not of data type (in %s:%d)"), "+[MODictionaryEncoder decodeToDictionary:]", 46);

  }
  v12 = objc_opt_class(NSData, v8);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    v19 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, &v19));
    v14 = v19;
    if (v14 || !v13)
    {
      v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        +[MODictionaryEncoder decodeToDictionary:].cold.1((uint64_t)v14, v17);

      v15 = 0;
    }
    else
    {
      v15 = v13;
    }

  }
  else
  {
LABEL_10:
    v15 = 0;
  }

  return v15;
}

+ (void)encodeDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error when serialization to json, %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
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

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Object is not of dictionary type (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)decodeToDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Error when serialization to dictionary, %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
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

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Object is not of data type (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
