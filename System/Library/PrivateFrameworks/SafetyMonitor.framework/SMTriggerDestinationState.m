@implementation SMTriggerDestinationState

- (SMTriggerDestinationState)initWithSessionIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  SMTriggerDestinationState *v8;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v10) = 1;
  LOWORD(v10) = 0;
  v8 = -[SMTriggerDestinationState initWithSessionIdentifier:currentStatus:currentStatusDate:lastLockDate:lastUnlockDate:predominantModeOfTransport:numberOfETARetries:shouldRetryETAQuery:roundTripReminderDate:timeToUpdateStatus:upperBoundEta:mapsExpectedTravelTime:remainingDistance:date:](self, "initWithSessionIdentifier:currentStatus:currentStatusDate:lastLockDate:lastUnlockDate:predominantModeOfTransport:numberOfETARetries:shouldRetryETAQuery:roundTripReminderDate:timeToUpdateStatus:upperBoundEta:mapsExpectedTravelTime:remainingDistance:date:", v5, 1, v6, 0, 0, 0xFFFFFFFLL, -1.0, -1.0, v10, 0, 0, 0, v7);

  return v8;
}

- (SMTriggerDestinationState)initWithSessionIdentifier:(id)a3 currentStatus:(unint64_t)a4 currentStatusDate:(id)a5 lastLockDate:(id)a6 lastUnlockDate:(id)a7 predominantModeOfTransport:(unint64_t)a8 numberOfETARetries:(unsigned __int16)a9 shouldRetryETAQuery:(BOOL)a10 roundTripReminderDate:(id)a11 timeToUpdateStatus:(id)a12 upperBoundEta:(id)a13 mapsExpectedTravelTime:(double)a14 remainingDistance:(double)a15 date:(id)a16
{
  id v23;
  SMTriggerDestinationState *v24;
  SMTriggerDestinationState *v25;
  SMTriggerDestinationState *v26;
  NSObject *v27;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;
  uint8_t buf[16];

  v23 = a3;
  v37 = a5;
  v36 = a6;
  v35 = a7;
  v34 = a11;
  v33 = a12;
  v32 = a13;
  v31 = a16;
  if (v23)
  {
    v38.receiver = self;
    v38.super_class = (Class)SMTriggerDestinationState;
    v24 = -[SMTriggerDestinationState init](&v38, sel_init);
    v25 = v24;
    if (v24)
    {
      objc_storeStrong((id *)&v24->_sessionIdentifier, a3);
      v25->_currentStatus = a4;
      objc_storeStrong((id *)&v25->_currentStatusDate, a5);
      objc_storeStrong((id *)&v25->_lastLockDate, a6);
      objc_storeStrong((id *)&v25->_lastUnlockDate, a7);
      v25->_predominantModeOfTransport = a8;
      v25->_numberOfETARetries = a9;
      v25->_shouldRetryETAQuery = a10;
      objc_storeStrong((id *)&v25->_roundTripReminderDate, a11);
      objc_storeStrong((id *)&v25->_timeToUpdateStatus, a12);
      objc_storeStrong((id *)&v25->_upperBoundEta, a13);
      v25->_mapsExpectedTravelTime = a14;
      v25->_remainingDistance = a15;
      objc_storeStrong((id *)&v25->_date, a16);
      v25->_dirty = 1;
    }
    self = v25;
    v26 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionIdentifier", buf, 2u);
    }

    v26 = 0;
  }

  return v26;
}

- (void)markDirty
{
  NSDate *v3;
  NSDate *date;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->_date;
  self->_date = v3;

  self->_dirty = 1;
}

- (void)setTimeToUpdateStatus:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_timeToUpdateStatus, "isEqualToDate:", v5))
  {
    objc_storeStrong((id *)&self->_timeToUpdateStatus, a3);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[NSDate stringFromDate](self->_timeToUpdateStatus, "stringFromDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "-[SMTriggerDestinationState setTimeToUpdateStatus:]";
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_245521000, v6, OS_LOG_TYPE_INFO, "%s, timeToUpdateStatus, %@", (uint8_t *)&v8, 0x16u);

    }
    -[SMTriggerDestinationState markDirty](self, "markDirty");
  }

}

- (void)setLastLockDate:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_lastLockDate, "isEqualToDate:", v5))
  {
    objc_storeStrong((id *)&self->_lastLockDate, a3);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[NSDate stringFromDate](self->_lastLockDate, "stringFromDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "-[SMTriggerDestinationState setLastLockDate:]";
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_245521000, v6, OS_LOG_TYPE_INFO, "%s, lastLockDate, %@", (uint8_t *)&v8, 0x16u);

    }
    -[SMTriggerDestinationState markDirty](self, "markDirty");
  }

}

- (void)setLastUnlockDate:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_lastUnlockDate, "isEqualToDate:", v5))
  {
    objc_storeStrong((id *)&self->_lastUnlockDate, a3);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[NSDate stringFromDate](self->_lastUnlockDate, "stringFromDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "-[SMTriggerDestinationState setLastUnlockDate:]";
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_245521000, v6, OS_LOG_TYPE_INFO, "%s, lastUnlockDate, %@", (uint8_t *)&v8, 0x16u);

    }
    -[SMTriggerDestinationState markDirty](self, "markDirty");
  }

}

- (void)setCurrentStatus:(unint64_t)a3
{
  NSDate *v4;
  NSDate *currentStatusDate;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_currentStatus != a3)
  {
    self->_currentStatus = a3;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    currentStatusDate = self->_currentStatusDate;
    self->_currentStatusDate = v4;

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      +[SMTriggerDestinationState statusToString:](SMTriggerDestinationState, "statusToString:", self->_currentStatus);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate stringFromDate](self->_currentStatusDate, "stringFromDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315650;
      v10 = "-[SMTriggerDestinationState setCurrentStatus:]";
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_245521000, v6, OS_LOG_TYPE_INFO, "%s, currentStatus, %@, currentStatusDate, %@", (uint8_t *)&v9, 0x20u);

    }
    -[SMTriggerDestinationState markDirty](self, "markDirty");
  }
}

- (void)setCurrentStatusDate:(id)a3
{
  NSDate *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (NSDate *)a3;
  if (self->_currentStatusDate != v5)
  {
    objc_storeStrong((id *)&self->_currentStatusDate, a3);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[NSDate stringFromDate](self->_currentStatusDate, "stringFromDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "-[SMTriggerDestinationState setCurrentStatusDate:]";
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_245521000, v6, OS_LOG_TYPE_INFO, "%s, currentStatusDate, %@", (uint8_t *)&v8, 0x16u);

    }
    -[SMTriggerDestinationState markDirty](self, "markDirty");
  }

}

- (void)setRoundTripReminderDate:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_roundTripReminderDate, "isEqualToDate:", v5))
  {
    objc_storeStrong((id *)&self->_roundTripReminderDate, a3);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[NSDate stringFromDate](self->_roundTripReminderDate, "stringFromDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "-[SMTriggerDestinationState setRoundTripReminderDate:]";
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_245521000, v6, OS_LOG_TYPE_INFO, "%s, roundTripReminderDate, %@", (uint8_t *)&v8, 0x16u);

    }
    -[SMTriggerDestinationState markDirty](self, "markDirty");
  }

}

- (void)setUpperBoundEta:(id)a3
{
  id v5;
  NSObject *v6;
  SMUpperBoundEta *upperBoundEta;
  int v8;
  const char *v9;
  __int16 v10;
  SMUpperBoundEta *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[SMUpperBoundEta isEqual:](self->_upperBoundEta, "isEqual:", v5))
  {
    objc_storeStrong((id *)&self->_upperBoundEta, a3);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      upperBoundEta = self->_upperBoundEta;
      v8 = 136315394;
      v9 = "-[SMTriggerDestinationState setUpperBoundEta:]";
      v10 = 2112;
      v11 = upperBoundEta;
      _os_log_impl(&dword_245521000, v6, OS_LOG_TYPE_INFO, "%s, upperBoundEta, %@", (uint8_t *)&v8, 0x16u);
    }

    -[SMTriggerDestinationState markDirty](self, "markDirty");
  }

}

- (void)setPredominantModeOfTransport:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_predominantModeOfTransport != a3)
  {
    self->_predominantModeOfTransport = a3;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      +[SMTriggerDestinationState convertSMDirectionTransportTypeToString:](SMTriggerDestinationState, "convertSMDirectionTransportTypeToString:", self->_predominantModeOfTransport);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[SMTriggerDestinationState setPredominantModeOfTransport:]";
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "%s, predominantModeOfTransport, %@", (uint8_t *)&v6, 0x16u);

    }
    -[SMTriggerDestinationState markDirty](self, "markDirty");
  }
}

- (void)setMapsExpectedTravelTime:(double)a3
{
  NSObject *v4;
  double mapsExpectedTravelTime;
  int v6;
  const char *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_mapsExpectedTravelTime != a3)
  {
    self->_mapsExpectedTravelTime = a3;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      mapsExpectedTravelTime = self->_mapsExpectedTravelTime;
      v6 = 136315394;
      v7 = "-[SMTriggerDestinationState setMapsExpectedTravelTime:]";
      v8 = 2048;
      v9 = mapsExpectedTravelTime;
      _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "%s, mapsExpectedTravelTime, %.1f", (uint8_t *)&v6, 0x16u);
    }

    -[SMTriggerDestinationState markDirty](self, "markDirty");
  }
}

- (void)setRemainingDistance:(double)a3
{
  NSObject *v4;
  double remainingDistance;
  int v6;
  const char *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_remainingDistance != a3)
  {
    self->_remainingDistance = a3;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      remainingDistance = self->_remainingDistance;
      v6 = 136315394;
      v7 = "-[SMTriggerDestinationState setRemainingDistance:]";
      v8 = 2048;
      v9 = remainingDistance;
      _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "%s, remainingDistance, %.1f", (uint8_t *)&v6, 0x16u);
    }

    -[SMTriggerDestinationState markDirty](self, "markDirty");
  }
}

+ (id)statusToString:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("Invalid");
  else
    return off_25166E2D8[a3];
}

+ (id)modeOfTransportToString:(unint64_t)a3
{
  if ((uint64_t)a3 > 3)
  {
    if (a3 != 4)
    {
      if (a3 == 0xFFFFFFF)
        return CFSTR("Any");
      return CFSTR("Invalid");
    }
    return CFSTR("Transit");
  }
  else
  {
    if (a3 != 1)
    {
      if (a3 == 2)
        return CFSTR("Walking");
      return CFSTR("Invalid");
    }
    return CFSTR("Automobile");
  }
}

+ (id)convertSMDirectionTransportTypeToString:(unint64_t)a3
{
  if ((uint64_t)a3 > 3)
  {
    if (a3 != 4)
    {
      if (a3 == 0xFFFFFFF)
        return CFSTR("SMDirectionsTransportTypeAny");
      return CFSTR("UKNOWN");
    }
    return CFSTR("SMDirectionsTransportTypeTransit");
  }
  else
  {
    if (a3 != 1)
    {
      if (a3 == 2)
        return CFSTR("SMDirectionsTransportTypeWalking");
      return CFSTR("UKNOWN");
    }
    return CFSTR("SMDirectionsTransportTypeAutomobile");
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMTriggerDestinationState)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __int16 v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  SMTriggerDestinationState *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMTriggerDestinationStateSessionIdentifierKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("__kSMTriggerDestinationStateCurrentStatusKey"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMTriggerDestinationStateCurrentStatusDateKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMTriggerDestinationStateLastLockDateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMTriggerDestinationStateLastUnlockDateKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("__kSMTriggerDestinationStatePredominantModeOfTransportKey"));
  v7 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("__kSMTriggerDestinationStateNumberOfETARetriesKey"));
  v8 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("__kSMTriggerDestinationStateShouldRetryETAQueryKey")) != 0;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMTriggerDestinationStateRoundTripReminderDateKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMTriggerDestinationStateTimeToUpdateStatusKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMTriggerDestinationStateUpperBoundEtaKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("__kSMTriggerDestinationStateMapsExpectedTravelTimeKey"));
  v13 = v12;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("__kSMTriggerDestinationStateRemainingDistanceKey"));
  v15 = v14;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMTriggerDestinationStateDateKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE2(v19) = v8;
  LOWORD(v19) = v7;
  v17 = -[SMTriggerDestinationState initWithSessionIdentifier:currentStatus:currentStatusDate:lastLockDate:lastUnlockDate:predominantModeOfTransport:numberOfETARetries:shouldRetryETAQuery:roundTripReminderDate:timeToUpdateStatus:upperBoundEta:mapsExpectedTravelTime:remainingDistance:date:](self, "initWithSessionIdentifier:currentStatus:currentStatusDate:lastLockDate:lastUnlockDate:predominantModeOfTransport:numberOfETARetries:shouldRetryETAQuery:roundTripReminderDate:timeToUpdateStatus:upperBoundEta:mapsExpectedTravelTime:remainingDistance:date:", v22, v21, v4, v5, v6, v20, v13, v15, v19, v9, v10, v11, v16);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *sessionIdentifier;
  id v5;

  sessionIdentifier = self->_sessionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionIdentifier, CFSTR("__kSMTriggerDestinationStateSessionIdentifierKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_currentStatus, CFSTR("__kSMTriggerDestinationStateCurrentStatusKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentStatusDate, CFSTR("__kSMTriggerDestinationStateCurrentStatusDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastLockDate, CFSTR("__kSMTriggerDestinationStateLastLockDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUnlockDate, CFSTR("__kSMTriggerDestinationStateLastUnlockDateKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_predominantModeOfTransport, CFSTR("__kSMTriggerDestinationStatePredominantModeOfTransportKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfETARetries, CFSTR("__kSMTriggerDestinationStateNumberOfETARetriesKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_shouldRetryETAQuery, CFSTR("__kSMTriggerDestinationStateShouldRetryETAQueryKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_roundTripReminderDate, CFSTR("__kSMTriggerDestinationStateRoundTripReminderDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeToUpdateStatus, CFSTR("__kSMTriggerDestinationStateTimeToUpdateStatusKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_upperBoundEta, CFSTR("__kSMTriggerDestinationStateUpperBoundEtaKey"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("__kSMTriggerDestinationStateMapsExpectedTravelTimeKey"), self->_mapsExpectedTravelTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("__kSMTriggerDestinationStateRemainingDistanceKey"), self->_remainingDistance);
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("__kSMTriggerDestinationStateDateKey"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unsigned __int16 v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  SMTriggerDestinationState *v18;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  SMTriggerDestinationState *v23;

  v23 = +[SMTriggerDestinationState allocWithZone:](SMTriggerDestinationState, "allocWithZone:", a3);
  -[SMTriggerDestinationState sessionIdentifier](self, "sessionIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SMTriggerDestinationState currentStatus](self, "currentStatus");
  -[SMTriggerDestinationState currentStatusDate](self, "currentStatusDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestinationState lastLockDate](self, "lastLockDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestinationState lastUnlockDate](self, "lastUnlockDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SMTriggerDestinationState predominantModeOfTransport](self, "predominantModeOfTransport");
  v8 = -[SMTriggerDestinationState numberOfETARetries](self, "numberOfETARetries");
  v9 = -[SMTriggerDestinationState shouldRetryETAQuery](self, "shouldRetryETAQuery");
  -[SMTriggerDestinationState roundTripReminderDate](self, "roundTripReminderDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestinationState timeToUpdateStatus](self, "timeToUpdateStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestinationState upperBoundEta](self, "upperBoundEta");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestinationState mapsExpectedTravelTime](self, "mapsExpectedTravelTime");
  v14 = v13;
  -[SMTriggerDestinationState remainingDistance](self, "remainingDistance");
  v16 = v15;
  -[SMTriggerDestinationState date](self, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v20) = v9;
  LOWORD(v20) = v8;
  v18 = -[SMTriggerDestinationState initWithSessionIdentifier:currentStatus:currentStatusDate:lastLockDate:lastUnlockDate:predominantModeOfTransport:numberOfETARetries:shouldRetryETAQuery:roundTripReminderDate:timeToUpdateStatus:upperBoundEta:mapsExpectedTravelTime:remainingDistance:date:](v23, "initWithSessionIdentifier:currentStatus:currentStatusDate:lastLockDate:lastUnlockDate:predominantModeOfTransport:numberOfETARetries:shouldRetryETAQuery:roundTripReminderDate:timeToUpdateStatus:upperBoundEta:mapsExpectedTravelTime:remainingDistance:date:", v22, v21, v4, v5, v6, v7, v14, v16, v20, v10, v11, v12, v17);

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v28;
  void *v29;

  -[SMTriggerDestinationState sessionIdentifier](self, "sessionIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v29, "hash");
  v4 = -[SMTriggerDestinationState currentStatus](self, "currentStatus") ^ v3;
  -[SMTriggerDestinationState currentStatusDate](self, "currentStatusDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v28, "hash");
  -[SMTriggerDestinationState lastLockDate](self, "lastLockDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ v5 ^ objc_msgSend(v6, "hash");
  -[SMTriggerDestinationState lastUnlockDate](self, "lastUnlockDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  v10 = v9 ^ -[SMTriggerDestinationState predominantModeOfTransport](self, "predominantModeOfTransport");
  v11 = v7 ^ v10 ^ -[SMTriggerDestinationState numberOfETARetries](self, "numberOfETARetries");
  v12 = -[SMTriggerDestinationState shouldRetryETAQuery](self, "shouldRetryETAQuery");
  -[SMTriggerDestinationState roundTripReminderDate](self, "roundTripReminderDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[SMTriggerDestinationState timeToUpdateStatus](self, "timeToUpdateStatus");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v11 ^ v14 ^ objc_msgSend(v15, "hash");
  -[SMTriggerDestinationState upperBoundEta](self, "upperBoundEta");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  v19 = (void *)MEMORY[0x24BDD16E0];
  -[SMTriggerDestinationState mapsExpectedTravelTime](self, "mapsExpectedTravelTime");
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v18 ^ objc_msgSend(v20, "hash");
  v22 = (void *)MEMORY[0x24BDD16E0];
  -[SMTriggerDestinationState remainingDistance](self, "remainingDistance");
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "hash");
  -[SMTriggerDestinationState date](self, "date");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v21 ^ v24 ^ objc_msgSend(v25, "hash");

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  SMTriggerDestinationState *v4;
  SMTriggerDestinationState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  char v44;
  char v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  char v59;
  char v60;
  char v61;
  BOOL v63;
  char v64;
  int v65;
  int v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  char v70;
  char v71;
  uint64_t v72;
  unint64_t v73;
  char v74;

  v4 = (SMTriggerDestinationState *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SMTriggerDestinationState sessionIdentifier](self, "sessionIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestinationState sessionIdentifier](v5, "sessionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v74 = 0;
      }
      else
      {
        -[SMTriggerDestinationState sessionIdentifier](self, "sessionIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMTriggerDestinationState sessionIdentifier](v5, "sessionIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        v74 = v10 ^ 1;
      }

      v73 = -[SMTriggerDestinationState currentStatus](self, "currentStatus");
      v72 = -[SMTriggerDestinationState currentStatus](v5, "currentStatus");
      -[SMTriggerDestinationState currentStatusDate](self, "currentStatusDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestinationState currentStatusDate](v5, "currentStatusDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
      {
        v71 = 0;
      }
      else
      {
        -[SMTriggerDestinationState currentStatusDate](self, "currentStatusDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMTriggerDestinationState currentStatusDate](v5, "currentStatusDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

        v71 = v16 ^ 1;
      }

      -[SMTriggerDestinationState lastLockDate](self, "lastLockDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestinationState lastLockDate](v5, "lastLockDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == v18)
      {
        v70 = 0;
      }
      else
      {
        -[SMTriggerDestinationState lastLockDate](self, "lastLockDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMTriggerDestinationState lastLockDate](v5, "lastLockDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqual:", v20);

        v70 = v21 ^ 1;
      }

      -[SMTriggerDestinationState lastUnlockDate](self, "lastUnlockDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestinationState lastUnlockDate](v5, "lastUnlockDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 == v23)
      {
        v69 = 0;
      }
      else
      {
        -[SMTriggerDestinationState lastUnlockDate](self, "lastUnlockDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMTriggerDestinationState lastUnlockDate](v5, "lastUnlockDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqual:", v25);

        v69 = v26 ^ 1;
      }

      v68 = -[SMTriggerDestinationState predominantModeOfTransport](self, "predominantModeOfTransport");
      v67 = -[SMTriggerDestinationState predominantModeOfTransport](v5, "predominantModeOfTransport");
      v66 = -[SMTriggerDestinationState numberOfETARetries](self, "numberOfETARetries");
      v65 = -[SMTriggerDestinationState numberOfETARetries](v5, "numberOfETARetries");
      v63 = -[SMTriggerDestinationState shouldRetryETAQuery](self, "shouldRetryETAQuery");
      v27 = -[SMTriggerDestinationState shouldRetryETAQuery](v5, "shouldRetryETAQuery");
      -[SMTriggerDestinationState roundTripReminderDate](self, "roundTripReminderDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestinationState roundTripReminderDate](v5, "roundTripReminderDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28 == v29)
      {
        v64 = 0;
      }
      else
      {
        -[SMTriggerDestinationState roundTripReminderDate](self, "roundTripReminderDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMTriggerDestinationState roundTripReminderDate](v5, "roundTripReminderDate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqual:", v31);

        v64 = v32 ^ 1;
      }

      -[SMTriggerDestinationState timeToUpdateStatus](self, "timeToUpdateStatus");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestinationState timeToUpdateStatus](v5, "timeToUpdateStatus");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33 == v34)
      {
        v38 = 0;
      }
      else
      {
        -[SMTriggerDestinationState timeToUpdateStatus](self, "timeToUpdateStatus");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMTriggerDestinationState timeToUpdateStatus](v5, "timeToUpdateStatus");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqual:", v36);

        v38 = v37 ^ 1;
      }

      -[SMTriggerDestinationState upperBoundEta](self, "upperBoundEta");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestinationState upperBoundEta](v5, "upperBoundEta");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39 == v40)
      {
        v44 = 0;
      }
      else
      {
        -[SMTriggerDestinationState upperBoundEta](self, "upperBoundEta");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMTriggerDestinationState upperBoundEta](v5, "upperBoundEta");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "isEqual:", v42);

        v44 = v43 ^ 1;
      }
      v45 = v63 ^ v27;

      -[SMTriggerDestinationState mapsExpectedTravelTime](self, "mapsExpectedTravelTime");
      v47 = v46;
      -[SMTriggerDestinationState mapsExpectedTravelTime](v5, "mapsExpectedTravelTime");
      v49 = v48;
      -[SMTriggerDestinationState remainingDistance](self, "remainingDistance");
      v51 = v50;
      -[SMTriggerDestinationState remainingDistance](v5, "remainingDistance");
      v53 = v52;
      -[SMTriggerDestinationState date](self, "date");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestinationState date](v5, "date");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54 == v55)
      {
        v58 = 1;
      }
      else
      {
        -[SMTriggerDestinationState date](self, "date");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMTriggerDestinationState date](v5, "date");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v56, "isEqual:", v57);

      }
      v59 = v74;
      if (v73 != v72)
        v59 = 1;
      v60 = v59 | v71 | v70 | v69;
      if (v68 != v67)
        v60 = 1;
      if (v66 != v65)
        v60 = 1;
      v61 = (v47 == v49) & ~(v60 | v45 | v64 | v38 | v44);
      if (v51 != v53)
        v61 = 0;
      v11 = v61 & v58;

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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

  v23 = (void *)MEMORY[0x24BDD17C8];
  -[SMTriggerDestinationState sessionIdentifier](self, "sessionIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestinationState date](self, "date");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringFromDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "statusToString:", -[SMTriggerDestinationState currentStatus](self, "currentStatus"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestinationState currentStatusDate](self, "currentStatusDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringFromDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestinationState lastLockDate](self, "lastLockDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringFromDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestinationState lastUnlockDate](self, "lastUnlockDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "modeOfTransportToString:", -[SMTriggerDestinationState predominantModeOfTransport](self, "predominantModeOfTransport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SMTriggerDestinationState numberOfETARetries](self, "numberOfETARetries");
  if (-[SMTriggerDestinationState shouldRetryETAQuery](self, "shouldRetryETAQuery"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[SMTriggerDestinationState roundTripReminderDate](self, "roundTripReminderDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestinationState timeToUpdateStatus](self, "timeToUpdateStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestinationState upperBoundEta](self, "upperBoundEta");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestinationState mapsExpectedTravelTime](self, "mapsExpectedTravelTime");
  v12 = v11;
  -[SMTriggerDestinationState remainingDistance](self, "remainingDistance");
  objc_msgSend(v23, "stringWithFormat:", CFSTR("sessionIdentifier, %@, date, %@, currentStatus, %@, currentStatusDate, %@, lastLockDate, %@, lastUnLockDate, %@, predominantModeOfTransport, %@, numberOfETARetries, %hu, shouldRetryETAQuery, %@, roundTripReminderDate, %@, timeToUpdateStatus, %@, upperBoundEta, %@, mapsExpectedTravelTime, %.1f, remainingDistance, %.1f"), v22, v20, v18, v3, v17, v16, v4, v5, v6, v7, v9, v10, v12, v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDate)lastLockDate
{
  return self->_lastLockDate;
}

- (NSDate)lastUnlockDate
{
  return self->_lastUnlockDate;
}

- (unint64_t)predominantModeOfTransport
{
  return self->_predominantModeOfTransport;
}

- (unint64_t)currentStatus
{
  return self->_currentStatus;
}

- (NSDate)currentStatusDate
{
  return self->_currentStatusDate;
}

- (NSDate)roundTripReminderDate
{
  return self->_roundTripReminderDate;
}

- (NSDate)timeToUpdateStatus
{
  return self->_timeToUpdateStatus;
}

- (SMUpperBoundEta)upperBoundEta
{
  return self->_upperBoundEta;
}

- (double)mapsExpectedTravelTime
{
  return self->_mapsExpectedTravelTime;
}

- (double)remainingDistance
{
  return self->_remainingDistance;
}

- (BOOL)shouldRetryETAQuery
{
  return self->_shouldRetryETAQuery;
}

- (void)setShouldRetryETAQuery:(BOOL)a3
{
  self->_shouldRetryETAQuery = a3;
}

- (unsigned)numberOfETARetries
{
  return self->_numberOfETARetries;
}

- (void)setNumberOfETARetries:(unsigned __int16)a3
{
  self->_numberOfETARetries = a3;
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (CLLocation)originLocation
{
  return self->_originLocation;
}

- (void)setOriginLocation:(id)a3
{
  self->_originLocation = (CLLocation *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upperBoundEta, 0);
  objc_storeStrong((id *)&self->_timeToUpdateStatus, 0);
  objc_storeStrong((id *)&self->_roundTripReminderDate, 0);
  objc_storeStrong((id *)&self->_currentStatusDate, 0);
  objc_storeStrong((id *)&self->_lastUnlockDate, 0);
  objc_storeStrong((id *)&self->_lastLockDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
