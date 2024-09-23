@implementation RTXPCActivityRegistrant

- (RTXPCActivityRegistrant)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_criteria_handler_);
}

- (RTXPCActivityRegistrant)initWithIdentifier:(id)a3 criteria:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  RTXPCActivityRegistrant *v13;
  RTXPCActivityRegistrant *v14;
  uint64_t v15;
  id handler;
  RTXPCActivityRegistrant *v17;
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
    v19 = "Invalid parameter not satisfying: criteria";
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
  v21.super_class = (Class)RTXPCActivityRegistrant;
  v13 = -[RTXPCActivityRegistrant init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v14->_criteria, a4);
    v15 = objc_msgSend(v12, "copy");
    handler = v14->_handler;
    v14->_handler = (id)v15;

  }
  self = v14;
  v17 = self;
LABEL_15:

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTXPCActivityRegistrant identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTXPCActivityRegistrant criteria](self, "criteria");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier, %@, criteria, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (RTXPCActivityCriteria)criteria
{
  return self->_criteria;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
