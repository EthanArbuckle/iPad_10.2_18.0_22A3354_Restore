@implementation MOXPCContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOXPCContext)init
{
  MOXPCContext *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *configuration;
  void *v5;
  void *v6;
  MOXPCContext *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MOXPCContext;
  v2 = -[MOXPCContext init](&v9, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    configuration = v2->_configuration;
    v2->_configuration = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "processName"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_configuration, "setObject:forKeyedSubscript:", v6, CFSTR("ProcessName"));

    v7 = v2;
  }

  return v2;
}

- (MOXPCContext)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  MOXPCContext *v6;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *configuration;
  MOXPCContext *v11;

  v4 = a3;
  v6 = -[MOXPCContext init](self, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("ProcessName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    configuration = v6->_configuration;
    v6->_configuration = v9;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_configuration, "setObject:forKeyedSubscript:", v8, CFSTR("ProcessName"));
    v11 = v6;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *configuration;
  id v4;
  id v5;

  configuration = self->_configuration;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](configuration, "objectForKeyedSubscript:", CFSTR("ProcessName")));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ProcessName"));

}

- (NSString)xpcProcessName
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_configuration, "objectForKey:", CFSTR("ProcessName"));
}

- (id)encodeDictionary:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id os_log;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  SEL v22;
  MOXPCContext *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v43;

  v6 = a3;
  if (!v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MOXPCContext encodeDictionary:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v9 = v20;
    v21 = CFSTR("Invalid parameter not satisfying: value");
    v22 = a2;
    v23 = self;
    v24 = 62;
    goto LABEL_12;
  }
  v7 = objc_opt_class(NSDictionary, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v25 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MOXPCContext encodeDictionary:].cold.3(v26, v27, v28, v29, v30, v31, v32, v33);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v9 = v20;
    v21 = CFSTR("Invalid parameter not satisfying: [value isKindOfClass:[NSDictionary class]]");
    v22 = a2;
    v23 = self;
    v24 = 63;
LABEL_12:
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", v22, v23, CFSTR("MOXPCContext.m"), v24, v21);
    v10 = 0;
    goto LABEL_17;
  }
  v43 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v6, 0, &v43));
  v9 = v43;
  if (v9 || !v8)
  {
    v34 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[MOXPCContext encodeDictionary:].cold.2((uint64_t)v9, v35, v36, v37, v38, v39, v40, v41);

    v10 = 0;
  }
  else
  {
    v10 = v8;
  }

LABEL_17:
  return v10;
}

- (id)decodeToDictionary:(id)a3
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;

  v6 = a3;
  if (!v6)
    goto LABEL_10;
  v7 = objc_opt_class(NSData, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOXPCContext decodeToDictionary:].cold.2(v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOXPCContext.m"), 83, CFSTR("Object is not of data type (in %s:%d)"), "-[MOXPCContext decodeToDictionary:]", 83);

  }
  v12 = objc_opt_class(NSData, v8);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    v25 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, &v25));
    v14 = v25;
    if (v14 || !v13)
    {
      v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[MOXPCContext decodeToDictionary:].cold.1((uint64_t)v14, v17, v18, v19, v20, v21, v22, v23);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)encodeDictionary:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: value", a5, a6, a7, a8, 0);
}

- (void)encodeDictionary:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Error when serialization to json, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)encodeDictionary:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: [value isKindOfClass:[NSDictionary class]]", a5, a6, a7, a8, 0);
}

- (void)decodeToDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Error when serialization to dictionary, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)decodeToDictionary:(os_log_t)log .cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "-[MOXPCContext decodeToDictionary:]";
  v3 = 1024;
  v4 = 83;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

@end
