@implementation SMReceiverSessionStatus

- (SMReceiverSessionStatus)initWithIdentifier:(id)a3 sessionID:(id)a4 initiatorHandle:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SMReceiverSessionStatus *v12;
  NSUUID *v13;
  NSObject *v14;
  const char *v15;
  SMReceiverSessionStatus *v16;
  NSUUID *identifier;
  uint64_t v18;
  NSDate *lastUpdateDate;
  objc_super v21;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v16 = 0;
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: sessionID";
LABEL_15:
    _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_9;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: initiatorHandle";
    goto LABEL_15;
  }
  v21.receiver = self;
  v21.super_class = (Class)SMReceiverSessionStatus;
  v12 = -[SMReceiverSessionStatus init](&v21, sel_init);
  if (v12)
  {
    if (v8)
    {
      v13 = (NSUUID *)v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v13 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    }
    identifier = v12->_identifier;
    v12->_identifier = v13;

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v18 = objc_claimAutoreleasedReturnValue();
    lastUpdateDate = v12->_lastUpdateDate;
    v12->_lastUpdateDate = (NSDate *)v18;

    objc_storeStrong((id *)&v12->_sessionID, a4);
    objc_storeStrong((id *)&v12->_initiatorHandle, a5);
    *(_WORD *)&v12->_zoneShareAccepted = 0;
    v12->_destinationType = 0;
    v12->_triggerType = 0;
    v12->_sessionState = 0;
    v12->_sessionType = 0;
    v12->_lowPowerModeWarningState = 0;
    v12->_cacheDownloadError = 0;
  }
  self = v12;
  v16 = self;
LABEL_13:

  return v16;
}

+ (id)convertSessionStateToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8)
    return CFSTR("Unknown");
  else
    return off_25166DF40[a3 - 1];
}

- (BOOL)isSessionOngoing
{
  unint64_t v2;

  v2 = -[SMReceiverSessionStatus sessionState](self, "sessionState");
  return (v2 < 0xA) & (0x39Cu >> v2);
}

- (id)outputToDictionary
{
  id v3;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[SMReceiverSessionStatus identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("identifier"));

  v5 = (void *)MEMORY[0x24BDD16E0];
  -[SMReceiverSessionStatus lastUpdateDate](self, "lastUpdateDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("lastUpdateDate"));

  -[SMReceiverSessionStatus sessionID](self, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("sessionID"));

  -[SMReceiverSessionStatus initiatorHandle](self, "initiatorHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("initiatorHandle"));

  -[SMReceiverSessionStatus receiverHandle](self, "receiverHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SMReceiverSessionStatus receiverHandle](self, "receiverHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("receiverHandle"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMReceiverSessionStatus sessionState](self, "sessionState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("sessionState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SMReceiverSessionStatus zoneShareAccepted](self, "zoneShareAccepted"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("zoneShareAccepted"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMReceiverSessionStatus sessionType](self, "sessionType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("sessionType"));

  -[SMReceiverSessionStatus sessionStartDate](self, "sessionStartDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SMReceiverSessionStatus sessionStartDate](self, "sessionStartDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("sessionStartDate"));

  }
  -[SMReceiverSessionStatus estimatedEndDate](self, "estimatedEndDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SMReceiverSessionStatus estimatedEndDate](self, "estimatedEndDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("estimatedEndDate"));

  }
  -[SMReceiverSessionStatus coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[SMReceiverSessionStatus coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("coarseEstimatedEndDate"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMReceiverSessionStatus destinationType](self, "destinationType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("destinationType"));

  -[SMReceiverSessionStatus destinationMapItem](self, "destinationMapItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[SMReceiverSessionStatus destinationMapItem](self, "destinationMapItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "base64EncodedStringWithOptions:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("destinationMapItem"));

  }
  -[SMReceiverSessionStatus triggerDate](self, "triggerDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[SMReceiverSessionStatus triggerDate](self, "triggerDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("triggerDate"));

  }
  -[SMReceiverSessionStatus locationOfTrigger](self, "locationOfTrigger");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[SMReceiverSessionStatus locationOfTrigger](self, "locationOfTrigger");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("locationOfTrigger"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMReceiverSessionStatus triggerType](self, "triggerType"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("triggerType"));

  -[SMReceiverSessionStatus cacheRequestDate](self, "cacheRequestDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[SMReceiverSessionStatus cacheRequestDate](self, "cacheRequestDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("cacheRequestDate"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMReceiverSessionStatus sessionEndReason](self, "sessionEndReason"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("sessionEndReason"));

  -[SMReceiverSessionStatus cacheExpiryDate](self, "cacheExpiryDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[SMReceiverSessionStatus cacheExpiryDate](self, "cacheExpiryDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("cacheExpiryDate"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SMReceiverSessionStatus isSOSTrigger](self, "isSOSTrigger"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("isSOSTrigger"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMReceiverSessionStatus lowPowerModeWarningState](self, "lowPowerModeWarningState"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("lowPowerModeWarningState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMReceiverSessionStatus cacheDownloadError](self, "cacheDownloadError"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("cacheDownloadError"));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
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
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315394;
      v20 = "-[SMReceiverSessionStatus encodeWithCoder:]";
      v21 = 1024;
      v22 = 192;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", (uint8_t *)&v19, 0x12u);
    }

  }
  -[SMReceiverSessionStatus identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  -[SMReceiverSessionStatus lastUpdateDate](self, "lastUpdateDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("lastUpdateDate"));

  -[SMReceiverSessionStatus sessionID](self, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("sessionID"));

  -[SMReceiverSessionStatus initiatorHandle](self, "initiatorHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("initiatorHandle"));

  -[SMReceiverSessionStatus receiverHandle](self, "receiverHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("receiverHandle"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMReceiverSessionStatus sessionState](self, "sessionState"), CFSTR("sessionState"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SMReceiverSessionStatus zoneShareAccepted](self, "zoneShareAccepted"), CFSTR("zoneShareAccepted"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMReceiverSessionStatus sessionType](self, "sessionType"), CFSTR("sessionType"));
  -[SMReceiverSessionStatus sessionStartDate](self, "sessionStartDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("sessionStartDate"));

  -[SMReceiverSessionStatus estimatedEndDate](self, "estimatedEndDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("estimatedEndDate"));

  -[SMReceiverSessionStatus coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("coarseEstimatedEndDate"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMReceiverSessionStatus destinationType](self, "destinationType"), CFSTR("destinationType"));
  -[SMReceiverSessionStatus destinationMapItem](self, "destinationMapItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("destinationMapItem"));

  -[SMReceiverSessionStatus triggerDate](self, "triggerDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("triggerDate"));

  -[SMReceiverSessionStatus locationOfTrigger](self, "locationOfTrigger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("locationOfTrigger"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMReceiverSessionStatus triggerType](self, "triggerType"), CFSTR("triggerType"));
  -[SMReceiverSessionStatus cacheRequestDate](self, "cacheRequestDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("cacheRequestDate"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMReceiverSessionStatus sessionEndReason](self, "sessionEndReason"), CFSTR("sessionEndReason"));
  -[SMReceiverSessionStatus cacheExpiryDate](self, "cacheExpiryDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("cacheExpiryDate"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SMReceiverSessionStatus isSOSTrigger](self, "isSOSTrigger"), CFSTR("isSOSTrigger"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMReceiverSessionStatus lowPowerModeWarningState](self, "lowPowerModeWarningState"), CFSTR("lowPowerModeWarningState"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMReceiverSessionStatus cacheDownloadError](self, "cacheDownloadError"), CFSTR("cacheDownloadError"));

}

- (SMReceiverSessionStatus)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SMReceiverSessionStatus *v8;
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
  SMReceiverSessionStatus *v19;
  NSObject *v20;
  uint8_t v22[16];

  v4 = a3;
  if (v4)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initiatorHandle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SMReceiverSessionStatus initWithIdentifier:sessionID:initiatorHandle:](self, "initWithIdentifier:sessionID:initiatorHandle:", v5, v6, v7);
    if (v8)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receiverHandle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverSessionStatus setReceiverHandle:](v8, "setReceiverHandle:", v9);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdateDate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverSessionStatus setLastUpdateDate:](v8, "setLastUpdateDate:", v10);

      -[SMReceiverSessionStatus setSessionState:](v8, "setSessionState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sessionState")));
      -[SMReceiverSessionStatus setZoneShareAccepted:](v8, "setZoneShareAccepted:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("zoneShareAccepted")));
      -[SMReceiverSessionStatus setSessionType:](v8, "setSessionType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sessionType")));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionStartDate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverSessionStatus setSessionStartDate:](v8, "setSessionStartDate:", v11);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("estimatedEndDate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverSessionStatus setEstimatedEndDate:](v8, "setEstimatedEndDate:", v12);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coarseEstimatedEndDate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverSessionStatus setCoarseEstimatedEndDate:](v8, "setCoarseEstimatedEndDate:", v13);

      -[SMReceiverSessionStatus setDestinationType:](v8, "setDestinationType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("destinationType")));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationMapItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverSessionStatus setDestinationMapItem:](v8, "setDestinationMapItem:", v14);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triggerDate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverSessionStatus setTriggerDate:](v8, "setTriggerDate:", v15);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationOfTrigger"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverSessionStatus setLocationOfTrigger:](v8, "setLocationOfTrigger:", v16);

      -[SMReceiverSessionStatus setTriggerType:](v8, "setTriggerType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("triggerType")));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cacheRequestDate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverSessionStatus setCacheRequestDate:](v8, "setCacheRequestDate:", v17);

      -[SMReceiverSessionStatus setSessionEndReason:](v8, "setSessionEndReason:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sessionEndReason")));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cacheExpiryDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMReceiverSessionStatus setCacheExpiryDate:](v8, "setCacheExpiryDate:", v18);

      -[SMReceiverSessionStatus setIsSOSTrigger:](v8, "setIsSOSTrigger:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSOSTrigger")));
      -[SMReceiverSessionStatus setLowPowerModeWarningState:](v8, "setLowPowerModeWarningState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lowPowerModeWarningState")));
      -[SMReceiverSessionStatus setCacheDownloadError:](v8, "setCacheDownloadError:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cacheDownloadError")));
    }
    self = v8;

    v19 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", v22, 2u);
    }

    v19 = 0;
  }

  return v19;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  _BOOL4 v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v27 = (void *)MEMORY[0x24BDD17C8];
  -[SMReceiverSessionStatus identifier](self, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverSessionStatus lastUpdateDate](self, "lastUpdateDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringFromDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverSessionStatus sessionID](self, "sessionID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "UUIDString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverSessionStatus initiatorHandle](self, "initiatorHandle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverSessionStatus receiverHandle](self, "receiverHandle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SMReceiverSessionStatus sessionState](self, "sessionState");
  v20 = -[SMReceiverSessionStatus zoneShareAccepted](self, "zoneShareAccepted");
  v19 = -[SMReceiverSessionStatus sessionType](self, "sessionType");
  -[SMReceiverSessionStatus sessionStartDate](self, "sessionStartDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringFromDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverSessionStatus estimatedEndDate](self, "estimatedEndDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringFromDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverSessionStatus coarseEstimatedEndDate](self, "coarseEstimatedEndDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringFromDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SMReceiverSessionStatus destinationType](self, "destinationType");
  -[SMReceiverSessionStatus destinationMapItem](self, "destinationMapItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverSessionStatus triggerDate](self, "triggerDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringFromDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverSessionStatus locationOfTrigger](self, "locationOfTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SMReceiverSessionStatus triggerType](self, "triggerType");
  -[SMReceiverSessionStatus cacheRequestDate](self, "cacheRequestDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SMReceiverSessionStatus sessionEndReason](self, "sessionEndReason");
  -[SMReceiverSessionStatus cacheExpiryDate](self, "cacheExpiryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SMReceiverSessionStatus isSOSTrigger](self, "isSOSTrigger");
  +[SMDeviceConfigurationChecker convertLowPowerModeWarningStateToString:](SMDeviceConfigurationChecker, "convertLowPowerModeWarningStateToString:", -[SMReceiverSessionStatus lowPowerModeWarningState](self, "lowPowerModeWarningState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("SMReceiverSessionStatus:identifier,%@,lastUpdateDate,%@,sessionID,%@,initiatorHandle,%@,receiverHandle,%@,sessionState,%d,zoneShareAccepted,%d,sessionType,%d,sessionStartDate,%@,estimatedEndDate,%@,coarseEstimatedEndDate,%@,destinationType,%d,destinationMapItem,%@,triggerDate,%@,locationOfTrigger,%@,triggerType,%d,cacheRequestDate,%@,sessionEndReason,%d,cacheExpiryDate,%@,isSOSTrigger,%d, lowPowerModeStateWarning,%@, cacheDownloadError,%d"), v35, v34, v33, v24, v23, v22, v20, v19, v32, v17, v12, v16, v14, v13, v3, v4,
    v5,
    v6,
    v8,
    v9,
    v10,
    -[SMReceiverSessionStatus cacheDownloadError](self, "cacheDownloadError"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SMHandle)initiatorHandle
{
  return self->_initiatorHandle;
}

- (void)setInitiatorHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)receiverHandle
{
  return self->_receiverHandle;
}

- (void)setReceiverHandle:(id)a3
{
  objc_storeStrong((id *)&self->_receiverHandle, a3);
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(int64_t)a3
{
  self->_sessionState = a3;
}

- (BOOL)zoneShareAccepted
{
  return self->_zoneShareAccepted;
}

- (void)setZoneShareAccepted:(BOOL)a3
{
  self->_zoneShareAccepted = a3;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->_sessionType = a3;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (void)setSessionStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)estimatedEndDate
{
  return self->_estimatedEndDate;
}

- (void)setEstimatedEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDate)coarseEstimatedEndDate
{
  return self->_coarseEstimatedEndDate;
}

- (void)setCoarseEstimatedEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)destinationType
{
  return self->_destinationType;
}

- (void)setDestinationType:(unint64_t)a3
{
  self->_destinationType = a3;
}

- (NSData)destinationMapItem
{
  return self->_destinationMapItem;
}

- (void)setDestinationMapItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDate)triggerDate
{
  return self->_triggerDate;
}

- (void)setTriggerDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (RTLocation)locationOfTrigger
{
  return self->_locationOfTrigger;
}

- (void)setLocationOfTrigger:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (unint64_t)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(unint64_t)a3
{
  self->_triggerType = a3;
}

- (NSDate)cacheRequestDate
{
  return self->_cacheRequestDate;
}

- (void)setCacheRequestDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (unint64_t)sessionEndReason
{
  return self->_sessionEndReason;
}

- (void)setSessionEndReason:(unint64_t)a3
{
  self->_sessionEndReason = a3;
}

- (NSDate)cacheExpiryDate
{
  return self->_cacheExpiryDate;
}

- (void)setCacheExpiryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDate)lastSessionStartInfoRequestDate
{
  return self->_lastSessionStartInfoRequestDate;
}

- (void)setLastSessionStartInfoRequestDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (int64_t)sessionStartInfoRequestCount
{
  return self->_sessionStartInfoRequestCount;
}

- (void)setSessionStartInfoRequestCount:(int64_t)a3
{
  self->_sessionStartInfoRequestCount = a3;
}

- (NSDate)lastKeyReleaseInfoRequestDate
{
  return self->_lastKeyReleaseInfoRequestDate;
}

- (void)setLastKeyReleaseInfoRequestDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (int64_t)keyReleaseInfoRequestCount
{
  return self->_keyReleaseInfoRequestCount;
}

- (void)setKeyReleaseInfoRequestCount:(int64_t)a3
{
  self->_keyReleaseInfoRequestCount = a3;
}

- (BOOL)isSOSTrigger
{
  return self->_isSOSTrigger;
}

- (void)setIsSOSTrigger:(BOOL)a3
{
  self->_isSOSTrigger = a3;
}

- (int64_t)lowPowerModeWarningState
{
  return self->_lowPowerModeWarningState;
}

- (void)setLowPowerModeWarningState:(int64_t)a3
{
  self->_lowPowerModeWarningState = a3;
}

- (int64_t)cacheDownloadError
{
  return self->_cacheDownloadError;
}

- (void)setCacheDownloadError:(int64_t)a3
{
  self->_cacheDownloadError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKeyReleaseInfoRequestDate, 0);
  objc_storeStrong((id *)&self->_lastSessionStartInfoRequestDate, 0);
  objc_storeStrong((id *)&self->_cacheExpiryDate, 0);
  objc_storeStrong((id *)&self->_cacheRequestDate, 0);
  objc_storeStrong((id *)&self->_locationOfTrigger, 0);
  objc_storeStrong((id *)&self->_triggerDate, 0);
  objc_storeStrong((id *)&self->_destinationMapItem, 0);
  objc_storeStrong((id *)&self->_coarseEstimatedEndDate, 0);
  objc_storeStrong((id *)&self->_estimatedEndDate, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_receiverHandle, 0);
  objc_storeStrong((id *)&self->_initiatorHandle, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
