@implementation SBProductivityGestureEducationItem

- (SBProductivityGestureEducationItem)initWithType:(int64_t)a3
{
  SBProductivityGestureEducationItem *v4;
  SBProductivityGestureEducationItem *v5;
  uint64_t v6;
  NSMutableDictionary *activationHistoryMap;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBProductivityGestureEducationItem;
  v4 = -[SBProductivityGestureEducationItem init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    activationHistoryMap = v5->_activationHistoryMap;
    v5->_activationHistoryMap = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (double)_policyInterval
{
  return 5.0;
}

- (int64_t)_policyCount
{
  return 2;
}

- (void)contentDidAppear
{
  NSDate *v3;
  NSDate *displayDate;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  displayDate = self->_displayDate;
  self->_displayDate = v3;

  -[SBProductivityGestureEducationItem resetActivations](self, "resetActivations");
}

- (void)resetActivations
{
  -[NSMutableDictionary removeAllObjects](self->_activationHistoryMap, "removeAllObjects");
}

- (BOOL)isValidWithActivationForType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *activationHistoryMap;
  void *v10;
  SBProductivityGestureEducationActivationHistory *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  SBProductivityGestureEducationActivationHistory *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!self->_displayDate)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    activationHistoryMap = self->_activationHistoryMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](activationHistoryMap, "objectForKeyedSubscript:", v10);
    v11 = (SBProductivityGestureEducationActivationHistory *)objc_claimAutoreleasedReturnValue();

    self->_lastActivatedEducationType = a3;
    if (!v11)
    {
      v11 = objc_alloc_init(SBProductivityGestureEducationActivationHistory);
      v12 = self->_activationHistoryMap;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

    }
    -[SBProductivityGestureEducationActivationHistory date](v11, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v6, "timeIntervalSinceDate:", v14);
      v16 = v15;
      -[SBProductivityGestureEducationItem _policyInterval](self, "_policyInterval");
      if (v16 < v17)
      {
        v22 = -[SBProductivityGestureEducationActivationHistory count](v11, "count") + 1;
        v21 = v11;
        goto LABEL_13;
      }
      SBLogSystemGesture();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        _SBFLoggingMethodProem();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBProductivityGestureEducationItem _policyInterval](self, "_policyInterval");
        v27 = 138543874;
        v28 = v19;
        v29 = 2048;
        v30 = v20;
        v31 = 2048;
        v32 = a3;
        _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_INFO, "%{public}@ subsequent gesture activation happened past the require policy time of %f seconds for type %ld", (uint8_t *)&v27, 0x20u);

      }
    }
    -[SBProductivityGestureEducationActivationHistory setDate:](v11, "setDate:", v6);
    v21 = v11;
    v22 = 1;
LABEL_13:
    -[SBProductivityGestureEducationActivationHistory setCount:](v21, "setCount:", v22);
    v23 = -[SBProductivityGestureEducationActivationHistory count](v11, "count");
    v24 = v23 >= -[SBProductivityGestureEducationItem _policyCount](self, "_policyCount");

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 1, self->_displayDate, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "compare:", v6);

  if (v8 != -1)
  {

    goto LABEL_4;
  }
  SBLogSystemGesture();
  v11 = (SBProductivityGestureEducationActivationHistory *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543874;
    v28 = v25;
    v29 = 2048;
    v30 = 1;
    v31 = 2048;
    v32 = a3;
    _os_log_impl(&dword_1D0540000, &v11->super, OS_LOG_TYPE_INFO, "%{public}@ gated by the %ld day per education pill type %ld", (uint8_t *)&v27, 0x20u);

  }
  v24 = 0;
LABEL_17:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SBProductivityGestureEducationItem *v4;

  v4 = -[SBProductivityGestureEducationItem initWithType:]([SBProductivityGestureEducationItem alloc], "initWithType:", self->_type);
  objc_storeStrong((id *)&v4->_displayDate, self->_displayDate);
  objc_storeStrong((id *)&v4->_activationHistoryMap, self->_activationHistoryMap);
  v4->_lastActivatedEducationType = self->_lastActivatedEducationType;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBProductivityGestureEducationItem)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  NSDate *v6;
  NSDate *displayDate;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayDate"));
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();

  displayDate = self->_displayDate;
  self->_displayDate = v6;

  return -[SBProductivityGestureEducationItem initWithType:](self, "initWithType:", v5);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayDate, CFSTR("displayDate"));

}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)lastActivatedEducationType
{
  return self->_lastActivatedEducationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationHistoryMap, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
}

@end
