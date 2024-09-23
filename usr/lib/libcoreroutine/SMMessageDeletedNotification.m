@implementation SMMessageDeletedNotification

- (SMMessageDeletedNotification)init
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SMMessageDeletedNotification init]";
    v7 = 1024;
    v8 = 93;
    _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "default initializer not supported for SMMessageDeletedNotification (in %s:%d)", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (SMMessageDeletedNotification)initWithMessage:(id)a3
{
  id v5;
  SMMessageDeletedNotification *v6;
  SMMessageDeletedNotification *v7;
  SMMessageDeletedNotification *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)SMMessageDeletedNotification;
    v6 = -[RTNotification init](&v11, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_message, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (SMMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
