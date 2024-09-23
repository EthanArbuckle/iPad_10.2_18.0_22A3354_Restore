@implementation SAMonitoringSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SAMonitoringSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  SAMonitoringSession *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SAMonitoringSessionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SAMonitoringSessionState"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SAMonitoringSessionGeofence"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SAMonitoringSessionScenario"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SAMonitoringSessionTrackedTravelingStartDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SAMonitoringSession initWithDeviceUUID:state:geofence:scenario:trackedTravelingStartDate:](self, "initWithDeviceUUID:state:geofence:scenario:trackedTravelingStartDate:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SAMonitoringSession deviceUUID](self, "deviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SAMonitoringSessionIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SAMonitoringSession state](self, "state"), CFSTR("SAMonitoringSessionState"));
  -[SAMonitoringSession geofence](self, "geofence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SAMonitoringSessionGeofence"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SAMonitoringSession scenario](self, "scenario"), CFSTR("SAMonitoringSessionScenario"));
  -[SAMonitoringSession trackedTravelingStartDate](self, "trackedTravelingStartDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SAMonitoringSessionTrackedTravelingStartDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  SAMonitoringSession *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  SAMonitoringSession *v10;

  v4 = +[SAMonitoringSession allocWithZone:](SAMonitoringSession, "allocWithZone:", a3);
  -[SAMonitoringSession deviceUUID](self, "deviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SAMonitoringSession state](self, "state");
  -[SAMonitoringSession geofence](self, "geofence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SAMonitoringSession scenario](self, "scenario");
  -[SAMonitoringSession trackedTravelingStartDate](self, "trackedTravelingStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SAMonitoringSession initWithDeviceUUID:state:geofence:scenario:trackedTravelingStartDate:](v4, "initWithDeviceUUID:state:geofence:scenario:trackedTravelingStartDate:", v5, v6, v7, v8, v9);

  return v10;
}

- (SAMonitoringSession)initWithDeviceUUID:(id)a3 state:(unint64_t)a4 geofence:(id)a5 scenario:(unint64_t)a6 trackedTravelingStartDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  SAMonitoringSession *v15;
  uint64_t v16;
  NSUUID *deviceUUID;
  uint64_t v18;
  CLCircularRegion *geofence;
  uint64_t v20;
  NSDate *trackedTravelingStartDate;
  TALocationLite *trackedTravelingStartLocation;
  NSDate *travelingGeofenceExitDate;
  TALocationLite *firstNotWithYouLocation;
  NSDate *earlyVehicularStateChangeDate;
  SAScenarioClassifier *v26;
  SAScenarioClassifier *scenarioClassifier;
  NSDate *lastAlertDateInCurrentTravelingSession;
  objc_super v30;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v30.receiver = self;
  v30.super_class = (Class)SAMonitoringSession;
  v15 = -[SAMonitoringSession init](&v30, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    deviceUUID = v15->_deviceUUID;
    v15->_deviceUUID = (NSUUID *)v16;

    v15->_state = a4;
    v18 = objc_msgSend(v13, "copy");
    geofence = v15->_geofence;
    v15->_geofence = (CLCircularRegion *)v18;

    v15->_scenario = a6;
    v20 = objc_msgSend(v14, "copy");
    trackedTravelingStartDate = v15->_trackedTravelingStartDate;
    v15->_trackedTravelingStartDate = (NSDate *)v20;

    trackedTravelingStartLocation = v15->_trackedTravelingStartLocation;
    v15->_trackedTravelingStartLocation = 0;

    travelingGeofenceExitDate = v15->_travelingGeofenceExitDate;
    v15->_travelingGeofenceExitDate = 0;

    firstNotWithYouLocation = v15->_firstNotWithYouLocation;
    v15->_firstNotWithYouLocation = 0;

    earlyVehicularStateChangeDate = v15->_earlyVehicularStateChangeDate;
    v15->_earlyVehicularStateChangeDate = 0;

    v26 = -[SAScenarioClassifier initWithDeviceUuid:scenarioClass:unsafeLocation:]([SAScenarioClassifier alloc], "initWithDeviceUuid:scenarioClass:unsafeLocation:", v15->_deviceUUID, a6, 0);
    scenarioClassifier = v15->_scenarioClassifier;
    v15->_scenarioClassifier = v26;

    *(_WORD *)&v15->_earlyVehicularTrigger = 0;
    lastAlertDateInCurrentTravelingSession = v15->_lastAlertDateInCurrentTravelingSession;
    v15->_lastAlertDateInCurrentTravelingSession = 0;

  }
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SAMonitoringSession *v6;
  SAMonitoringSession *v7;
  void *v8;
  void *v9;
  char v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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

  v6 = (SAMonitoringSession *)a3;
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
      -[SAMonitoringSession deviceUUID](self, "deviceUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAMonitoringSession deviceUUID](v7, "deviceUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[SAMonitoringSession deviceUUID](self, "deviceUUID");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAMonitoringSession deviceUUID](v7, "deviceUUID");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_30;
        }
      }
      v11 = -[SAMonitoringSession state](self, "state");
      if (v11 != -[SAMonitoringSession state](v7, "state"))
      {
        v10 = 0;
        goto LABEL_29;
      }
      -[SAMonitoringSession geofence](self, "geofence");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAMonitoringSession geofence](v7, "geofence");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 != v13)
      {
        -[SAMonitoringSession geofence](self, "geofence");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAMonitoringSession geofence](v7, "geofence");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_27;
        }
        v36 = v14;
      }
      v15 = -[SAMonitoringSession scenario](self, "scenario");
      if (v15 != -[SAMonitoringSession scenario](v7, "scenario"))
      {
        v10 = 0;
        v14 = v36;
        if (v12 == v13)
          goto LABEL_28;
        goto LABEL_27;
      }
      -[SAMonitoringSession trackedTravelingStartDate](self, "trackedTravelingStartDate");
      v16 = objc_claimAutoreleasedReturnValue();
      -[SAMonitoringSession trackedTravelingStartDate](v7, "trackedTravelingStartDate");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v16;
      v19 = v16 == v17;
      v14 = v36;
      v32 = (void *)v17;
      v33 = (void *)v18;
      v34 = v13;
      v35 = v12;
      if (!v19)
      {
        v28 = v3;
        -[SAMonitoringSession trackedTravelingStartDate](self, "trackedTravelingStartDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAMonitoringSession trackedTravelingStartDate](v7, "trackedTravelingStartDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v20;
        if (!objc_msgSend(v20, "isEqual:"))
        {
          v10 = 0;
          v26 = v32;
          v25 = v33;
          v3 = v28;
          goto LABEL_25;
        }
        v3 = v28;
      }
      -[SAMonitoringSession trackedTravelingStartLocation](self, "trackedTravelingStartLocation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAMonitoringSession trackedTravelingStartLocation](v7, "trackedTravelingStartLocation");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v21 == (void *)v22)
      {

        v10 = 1;
      }
      else
      {
        v23 = (void *)v22;
        -[SAMonitoringSession trackedTravelingStartLocation](self, "trackedTravelingStartLocation");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAMonitoringSession trackedTravelingStartLocation](v7, "trackedTravelingStartLocation");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v29, "isEqual:", v24);

        v14 = v36;
      }
      v26 = v32;
      v25 = v33;
      if (v33 == v32)
      {
LABEL_26:

        v13 = v34;
        v12 = v35;
        if (v35 == v34)
        {
LABEL_28:

LABEL_29:
          if (v8 == v9)
          {
LABEL_31:

            goto LABEL_32;
          }
LABEL_30:

          goto LABEL_31;
        }
LABEL_27:

        goto LABEL_28;
      }
LABEL_25:

      goto LABEL_26;
    }
    v10 = 0;
  }
LABEL_32:

  return v10;
}

- (id)descriptionDictionary
{
  objc_class *v3;
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
  void *v15;
  void *v16;
  _QWORD v17[7];
  _QWORD v18[8];

  v18[7] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v16;
  v17[1] = CFSTR("SAMonitoringSessionIdentifier");
  -[SAMonitoringSession deviceUUID](self, "deviceUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("SAMonitoringSessionState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAMonitoringSession state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v5;
  v17[3] = CFSTR("SAMonitoringSessionGeofence");
  -[SAMonitoringSession geofence](self, "geofence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v7;
  v17[4] = CFSTR("SAMonitoringSessionScenario");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAMonitoringSession scenario](self, "scenario"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v8;
  v17[5] = CFSTR("SAMonitoringSessionTrackedTravelingStartDate");
  -[SAMonitoringSession trackedTravelingStartDate](self, "trackedTravelingStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v10;
  v17[6] = CFSTR("SAMonitoringSessionTrackedTravelingStartLocation");
  -[SAMonitoringSession trackedTravelingStartLocation](self, "trackedTravelingStartLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  -[SAMonitoringSession descriptionDictionary](self, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONStringFromNSDictionary:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      -[SAConnectionEvent description].cold.1(v6, (uint64_t)self, (uint64_t)v5);
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (NSUUID)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUUID, a3);
}

- (CLCircularRegion)geofence
{
  return self->_geofence;
}

- (void)setGeofence:(id)a3
{
  objc_storeStrong((id *)&self->_geofence, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)scenario
{
  return self->_scenario;
}

- (void)setScenario:(unint64_t)a3
{
  self->_scenario = a3;
}

- (NSDate)trackedTravelingStartDate
{
  return self->_trackedTravelingStartDate;
}

- (void)setTrackedTravelingStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_trackedTravelingStartDate, a3);
}

- (NSDate)travelingGeofenceExitDate
{
  return self->_travelingGeofenceExitDate;
}

- (void)setTravelingGeofenceExitDate:(id)a3
{
  objc_storeStrong((id *)&self->_travelingGeofenceExitDate, a3);
}

- (NSDate)earlyVehicularStateChangeDate
{
  return self->_earlyVehicularStateChangeDate;
}

- (void)setEarlyVehicularStateChangeDate:(id)a3
{
  objc_storeStrong((id *)&self->_earlyVehicularStateChangeDate, a3);
}

- (TALocationLite)trackedTravelingStartLocation
{
  return self->_trackedTravelingStartLocation;
}

- (void)setTrackedTravelingStartLocation:(id)a3
{
  objc_storeStrong((id *)&self->_trackedTravelingStartLocation, a3);
}

- (TALocationLite)firstNotWithYouLocation
{
  return self->_firstNotWithYouLocation;
}

- (void)setFirstNotWithYouLocation:(id)a3
{
  objc_storeStrong((id *)&self->_firstNotWithYouLocation, a3);
}

- (SAScenarioClassifier)scenarioClassifier
{
  return self->_scenarioClassifier;
}

- (void)setScenarioClassifier:(id)a3
{
  objc_storeStrong((id *)&self->_scenarioClassifier, a3);
}

- (BOOL)earlyVehicularTrigger
{
  return self->_earlyVehicularTrigger;
}

- (void)setEarlyVehicularTrigger:(BOOL)a3
{
  self->_earlyVehicularTrigger = a3;
}

- (BOOL)earlyAirplaneTrigger
{
  return self->_earlyAirplaneTrigger;
}

- (void)setEarlyAirplaneTrigger:(BOOL)a3
{
  self->_earlyAirplaneTrigger = a3;
}

- (NSDate)lastAlertDateInCurrentTravelingSession
{
  return self->_lastAlertDateInCurrentTravelingSession;
}

- (void)setLastAlertDateInCurrentTravelingSession:(id)a3
{
  objc_storeStrong((id *)&self->_lastAlertDateInCurrentTravelingSession, a3);
}

- (NSDate)caLastStateTransition
{
  return self->_caLastStateTransition;
}

- (void)setCaLastStateTransition:(id)a3
{
  objc_storeStrong((id *)&self->_caLastStateTransition, a3);
}

- (CLLocation)caSeparationLocation
{
  return self->_caSeparationLocation;
}

- (void)setCaSeparationLocation:(id)a3
{
  objc_storeStrong((id *)&self->_caSeparationLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caSeparationLocation, 0);
  objc_storeStrong((id *)&self->_caLastStateTransition, 0);
  objc_storeStrong((id *)&self->_lastAlertDateInCurrentTravelingSession, 0);
  objc_storeStrong((id *)&self->_scenarioClassifier, 0);
  objc_storeStrong((id *)&self->_firstNotWithYouLocation, 0);
  objc_storeStrong((id *)&self->_trackedTravelingStartLocation, 0);
  objc_storeStrong((id *)&self->_earlyVehicularStateChangeDate, 0);
  objc_storeStrong((id *)&self->_travelingGeofenceExitDate, 0);
  objc_storeStrong((id *)&self->_trackedTravelingStartDate, 0);
  objc_storeStrong((id *)&self->_geofence, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
}

@end
