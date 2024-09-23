@implementation RTDefaultsManagerNotificationDefaultsChanged

- (NSArray)updatedKeys
{
  return self->_updatedKeys;
}

- (RTDefaultsManagerNotificationDefaultsChanged)initWithUpdatedKeys:(id)a3
{
  id v4;
  NSObject *v5;
  RTDefaultsManagerNotificationDefaultsChanged *v6;
  uint64_t v7;
  NSArray *updatedKeys;
  RTDefaultsManagerNotificationDefaultsChanged *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTDefaultsManagerNotificationDefaultsChanged initWithUpdatedKeys:]";
      v14 = 1024;
      v15 = 83;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: updatedKeys.count (in %s:%d)", buf, 0x12u);
    }

  }
  if (objc_msgSend(v4, "count"))
  {
    v11.receiver = self;
    v11.super_class = (Class)RTDefaultsManagerNotificationDefaultsChanged;
    v6 = -[RTNotification init](&v11, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v4, "copy");
      updatedKeys = v6->_updatedKeys;
      v6->_updatedKeys = (NSArray *)v7;

    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedKeys, 0);
}

- (RTDefaultsManagerNotificationDefaultsChanged)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithUpdatedKeys_);
}

@end
