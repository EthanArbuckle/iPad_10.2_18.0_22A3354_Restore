@implementation APMetricOffsetSettings

- (void)resetRouteOffsets
{
  objc_class *v3;
  objc_property_t *v4;
  unint64_t i;
  id v6;
  NSNumber *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  unsigned int outCount;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;

  outCount = 0;
  v3 = (objc_class *)objc_opt_class(self);
  v4 = class_copyPropertyList(v3, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", property_getName(v4[i]), 4);
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("lastActivity")) & 1) == 0)
      {
        v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", arc4random_uniform(0x258u) + 300);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        -[APMetricOffsetSettings setValue:forKey:](self, "setValue:forKey:", v8, v6);
        v9 = APLogForCategory(29);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = (objc_class *)objc_opt_class(self);
          v12 = NSStringFromClass(v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          *(_DWORD *)buf = 138478339;
          v16 = v13;
          v17 = 2113;
          v18 = v6;
          v19 = 2113;
          v20 = v8;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{private}@] Resetting offset for %{private}@ to %{private}@.", buf, 0x20u);

        }
      }

    }
  }
  free(v4);
}

@end
