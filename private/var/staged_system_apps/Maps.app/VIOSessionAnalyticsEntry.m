@implementation VIOSessionAnalyticsEntry

- (VIOSessionAnalyticsEntry)initWithUsageType:(int)a3 value:(id)a4
{
  id v7;
  VIOSessionAnalyticsEntry *v8;
  VIOSessionAnalyticsEntry *v9;
  uint64_t v10;
  NSDate *startDate;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VIOSessionAnalyticsEntry;
  v8 = -[VIOSessionAnalyticsEntry init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    v8->_usageType = a3;
    objc_storeStrong((id *)&v8->_value, a4);
    v10 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    startDate = v9->_startDate;
    v9->_startDate = (NSDate *)v10;

  }
  return v9;
}

- (BOOL)isComplete
{
  return self->_endDate != 0;
}

- (void)completeEntryWithReason:(int)a3
{
  uint64_t v3;
  NSDate *v5;
  NSDate *endDate;
  NSNumber *v7;
  NSNumber *exitReason;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;

  v3 = *(_QWORD *)&a3;
  if (-[VIOSessionAnalyticsEntry isComplete](self, "isComplete"))
  {
    v9 = sub_1004318FC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315906;
      v15 = "-[VIOSessionAnalyticsEntry completeEntryWithReason:]";
      v16 = 2080;
      v17 = "VIOSessionAnalyticsEntry.m";
      v18 = 1024;
      v19 = 48;
      v20 = 2080;
      v21 = "!self.isComplete";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v14, 0x26u);
    }

    if (sub_100A70734())
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v14 = 138412290;
        v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

      }
    }
  }
  if (!-[VIOSessionAnalyticsEntry isComplete](self, "isComplete"))
  {
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    endDate = self->_endDate;
    self->_endDate = v5;

    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
    exitReason = self->_exitReason;
    self->_exitReason = v7;

  }
}

- (double)totalTime
{
  double result;

  -[NSDate timeIntervalSinceDate:](self->_endDate, "timeIntervalSinceDate:", self->_startDate);
  return result;
}

- (GEOMarcoLiteUsageState)usageState
{
  GEOMarcoLiteUsageState *v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;

  if (!-[VIOSessionAnalyticsEntry isComplete](self, "isComplete"))
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315906;
      v16 = "-[VIOSessionAnalyticsEntry usageState]";
      v17 = 2080;
      v18 = "VIOSessionAnalyticsEntry.m";
      v19 = 1024;
      v20 = 64;
      v21 = 2080;
      v22 = "self.isComplete";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v15, 0x26u);
    }

    if (sub_100A70734())
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v15 = 138412290;
        v16 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);

      }
    }
  }
  v3 = objc_opt_new(GEOMarcoLiteUsageState);
  -[GEOMarcoLiteUsageState setStateType:](v3, "setStateType:", -[VIOSessionAnalyticsEntry usageType](self, "usageType"));
  -[VIOSessionAnalyticsEntry totalTime](self, "totalTime");
  LODWORD(v5) = vcvtpd_u64_f64(v4);
  -[GEOMarcoLiteUsageState setStateTime:](v3, "setStateTime:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsEntry value](self, "value"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsEntry value](self, "value"));
    -[GEOMarcoLiteUsageState setStateValue:](v3, "setStateValue:", objc_msgSend(v7, "unsignedIntegerValue"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionAnalyticsEntry exitReason](self, "exitReason"));
  -[GEOMarcoLiteUsageState setStateExitReason:](v3, "setStateExitReason:", objc_msgSend(v8, "integerValue"));

  return v3;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  uint64_t usageType;
  __CFString *v7;
  NSNumber *exitReason;
  NSInteger v9;
  __CFString *v10;
  NSNumber *value;
  NSDate *startDate;
  NSDate *endDate;
  uint64_t v14;
  void *v15;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  usageType = self->_usageType;
  if (usageType >= 0x1A)
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_usageType));
  else
    v7 = off_1011E8E28[usageType];
  exitReason = self->_exitReason;
  if (exitReason)
  {
    v9 = -[NSNumber integerValue](self->_exitReason, "integerValue");
    if (v9 >= 0x1A)
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v9));
    else
      v10 = off_1011E8E28[(int)v9];
  }
  else
  {
    v10 = CFSTR("none");
  }
  startDate = self->_startDate;
  value = self->_value;
  endDate = self->_endDate;
  -[VIOSessionAnalyticsEntry totalTime](self, "totalTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p: type: %@ exit: %@ value: %@ from: %@ to: %@; total: %f>"),
                    v5,
                    self,
                    v7,
                    v10,
                    value,
                    startDate,
                    endDate,
                    v14));
  if (exitReason)

  return v15;
}

- (int)usageType
{
  return self->_usageType;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSNumber)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(id)a3
{
  objc_storeStrong((id *)&self->_exitReason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitReason, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
