@implementation SMSessionMonitorContext

- (SMSessionMonitorContext)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithUpdateReason_triggerCategory_sessionID_);
}

- (SMSessionMonitorContext)initWithUpdateReason:(unint64_t)a3 triggerCategory:(unint64_t)a4 sessionID:(id)a5
{
  return -[SMSessionMonitorContext initWithUpdateReason:triggerCategory:estimatedEndDate:coarseEstimatedEndDate:sessionID:](self, "initWithUpdateReason:triggerCategory:estimatedEndDate:coarseEstimatedEndDate:sessionID:", a3, a4, 0, 0, a5);
}

- (SMSessionMonitorContext)initWithUpdateReason:(unint64_t)a3 triggerCategory:(unint64_t)a4 estimatedEndDate:(id)a5 coarseEstimatedEndDate:(id)a6 sessionID:(id)a7
{
  id v13;
  id v14;
  id v15;
  SMSessionMonitorContext *v16;
  SMSessionMonitorContext *v17;
  objc_super v19;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)SMSessionMonitorContext;
  v16 = -[SMSessionMonitorContext init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_updateReason = a3;
    v16->_triggerCategory = a4;
    objc_storeStrong((id *)&v16->_estimatedEndDate, a5);
    objc_storeStrong((id *)&v17->_coarseEstimatedEndDate, a6);
    objc_storeStrong((id *)&v17->_sessionID, a7);
  }

  return v17;
}

- (SMSessionMonitorContext)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SMSessionMonitorContext *v15;

  v4 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionMonitorContextUpdateReasonKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionMonitorContextTriggerCategoryKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionMonitorContextSessionIDStringKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v7);
  else
    v8 = 0;
  objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionMonitorContextEstimatedEndDateKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionMonitorContextEstimatedEndDateKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionMonitorContextCoarseEstimatedEndDateKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionMonitorContextCoarseEstimatedEndDateKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(v14, "dateWithTimeIntervalSince1970:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = 0;
  if (v5 && v6)
  {
    v15 = -[SMSessionMonitorContext initWithUpdateReason:triggerCategory:estimatedEndDate:coarseEstimatedEndDate:sessionID:](self, "initWithUpdateReason:triggerCategory:estimatedEndDate:coarseEstimatedEndDate:sessionID:", (int)objc_msgSend(v5, "intValue"), (int)objc_msgSend(v6, "intValue"), v9, v12, v8);
    self = v15;
  }

  return v15;
}

- (id)outputToDictionary
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionMonitorContext updateReason](self, "updateReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("__kSMSessionMonitorContextUpdateReasonKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionMonitorContext triggerCategory](self, "triggerCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("__kSMSessionMonitorContextTriggerCategoryKey"));

  -[SMSessionMonitorContext estimatedEndDate](self, "estimatedEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    -[SMSessionMonitorContext estimatedEndDate](self, "estimatedEndDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("__kSMSessionMonitorContextEstimatedEndDateKey"));

  }
  -[SMSessionMonitorContext coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD16E0];
    -[SMSessionMonitorContext coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    objc_msgSend(v11, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("__kSMSessionMonitorContextCoarseEstimatedEndDateKey"));

  }
  -[SMSessionMonitorContext sessionID](self, "sessionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SMSessionMonitorContext sessionID](self, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("__kSMSessionMonitorContextSessionIDStringKey"));

  }
  return v3;
}

+ (id)sessionSafetyMonitorUpdateReasonToString:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return CFSTR("SMSessionMonitorUpdateReasonUnknown");
  else
    return off_25166DE10[a3 - 1];
}

+ (id)triggerCategoryToString:(unint64_t)a3
{
  if (a3 > 0x16)
    return CFSTR("SMTriggerCategoryNone");
  else
    return off_25166DE38[a3];
}

+ (id)userTriggerResponseToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("SMUserTriggerResponseUnknown");
  else
    return off_25166DEF0[a3 - 1];
}

+ (id)sessionEndReasonToString:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return CFSTR("SMSessionEndReasonUnknown");
  else
    return off_25166DF08[a3 - 1];
}

+ (BOOL)isDestinationTriggerCategory:(unint64_t)a3
{
  return a3 - 3 < 3;
}

+ (BOOL)isRoundTripTriggerCategory:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 8;
}

+ (BOOL)isDurationTriggerCategory:(unint64_t)a3
{
  return a3 == 7;
}

+ (BOOL)isSOSTriggerCategory:(unint64_t)a3
{
  return a3 - 10 < 5;
}

+ (BOOL)isWorkoutTriggerCategory:(unint64_t)a3
{
  return a3 - 19 < 4;
}

+ (BOOL)isValidAnomaly:(unint64_t)a3
{
  return (a3 < 0x17) & (0x787FBCu >> a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionMonitorContext)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  SMSessionMonitorContext *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("__kSMSessionMonitorContextUpdateReasonKey"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("__kSMSessionMonitorContextTriggerCategoryKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionMonitorContextEstimatedEndDateKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionMonitorContextCoarseEstimatedEndDateKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMSessionMonitorContextSessionIDStringKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SMSessionMonitorContext initWithUpdateReason:triggerCategory:estimatedEndDate:coarseEstimatedEndDate:sessionID:](self, "initWithUpdateReason:triggerCategory:estimatedEndDate:coarseEstimatedEndDate:sessionID:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t updateReason;
  id v5;

  updateReason = self->_updateReason;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", updateReason, CFSTR("__kSMSessionMonitorContextUpdateReasonKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_triggerCategory, CFSTR("__kSMSessionMonitorContextTriggerCategoryKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_estimatedEndDate, CFSTR("__kSMSessionMonitorContextEstimatedEndDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_coarseEstimatedEndDate, CFSTR("__kSMSessionMonitorContextCoarseEstimatedEndDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionID, CFSTR("__kSMSessionMonitorContextSessionIDStringKey"));

}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[SMSessionMonitorContext updateReason](self, "updateReason");
  v4 = -[SMSessionMonitorContext triggerCategory](self, "triggerCategory") ^ v3;
  -[SMSessionMonitorContext estimatedEndDate](self, "estimatedEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  -[SMSessionMonitorContext coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SMSessionMonitorContext *v4;
  SMSessionMonitorContext *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  BOOL v18;

  v4 = (SMSessionMonitorContext *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SMSessionMonitorContext updateReason](self, "updateReason");
      if (v6 == -[SMSessionMonitorContext updateReason](v5, "updateReason")
        && (v7 = -[SMSessionMonitorContext triggerCategory](self, "triggerCategory"),
            v7 == -[SMSessionMonitorContext triggerCategory](v5, "triggerCategory")))
      {
        -[SMSessionMonitorContext estimatedEndDate](self, "estimatedEndDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSince1970");
        v10 = v9;
        -[SMSessionMonitorContext estimatedEndDate](v5, "estimatedEndDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeIntervalSince1970");
        if (v10 == v12)
        {
          -[SMSessionMonitorContext coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "timeIntervalSince1970");
          v15 = v14;
          -[SMSessionMonitorContext coarseEstimatedEndDate](v5, "coarseEstimatedEndDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "timeIntervalSince1970");
          v18 = v15 == v17;

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  +[SMSessionMonitorContext sessionSafetyMonitorUpdateReasonToString:](SMSessionMonitorContext, "sessionSafetyMonitorUpdateReasonToString:", -[SMSessionMonitorContext updateReason](self, "updateReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMSessionMonitorContext triggerCategoryToString:](SMSessionMonitorContext, "triggerCategoryToString:", -[SMSessionMonitorContext triggerCategory](self, "triggerCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionMonitorContext estimatedEndDate](self, "estimatedEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionMonitorContext coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionMonitorContext sessionID](self, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{UpdateReason:%@, TriggerCategory:%@, estimatedEndDate:%@, coarseEstimatedEndDate:%@, sessionID:%@}"), v4, v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)updateReason
{
  return self->_updateReason;
}

- (unint64_t)triggerCategory
{
  return self->_triggerCategory;
}

- (NSDate)estimatedEndDate
{
  return self->_estimatedEndDate;
}

- (NSDate)coarseEstimatedEndDate
{
  return self->_coarseEstimatedEndDate;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_coarseEstimatedEndDate, 0);
  objc_storeStrong((id *)&self->_estimatedEndDate, 0);
}

@end
