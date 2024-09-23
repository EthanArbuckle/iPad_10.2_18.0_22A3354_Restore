@implementation SOSStatus

- (SOSStatus)initWithUUID:(id)a3 trigger:(int64_t)a4 timeOfDetection:(id)a5 timeOfResolution:(id)a6 resolution:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  SOSStatus *v16;
  SOSStatus *v17;
  objc_super v19;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SOSStatus;
  v16 = -[SOSStatus init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_uuid, a3);
    v17->_trigger = a4;
    objc_storeStrong((id *)&v17->_timeOfDetection, a5);
    objc_storeStrong((id *)&v17->_timeOfResolution, a6);
    v17->_resolution = a7;
    v17->_flowState = 0;
    v17->_isPairedDeviceStatus = 0;
  }

  return v17;
}

- (SOSStatus)initWithUUID:(id)a3 trigger:(int64_t)a4 timeOfDetection:(id)a5
{
  id v9;
  id v10;
  SOSStatus *v11;
  SOSStatus *v12;
  NSDate *timeOfResolution;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SOSStatus;
  v11 = -[SOSStatus init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    v12->_trigger = a4;
    objc_storeStrong((id *)&v12->_timeOfDetection, a5);
    timeOfResolution = v12->_timeOfResolution;
    v12->_timeOfResolution = 0;

    v12->_isPairedDeviceStatus = 0;
    v12->_resolution = 0;
    v12->_flowState = 0;
  }

  return v12;
}

- (SOSStatus)initWithUUID:(id)a3 trigger:(int64_t)a4 timeOfDetection:(id)a5 timeOfResolution:(id)a6 resolution:(int64_t)a7 flowState:(int64_t)a8 isPairedDeviceStatus:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  SOSStatus *v19;
  SOSStatus *v20;
  objc_super v22;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SOSStatus;
  v19 = -[SOSStatus init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_uuid, a3);
    v20->_trigger = a4;
    objc_storeStrong((id *)&v20->_timeOfDetection, a5);
    objc_storeStrong((id *)&v20->_timeOfResolution, a6);
    v20->_resolution = a7;
    v20->_flowState = a8;
    v20->_isPairedDeviceStatus = a9;
  }

  return v20;
}

- (BOOL)isValid
{
  void *v3;
  int64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  -[SOSStatus uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  v4 = -[SOSStatus trigger](self, "trigger");
  if (v4)
  {
    -[SOSStatus timeOfDetection](self, "timeOfDetection");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_5;
    v6 = (void *)v5;
    -[SOSStatus timeOfDetection](self, "timeOfDetection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    v12 = v11 + 60.0;

    if (v9 > v12)
    {
LABEL_5:
      LOBYTE(v4) = 0;
      return v4;
    }
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)isFlowActive
{
  _BOOL4 v3;
  unint64_t v4;
  char *v5;

  v3 = -[SOSStatus isValid](self, "isValid");
  if (v3)
  {
    v4 = -[SOSStatus flowState](self, "flowState");
    if (v4 >= 0xF)
    {
      sos_default_log();
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
        -[SOSStatus isFlowActive].cold.1(self, v5);

      LOBYTE(v3) = 0;
    }
    else
    {
      return (0x6ABEu >> v4) & 1;
    }
  }
  return v3;
}

- (BOOL)isFlowActiveAndNotResting
{
  _BOOL4 v3;
  unint64_t v4;
  char *v5;

  v3 = -[SOSStatus isValid](self, "isValid");
  if (v3)
  {
    v4 = -[SOSStatus flowState](self, "flowState");
    if (v4 >= 0xF)
    {
      sos_default_log();
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
        -[SOSStatus isFlowActiveAndNotResting].cold.1(self, v5);

      LOBYTE(v3) = 0;
    }
    else
    {
      return (0x40BEu >> v4) & 1;
    }
  }
  return v3;
}

- (BOOL)isPreCall
{
  _BOOL4 v3;
  unint64_t v4;
  char *v5;

  v3 = -[SOSStatus isValid](self, "isValid");
  if (v3)
  {
    v4 = -[SOSStatus flowState](self, "flowState");
    if (v4 >= 0xF)
    {
      sos_default_log();
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
        -[SOSStatus isPreCall].cold.1(self, v5);

      LOBYTE(v3) = 0;
    }
    else
    {
      return (0x4006u >> v4) & 1;
    }
  }
  return v3;
}

- (BOOL)shouldBlockNonEmergencyCalls
{
  _BOOL4 v3;
  unint64_t v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  unint64_t v12;
  NSObject *v13;

  v3 = -[SOSStatus isValid](self, "isValid");
  if (v3)
  {
    v4 = -[SOSStatus trigger](self, "trigger");
    if (v4 >= 0xA)
    {
      sos_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SOSStatus shouldBlockNonEmergencyCalls].cold.2(self);
    }
    else
    {
      v5 = dbl_1AF513358[v4];
      -[SOSStatus timeOfDetection](self, "timeOfDetection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSince1970");
      v8 = v5 + v7;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSince1970");
      v11 = v10;

      if (v8 < v11)
      {
LABEL_11:
        LOBYTE(v3) = 0;
        return v3;
      }
      v12 = -[SOSStatus flowState](self, "flowState");
      if (v12 < 0xF)
        return (0x4006u >> v12) & 1;
      sos_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SOSStatus shouldBlockNonEmergencyCalls].cold.1(self, (const char *)v13);
    }

    goto LABEL_11;
  }
  return v3;
}

- (BOOL)shouldRejectNewSOSTriggers
{
  _BOOL4 v3;
  unint64_t v4;
  char *v5;

  v3 = -[SOSStatus isValid](self, "isValid");
  if (v3)
  {
    if (!+[SOSUtilities shouldAllowSOSStatusReset](SOSUtilities, "shouldAllowSOSStatusReset"))
    {
      v4 = -[SOSStatus flowState](self, "flowState");
      if (v4 < 0xF)
        return (0x401Eu >> v4) & 1;
      sos_default_log();
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
        -[SOSStatus shouldRejectNewSOSTriggers].cold.1(self, v5);

    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)shouldRetriggerSOS
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  unint64_t v10;
  char *v11;

  v3 = -[SOSStatus isValid](self, "isValid");
  if (v3)
  {
    if (!+[SOSUtilities shouldAllowSOSStatusReset](SOSUtilities, "shouldAllowSOSStatusReset")
      && (-[SOSStatus trigger](self, "trigger") == 5 || -[SOSStatus trigger](self, "trigger") == 7))
    {
      -[SOSStatus timeOfDetection](self, "timeOfDetection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeIntervalSince1970");
      v6 = v5 + 60.0;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSince1970");
      v9 = v8;

      if (v6 >= v9)
      {
        v10 = -[SOSStatus flowState](self, "flowState");
        if (v10 < 0xF)
          return (0x4006u >> v10) & 1;
        sos_default_log();
        v11 = (char *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
          -[SOSStatus shouldRetriggerSOS].cold.1(self, v11);

      }
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuid, CFSTR("kSOSStatusUUID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_trigger, CFSTR("kSOSStatusTrigger"));
  -[NSDate timeIntervalSinceReferenceDate](self->_timeOfDetection, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("kSOSStatusDetectionDate"));
  -[NSDate timeIntervalSinceReferenceDate](self->_timeOfResolution, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("kSOSStatusResolutionDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_resolution, CFSTR("kSOSStatusResolution"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_flowState, CFSTR("kSOSStatusFlowState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPairedDeviceStatus, CFSTR("kSOSStatusIsPairedDeviceStatus"));

}

- (SOSStatus)initWithCoder:(id)a3
{
  id v4;
  SOSStatus *v5;
  uint64_t v6;
  NSUUID *uuid;
  id v8;
  uint64_t v9;
  NSDate *timeOfDetection;
  id v11;
  uint64_t v12;
  NSDate *timeOfResolution;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SOSStatus;
  v5 = -[SOSStatus init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("kSOSStatusUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v5->_trigger = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSOSStatusTrigger"));
    v8 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kSOSStatusDetectionDate"));
    v9 = objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");
    timeOfDetection = v5->_timeOfDetection;
    v5->_timeOfDetection = (NSDate *)v9;

    v11 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kSOSStatusResolutionDate"));
    v12 = objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
    timeOfResolution = v5->_timeOfResolution;
    v5->_timeOfResolution = (NSDate *)v12;

    v5->_resolution = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSOSStatusResolution"));
    v5->_flowState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSOSStatusFlowState"));
    v5->_isPairedDeviceStatus = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kSOSStatusIsPairedDeviceStatus"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  LOBYTE(v6) = self->_isPairedDeviceStatus;
  return (id)objc_msgSend(v4, "initWithUUID:trigger:timeOfDetection:timeOfResolution:resolution:flowState:isPairedDeviceStatus:", self->_uuid, self->_trigger, self->_timeOfDetection, self->_timeOfResolution, self->_resolution, self->_flowState, v6);
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SOSStatus uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SOSStatus trigger](self, "trigger");
  -[SOSStatus timeOfDetection](self, "timeOfDetection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSStatus timeOfResolution](self, "timeOfResolution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SOSStatus resolution](self, "resolution");
  sosFlowStateDescription(-[SOSStatus flowState](self, "flowState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SOSStatus isPairedDeviceStatus](self, "isPairedDeviceStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SOSStatus - uuid: %@ trigger: %d, detectedAt: %@, resolvedAt: %@, resolution: %d, sosFlowState: %@, isPairedDeviceStatus: %@"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (int64_t)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(int64_t)a3
{
  self->_trigger = a3;
}

- (NSDate)timeOfDetection
{
  return self->_timeOfDetection;
}

- (void)setTimeOfDetection:(id)a3
{
  objc_storeStrong((id *)&self->_timeOfDetection, a3);
}

- (NSDate)timeOfResolution
{
  return self->_timeOfResolution;
}

- (void)setTimeOfResolution:(id)a3
{
  objc_storeStrong((id *)&self->_timeOfResolution, a3);
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (void)setResolution:(int64_t)a3
{
  self->_resolution = a3;
}

- (int64_t)flowState
{
  return self->_flowState;
}

- (void)setFlowState:(int64_t)a3
{
  self->_flowState = a3;
}

- (BOOL)isPairedDeviceStatus
{
  return self->_isPairedDeviceStatus;
}

- (void)setIsPairedDeviceStatus:(BOOL)a3
{
  self->_isPairedDeviceStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfResolution, 0);
  objc_storeStrong((id *)&self->_timeOfDetection, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)isFlowActive
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2_2(a1, a2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1(&dword_1AF4DC000, v2, v3, "SOSStatus,isFlowActive,unexpected SOSFlowState %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1_2();
}

- (void)isFlowActiveAndNotResting
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2_2(a1, a2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1(&dword_1AF4DC000, v2, v3, "SOSStatus,isFlowActiveAndNotResting,unexpected SOSFlowState %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1_2();
}

- (void)isPreCall
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2_2(a1, a2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1(&dword_1AF4DC000, v2, v3, "SOSStatus,isPreCall,unexpected SOSFlowState %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1_2();
}

- (void)shouldBlockNonEmergencyCalls
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "trigger");
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1(&dword_1AF4DC000, v1, v2, "SOSStatus,shouldBlockNonEmergencyCalls,unexpected SOSTriggerMechanism %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_2();
}

- (void)shouldRejectNewSOSTriggers
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2_2(a1, a2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1(&dword_1AF4DC000, v2, v3, "SOSStatus,shouldRejectNewSOSTriggers,unexpected SOSFlowState %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1_2();
}

- (void)shouldRetriggerSOS
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2_2(a1, a2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1(&dword_1AF4DC000, v2, v3, "SOSStatus,shouldRetriggerSOS,unexpected SOSFlowState %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1_2();
}

@end
