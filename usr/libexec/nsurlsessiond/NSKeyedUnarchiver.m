@implementation NSKeyedUnarchiver

+ (id)_nsurlsessionproxy_secureUnarchiveObjectOfClass:(Class)a3 withData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  Class v13;
  __int16 v14;
  id v15;

  v5 = a4;
  v6 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyCommon allowedClassesForUnarchiving](PDURLSessionProxyCommon, "allowedClassesForUnarchiving"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "setByAddingObject:", a3));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v8, NSKeyedArchiveRootObjectKey));
  if (!v9)
  {
    v10 = (id)qword_1000C7120;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412546;
      v13 = a3;
      v14 = 2048;
      v15 = objc_msgSend(v5, "length");
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to unarchive data of class %@, length %lu", (uint8_t *)&v12, 0x16u);
    }

  }
  return v9;
}

@end
