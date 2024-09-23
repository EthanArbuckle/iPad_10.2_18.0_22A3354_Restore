@implementation SMTriggerEstimatedEndDateUpdateNotification

- (SMTriggerEstimatedEndDateUpdateNotification)initWithTriggerCategory:(unint64_t)a3 SOSState:(unint64_t)a4 estimatedEndDate:(id)a5 coarseEstimatedEndDate:(id)a6 triggerName:(id)a7 date:(id)a8 details:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  SMTriggerEstimatedEndDateUpdateNotification *v22;
  id *p_isa;
  SMTriggerEstimatedEndDateUpdateNotification *v24;
  NSObject *v25;
  const char *v26;
  objc_super v28;
  uint8_t buf[16];

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = v20;
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: estimatedEndDate";
LABEL_16:
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_17;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: triggerName";
    goto LABEL_16;
  }
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: date";
    goto LABEL_16;
  }
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: details";
      goto LABEL_16;
    }
LABEL_17:

    v24 = 0;
    goto LABEL_18;
  }
  v28.receiver = self;
  v28.super_class = (Class)SMTriggerEstimatedEndDateUpdateNotification;
  v22 = -[SMTriggerNotification initWithTriggerCategory:SOSState:triggerName:date:details:](&v28, sel_initWithTriggerCategory_SOSState_triggerName_date_details_, a3, a4, v18, v19, v20);
  p_isa = (id *)&v22->super.super.super.isa;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_estimatedEndDate, a5);
    objc_storeStrong(p_isa + 7, a6);
  }
  self = p_isa;
  v24 = self;
LABEL_18:

  return v24;
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
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D8BA40], "triggerCategoryToString:", -[SMTriggerNotification triggerCategory](self, "triggerCategory"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "triggerSOSCategoryToString:", -[SMTriggerNotification SOSState](self, "SOSState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerNotification triggerName](self, "triggerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerNotification date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerEstimatedEndDateUpdateNotification estimatedEndDate](self, "estimatedEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerEstimatedEndDateUpdateNotification coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerNotification details](self, "details");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("SMTriggerEstimatedEndDateUpdateNotification, triggerCategory, %@, SOS state, %@, triggerName, %@, date, %@, estimatedEndDate, %@, coarseEstimatedEndDate, %@, details, %@"), v14, v3, v4, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDate)estimatedEndDate
{
  return self->_estimatedEndDate;
}

- (NSDate)coarseEstimatedEndDate
{
  return self->_coarseEstimatedEndDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coarseEstimatedEndDate, 0);
  objc_storeStrong((id *)&self->_estimatedEndDate, 0);
}

@end
