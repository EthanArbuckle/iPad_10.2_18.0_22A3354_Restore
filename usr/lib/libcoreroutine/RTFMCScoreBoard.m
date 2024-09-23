@implementation RTFMCScoreBoard

- (RTFMCScoreBoard)init
{
  return -[RTFMCScoreBoard initWithLocationType:](self, "initWithLocationType:", 0xFFFFFFFFLL);
}

- (RTFMCScoreBoard)initWithLocationType:(int)a3
{
  RTFMCScoreBoard *v4;
  RTFMCScoreBoard *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RTFMCScoreBoard;
  v4 = -[RTFMCScoreBoard init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_locationType = a3;
    -[RTFMCScoreBoard clearScoreBoard](v4, "clearScoreBoard");
  }
  return v5;
}

- (void)clearScoreBoard
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTFMCScoreBoard setCreationDate:](self, "setCreationDate:", v3);

  -[RTFMCScoreBoard setEngaged:](self, "setEngaged:", 0);
  -[RTFMCScoreBoard setAssisted:](self, "setAssisted:", 0);
  -[RTFMCScoreBoard setParkingEvents:](self, "setParkingEvents:", 0);
  -[RTFMCScoreBoard setEngagedParkingEvents:](self, "setEngagedParkingEvents:", 0);
  -[RTFMCScoreBoard setAssistedParkingEvents:](self, "setAssistedParkingEvents:", 0);
  -[RTFMCScoreBoard setEngagements:](self, "setEngagements:", 0);
  -[RTFMCScoreBoard setAssistances:](self, "setAssistances:", 0);
  -[RTFMCScoreBoard setSuppressedEvents:](self, "setSuppressedEvents:", 0);
}

- (void)copyToMetric:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v8 = a3;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTFMCScoreBoard creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  objc_msgSend(v8, "setDuration:", (int)v7);

  objc_msgSend(v8, "setParkingEvents:", -[RTFMCScoreBoard parkingEvents](self, "parkingEvents"));
  objc_msgSend(v8, "setEngagedParkingEvents:", -[RTFMCScoreBoard engagedParkingEvents](self, "engagedParkingEvents"));
  objc_msgSend(v8, "setAssistedParkingEvents:", -[RTFMCScoreBoard assistedParkingEvents](self, "assistedParkingEvents"));
  objc_msgSend(v8, "setEngagements:", -[RTFMCScoreBoard engagements](self, "engagements"));
  objc_msgSend(v8, "setAssistances:", -[RTFMCScoreBoard assistances](self, "assistances"));
  objc_msgSend(v8, "setSuppressedParkingEvents:", -[RTFMCScoreBoard suppressedEvents](self, "suppressedEvents"));
  objc_msgSend(v8, "setLocationType:", -[RTFMCScoreBoard locationType](self, "locationType"));

}

- (void)parkingEvent
{
  NSObject *v3;
  uint8_t v4[16];

  -[RTFMCScoreBoard setParkingEvents:](self, "setParkingEvents:", -[RTFMCScoreBoard parkingEvents](self, "parkingEvents") + 1);
  -[RTFMCScoreBoard setEngaged:](self, "setEngaged:", 0);
  -[RTFMCScoreBoard setAssisted:](self, "setAssisted:", 0);
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "FMC scoreboard: parked", v4, 2u);
  }

}

- (void)assistanceEvent
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  uint8_t buf[2];

  -[RTFMCScoreBoard setAssistances:](self, "setAssistances:", -[RTFMCScoreBoard assistances](self, "assistances") + 1);
  if (-[RTFMCScoreBoard assisted](self, "assisted"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = 0;
      v4 = "FMC scoreboard: assistance";
      v5 = (uint8_t *)&v6;
LABEL_6:
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
    }
  }
  else
  {
    -[RTFMCScoreBoard setAssistedParkingEvents:](self, "setAssistedParkingEvents:", -[RTFMCScoreBoard assistedParkingEvents](self, "assistedParkingEvents") + 1);
    -[RTFMCScoreBoard setAssisted:](self, "setAssisted:", 1);
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v4 = "FMC scoreboard: first assistance";
      v5 = buf;
      goto LABEL_6;
    }
  }

}

- (void)engagementEvent
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  uint8_t buf[2];

  -[RTFMCScoreBoard setEngagements:](self, "setEngagements:", -[RTFMCScoreBoard engagements](self, "engagements") + 1);
  if (-[RTFMCScoreBoard engaged](self, "engaged"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = 0;
      v4 = "FMC scoreboard: engagement";
      v5 = (uint8_t *)&v6;
LABEL_6:
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
    }
  }
  else
  {
    -[RTFMCScoreBoard setEngagedParkingEvents:](self, "setEngagedParkingEvents:", -[RTFMCScoreBoard engagedParkingEvents](self, "engagedParkingEvents") + 1);
    -[RTFMCScoreBoard setEngaged:](self, "setEngaged:", 1);
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v4 = "FMC scoreboard: first engagement";
      v5 = buf;
      goto LABEL_6;
    }
  }

}

- (void)suppressedEvent
{
  NSObject *v2;
  uint8_t v3[16];

  -[RTFMCScoreBoard setSuppressedEvents:](self, "setSuppressedEvents:", -[RTFMCScoreBoard suppressedEvents](self, "suppressedEvents") + 1);
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "FMC scoreboard: suppression", v3, 2u);
  }

}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (int)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int)a3
{
  self->_locationType = a3;
}

- (BOOL)engaged
{
  return self->_engaged;
}

- (void)setEngaged:(BOOL)a3
{
  self->_engaged = a3;
}

- (BOOL)assisted
{
  return self->_assisted;
}

- (void)setAssisted:(BOOL)a3
{
  self->_assisted = a3;
}

- (int)parkingEvents
{
  return self->_parkingEvents;
}

- (void)setParkingEvents:(int)a3
{
  self->_parkingEvents = a3;
}

- (int)engagedParkingEvents
{
  return self->_engagedParkingEvents;
}

- (void)setEngagedParkingEvents:(int)a3
{
  self->_engagedParkingEvents = a3;
}

- (int)assistedParkingEvents
{
  return self->_assistedParkingEvents;
}

- (void)setAssistedParkingEvents:(int)a3
{
  self->_assistedParkingEvents = a3;
}

- (int)engagements
{
  return self->_engagements;
}

- (void)setEngagements:(int)a3
{
  self->_engagements = a3;
}

- (int)assistances
{
  return self->_assistances;
}

- (void)setAssistances:(int)a3
{
  self->_assistances = a3;
}

- (int)suppressedEvents
{
  return self->_suppressedEvents;
}

- (void)setSuppressedEvents:(int)a3
{
  self->_suppressedEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
