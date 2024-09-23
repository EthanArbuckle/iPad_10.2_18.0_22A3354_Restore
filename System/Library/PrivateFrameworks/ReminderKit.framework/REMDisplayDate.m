@implementation REMDisplayDate

- (REMDisplayDate)initWithDate:(id)a3 allDay:(BOOL)a4 timeZone:(id)a5
{
  id v8;
  id v9;
  REMDisplayDate *v10;
  uint64_t v11;
  NSDate *date;
  REMDisplayDate *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v23.receiver = self;
    v23.super_class = (Class)REMDisplayDate;
    v10 = -[REMDisplayDate init](&v23, sel_init);
    if (v10)
    {
      v11 = objc_msgSend(v8, "copy");
      date = v10->_date;
      v10->_date = (NSDate *)v11;

      v10->_allDay = a4;
      objc_storeStrong((id *)&v10->_timeZone, a5);
    }
    self = v10;
    v13 = self;
  }
  else
  {
    +[REMLog utility](REMLog, "utility");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[REMDisplayDate initWithDate:allDay:timeZone:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    v13 = 0;
  }

  return v13;
}

- (REMDisplayDate)initWithFloatingDateComponents:(id)a3 nonFloatingDateComponents:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDate **p_date;
  double v15;
  NSTimeZone *v16;
  NSTimeZone *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  REMDisplayDate *v40;
  NSTimeZone *v41;
  NSTimeZone *timeZone;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  objc_super v57;

  v6 = (uint64_t)a3;
  v7 = (uint64_t)a4;
  if (!(v6 | v7))
    goto LABEL_18;
  v57.receiver = self;
  v57.super_class = (Class)REMDisplayDate;
  self = -[REMDisplayDate init](&v57, sel_init);
  if (!self)
  {
LABEL_28:
    self = self;
    v40 = self;
    goto LABEL_29;
  }
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0C99D78];
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rem_dateWithDateComponents:timeZone:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_6;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_12;
LABEL_5:
  v11 = (void *)MEMORY[0x1E0C99D78];
  objc_msgSend((id)v7, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rem_dateWithDateComponents:timeZone:", v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
LABEL_6:
    if (v13)
    {
      objc_msgSend(v10, "timeIntervalSinceDate:", v13);
      p_date = &self->_date;
      if (v15 >= 0.0)
      {
        objc_storeStrong((id *)p_date, v13);
        self->_allDay = objc_msgSend((id)v7, "rem_isAllDayDateComponents");
        objc_msgSend((id)v7, "timeZone");
        v41 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
        timeZone = self->_timeZone;
        self->_timeZone = v41;

        if (!self->_timeZone)
        {
          +[REMLog utility](REMLog, "utility");
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
            -[REMDisplayDate initWithFloatingDateComponents:nonFloatingDateComponents:].cold.5(v7, v43, v44, v45, v46, v47, v48, v49);

        }
        if (!self->_allDay)
          goto LABEL_27;
        +[REMLog utility](REMLog, "utility");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          -[REMDisplayDate initWithFloatingDateComponents:nonFloatingDateComponents:].cold.4(v7, v18, v50, v51, v52, v53, v54, v55);
      }
      else
      {
        objc_storeStrong((id *)p_date, v10);
        self->_allDay = objc_msgSend((id)v6, "rem_isAllDayDateComponents");
        objc_msgSend((id)v6, "timeZone");
        v16 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
        v17 = self->_timeZone;
        self->_timeZone = v16;

        if (!self->_timeZone)
        {
LABEL_27:

          goto LABEL_28;
        }
        +[REMLog utility](REMLog, "utility");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          -[REMDisplayDate initWithFloatingDateComponents:nonFloatingDateComponents:].cold.3(v6, v18, v19, v20, v21, v22, v23, v24);
      }

      goto LABEL_27;
    }
    +[REMLog utility](REMLog, "utility");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[REMDisplayDate initWithFloatingDateComponents:nonFloatingDateComponents:].cold.2(v25, v33, v34, v35, v36, v37, v38, v39);
    goto LABEL_17;
  }
LABEL_13:
  +[REMLog utility](REMLog, "utility");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    -[REMDisplayDate initWithFloatingDateComponents:nonFloatingDateComponents:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
LABEL_17:

LABEL_18:
  v40 = 0;
LABEL_29:

  return v40;
}

- (REMDisplayDate)initWithDueDateComponents:(id)a3 alarms:(id)a4
{
  id v6;
  id v7;
  REMDisplayDate *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "displayDateWithDueDateComponents:alarms:", v7, v6);
  v8 = (REMDisplayDate *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMDisplayDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDisplayDate timeZone](self, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p date: %@, timeZone: %@, allDay: %ld>"), v4, self, v5, v6, -[REMDisplayDate isAllDay](self, "isAllDay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  char v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  -[REMDisplayDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMDisplayDate date](self, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_7;
  }
  v11 = -[REMDisplayDate isAllDay](self, "isAllDay");
  if (v11 != objc_msgSend(v4, "isAllDay"))
  {
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  -[REMDisplayDate timeZone](self, "timeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZone");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v14 == (void *)v15)
  {
    v12 = 1;
    v16 = v14;
  }
  else
  {
    v16 = (void *)v15;
    -[REMDisplayDate timeZone](self, "timeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v17, "isEqual:", v18);

  }
LABEL_8:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  -[REMDisplayDate date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 + -[REMDisplayDate isAllDay](self, "isAllDay");
  -[REMDisplayDate timeZone](self, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v5;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  REMDisplayDate *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  REMDisplayDate *v8;

  v4 = [REMDisplayDate alloc];
  -[REMDisplayDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[REMDisplayDate isAllDay](self, "isAllDay");
  -[REMDisplayDate timeZone](self, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMDisplayDate initWithDate:allDay:timeZone:](v4, "initWithDate:allDay:timeZone:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMDisplayDate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  REMDisplayDate *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isAllDay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[REMDisplayDate initWithDate:allDay:timeZone:](self, "initWithDate:allDay:timeZone:", v5, objc_msgSend(v6, "BOOLValue"), v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[REMDisplayDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("date"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMDisplayDate isAllDay](self, "isAllDay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("isAllDay"));

  -[REMDisplayDate timeZone](self, "timeZone");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("timeZone"));

}

- (id)dateComponentsRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  -[REMDisplayDate timeZone](self, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0C99D78];
  -[REMDisplayDate date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rem_dateComponentsWithDate:timeZone:isAllDay:", v8, v6, -[REMDisplayDate isAllDay](self, "isAllDay"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMDisplayDate timeZone](self, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v9, "rem_strippingTimeZone");
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }

  return v9;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (void)initWithDate:(uint64_t)a3 allDay:(uint64_t)a4 timeZone:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, a1, a3, "REMDisplayDate unexpectedly initialized with a nil date. Returning nil.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)initWithFloatingDateComponents:(uint64_t)a3 nonFloatingDateComponents:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, a1, a3, "Unable to obtain a valid floating date from floating date components; returning nil",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_7();
}

- (void)initWithFloatingDateComponents:(uint64_t)a3 nonFloatingDateComponents:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, a1, a3, "Unable to obtain a valid non-floating date from non-floating date components; returning nil",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_7();
}

- (void)initWithFloatingDateComponents:(uint64_t)a3 nonFloatingDateComponents:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "Floating date components must not have a timezone {dateComponents %@}", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_1();
}

- (void)initWithFloatingDateComponents:(uint64_t)a3 nonFloatingDateComponents:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "Non-floating display date is all day but only floating display dates should be all day {dateComponents %@}", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_1();
}

- (void)initWithFloatingDateComponents:(uint64_t)a3 nonFloatingDateComponents:(uint64_t)a4 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "Non-floating date components must have a timezone {dateComponents %@}", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_1();
}

@end
