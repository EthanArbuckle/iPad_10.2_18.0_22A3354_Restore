@implementation MOMeasurementTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(NSData, a2);
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
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
  void *v14;

  v6 = a3;
  if (!v6)
    goto LABEL_8;
  v7 = objc_opt_class(NSMeasurement, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOMeasurementTransformer transformedValue:].cold.1();

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOMeasurementTransformer.m"), 30, CFSTR("Object is not of NSMeasurement (in %s:%d)"), "-[MOMeasurementTransformer transformedValue:]", 30);

  }
  v12 = objc_opt_class(NSMeasurement, v8);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v13));

  }
  else
  {
LABEL_8:
    v14 = 0;
  }

  return v14;
}

- (id)reverseTransformedValue:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id os_log;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;

  v6 = a3;
  if (!v6)
    goto LABEL_8;
  v7 = objc_opt_class(NSData, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOMeasurementTransformer reverseTransformedValue:].cold.1();

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOMeasurementTransformer.m"), 48, CFSTR("Object is not of data type (in %s:%d)"), "-[MOMeasurementTransformer reverseTransformedValue:]", 48);

  }
  v12 = objc_opt_class(NSData, v8);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    v14 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSMeasurement, v13), v6, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }
  else
  {
LABEL_8:
    v15 = 0;
  }

  return v15;
}

- (void)transformedValue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Object is not of NSMeasurement (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)reverseTransformedValue:.cold.1()
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
}

@end
