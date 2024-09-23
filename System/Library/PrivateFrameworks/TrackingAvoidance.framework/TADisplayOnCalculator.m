@implementation TADisplayOnCalculator

- (TADisplayOnCalculator)initWithStartTime:(id)a3
{
  id v5;
  TADisplayOnCalculator *v6;
  TADisplayOnCalculator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TADisplayOnCalculator;
  v6 = -[TADisplayOnCalculator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_startTime, a3);
    v7->_useBudget = 0;
    objc_storeStrong((id *)&v7->_evaluatedUntil, v7->_startTime);
  }

  return v7;
}

- (TADisplayOnCalculator)initWithStartTime:(id)a3 budget:(double)a4
{
  TADisplayOnCalculator *result;

  result = -[TADisplayOnCalculator initWithStartTime:](self, "initWithStartTime:", a3);
  if (result)
  {
    result->_useBudget = 1;
    result->_budgetRemaining = a4;
  }
  return result;
}

- (void)completeDisplayOnWithEndDate:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  if (!self->_useBudget)
  {
    v6 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
      -[TADisplayOnCalculator completeDisplayOnWithEndDate:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  if (self->_budgetRemaining > 0.0)
  {
    if (-[NSDate compare:](self->_evaluatedUntil, "compare:", v5) == NSOrderedAscending)
      objc_storeStrong((id *)&self->_evaluatedUntil, a3);
    self->_budgetRemaining = 0.0;
  }

}

- (double)calculateDisplayOnWithEvents:(id)a3 advertisements:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  NSDate *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char v21;
  double v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSDate *v34;
  unint64_t v35;
  unint64_t v36;
  BOOL v37;
  void *v38;
  NSDate *v39;
  double v40;
  double v41;
  uint64_t v42;
  double v43;
  double v44;
  void *v45;
  double budgetRemaining;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSDate *v55;
  NSDate *v56;
  NSDate **p_evaluatedUntil;
  id v59;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = 0.0;
  if (-[NSDate compare:](self->_evaluatedUntil, "compare:", v10) != NSOrderedAscending
    || self->_useBudget && self->_budgetRemaining <= 0.0)
  {
    goto LABEL_46;
  }
  v12 = self->_evaluatedUntil;
  if (!objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v10, "timeIntervalSinceDate:", self->_startTime);
      v11 = v22;
      if (v22 >= 0.0)
      {
        objc_storeStrong((id *)&self->_evaluatedUntil, a5);
        if (self->_useBudget)
        {
          budgetRemaining = self->_budgetRemaining;
          if (v11 <= budgetRemaining)
          {
            self->_budgetRemaining = budgetRemaining - v11;
          }
          else
          {
            self->_budgetRemaining = 0.0;
            v11 = 0.0;
          }
        }
      }
      else
      {
        v23 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
          -[TADisplayOnCalculator calculateDisplayOnWithEvents:advertisements:endDate:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
    goto LABEL_45;
  }
  p_evaluatedUntil = &self->_evaluatedUntil;
  v59 = v9;
  objc_msgSend(v8, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "compare:", v12);

  v16 = objc_msgSend(v8, "count");
  if (v15 != 1)
  {
    LODWORD(v17) = v16 - 1;
    v31 = (int)v16 - 1;
LABEL_17:
    v32 = v8;
LABEL_18:
    objc_msgSend(v32, "objectAtIndexedSubscript:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v33, "isOn");
LABEL_19:

    goto LABEL_20;
  }
  if (v16)
  {
    v17 = 0;
    while (1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "getDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "compare:", v12);

      if (v20 == 1)
        break;
      if (!v20)
      {
        v32 = v8;
        v31 = v17;
        goto LABEL_18;
      }
      if (objc_msgSend(v8, "count") <= (unint64_t)++v17)
        goto LABEL_11;
    }
    if ((_DWORD)v17)
    {
      LODWORD(v17) = v17 - 1;
      v31 = v17;
      goto LABEL_17;
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", v17);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v33, "isOn") ^ 1;
    LODWORD(v17) = -1;
    goto LABEL_19;
  }
LABEL_11:
  v21 = 0;
  LODWORD(v17) = -1;
LABEL_20:
  v34 = 0;
  v35 = (int)v17 + 1;
  v11 = 0.0;
  while (1)
  {
    v36 = objc_msgSend(v8, "count");
    v37 = v36 > v35;
    if (v36 <= v35)
      goto LABEL_24;
    objc_msgSend(v8, "objectAtIndexedSubscript:", v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "getDate");
    v39 = (NSDate *)objc_claimAutoreleasedReturnValue();

    if (-[NSDate compare:](v39, "compare:", v10) == NSOrderedAscending)
      break;
    v34 = v39;
LABEL_24:
    v39 = (NSDate *)v10;

    if ((v21 & 1) != 0)
      goto LABEL_25;
LABEL_34:
    if (v37 || v35 == objc_msgSend(v8, "count") || self->_useBudget && self->_budgetRemaining <= 0.0)
      goto LABEL_44;
    objc_msgSend(v8, "objectAtIndexedSubscript:", v35);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v45, "isOn");

    v34 = v39;
    ++v35;
    v12 = v34;
  }
  v37 = 0;
  if ((v21 & 1) == 0)
    goto LABEL_34;
LABEL_25:
  -[NSDate timeIntervalSinceDate:](v39, "timeIntervalSinceDate:", v12);
  if (!self->_useBudget)
  {
LABEL_33:
    -[NSDate timeIntervalSinceDate:](v39, "timeIntervalSinceDate:", v12);
    v11 = v11 + v44;
    goto LABEL_34;
  }
  if (v40 >= 0.0)
  {
    v41 = self->_budgetRemaining;
    if (v40 <= v41)
    {
      v43 = v41 - v40;
    }
    else
    {
      -[NSDate dateByAddingTimeInterval:](v12, "dateByAddingTimeInterval:", self->_budgetRemaining);
      v42 = objc_claimAutoreleasedReturnValue();

      v43 = 0.0;
      v39 = (NSDate *)v42;
    }
    self->_budgetRemaining = v43;
    goto LABEL_33;
  }
  v47 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
    -[TADisplayOnCalculator calculateDisplayOnWithEvents:advertisements:endDate:].cold.2(v47, v48, v49, v50, v51, v52, v53, v54);
LABEL_44:
  v55 = *p_evaluatedUntil;
  *p_evaluatedUntil = v39;
  v56 = v39;

  v9 = v59;
LABEL_45:

LABEL_46:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  TADisplayOnCalculator *v5;
  TADisplayOnCalculator *v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;

  v5 = (TADisplayOnCalculator *)a3;
  if (self == v5)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = -[TADisplayOnCalculator useBudget](self, "useBudget");
      if (v7 != -[TADisplayOnCalculator useBudget](v6, "useBudget")
        || (-[TADisplayOnCalculator budgetRemaining](self, "budgetRemaining"),
            v9 = v8,
            -[TADisplayOnCalculator budgetRemaining](v6, "budgetRemaining"),
            v9 != v10))
      {
        v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
      -[TADisplayOnCalculator startTime](self, "startTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TADisplayOnCalculator startTime](v6, "startTime");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[TADisplayOnCalculator startTime](self, "startTime");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TADisplayOnCalculator startTime](v6, "startTime");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v3))
        {
          v14 = 0;
LABEL_16:

LABEL_17:
          goto LABEL_18;
        }
        v21 = v13;
      }
      -[TADisplayOnCalculator evaluatedUntil](self, "evaluatedUntil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TADisplayOnCalculator evaluatedUntil](v6, "evaluatedUntil");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v15 == (void *)v16)
      {

        v14 = 1;
      }
      else
      {
        v17 = (void *)v16;
        -[TADisplayOnCalculator evaluatedUntil](self, "evaluatedUntil");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[TADisplayOnCalculator evaluatedUntil](v6, "evaluatedUntil");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v18, "isEqual:", v19);

      }
      v13 = v21;
      if (v11 == v12)
        goto LABEL_17;
      goto LABEL_16;
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TADisplayOnCalculator)initWithCoder:(id)a3
{
  id v4;
  TADisplayOnCalculator *v5;
  double v6;
  uint64_t v7;
  NSDate *startTime;
  uint64_t v9;
  NSDate *evaluatedUntil;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TADisplayOnCalculator;
  v5 = -[TADisplayOnCalculator init](&v12, sel_init);
  if (v5)
  {
    v5->_useBudget = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UseBudget"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BudgetRemaining"));
    v5->_budgetRemaining = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StartTime"));
    v7 = objc_claimAutoreleasedReturnValue();
    startTime = v5->_startTime;
    v5->_startTime = (NSDate *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EvalUntil"));
    v9 = objc_claimAutoreleasedReturnValue();
    evaluatedUntil = v5->_evaluatedUntil;
    v5->_evaluatedUntil = (NSDate *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 useBudget;
  id v5;

  useBudget = self->_useBudget;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", useBudget, CFSTR("UseBudget"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("BudgetRemaining"), self->_budgetRemaining);
  objc_msgSend(v5, "encodeObject:forKey:", self->_startTime, CFSTR("StartTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_evaluatedUntil, CFSTR("EvalUntil"));

}

- (NSDate)evaluatedUntil
{
  return self->_evaluatedUntil;
}

- (BOOL)useBudget
{
  return self->_useBudget;
}

- (void)setUseBudget:(BOOL)a3
{
  self->_useBudget = a3;
}

- (double)budgetRemaining
{
  return self->_budgetRemaining;
}

- (void)setBudgetRemaining:(double)a3
{
  self->_budgetRemaining = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_evaluatedUntil, 0);
}

- (void)completeDisplayOnWithEndDate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_217877000, a1, a3, "#TADisplayOnCalculator called completeDisplayOnWithEndDate when not using budget", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

- (void)calculateDisplayOnWithEvents:(uint64_t)a3 advertisements:(uint64_t)a4 endDate:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_217877000, a1, a3, "#TADisplayOnCalculator end date is before start date in calculateDisplayOnWithEvents", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

- (void)calculateDisplayOnWithEvents:(uint64_t)a3 advertisements:(uint64_t)a4 endDate:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_217877000, a1, a3, "#TADisplayOnCalculator negative time interval in calculateDisplayOnWithEvents", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

@end
