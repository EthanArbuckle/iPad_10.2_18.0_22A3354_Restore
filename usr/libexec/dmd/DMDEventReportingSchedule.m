@implementation DMDEventReportingSchedule

- (DMDEventReportingSchedule)initWithScheduleRegistration:(id)a3
{
  id v4;
  DMDEventReportingSchedule *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  _UNKNOWN **v23;
  uint64_t v24;
  NSNumber *day;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)DMDEventReportingSchedule;
  v5 = -[DMDEventReportingSchedule init](&v27, "init");
  if (!v5)
    goto LABEL_24;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "schedule"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "payloadFrequency"));
  v10 = v9;
  if (!v9)
    goto LABEL_9;
  if (!objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("Immediate")))
  {
    v14 = 0;
    goto LABEL_17;
  }
  if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("Minutely"))
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeviceController shared](DMDDeviceController, "shared")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "isAppleInternal")),
        v13 = objc_msgSend(v12, "BOOLValue"),
        v12,
        v11,
        (v13 & 1) == 0))
  {
    if (!objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("Hourly")))
    {
      v14 = 2;
      goto LABEL_17;
    }
    if (!objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("Weekly")))
    {
      v14 = 4;
      goto LABEL_17;
    }
LABEL_9:
    v15 = objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("Daily"));
    if (v15)
    {
      v16 = DMFConfigurationEngineLog(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_100077084((uint64_t)v10, v17);

    }
    v14 = 3;
    goto LABEL_17;
  }
  v14 = 1;
LABEL_17:
  v5->_frequency = v14;
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "payloadLocalTime"));
  v19 = (void *)v18;
  if (v18)
    v20 = (__CFString *)v18;
  else
    v20 = CFSTR("00:00");
  objc_storeStrong((id *)&v5->_localTime, v20);

  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "payloadSpread"));
  v22 = (void *)v21;
  if (v21)
    v23 = (_UNKNOWN **)v21;
  else
    v23 = &off_1000C3510;
  objc_storeStrong((id *)&v5->_spread, v23);

  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "payloadDay"));
  day = v5->_day;
  v5->_day = (NSNumber *)v24;

LABEL_24:
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)DMDEventReportingSchedule;
  -[DMDEventReportingSchedule dealloc](&v3, "dealloc");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[4];

  v7[0] = CFSTR("frequency");
  v7[1] = CFSTR("localTime");
  v7[2] = CFSTR("spread");
  v7[3] = CFSTR("day");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 4));
  v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  DMDEventReportingSchedule *v4;
  uint64_t v5;
  DMDEventReportingSchedule *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v18;

  v4 = (DMDEventReportingSchedule *)a3;
  if (v4 == self)
  {
    v16 = 1;
  }
  else
  {
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule day](self, "day"));
      v8 = objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule day](v6, "day"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule identifier](self, "identifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule identifier](v6, "identifier"));
      if (objc_msgSend(v9, "isEqual:", v10)
        && (v11 = -[DMDEventReportingSchedule frequency](self, "frequency"),
            v11 == (id)-[DMDEventReportingSchedule frequency](v6, "frequency")))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule localTime](self, "localTime"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule localTime](v6, "localTime"));
        if (objc_msgSend(v12, "isEqual:", v13))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule spread](self, "spread"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule spread](v6, "spread"));
          v18 = v14;
          if (objc_msgSend(v14, "isEqual:", v15))
          {
            if (v7 | v8)
              v16 = objc_msgSend((id)v7, "isEqual:", v8);
            else
              v16 = 1;
          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule identifier](self, "identifier"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[DMDEventReportingSchedule frequency](self, "frequency")));
  v6 = (unint64_t)objc_msgSend(v5, "hash");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule localTime](self, "localTime"));
  v8 = v4 ^ (unint64_t)objc_msgSend(v7, "hash");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule spread](self, "spread"));
  v10 = v8 ^ (unint64_t)objc_msgSend(v9, "hash");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule day](self, "day"));
  v12 = v6 ^ v10 ^ (unint64_t)objc_msgSend(v11, "hash");

  return v12;
}

- (void)startWithScheduleElapsedHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  double v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  switch(-[DMDEventReportingSchedule frequency](self, "frequency"))
  {
    case 1:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeviceController shared](DMDDeviceController, "shared"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "isAppleInternal"));
      v7 = objc_msgSend(v6, "BOOLValue");

      if (v7)
        v8 = 60.0;
      else
        v8 = 86400.0;
      break;
    case 2:
      v8 = 3600.0;
      break;
    case 3:
      v8 = 86400.0;
      break;
    case 4:
      v8 = 604800.0;
      break;
    default:
      v8 = 0.0;
      break;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100041DE4;
  v11[3] = &unk_1000BAEF0;
  v12 = v4;
  v9 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, v11, v8));
  -[DMDEventReportingSchedule setTimer:](self, "setTimer:", v10);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (NSString)localTime
{
  return self->_localTime;
}

- (NSNumber)spread
{
  return self->_spread;
}

- (NSNumber)day
{
  return self->_day;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_day, 0);
  objc_storeStrong((id *)&self->_spread, 0);
  objc_storeStrong((id *)&self->_localTime, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
