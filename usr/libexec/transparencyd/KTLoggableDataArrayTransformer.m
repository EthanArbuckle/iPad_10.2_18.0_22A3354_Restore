@implementation KTLoggableDataArrayTransformer

- (id)allowedTopLevelClasses
{
  uint64_t v3;

  v3 = objc_opt_class(KTLoggableDataArray, a2);
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

+ (id)name
{
  return CFSTR("KTLoggableDataArrayTransformer");
}

+ (void)registerTransformer
{
  void *v2;
  KTLoggableDataArrayTransformer *v3;

  v3 = objc_alloc_init(KTLoggableDataArrayTransformer);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[KTLoggableDataArrayTransformer name](KTLoggableDataArrayTransformer, "name"));
  +[NSValueTransformer setValueTransformer:forName:](NSValueTransformer, "setValueTransformer:forName:", v3, v2);

}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(KTLoggableData, a2);
}

- (id)transformedValue:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;

  v3 = a3;
  v10 = 0;
  v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(KTLoggableDataArray, v4), v3, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = v10;
  if (v7)
  {
    if (qword_1002A77F8 != -1)
      dispatch_once(&qword_1002A77F8, &stru_1002482D0);
    v8 = qword_1002A7800;
    if (os_log_type_enabled((os_log_t)qword_1002A7800, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "failed to transform from data to KTLoggableDataArray: %@", buf, 0xCu);
    }
  }

  return v6;
}

- (id)reverseTransformedValue:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;

  v7 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v7));
  v4 = v7;
  if (v4)
  {
    if (qword_1002A77F8 != -1)
      dispatch_once(&qword_1002A77F8, &stru_1002482F0);
    v5 = qword_1002A7800;
    if (os_log_type_enabled((os_log_t)qword_1002A7800, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "failed to transform from KTLoggableDataArray to data: %@", buf, 0xCu);
    }
  }

  return v3;
}

@end
