@implementation TAScanRequest

- (id)evictScheduledInterVisitScanWithClock:(id)a3
{
  id v4;
  NSDate *scheduledScanRequest;
  double v6;
  double v7;
  double v8;
  unint64_t interVisitScanCount;
  unint64_t v10;
  NSDate *v11;
  TAOutgoingRequests *v12;
  TAOutgoingRequests *v13;
  void *v14;
  NSDate *v15;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  scheduledScanRequest = self->_scheduledScanRequest;
  if (!scheduledScanRequest || -[NSDate compare:](scheduledScanRequest, "compare:", v4) == NSOrderedDescending)
    goto LABEL_8;
  if (self->_lastScanRequestedDate)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:");
    v7 = v6;
    -[TAScanRequestSettings interVisitScanDelay](self->_settings, "interVisitScanDelay");
    if (v7 <= v8)
    {
      v15 = self->_scheduledScanRequest;
      self->_scheduledScanRequest = 0;

LABEL_8:
      v12 = 0;
      goto LABEL_9;
    }
  }
  interVisitScanCount = self->_interVisitScanCount;
  v10 = -[TAScanRequestSettings maxInterVisitScanRequests](self->_settings, "maxInterVisitScanRequests");
  v11 = self->_scheduledScanRequest;
  self->_scheduledScanRequest = 0;

  v12 = 0;
  if (interVisitScanCount < v10)
  {
    ++self->_interVisitScanCount;
    v13 = [TAOutgoingRequests alloc];
    v17 = CFSTR("ScanRequestReason");
    v18[0] = CFSTR("InterVisitScheduled");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TAOutgoingRequests initWithRequestKey:additionalInformation:date:](v13, "initWithRequestKey:additionalInformation:date:", CFSTR("RequestingAdditionalScans"), v14, v4);

  }
LABEL_9:

  return v12;
}

- (TAScanRequest)initWithSettings:(id)a3
{
  id v5;
  TAScanRequest *v6;
  TAScanRequest *v7;
  NSDate *lastScanRequestedDate;
  NSDate *scheduledScanRequest;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TAScanRequest;
  v6 = -[TAScanRequest init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    lastScanRequestedDate = v7->_lastScanRequestedDate;
    v7->_lastScanRequestedDate = 0;

    v7->_interVisitScanCount = 0;
    scheduledScanRequest = v7->_scheduledScanRequest;
    v7->_scheduledScanRequest = 0;

  }
  return v7;
}

- (id)evaluateVisitEntry:(id)a3 clock:(id)a4
{
  id v6;
  id v7;
  NSDate *scheduledScanRequest;
  TAOutgoingRequests *v9;
  double v10;
  double v11;
  double v12;
  NSDate *lastScanRequestedDate;
  void *v14;
  void *v15;
  uint64_t v16;
  TAOutgoingRequests *v17;
  void *v18;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  self->_interVisitScanCount = 0;
  scheduledScanRequest = self->_scheduledScanRequest;
  self->_scheduledScanRequest = 0;

  v9 = 0;
  if ((objc_msgSend(v6, "isClosed") & 1) == 0)
  {
    objc_msgSend(v6, "getDisplayOnTimeUntilEndDate:", v7);
    v11 = v10;
    -[TAScanRequestSettings minVisitEntryDisplayOnDuration](self->_settings, "minVisitEntryDisplayOnDuration");
    if (v11 >= v12)
      goto LABEL_5;
    lastScanRequestedDate = self->_lastScanRequestedDate;
    if (!lastScanRequestedDate
      || (objc_msgSend(v6, "representativeVisit"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "arrivalDate"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = -[NSDate compare:](lastScanRequestedDate, "compare:", v15),
          v15,
          v14,
          v16 == -1))
    {
      v17 = [TAOutgoingRequests alloc];
      v20 = CFSTR("ScanRequestReason");
      v21[0] = CFSTR("VisitEntry");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[TAOutgoingRequests initWithRequestKey:additionalInformation:date:](v17, "initWithRequestKey:additionalInformation:date:", CFSTR("RequestingAdditionalScans"), v18, v7);

    }
    else
    {
LABEL_5:
      v9 = 0;
    }
  }

  return v9;
}

- (id)evaluateInterVisitAfterVisitExit:(id)a3 displayEvents:(id)a4 advertisements:(id)a5 deviceRecord:(id)a6 clock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSDate *scheduledScanRequest;
  TADisplayOnCalculator *v18;
  void *v19;
  void *v20;
  TADisplayOnCalculator *v21;
  double v22;
  double v23;
  double v24;
  TAOutgoingRequests *v25;
  id v26;
  TAOutgoingRequests *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  TADisplayOnCalculator *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  const __CFString *v41;
  const __CFString *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  self->_interVisitScanCount = 0;
  scheduledScanRequest = self->_scheduledScanRequest;
  self->_scheduledScanRequest = 0;

  if ((objc_msgSend(v12, "isClosed") & 1) != 0)
  {
    v18 = [TADisplayOnCalculator alloc];
    objc_msgSend(v12, "representativeVisit");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "departureDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[TADisplayOnCalculator initWithStartTime:](v18, "initWithStartTime:", v20);

    -[TADisplayOnCalculator calculateDisplayOnWithEvents:advertisements:endDate:](v21, "calculateDisplayOnWithEvents:advertisements:endDate:", v13, v14, v16);
    v23 = v22;
    -[TAScanRequestSettings minInterVisitDisplayOnDuration](self->_settings, "minInterVisitDisplayOnDuration");
    if (v23 >= v24)
    {
      if (!objc_msgSend(v14, "count"))
      {
        v27 = 0;
LABEL_22:

        goto LABEL_23;
      }
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v26 = v14;
      v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v29)
      {
        v30 = v29;
        v35 = v21;
        v36 = v13;
        v31 = *(_QWORD *)v38;
        while (2)
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v38 != v31)
              objc_enumerationMutation(v26);
            v33 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
            if (-[TAScanRequest shouldScanOnAdvertisement:withDeviceRecord:](self, "shouldScanOnAdvertisement:withDeviceRecord:", v33, v15, v35, v36, (_QWORD)v37))
            {
              -[TAScanRequest scheduleInterVisitScanForAdvertisement:deviceRecord:clock:](self, "scheduleInterVisitScanForAdvertisement:deviceRecord:clock:", v33, v15, v16);
              goto LABEL_18;
            }
          }
          v30 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
          if (v30)
            continue;
          break;
        }
LABEL_18:
        v27 = 0;
        v21 = v35;
        v13 = v36;
      }
      else
      {
        v27 = 0;
      }
    }
    else
    {
      ++self->_interVisitScanCount;
      v25 = [TAOutgoingRequests alloc];
      v41 = CFSTR("ScanRequestReason");
      v42 = CFSTR("InterVisitImmediate");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = -[TAOutgoingRequests initWithRequestKey:additionalInformation:date:](v25, "initWithRequestKey:additionalInformation:date:", CFSTR("RequestingAdditionalScans"), v26, v16);
    }

    goto LABEL_22;
  }
  v28 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    -[TAScanRequest evaluateInterVisitAfterVisitExit:displayEvents:advertisements:deviceRecord:clock:].cold.1(v28);
  v27 = 0;
LABEL_23:

  return v27;
}

- (void)scheduleInterVisitScanForAdvertisement:(id)a3 deviceRecord:(id)a4 clock:(id)a5
{
  id v7;
  unint64_t interVisitScanCount;
  void *v9;
  NSDate *v10;
  NSDate *scheduledScanRequest;
  id v12;

  v12 = a3;
  v7 = a4;
  interVisitScanCount = self->_interVisitScanCount;
  if (interVisitScanCount < -[TAScanRequestSettings maxInterVisitScanRequests](self->_settings, "maxInterVisitScanRequests")&& v12&& !self->_scheduledScanRequest&& -[TAScanRequest shouldScanOnAdvertisement:withDeviceRecord:](self, "shouldScanOnAdvertisement:withDeviceRecord:", v12, v7))
  {
    objc_msgSend(v12, "scanDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TAScanRequestSettings interVisitScanDelay](self->_settings, "interVisitScanDelay");
    objc_msgSend(v9, "dateByAddingTimeInterval:");
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
    scheduledScanRequest = self->_scheduledScanRequest;
    self->_scheduledScanRequest = v10;

  }
}

- (BOOL)shouldScanOnAdvertisement:(id)a3 withDeviceRecord:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  objc_msgSend(a3, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isKnownDevice:", v6);

  return v7 ^ 1;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  TAScanRequest *v6;
  TAScanRequest *v7;
  void *v8;
  void *v9;
  char v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v6 = (TAScanRequest *)a3;
  if (self == v6)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[TAScanRequest lastScanRequestedDate](self, "lastScanRequestedDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAScanRequest lastScanRequestedDate](v7, "lastScanRequestedDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[TAScanRequest lastScanRequestedDate](self, "lastScanRequestedDate");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAScanRequest lastScanRequestedDate](v7, "lastScanRequestedDate");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_22;
        }
      }
      v11 = -[TAScanRequest interVisitScanCount](self, "interVisitScanCount");
      if (v11 != -[TAScanRequest interVisitScanCount](v7, "interVisitScanCount"))
      {
        v10 = 0;
        goto LABEL_21;
      }
      -[TAScanRequest settings](self, "settings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAScanRequest settings](v7, "settings");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v12 == (void *)v13)
      {
        v26 = (void *)v13;
      }
      else
      {
        -[TAScanRequest settings](self, "settings");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAScanRequest settings](v7, "settings");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "isEqual:"))
        {
          v10 = 0;
LABEL_19:

LABEL_20:
LABEL_21:
          if (v8 == v9)
          {
LABEL_23:

            goto LABEL_24;
          }
LABEL_22:

          goto LABEL_23;
        }
        v25 = v15;
        v26 = v14;
      }
      -[TAScanRequest scheduledScanRequest](self, "scheduledScanRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAScanRequest scheduledScanRequest](v7, "scheduledScanRequest");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v16 == (void *)v17)
      {

        v10 = 1;
      }
      else
      {
        v18 = (void *)v17;
        -[TAScanRequest scheduledScanRequest](self, "scheduledScanRequest");
        v24 = v3;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAScanRequest scheduledScanRequest](v7, "scheduledScanRequest");
        v23 = v12;
        v20 = v4;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v19, "isEqual:", v21);

        v4 = v20;
        v12 = v23;

        v3 = v24;
      }
      v15 = v25;
      v14 = v26;
      if (v12 == v26)
        goto LABEL_20;
      goto LABEL_19;
    }
    v10 = 0;
  }
LABEL_24:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAScanRequest)initWithCoder:(id)a3
{
  id v4;
  TAScanRequest *v5;
  uint64_t v6;
  TAScanRequestSettings *settings;
  uint64_t v8;
  NSDate *lastScanRequestedDate;
  uint64_t v10;
  NSDate *scheduledScanRequest;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TAScanRequest;
  v5 = -[TAScanRequest init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Settings"));
    v6 = objc_claimAutoreleasedReturnValue();
    settings = v5->_settings;
    v5->_settings = (TAScanRequestSettings *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastScan"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastScanRequestedDate = v5->_lastScanRequestedDate;
    v5->_lastScanRequestedDate = (NSDate *)v8;

    v5->_interVisitScanCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("InterScanCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ScanSchedule"));
    v10 = objc_claimAutoreleasedReturnValue();
    scheduledScanRequest = v5->_scheduledScanRequest;
    v5->_scheduledScanRequest = (NSDate *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  TAScanRequestSettings *settings;
  id v5;

  settings = self->_settings;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", settings, CFSTR("Settings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastScanRequestedDate, CFSTR("LastScan"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_interVisitScanCount, CFSTR("InterScanCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scheduledScanRequest, CFSTR("ScanSchedule"));

}

- (TAScanRequestSettings)settings
{
  return self->_settings;
}

- (NSDate)scheduledScanRequest
{
  return self->_scheduledScanRequest;
}

- (NSDate)lastScanRequestedDate
{
  return self->_lastScanRequestedDate;
}

- (void)setLastScanRequestedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastScanRequestedDate, a3);
}

- (unint64_t)interVisitScanCount
{
  return self->_interVisitScanCount;
}

- (void)setInterVisitScanCount:(unint64_t)a3
{
  self->_interVisitScanCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastScanRequestedDate, 0);
  objc_storeStrong((id *)&self->_scheduledScanRequest, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)evaluateInterVisitAfterVisitExit:(os_log_t)log displayEvents:advertisements:deviceRecord:clock:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217877000, log, OS_LOG_TYPE_ERROR, "#TAScanRequest called evaluateInterVisitAfterVisitExit with an open POI snapshot", v1, 2u);
}

@end
