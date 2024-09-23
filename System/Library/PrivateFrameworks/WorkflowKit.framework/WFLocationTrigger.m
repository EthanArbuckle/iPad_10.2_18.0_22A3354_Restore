@implementation WFLocationTrigger

- (BOOL)hasValidConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[WFLocationTrigger region](self, "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFLocationTrigger startTime](self, "startTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[WFLocationTrigger startTime](self, "startTime");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFLocationTrigger endTime](self, "endTime");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "compare:", v6) != 1;

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isDateWithinTimeRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  BOOL v20;
  void *v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  NSObject *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationTrigger startTime](self, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 96, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v7, "hour"), objc_msgSend(v7, "minute"), 0, v4, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  -[WFLocationTrigger endTime](self, "endTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 96, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v10, "hour"), objc_msgSend(v10, "minute"), 0, v4, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v8)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to calculate todayStart (%@) or todayEnd (%@) times"), v8, v11);
    v14 = objc_claimAutoreleasedReturnValue();
    getWFTriggersLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[WFLocationTrigger isDateWithinTimeRange:]";
      v28 = 2114;
      v29 = v14;
      v16 = "%s %{public}@";
      v17 = v15;
      v18 = OS_LOG_TYPE_ERROR;
      v19 = 22;
LABEL_8:
      _os_log_impl(&dword_1C15B3000, v17, v18, v16, buf, v19);
    }
  }
  else
  {
    if (-[NSObject isEqualToDate:](v8, "isEqualToDate:", v11))
    {
      objc_msgSend(v5, "components:fromDate:", 96, v4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFLocationTrigger startTime](self, "startTime");
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "components:fromDate:", 96, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v24) = objc_msgSend(v23, "isEqual:", v25);
      if ((v24 & 1) != 0)
      {
        v20 = 1;
        goto LABEL_12;
      }
    }
    if (-[NSObject compare:](v8, "compare:", v12) != -1)
    {
      getWFTriggersLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        v27 = "-[WFLocationTrigger isDateWithinTimeRange:]";
        v28 = 2114;
        v29 = v8;
        v30 = 2114;
        v31 = v12;
        _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_FAULT, "%s Today start %{public}@ should not be after today end %{public}@", buf, 0x20u);
      }
      goto LABEL_10;
    }
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v12);
    if ((-[NSObject containsDate:](v14, "containsDate:", v4) & 1) != 0)
    {
      v20 = 1;
      goto LABEL_11;
    }
    getWFTriggersLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[WFLocationTrigger isDateWithinTimeRange:]";
      v16 = "%s Not running location trigger due to start/end time";
      v17 = v15;
      v18 = OS_LOG_TYPE_DEBUG;
      v19 = 12;
      goto LABEL_8;
    }
  }

LABEL_10:
  v20 = 0;
LABEL_11:

LABEL_12:
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFLocationTrigger;
  v4 = -[WFTrigger copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[WFLocationTrigger region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setRegion:", v6);

  -[WFLocationTrigger startTime](self, "startTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setStartTime:", v8);

  -[WFLocationTrigger endTime](self, "endTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setEndTime:", v10);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFLocationTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[WFLocationTrigger region](self, "region", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("region"));

  -[WFLocationTrigger startTime](self, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("startTime"));

  -[WFLocationTrigger endTime](self, "endTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("endTime"));

}

- (WFLocationTrigger)initWithCoder:(id)a3
{
  id v4;
  WFLocationTrigger *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WFLocationTrigger *v14;
  objc_super v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFLocationTrigger;
  v5 = -[WFTrigger initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v6 = (void *)getCLCircularRegionClass_softClass;
    v21 = getCLCircularRegionClass_softClass;
    if (!getCLCircularRegionClass_softClass)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __getCLCircularRegionClass_block_invoke;
      v17[3] = &unk_1E7AF9520;
      v17[4] = &v18;
      __getCLCircularRegionClass_block_invoke((uint64_t)v17);
      v6 = (void *)v19[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v18, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("region"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationTrigger setRegion:](v5, "setRegion:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationTrigger setStartTime:](v5, "setStartTime:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endTime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationTrigger setEndTime:](v5, "setEndTime:", v10);

    v11 = (void *)objc_opt_class();
    if (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()))
    {
      -[WFLocationTrigger region](v5, "region");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNotifyOnEntry:", 1);
    }
    else
    {
      v13 = (void *)objc_opt_class();
      if (!objc_msgSend(v13, "isSubclassOfClass:", objc_opt_class()))
      {
LABEL_9:
        v14 = v5;
        goto LABEL_10;
      }
      -[WFLocationTrigger region](v5, "region");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNotifyOnExit:", 1);
    }

    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

+ (BOOL)requiresNotification
{
  return 1;
}

+ (id)timestampDateFormatter
{
  if (timestampDateFormatter_onceToken != -1)
    dispatch_once(&timestampDateFormatter_onceToken, &__block_literal_global_36368);
  return (id)timestampDateFormatter_dateFormatter;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __43__WFLocationTrigger_timestampDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)timestampDateFormatter_dateFormatter;
  timestampDateFormatter_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)timestampDateFormatter_dateFormatter, "setDateStyle:", 0);
  return objc_msgSend((id)timestampDateFormatter_dateFormatter, "setTimeStyle:", 1);
}

@end
