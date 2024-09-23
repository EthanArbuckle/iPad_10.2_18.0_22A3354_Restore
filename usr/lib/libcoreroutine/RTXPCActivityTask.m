@implementation RTXPCActivityTask

- (RTXPCActivityTask)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_activity_handler_);
}

- (RTXPCActivityTask)initWithIdentifier:(id)a3 activity:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  RTXPCActivityTask *v13;
  RTXPCActivityTask *v14;
  uint64_t v15;
  id handler;
  RTXPCActivityTask *v17;
  NSObject *v18;
  const char *v19;
  objc_super v21;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: identifier";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_14;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: activity";
    goto LABEL_13;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: handler";
      goto LABEL_13;
    }
LABEL_14:

    v17 = 0;
    goto LABEL_15;
  }
  v21.receiver = self;
  v21.super_class = (Class)RTXPCActivityTask;
  v13 = -[RTXPCActivityTask init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v14->_activity, a4);
    v15 = objc_msgSend(v12, "copy");
    handler = v14->_handler;
    v14->_handler = (id)v15;

  }
  self = v14;
  v17 = self;
LABEL_15:

  return v17;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
