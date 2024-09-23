@implementation SMTriggerNotification

- (SMTriggerNotification)initWithTriggerCategory:(unint64_t)a3 SOSState:(unint64_t)a4 triggerName:(id)a5 date:(id)a6 details:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  SMTriggerNotification *v17;
  id *p_isa;
  SMTriggerNotification *v19;
  NSObject *v20;
  const char *v21;
  objc_super v23;
  uint8_t buf[16];

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (a3 >= 0x18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: triggerCategory >= SMTriggerCategoryUnknown && triggerCategory <= SMTriggerCategoryMax";
LABEL_19:
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_20;
  }
  if (a4 - 1 >= 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: SOSState >= SMTriggerSOSCategoryNonSOS && SOSState <= SMTriggerSOSCategorySOS";
    goto LABEL_19;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: triggerName";
    goto LABEL_19;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: date";
    goto LABEL_19;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "Invalid parameter not satisfying: details";
      goto LABEL_19;
    }
LABEL_20:

    v19 = 0;
    goto LABEL_21;
  }
  v23.receiver = self;
  v23.super_class = (Class)SMTriggerNotification;
  v17 = -[RTNotification init](&v23, sel_init);
  p_isa = (id *)&v17->super.super.isa;
  if (v17)
  {
    v17->_triggerCategory = a3;
    v17->_SOSState = a4;
    objc_storeStrong((id *)&v17->_triggerName, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
  }
  self = p_isa;
  v19 = self;
LABEL_21:

  return v19;
}

+ (id)triggerSOSCategoryToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("SMTriggerSOSCategoryNonSOS");
  if (a3 == 2)
    v3 = CFSTR("SMTriggerSOSCategorySOS");
  if (a3)
    return (id)v3;
  else
    return CFSTR("SMTriggerSOSCategoryUnknown");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D8BA40], "triggerCategoryToString:", -[SMTriggerNotification triggerCategory](self, "triggerCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "triggerSOSCategoryToString:", -[SMTriggerNotification SOSState](self, "SOSState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerNotification triggerName](self, "triggerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerNotification date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerNotification details](self, "details");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SMTriggerNotification, triggerCategory, %@, SOS state, %@, triggerName, %@, date, %@, details, %@"), v4, v5, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)triggerCategory
{
  return self->_triggerCategory;
}

- (unint64_t)SOSState
{
  return self->_SOSState;
}

- (NSString)triggerName
{
  return self->_triggerName;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDictionary)details
{
  return self->_details;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_triggerName, 0);
}

@end
