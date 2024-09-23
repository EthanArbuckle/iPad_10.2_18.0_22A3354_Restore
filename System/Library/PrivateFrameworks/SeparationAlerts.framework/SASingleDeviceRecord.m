@implementation SASingleDeviceRecord

- (SASingleDeviceRecord)initWithDevice:(id)a3 clock:(id)a4 analytics:(id)a5
{
  id v9;
  id v10;
  id v11;
  SASingleDeviceRecord *v12;
  SASingleDeviceRecord *v13;
  void *v14;
  uint64_t v15;
  NSUUID *uuid;
  TASPAdvertisement *latestAdvertisement;
  NSDate *latestCaseAdvertisementDate;
  NSMutableArray *v19;
  NSMutableArray *uuidsOfRelatedDevices;
  NSDate *firstAdvertisementAfterScenarioTransition;
  uint64_t v22;
  NSDate *currentScenarioTime;
  NSDate *lastCompanionDisconnectionDate;
  SASingleDeviceRecord *v25;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SASingleDeviceRecord;
  v12 = -[SASingleDeviceRecord init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    if (!v9)
    {
      v25 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v12->_clock, a4);
    objc_storeStrong((id *)&v13->_analytics, a5);
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    uuid = v13->_uuid;
    v13->_uuid = (NSUUID *)v15;

    objc_storeStrong((id *)&v13->_device, a3);
    latestAdvertisement = v13->_latestAdvertisement;
    *(_OWORD *)&v13->_withYouStatus = 0u;
    *(_OWORD *)&v13->_notificationState = 0u;

    latestCaseAdvertisementDate = v13->_latestCaseAdvertisementDate;
    v13->_latestCaseAdvertisementDate = 0;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    uuidsOfRelatedDevices = v13->_uuidsOfRelatedDevices;
    v13->_uuidsOfRelatedDevices = v19;

    v13->_hasSurfacedNotification = 0;
    firstAdvertisementAfterScenarioTransition = v13->_firstAdvertisementAfterScenarioTransition;
    v13->_firstAdvertisementAfterScenarioTransition = 0;

    -[SATimeServiceProtocol getCurrentTime](v13->_clock, "getCurrentTime");
    v22 = objc_claimAutoreleasedReturnValue();
    currentScenarioTime = v13->_currentScenarioTime;
    v13->_currentScenarioTime = (NSDate *)v22;

    lastCompanionDisconnectionDate = v13->_lastCompanionDisconnectionDate;
    v13->_lastCompanionDisconnectionDate = 0;

  }
  v25 = v13;
LABEL_6:

  return v25;
}

- (SASingleDeviceRecord)initWithConnectionEvent:(id)a3 clock:(id)a4 analytics:(id)a5
{
  id v8;
  id v9;
  id v10;
  SASingleDeviceRecord *v11;
  SASingleDeviceRecord *v12;
  void *v13;
  uint64_t v14;
  NSUUID *uuid;
  SADevice *device;
  _BOOL8 v17;
  SASingleDeviceRecord *v18;
  TASPAdvertisement *latestAdvertisement;
  TASPAdvertisement *latestNOAdvertisement;
  TASPAdvertisement *latestWildAdvertisement;
  NSDate *latestCaseAdvertisementDate;
  NSMutableArray *v23;
  NSMutableArray *uuidsOfRelatedDevices;
  uint64_t v25;
  NSDate *currentScenarioTime;
  uint64_t v27;
  NSDate *lastCompanionDisconnectionDate;
  CLCircularRegion *lastWithYouLocation;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)SASingleDeviceRecord;
  v11 = -[SASingleDeviceRecord init](&v31, sel_init);
  v12 = v11;
  if (!v11)
  {
LABEL_12:
    v18 = v12;
    goto LABEL_13;
  }
  if (v8)
  {
    objc_storeStrong((id *)&v11->_clock, a4);
    objc_storeStrong((id *)&v12->_analytics, a5);
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    uuid = v12->_uuid;
    v12->_uuid = (NSUUID *)v14;

    device = v12->_device;
    v12->_device = 0;

    v17 = objc_msgSend(v8, "state") == 2 || objc_msgSend(v8, "state") == 3;
    v12->_withYouStatus = v17;
    v12->_connectionState = objc_msgSend(v8, "state");
    v12->_notificationState = 0;
    latestAdvertisement = v12->_latestAdvertisement;
    v12->_latestAdvertisement = 0;

    latestNOAdvertisement = v12->_latestNOAdvertisement;
    v12->_latestNOAdvertisement = 0;

    latestWildAdvertisement = v12->_latestWildAdvertisement;
    v12->_latestWildAdvertisement = 0;

    latestCaseAdvertisementDate = v12->_latestCaseAdvertisementDate;
    v12->_latestCaseAdvertisementDate = 0;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    uuidsOfRelatedDevices = v12->_uuidsOfRelatedDevices;
    v12->_uuidsOfRelatedDevices = v23;

    v12->_hasSurfacedNotification = 0;
    -[SATimeServiceProtocol getCurrentTime](v12->_clock, "getCurrentTime");
    v25 = objc_claimAutoreleasedReturnValue();
    currentScenarioTime = v12->_currentScenarioTime;
    v12->_currentScenarioTime = (NSDate *)v25;

    if (objc_msgSend(v8, "state") && objc_msgSend(v8, "state") != 1)
    {
      lastCompanionDisconnectionDate = v12->_lastCompanionDisconnectionDate;
      v12->_lastCompanionDisconnectionDate = 0;
    }
    else
    {
      -[SATimeServiceProtocol getCurrentTime](v12->_clock, "getCurrentTime");
      v27 = objc_claimAutoreleasedReturnValue();
      lastCompanionDisconnectionDate = v12->_lastCompanionDisconnectionDate;
      v12->_lastCompanionDisconnectionDate = (NSDate *)v27;
    }

    lastWithYouLocation = v12->_lastWithYouLocation;
    v12->_lastWithYouLocation = 0;

    goto LABEL_12;
  }
  v18 = 0;
LABEL_13:

  return v18;
}

- (void)updateLatestAdvertisement:(id)a3
{
  void *v5;
  TASPAdvertisement **p_latestAdvertisement;
  TASPAdvertisement *latestNOAdvertisement;
  void *v8;
  void *v9;
  uint64_t v10;
  TASPAdvertisement *v11;
  TASPAdvertisement **p_latestWildAdvertisement;
  TASPAdvertisement *latestWildAdvertisement;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "getDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASingleDeviceRecord updateFirstAdvertisementAfterScenarioTransition:](self, "updateFirstAdvertisementAfterScenarioTransition:", v5);

  p_latestAdvertisement = &self->_latestAdvertisement;
  if (!self->_latestAdvertisement)
  {
    objc_storeStrong((id *)&self->_latestAdvertisement, a3);
    if (objc_msgSend(v20, "getType") == 1)
    {
      p_latestAdvertisement = &self->_latestNOAdvertisement;
    }
    else
    {
      if (objc_msgSend(v20, "getType") != 2)
        goto LABEL_17;
      p_latestAdvertisement = &self->_latestWildAdvertisement;
    }
LABEL_16:
    objc_storeStrong((id *)p_latestAdvertisement, a3);
    goto LABEL_17;
  }
  if (objc_msgSend(v20, "getType") == 1)
  {
    latestNOAdvertisement = self->_latestNOAdvertisement;
    if (!latestNOAdvertisement
      || (-[TASPAdvertisement scanDate](latestNOAdvertisement, "scanDate"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v20, "scanDate"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v8, "compare:", v9),
          v9,
          v8,
          v10 == -1))
    {
      objc_storeStrong((id *)&self->_latestNOAdvertisement, a3);
    }
  }
  if (objc_msgSend(v20, "getType") == 2)
  {
    latestWildAdvertisement = self->_latestWildAdvertisement;
    p_latestWildAdvertisement = &self->_latestWildAdvertisement;
    v11 = latestWildAdvertisement;
    if (!latestWildAdvertisement
      || (-[TASPAdvertisement scanDate](v11, "scanDate"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v20, "scanDate"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v14, "compare:", v15),
          v15,
          v14,
          v16 == -1))
    {
      objc_storeStrong((id *)p_latestWildAdvertisement, a3);
    }
  }
  -[TASPAdvertisement scanDate](*p_latestAdvertisement, "scanDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scanDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "compare:", v18);

  if (v19 == -1)
    goto LABEL_16;
LABEL_17:

}

- (void)updateLatestCaseAdvertisementDate:(id)a3
{
  id v5;
  NSDate *v6;
  NSDate **p_latestCaseAdvertisementDate;
  NSDate *latestCaseAdvertisementDate;
  id v9;

  v5 = a3;
  latestCaseAdvertisementDate = self->_latestCaseAdvertisementDate;
  p_latestCaseAdvertisementDate = &self->_latestCaseAdvertisementDate;
  v6 = latestCaseAdvertisementDate;
  v9 = v5;
  if (!latestCaseAdvertisementDate)
  {
    objc_storeStrong((id *)p_latestCaseAdvertisementDate, a3);
    v5 = v9;
    v6 = *p_latestCaseAdvertisementDate;
  }
  if (-[NSDate compare:](v6, "compare:", v5) == NSOrderedAscending)
    objc_storeStrong((id *)p_latestCaseAdvertisementDate, a3);

}

- (void)updateLastWithYouDate:(id)a3
{
  id v5;
  NSDate *v6;
  NSDate **p_lastWithYouDate;
  NSDate *lastWithYouDate;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  lastWithYouDate = self->_lastWithYouDate;
  p_lastWithYouDate = &self->_lastWithYouDate;
  v6 = lastWithYouDate;
  v11 = v5;
  if (!lastWithYouDate || (v9 = -[NSDate compare:](v6, "compare:", v5), v10 = v11, v9 == -1))
  {
    objc_storeStrong((id *)p_lastWithYouDate, a3);
    v10 = v11;
  }

}

- (void)updateLastCompanionDisconnectionDate:(id)a3
{
  id v5;
  NSDate *v6;
  NSDate **p_lastCompanionDisconnectionDate;
  NSDate *lastCompanionDisconnectionDate;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  lastCompanionDisconnectionDate = self->_lastCompanionDisconnectionDate;
  p_lastCompanionDisconnectionDate = &self->_lastCompanionDisconnectionDate;
  v6 = lastCompanionDisconnectionDate;
  v11 = v5;
  if (!lastCompanionDisconnectionDate || (v9 = -[NSDate compare:](v6, "compare:", v5), v10 = v11, v9 == -1))
  {
    objc_storeStrong((id *)p_lastCompanionDisconnectionDate, a3);
    v10 = v11;
  }

}

- (void)updateWithYouStatus:(unint64_t)a3
{
  self->_withYouStatus = a3;
}

- (void)updateFirstAdvertisementAfterScenarioTransition:(id)a3
{
  id v5;
  void *v6;
  double v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (self->_currentScenarioTime)
    {
      v8 = v5;
      objc_msgSend(v5, "timeIntervalSinceDate:");
      v6 = v8;
      if (self->_currentScenarioClass)
      {
        if (!self->_firstAdvertisementAfterScenarioTransition && v7 > 0.0)
        {
          self->_monitoringSessionStateAtTimeOfFirstAdv = self->_currentMonitoringSessionState;
          objc_storeStrong((id *)&self->_firstAdvertisementAfterScenarioTransition, a3);
          v6 = v8;
        }
      }
    }
  }

}

- (void)updateCurrentScenarioClass:(unint64_t)a3
{
  NSDate *v5;
  NSDate *firstAdvertisementAfterScenarioTransition;
  NSDate *currentScenarioTime;

  -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (a3 && self->_currentScenarioClass && self->_firstAdvertisementAfterScenarioTransition)
    -[SASingleDeviceRecord publishAnalyticsForFirstAdv:scenario:](self, "publishAnalyticsForFirstAdv:scenario:", v5, a3);
  firstAdvertisementAfterScenarioTransition = self->_firstAdvertisementAfterScenarioTransition;
  self->_firstAdvertisementAfterScenarioTransition = 0;

  currentScenarioTime = self->_currentScenarioTime;
  self->_currentScenarioTime = v5;

  self->_currentScenarioClass = a3;
}

- (void)publishAnalyticsForFirstAdv:(id)a3 scenario:(unint64_t)a4
{
  NSDate *firstAdvertisementAfterScenarioTransition;
  NSDate *currentScenarioTime;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  firstAdvertisementAfterScenarioTransition = self->_firstAdvertisementAfterScenarioTransition;
  currentScenarioTime = self->_currentScenarioTime;
  v8 = a3;
  -[NSDate timeIntervalSinceDate:](firstAdvertisementAfterScenarioTransition, "timeIntervalSinceDate:", currentScenarioTime);
  v10 = v9;
  objc_msgSend(v8, "timeIntervalSinceDate:", self->_firstAdvertisementAfterScenarioTransition);
  v12 = v11;

  v20[0] = CFSTR("currentScenario");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SASingleDeviceRecord currentScenarioClass](self, "currentScenarioClass"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v20[1] = CFSTR("firstDetectedToNextScenarioTimeInterval");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v14;
  v20[2] = CFSTR("nextScenario");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v15;
  v20[3] = CFSTR("previousMonitoringState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SASingleDeviceRecord monitoringSessionStateAtTimeOfFirstAdv](self, "monitoringSessionStateAtTimeOfFirstAdv"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v16;
  v20[4] = CFSTR("scenarioChangeToFirstDetectedTimeInterval");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[SASingleDeviceRecord analytics](self, "analytics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "submitEvent:content:", CFSTR("com.apple.clx.alert.firstAdv"), v18);

}

- (void)resetRelatedDevices
{
  -[NSMutableArray removeAllObjects](self->_uuidsOfRelatedDevices, "removeAllObjects");
}

- (void)insertRelatedDevice:(id)a3
{
  -[NSMutableArray addObject:](self->_uuidsOfRelatedDevices, "addObject:", a3);
}

- (BOOL)isConnected
{
  return -[SASingleDeviceRecord connectionState](self, "connectionState") == 2
      || -[SASingleDeviceRecord connectionState](self, "connectionState") == 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASingleDeviceRecord)initWithCoder:(id)a3
{
  id v4;
  SASingleDeviceRecord *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  SADevice *device;
  uint64_t v10;
  TASPAdvertisement *latestAdvertisement;
  uint64_t v12;
  NSDate *lastWithYouDate;
  uint64_t v14;
  NSMutableArray *uuidsOfRelatedDevices;
  uint64_t v16;
  NSDate *firstAdvertisementAfterScenarioTransition;
  uint64_t v18;
  NSDate *currentScenarioTime;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SASingleDeviceRecord;
  v5 = -[SASingleDeviceRecord init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Device"));
    v8 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (SADevice *)v8;

    v5->_withYouStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WithYouStatus"));
    v5->_connectionState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ConnectionState"));
    v5->_notificationState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NotificationState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LatestAdvertisement"));
    v10 = objc_claimAutoreleasedReturnValue();
    latestAdvertisement = v5->_latestAdvertisement;
    v5->_latestAdvertisement = (TASPAdvertisement *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastWithYouDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastWithYouDate = v5->_lastWithYouDate;
    v5->_lastWithYouDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RelatedDevices"));
    v14 = objc_claimAutoreleasedReturnValue();
    uuidsOfRelatedDevices = v5->_uuidsOfRelatedDevices;
    v5->_uuidsOfRelatedDevices = (NSMutableArray *)v14;

    v5->_hasSurfacedNotification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Surfaced"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FirstAdvertisement"));
    v16 = objc_claimAutoreleasedReturnValue();
    firstAdvertisementAfterScenarioTransition = v5->_firstAdvertisementAfterScenarioTransition;
    v5->_firstAdvertisementAfterScenarioTransition = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CurrentScenarioTime"));
    v18 = objc_claimAutoreleasedReturnValue();
    currentScenarioTime = v5->_currentScenarioTime;
    v5->_currentScenarioTime = (NSDate *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuid, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_device, CFSTR("Device"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_withYouStatus, CFSTR("WithYouStatus"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_connectionState, CFSTR("ConnectionState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_notificationState, CFSTR("NotificationState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latestAdvertisement, CFSTR("LatestAdvertisement"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastWithYouDate, CFSTR("LastWithYouDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuidsOfRelatedDevices, CFSTR("RelatedDevices"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasSurfacedNotification, CFSTR("Surfaced"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstAdvertisementAfterScenarioTransition, CFSTR("FirstAdvertisement"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentScenarioTime, CFSTR("CurrentScenarioTime"));

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (SADevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (unint64_t)withYouStatus
{
  return self->_withYouStatus;
}

- (void)setWithYouStatus:(unint64_t)a3
{
  self->_withYouStatus = a3;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (unint64_t)notificationState
{
  return self->_notificationState;
}

- (void)setNotificationState:(unint64_t)a3
{
  self->_notificationState = a3;
}

- (TASPAdvertisement)latestAdvertisement
{
  return self->_latestAdvertisement;
}

- (TASPAdvertisement)latestNOAdvertisement
{
  return self->_latestNOAdvertisement;
}

- (TASPAdvertisement)latestWildAdvertisement
{
  return self->_latestWildAdvertisement;
}

- (NSDate)latestCaseAdvertisementDate
{
  return self->_latestCaseAdvertisementDate;
}

- (NSDate)lastWithYouDate
{
  return self->_lastWithYouDate;
}

- (NSDate)lastCompanionDisconnectionDate
{
  return self->_lastCompanionDisconnectionDate;
}

- (unint64_t)currentScenarioClass
{
  return self->_currentScenarioClass;
}

- (unint64_t)currentMonitoringSessionState
{
  return self->_currentMonitoringSessionState;
}

- (void)setCurrentMonitoringSessionState:(unint64_t)a3
{
  self->_currentMonitoringSessionState = a3;
}

- (unint64_t)monitoringSessionStateAtTimeOfFirstAdv
{
  return self->_monitoringSessionStateAtTimeOfFirstAdv;
}

- (NSMutableArray)uuidsOfRelatedDevices
{
  return self->_uuidsOfRelatedDevices;
}

- (void)setUuidsOfRelatedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_uuidsOfRelatedDevices, a3);
}

- (BOOL)hasSurfacedNotification
{
  return self->_hasSurfacedNotification;
}

- (void)setHasSurfacedNotification:(BOOL)a3
{
  self->_hasSurfacedNotification = a3;
}

- (NSDate)firstAdvertisementAfterScenarioTransition
{
  return self->_firstAdvertisementAfterScenarioTransition;
}

- (NSDate)currentScenarioTime
{
  return self->_currentScenarioTime;
}

- (CLCircularRegion)lastWithYouLocation
{
  return self->_lastWithYouLocation;
}

- (void)setLastWithYouLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (SAAnalyticsServiceProtocol)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_analytics, a3);
}

- (SATimeServiceProtocol)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
  objc_storeStrong((id *)&self->_clock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_lastWithYouLocation, 0);
  objc_storeStrong((id *)&self->_currentScenarioTime, 0);
  objc_storeStrong((id *)&self->_firstAdvertisementAfterScenarioTransition, 0);
  objc_storeStrong((id *)&self->_uuidsOfRelatedDevices, 0);
  objc_storeStrong((id *)&self->_lastCompanionDisconnectionDate, 0);
  objc_storeStrong((id *)&self->_lastWithYouDate, 0);
  objc_storeStrong((id *)&self->_latestCaseAdvertisementDate, 0);
  objc_storeStrong((id *)&self->_latestWildAdvertisement, 0);
  objc_storeStrong((id *)&self->_latestNOAdvertisement, 0);
  objc_storeStrong((id *)&self->_latestAdvertisement, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
