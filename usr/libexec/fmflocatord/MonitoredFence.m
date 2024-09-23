@implementation MonitoredFence

- (MonitoredFence)initWithDictionary:(id)a3
{
  id v4;
  MonitoredFence *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;

  v4 = a3;
  v5 = -[MonitoredFence init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fenceId")));
    if (v6)
    {
      -[MonitoredFence setFenceId:](v5, "setFenceId:", v6);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id")));
      -[MonitoredFence setFenceId:](v5, "setFenceId:", v7);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trigger")));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trigger")));
      v10 = (id)sub_100016150(v9);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerType")));
      v10 = objc_msgSend(v9, "integerValue");
    }
    -[MonitoredFence setTriggerType:](v5, "setTriggerType:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerURL")));
    -[MonitoredFence setTriggerURL:](v5, "setTriggerURL:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("latitude")));
    objc_msgSend(v12, "doubleValue");
    -[MonitoredFence setLatitude:](v5, "setLatitude:");

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("longitude")));
    objc_msgSend(v13, "doubleValue");
    -[MonitoredFence setLongitude:](v5, "setLongitude:");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("radius")));
    objc_msgSend(v14, "doubleValue");
    -[MonitoredFence setRadius:](v5, "setRadius:");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fenceContext")));
    -[MonitoredFence setContextDict:](v5, "setContextDict:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastTrigger")));
    -[MonitoredFence setLastTrigger:](v5, "setLastTrigger:", objc_msgSend(v16, "integerValue"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastTriggerTimestamp")));
    v19 = objc_opt_class(NSDate, v18);
    if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastTriggerTimestamp")));
      -[MonitoredFence setLastTriggerTimestamp:](v5, "setLastTriggerTimestamp:", v20);

    }
    else
    {
      -[MonitoredFence setLastTriggerTimestamp:](v5, "setLastTriggerTimestamp:", 0);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ckRecordName")));
    -[MonitoredFence setCkRecordName:](v5, "setCkRecordName:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ckRecordZoneOwnerName")));
    -[MonitoredFence setCkRecordZoneOwnerName:](v5, "setCkRecordZoneOwnerName:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type")));
    -[MonitoredFence setType:](v5, "setType:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acceptanceStatus")));
    -[MonitoredFence setAcceptanceStatus:](v5, "setAcceptanceStatus:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onetimeonly")));
    v26 = v25;
    if (v25)
      v27 = objc_msgSend(v25, "BOOLValue") ^ 1;
    else
      v27 = 0;
    -[MonitoredFence setRecurring:](v5, "setRecurring:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fenceTimeRange")));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "fm_nullToNil"));

    v31 = objc_msgSend((id)objc_opt_class(v5, v30), "createScheduleWithDictionary:", v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    -[MonitoredFence setSchedule:](v5, "setSchedule:", v32);

  }
  return v5;
}

+ (id)createScheduleWithDictionary:(id)a3
{
  id v3;
  int v4;
  Class *v5;
  id v6;

  v3 = a3;
  v4 = sub_10001F9D4();
  if (v3)
  {
    v5 = (Class *)FMFSchedule_ptr;
    if (!v4)
      v5 = (Class *)off_100054900;
    v6 = objc_msgSend(objc_alloc(*v5), "initWithDictionary:", v3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDictionary)dictionary
{
  NSMutableDictionary *v3;
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
  void *v17;
  void *v18;
  void *v19;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence fenceId](self, "fenceId"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("id"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MonitoredFence triggerType](self, "triggerType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CFSTR("triggerType"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence triggerURL](self, "triggerURL"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, CFSTR("triggerURL"));

  -[MonitoredFence latitude](self, "latitude");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CFSTR("latitude"));

  -[MonitoredFence longitude](self, "longitude");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, CFSTR("longitude"));

  -[MonitoredFence radius](self, "radius");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, CFSTR("radius"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence contextDict](self, "contextDict"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, CFSTR("fenceContext"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MonitoredFence lastTrigger](self, "lastTrigger")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, CFSTR("lastTrigger"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence lastTriggerTimestamp](self, "lastTriggerTimestamp"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, CFSTR("lastTriggerTimestamp"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence schedule](self, "schedule"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dictionary"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, CFSTR("fenceTimeRange"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MonitoredFence isRecurring](self, "isRecurring") ^ 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v15, CFSTR("onetimeonly"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence ckRecordName](self, "ckRecordName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v16, CFSTR("ckRecordName"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence ckRecordZoneOwnerName](self, "ckRecordZoneOwnerName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v17, CFSTR("ckRecordZoneOwnerName"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence acceptanceStatus](self, "acceptanceStatus"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v18, CFSTR("acceptanceStatus"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence type](self, "type"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v19, CFSTR("type"));

  return (NSDictionary *)v3;
}

- (BOOL)shouldUseIDSTrigger
{
  _BOOL4 v3;

  if (-[MonitoredFence isNotifyMeFence](self, "isNotifyMeFence")
    && (-[MonitoredFence isRecurring](self, "isRecurring")
     || (id)-[MonitoredFence triggerType](self, "triggerType") == (id)3))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[MonitoredFence isNotifyOthersFence](self, "isNotifyOthersFence");
    if (v3)
      LOBYTE(v3) = (id)-[MonitoredFence triggerType](self, "triggerType") == (id)3;
  }
  return v3;
}

- (BOOL)shouldTrigger:(int64_t)a3 forLocation:(id)a4 atDate:(id)a5 reason:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  BOOL v18;
  __CFString *v19;
  void *v20;
  unsigned int v21;

  v10 = a4;
  v11 = a5;
  if (-[MonitoredFence isValidTrigger:](self, "isValidTrigger:", a3))
  {
    if (-[MonitoredFence isAllowedAtLocation:](self, "isAllowedAtLocation:", v10))
    {
      if (-[MonitoredFence lastTrigger](self, "lastTrigger") == a3)
      {
        v12 = objc_claimAutoreleasedReturnValue(-[MonitoredFence lastTriggerTimestamp](self, "lastTriggerTimestamp"));
        if (v12)
        {
          v13 = (void *)v12;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence lastTriggerTimestamp](self, "lastTriggerTimestamp"));
          objc_msgSend(v11, "timeIntervalSinceDate:", v14);
          v16 = v15;

          if (v16 < 5.0)
          {
            if (a6)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence lastTriggerTimestamp](self, "lastTriggerTimestamp"));
              *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("date (%@) < lastTriggerTimestamp (%@) + 5s"), v11, v17));

            }
            goto LABEL_16;
          }
        }
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
      v21 = objc_msgSend(v20, "isFMFAppRemoved");

      if (!v21)
      {
        v18 = 1;
        goto LABEL_18;
      }
      if (!a6)
        goto LABEL_16;
      v18 = 0;
      v19 = CFSTR("app is removed");
      goto LABEL_10;
    }
    if (a6)
    {
      v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("not allowed at location: %@"), v10));
      goto LABEL_18;
    }
LABEL_16:
    v18 = 0;
    goto LABEL_18;
  }
  if (!a6)
    goto LABEL_16;
  v18 = 0;
  v19 = CFSTR("invalid trigger");
LABEL_10:
  *a6 = v19;
LABEL_18:

  return v18;
}

- (id)description
{
  void *v3;
  int64_t v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v24;
  uint64_t v25;
  void *v26;

  v25 = objc_opt_class(self, a2);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence fenceId](self, "fenceId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence type](self, "type"));
  v4 = -[MonitoredFence triggerType](self, "triggerType");
  if ((unint64_t)(v4 - 1) > 2)
    v5 = CFSTR("enter");
  else
    v5 = *(&off_100055770 + v4 - 1);
  v24 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence contextDict](self, "contextDict"));
  -[MonitoredFence latitude](self, "latitude");
  v8 = v7;
  -[MonitoredFence longitude](self, "longitude");
  v10 = v9;
  -[MonitoredFence radius](self, "radius");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence schedule](self, "schedule"));
  v14 = -[MonitoredFence isRecurring](self, "isRecurring");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence triggerURL](self, "triggerURL"));
  v16 = -[MonitoredFence lastTrigger](self, "lastTrigger");
  if (v16 > 3)
    v17 = CFSTR("in");
  else
    v17 = *(&off_100055788 + v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence lastTriggerTimestamp](self, "lastTriggerTimestamp"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence acceptanceStatus](self, "acceptanceStatus"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence ckRecordName](self, "ckRecordName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence ckRecordZoneOwnerName](self, "ckRecordZoneOwnerName"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ fenceId: %@, type: %@, triggerType: %@, contextDict: %@, latitude: %f, longitude: %f, radius: %f, schedule: %@, recurring: %d, triggerURL: %@, lastTrigger: %@, lastTriggerTimestamp: %@, acceptanceStatus: %@, ckRecordName: %@, ckRecordZoneOwnerName: %@>"), v25, v26, v3, v24, v6, v8, v10, v12, v13, v14, v15, v17, v18, v19, v20,
                    v21));

  return v22;
}

- (BOOL)isNotifyMeFence
{
  const __CFString *v3;

  if (sub_10001F9D4())
    v3 = (const __CFString *)FMFFenceTypeNotifyMe;
  else
    v3 = CFSTR("NotifyMe");
  return -[NSString isEqualToString:](self->_type, "isEqualToString:", v3);
}

- (BOOL)isNotifyOthersFence
{
  const __CFString *v3;

  if (sub_10001F9D4())
    v3 = (const __CFString *)FMFFenceTypeNotifyOther;
  else
    v3 = CFSTR("NotifyOthers");
  return -[NSString isEqualToString:](self->_type, "isEqualToString:", v3);
}

- (BOOL)isAllowedAtLocation:(id)a3
{
  id v3;
  int v4;
  void **v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = a3;
  v4 = sub_10001F9D4();
  v5 = (void **)FMFFence_ptr;
  if (!v4)
    v5 = (void **)&off_100054908;
  v6 = *v5;
  objc_msgSend(v3, "coordinate");
  v8 = v7;
  v10 = v9;

  return objc_msgSend(v6, "isAllowedAtLocation:", v8, v10);
}

- (BOOL)isValidTrigger:(int64_t)a3
{
  BOOL v4;
  BOOL v5;

  switch(-[MonitoredFence triggerType](self, "triggerType"))
  {
    case 0:
      v5 = a3 == 0;
      goto LABEL_6;
    case 1:
      v5 = a3 == 1;
      goto LABEL_6;
    case 2:
      return (unint64_t)a3 < 2;
    case 3:
      v5 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
LABEL_6:
      v4 = v5;
      break;
    default:
      return v4;
  }
  return v4;
}

- (NSString)fenceId
{
  return self->_fenceId;
}

- (void)setFenceId:(id)a3
{
  objc_storeStrong((id *)&self->_fenceId, a3);
}

- (int64_t)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(int64_t)a3
{
  self->_triggerType = a3;
}

- (BOOL)isRecurring
{
  return self->_recurring;
}

- (void)setRecurring:(BOOL)a3
{
  self->_recurring = a3;
}

- (NSDictionary)contextDict
{
  return self->_contextDict;
}

- (void)setContextDict:(id)a3
{
  objc_storeStrong((id *)&self->_contextDict, a3);
}

- (NSString)triggerURL
{
  return self->_triggerURL;
}

- (void)setTriggerURL:(id)a3
{
  objc_storeStrong((id *)&self->_triggerURL, a3);
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (FenceScheduleProtocol)schedule
{
  return self->_schedule;
}

- (void)setSchedule:(id)a3
{
  objc_storeStrong((id *)&self->_schedule, a3);
}

- (int64_t)lastTrigger
{
  return self->_lastTrigger;
}

- (void)setLastTrigger:(int64_t)a3
{
  self->_lastTrigger = a3;
}

- (NSDate)lastTriggerTimestamp
{
  return self->_lastTriggerTimestamp;
}

- (void)setLastTriggerTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastTriggerTimestamp, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)acceptanceStatus
{
  return self->_acceptanceStatus;
}

- (void)setAcceptanceStatus:(id)a3
{
  objc_storeStrong((id *)&self->_acceptanceStatus, a3);
}

- (NSString)ckRecordName
{
  return self->_ckRecordName;
}

- (void)setCkRecordName:(id)a3
{
  objc_storeStrong((id *)&self->_ckRecordName, a3);
}

- (NSString)ckRecordZoneOwnerName
{
  return self->_ckRecordZoneOwnerName;
}

- (void)setCkRecordZoneOwnerName:(id)a3
{
  objc_storeStrong((id *)&self->_ckRecordZoneOwnerName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckRecordZoneOwnerName, 0);
  objc_storeStrong((id *)&self->_ckRecordName, 0);
  objc_storeStrong((id *)&self->_acceptanceStatus, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_lastTriggerTimestamp, 0);
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_triggerURL, 0);
  objc_storeStrong((id *)&self->_contextDict, 0);
  objc_storeStrong((id *)&self->_fenceId, 0);
}

@end
