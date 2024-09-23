@implementation RTDarwinNotificationRecord

- (id)handler
{
  return self->_handler;
}

- (NSNumber)registrationToken
{
  return self->_registrationToken;
}

- (RTDarwinNotificationRecord)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithNotificationName_registrationToken_handler_);
}

- (RTDarwinNotificationRecord)initWithNotificationName:(id)a3 registrationToken:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  RTDarwinNotificationRecord *v12;
  uint64_t v13;
  NSString *notificationName;
  uint64_t v15;
  NSNumber *registrationToken;
  uint64_t v17;
  id handler;
  RTDarwinNotificationRecord *v19;
  NSObject *v20;
  const char *v21;
  objc_super v23;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: notificationName";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_14;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: registrationToken";
    goto LABEL_13;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "Invalid parameter not satisfying: handler";
      goto LABEL_13;
    }
LABEL_14:

    v19 = 0;
    goto LABEL_15;
  }
  v23.receiver = self;
  v23.super_class = (Class)RTDarwinNotificationRecord;
  v12 = -[RTDarwinNotificationRecord init](&v23, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    notificationName = v12->_notificationName;
    v12->_notificationName = (NSString *)v13;

    v15 = objc_msgSend(v9, "copy");
    registrationToken = v12->_registrationToken;
    v12->_registrationToken = (NSNumber *)v15;

    v17 = objc_msgSend(v11, "copy");
    handler = v12->_handler;
    v12->_handler = (id)v17;

  }
  self = v12;
  v19 = self;
LABEL_15:

  return v19;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setRegistrationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_registrationToken, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end
