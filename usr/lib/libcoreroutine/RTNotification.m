@implementation RTNotification

+ (id)notificationName
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "+[RTNotification notificationName]";
      v7 = 1024;
      v8 = 15;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "RTNotification should not be used directly. (in %s:%d)", (uint8_t *)&v5, 0x12u);
    }

  }
  NSStringFromClass((Class)a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)name
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (RTNotification)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RTNotification;
  return -[RTNotification init](&v3, sel_init);
}

@end
