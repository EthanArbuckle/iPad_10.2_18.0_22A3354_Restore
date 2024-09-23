@implementation VIOSessionDailyUsageEntry

+ (id)loadOrCreateEntry
{
  void *v2;
  void *v3;
  id v4;
  VIOSessionDailyUsageEntry *v5;
  VIOSessionDailyUsageEntry *v6;
  VIOSessionDailyUsageEntry *v7;
  id v8;
  NSObject *v9;
  VIOSessionDailyUsageEntry *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  VIOSessionDailyUsageEntry *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v32;
  uint8_t buf[4];
  VIOSessionDailyUsageEntry *v34;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataForKey:", CFSTR("kVIOSessionDailyUsageEntryUserDefaultsKey")));

  if (!v3)
    goto LABEL_12;
  v32 = 0;
  v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(VIOSessionDailyUsageEntry), v3, &v32);
  v5 = (VIOSessionDailyUsageEntry *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (VIOSessionDailyUsageEntry *)v32;
  if (v6)
  {
    v7 = v6;
    v8 = sub_100BD0FF8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error loading last entry: %@; creating a new one",
        buf,
        0xCu);
    }

    v10 = objc_opt_new(VIOSessionDailyUsageEntry);
LABEL_6:
    v5 = v10;
LABEL_15:
    -[VIOSessionDailyUsageEntry save](v5, "save");
    goto LABEL_16;
  }
  if (!v5)
  {
LABEL_12:
    v13 = sub_100BD0FF8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Entry is nil; creating a new one", buf, 2u);
    }

    v5 = objc_opt_new(VIOSessionDailyUsageEntry);
    v7 = 0;
    goto LABEL_15;
  }
  if (-[VIOSessionDailyUsageEntry isOld](v5, "isOld"))
  {
    v11 = sub_100BD0FF8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Entry is old (%@); creating a new one",
        buf,
        0xCu);
    }

    v10 = objc_opt_new(VIOSessionDailyUsageEntry);
    v7 = 0;
    goto LABEL_6;
  }
  v7 = 0;
LABEL_16:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageEntry lastStartDate](v5, "lastStartDate"));

  if (v15)
  {
    v16 = sub_100BD0FF8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (VIOSessionDailyUsageEntry *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageEntry lastStartDate](v5, "lastStartDate"));
      *(_DWORD *)buf = 138412290;
      v34 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Detected last VIO session did not end gracefully; assuming VIO session was running consecutively since %@",
        buf,
        0xCu);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageEntry lastStartDate](v5, "lastStartDate"));
    objc_msgSend(v19, "timeIntervalSinceDate:", v20);
    v22 = v21;
    -[VIOSessionDailyUsageEntry timeMultiplier](v5, "timeMultiplier");
    v24 = v23;
    -[VIOSessionDailyUsageEntry currentUsage](v5, "currentUsage");
    -[VIOSessionDailyUsageEntry setCurrentUsage:](v5, "setCurrentUsage:", v25 + v22 * v24);

    -[VIOSessionDailyUsageEntry currentUsage](v5, "currentUsage");
    v26 = 0.0;
    if (v27 > 0.0)
    {
      -[VIOSessionDailyUsageEntry currentUsage](v5, "currentUsage");
      v26 = v28;
    }
    -[VIOSessionDailyUsageEntry dailyUsageLimit](v5, "dailyUsageLimit");
    if (v26 >= v29)
    {
      -[VIOSessionDailyUsageEntry dailyUsageLimit](v5, "dailyUsageLimit");
      v26 = v30;
    }
    -[VIOSessionDailyUsageEntry setCurrentUsage:](v5, "setCurrentUsage:", v26);
    -[VIOSessionDailyUsageEntry setLastStartDate:](v5, "setLastStartDate:", 0);
    -[VIOSessionDailyUsageEntry save](v5, "save");
  }

  return v5;
}

- (void)save
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  VIOSessionDailyUsageEntry *v10;
  __int16 v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v8));
  v5 = v8;
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("kVIOSessionDailyUsageEntryUserDefaultsKey"));

  if (v5)
  {
    v6 = sub_100BD0FF8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error saving entry %@: %@", buf, 0x16u);
    }

  }
}

- (VIOSessionDailyUsageEntry)init
{
  VIOSessionDailyUsageEntry *v2;
  uint64_t v3;
  NSDate *creationDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VIOSessionDailyUsageEntry;
  v2 = -[VIOSessionDailyUsageEntry init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    creationDate = v2->_creationDate;
    v2->_creationDate = (NSDate *)v3;

  }
  return v2;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageEntry creationDate](self, "creationDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageEntry lastStartDate](self, "lastStartDate"));
  -[VIOSessionDailyUsageEntry currentUsage](self, "currentUsage");
  v9 = v8;
  -[VIOSessionDailyUsageEntry timeRemaining](self, "timeRemaining");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p: creationDate: %@ lastStartDate: %@ currentUsage: %f timeRemaining: %f>"), v5, self, v6, v7, v9, v10));

  return v11;
}

- (double)timeRemaining
{
  const char *label;
  const char *v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  double v14;
  double v15;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  char *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  char *v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  char *v31;
  int v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v17 = sub_1004318FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v32 = 136316418;
        v33 = "-[VIOSessionDailyUsageEntry timeRemaining]";
        v34 = 2080;
        v35 = "VIOSessionDailyUsageEntry.m";
        v36 = 1024;
        v37 = 89;
        v38 = 2080;
        v39 = "dispatch_get_main_queue()";
        v40 = 2080;
        v41 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v42 = 2080;
        v43 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v32,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v19 = sub_1004318FC();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v32 = 138412290;
          v33 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v32, 0xCu);

        }
      }
    }
  }
  -[VIOSessionDailyUsageEntry dailyUsageLimit](self, "dailyUsageLimit");
  v7 = v6;
  -[VIOSessionDailyUsageEntry currentUsage](self, "currentUsage");
  v9 = v7 - v8;
  if (v9 < 0.0)
  {
    v22 = sub_1004318FC();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v32 = 136315906;
      v33 = "-[VIOSessionDailyUsageEntry timeRemaining]";
      v34 = 2080;
      v35 = "VIOSessionDailyUsageEntry.m";
      v36 = 1024;
      v37 = 93;
      v38 = 2080;
      v39 = "timeRemaining >= 0";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v32, 0x26u);
    }

    if (sub_100A70734())
    {
      v24 = sub_1004318FC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v32 = 138412290;
        v33 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v32, 0xCu);

      }
    }
  }
  -[VIOSessionDailyUsageEntry dailyUsageLimit](self, "dailyUsageLimit");
  if (v9 > v10)
  {
    v27 = sub_1004318FC();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v32 = 136315906;
      v33 = "-[VIOSessionDailyUsageEntry timeRemaining]";
      v34 = 2080;
      v35 = "VIOSessionDailyUsageEntry.m";
      v36 = 1024;
      v37 = 94;
      v38 = 2080;
      v39 = "timeRemaining <= self.dailyUsageLimit";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v32, 0x26u);
    }

    if (sub_100A70734())
    {
      v29 = sub_1004318FC();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v32 = 138412290;
        v33 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v32, 0xCu);

      }
    }
  }
  if (v9 < 0.0 || (-[VIOSessionDailyUsageEntry dailyUsageLimit](self, "dailyUsageLimit"), v9 > v11))
  {
    v12 = sub_100BD0FF8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v32 = 134217984;
      v33 = *(const char **)&v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Detected invalid value for time remaining (%f); clamping",
        (uint8_t *)&v32,
        0xCu);
    }

    v9 = fmax(v9, 0.0);
    -[VIOSessionDailyUsageEntry dailyUsageLimit](self, "dailyUsageLimit");
    if (v9 >= v14)
    {
      -[VIOSessionDailyUsageEntry dailyUsageLimit](self, "dailyUsageLimit");
      return v15;
    }
  }
  return v9;
}

- (BOOL)isOld
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  int v11;
  VIOSessionDailyUsageEntry *v12;
  __int16 v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageEntry creationDate](self, "creationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "components:fromDate:toDate:options:", 16, v4, v5, 0));

  v7 = objc_msgSend(v6, "day");
  v8 = sub_100BD0FF8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = self;
    v13 = 2048;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ is %ld day(s) old", (uint8_t *)&v11, 0x16u);
  }

  return v7 != 0;
}

- (double)dailyUsageLimit
{
  return GEOConfigGetDouble(MapsConfig_OpticalHeadingSessionThrottlerDailyUsageLimit, off_1014B3488);
}

- (double)timeMultiplier
{
  unsigned int v2;
  double result;

  v2 = -[VIOSessionDailyUsageEntry isRunningVIO](self, "isRunningVIO");
  result = 1.2;
  if (v2)
    return 1.0;
  return result;
}

- (void)updateCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

+ (void)clearEntry
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("kVIOSessionDailyUsageEntryUserDefaultsKey"));

}

- (VIOSessionDailyUsageEntry)initWithCoder:(id)a3
{
  id v4;
  VIOSessionDailyUsageEntry *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  NSDate *creationDate;
  uint64_t v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  NSDate *lastStartDate;
  uint64_t v16;
  NSString *v17;
  void *v18;
  void *v19;
  double v20;
  NSString *v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)VIOSessionDailyUsageEntry;
  v5 = -[VIOSessionDailyUsageEntry init](&v24, "init");
  if (v5)
  {
    v6 = objc_opt_class(NSDate);
    v7 = NSStringFromSelector("creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v8));
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v9;

    v11 = objc_opt_class(NSDate);
    v12 = NSStringFromSelector("lastStartDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v13));
    lastStartDate = v5->_lastStartDate;
    v5->_lastStartDate = (NSDate *)v14;

    v16 = objc_opt_class(NSNumber);
    v17 = NSStringFromSelector("currentUsage");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v18));
    objc_msgSend(v19, "doubleValue");
    v5->_currentUsage = v20;

    v21 = NSStringFromSelector("isRunningVIO");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v5->_isRunningVIO = objc_msgSend(v4, "decodeBoolForKey:", v22);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  _BOOL8 v14;
  NSString *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageEntry creationDate](self, "creationDate"));
  v6 = NSStringFromSelector("creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "encodeObject:forKey:", v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionDailyUsageEntry lastStartDate](self, "lastStartDate"));
  v9 = NSStringFromSelector("lastStartDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v4, "encodeObject:forKey:", v8, v10);

  -[VIOSessionDailyUsageEntry currentUsage](self, "currentUsage");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v12 = NSStringFromSelector("currentUsage");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v4, "encodeObject:forKey:", v11, v13);

  v14 = -[VIOSessionDailyUsageEntry isRunningVIO](self, "isRunningVIO");
  v15 = NSStringFromSelector("isRunningVIO");
  v16 = (id)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v4, "encodeBool:forKey:", v14, v16);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastStartDate
{
  return self->_lastStartDate;
}

- (void)setLastStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastStartDate, a3);
}

- (double)currentUsage
{
  return self->_currentUsage;
}

- (void)setCurrentUsage:(double)a3
{
  self->_currentUsage = a3;
}

- (BOOL)isRunningVIO
{
  return self->_isRunningVIO;
}

- (void)setIsRunningVIO:(BOOL)a3
{
  self->_isRunningVIO = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastStartDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
