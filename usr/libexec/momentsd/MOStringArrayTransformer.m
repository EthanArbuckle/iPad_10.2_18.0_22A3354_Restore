@implementation MOStringArrayTransformer

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
  NSMutableData *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  if (!v6)
    goto LABEL_8;
  v7 = objc_opt_class(NSArray, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOStringArrayTransformer transformedValue:].cold.1();

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOStringArrayTransformer.m"), 32, CFSTR("Object is not of array type (in %s:%d)"), "-[MOStringArrayTransformer transformedValue:]", 32);

  }
  v12 = objc_opt_class(NSArray, v8);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    v13 = objc_opt_new(NSMutableData);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", &stru_1002B8010));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataUsingEncoding:", 4));
    -[NSMutableData appendData:](v13, "appendData:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v13));
  }
  else
  {
LABEL_8:
    v16 = 0;
  }

  return v16;
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
  id v13;
  void *v14;

  v6 = a3;
  if (!v6)
    goto LABEL_9;
  v7 = objc_opt_class(NSData, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOStringArrayTransformer reverseTransformedValue:].cold.1();

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOStringArrayTransformer.m"), 49, CFSTR("Object is not of data type (in %s:%d)"), "-[MOStringArrayTransformer reverseTransformedValue:]", 49);

  }
  v12 = objc_opt_class(NSData, v8);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v6, 4);
    if (objc_msgSend(v13, "length"))
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsSeparatedByString:", &stru_1002B8010));
    else
      v14 = &__NSArray0__struct;

  }
  else
  {
LABEL_9:
    v14 = 0;
  }

  return v14;
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
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Object is not of array type (in %s:%d)", v2, v3, v4, v5, v6);
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
