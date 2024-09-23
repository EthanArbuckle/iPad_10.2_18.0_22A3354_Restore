@implementation SMLowPowerModeWarningStateUpdateMessage

- (SMLowPowerModeWarningStateUpdateMessage)initWithSessionID:(id)a3 lowPowerModeWarningState:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  SMLowPowerModeWarningStateUpdateMessage *v10;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a3;
  objc_msgSend(v6, "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SMLowPowerModeWarningStateUpdateMessage initWithDate:messageID:sessionID:lowPowerModeWarningState:](self, "initWithDate:messageID:sessionID:lowPowerModeWarningState:", v8, v9, v7, a4);

  return v10;
}

- (SMLowPowerModeWarningStateUpdateMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 lowPowerModeWarningState:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  SMLowPowerModeWarningStateUpdateMessage *v14;
  SMLowPowerModeWarningStateUpdateMessage *v15;
  NSObject *v16;
  const char *v17;
  objc_super v19;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: date";
LABEL_13:
    _os_log_error_impl(&dword_245521000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_14;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: messageID";
    goto LABEL_13;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: sessionID";
      goto LABEL_13;
    }
LABEL_14:

    v15 = 0;
    goto LABEL_15;
  }
  v19.receiver = self;
  v19.super_class = (Class)SMLowPowerModeWarningStateUpdateMessage;
  v14 = -[SMMessage initWithDate:messageID:sessionID:](&v19, sel_initWithDate_messageID_sessionID_, v10, v11, v12);
  if (v14)
    v14->_lowPowerModeWarningState = a6;
  self = v14;
  v15 = self;
LABEL_15:

  return v15;
}

- (SMLowPowerModeWarningStateUpdateMessage)initWithDictionary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  objc_class *v24;
  void *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  SMLowPowerModeWarningStateUpdateMessage *v30;
  NSObject *v32;
  objc_class *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v46) = 0;
      _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", (uint8_t *)&v46, 2u);
    }
    goto LABEL_14;
  }
  objc_msgSend(v5, "valueForKey:", CFSTR("messageType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  if (objc_msgSend((id)objc_opt_class(), "messageType") != v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_14:
      v30 = 0;
      goto LABEL_15;
    }
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138413058;
    v47 = v25;
    v48 = 2112;
    v49 = v26;
    v50 = 1024;
    v51 = objc_msgSend((id)objc_opt_class(), "messageType");
    v52 = 1024;
    v53 = v8;
    v27 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v28 = v12;
    v29 = 34;
LABEL_33:
    _os_log_error_impl(&dword_245521000, v28, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v46, v29);

    goto LABEL_14;
  }
  objc_msgSend(v6, "valueForKey:", CFSTR("interfaceVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if (v10 != 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138412802;
    v47 = v25;
    v48 = 2112;
    v49 = v26;
    v50 = 1024;
    v51 = v10;
    v27 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v28 = v12;
    v29 = 28;
    goto LABEL_33;
  }
  objc_msgSend(v6, "valueForKey:", CFSTR("sendDate"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = (void *)MEMORY[0x24BDBCE60];
    -[NSObject doubleValue](v11, "doubleValue");
    objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v6, "valueForKey:", CFSTR("messageID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithUUIDString:", v16);

    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v6, "valueForKey:", CFSTR("sessionID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "initWithUUIDString:", v19);

      if (v20)
      {
        objc_msgSend(v6, "valueForKey:", CFSTR("lowPowerModeWarningState"));
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          v23 = (int)-[NSObject intValue](v21, "intValue");
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v43 = (objc_class *)objc_opt_class();
            NSStringFromClass(v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = 138412546;
            v47 = v44;
            v48 = 2112;
            v49 = v45;
            _os_log_error_impl(&dword_245521000, v32, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing lowPowerModeWarningState, OK to proceed", (uint8_t *)&v46, 0x16u);

          }
          v23 = 0;
        }
        self = -[SMLowPowerModeWarningStateUpdateMessage initWithDate:messageID:sessionID:lowPowerModeWarningState:](self, "initWithDate:messageID:sessionID:lowPowerModeWarningState:", v14, v17, v20, v23);
        v30 = self;
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v40 = (objc_class *)objc_opt_class();
          NSStringFromClass(v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = 138412546;
          v47 = v41;
          v48 = 2112;
          v49 = v42;
          _os_log_error_impl(&dword_245521000, v22, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v46, 0x16u);

        }
        v30 = 0;
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138412546;
        v47 = v38;
        v48 = 2112;
        v49 = v39;
        _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v46, 0x16u);

      }
      v30 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 138412546;
      v47 = v35;
      v48 = 2112;
      v49 = v36;
      _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v46, 0x16u);

    }
    v30 = 0;
  }

LABEL_15:
  return v30;
}

- (id)outputToDictionary
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SMLowPowerModeWarningStateUpdateMessage;
  -[SMMessage outputToDictionary](&v6, sel_outputToDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMLowPowerModeWarningStateUpdateMessage lowPowerModeWarningState](self, "lowPowerModeWarningState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("lowPowerModeWarningState"));

  return v3;
}

+ (unint64_t)messageType
{
  return 20;
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
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[SMLowPowerModeWarningStateUpdateMessage encodeWithCoder:]";
      v10 = 1024;
      v11 = 122;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }

  }
  v7.receiver = self;
  v7.super_class = (Class)SMLowPowerModeWarningStateUpdateMessage;
  -[SMMessage encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMLowPowerModeWarningStateUpdateMessage lowPowerModeWarningState](self, "lowPowerModeWarningState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("lowPowerModeWarningState"));

}

- (SMLowPowerModeWarningStateUpdateMessage)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  int v21;
  SMLowPowerModeWarningStateUpdateMessage *v22;
  NSObject *v24;
  objc_class *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v38) = 0;
      _os_log_error_impl(&dword_245521000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", (uint8_t *)&v38, 2u);
    }
    goto LABEL_14;
  }
  v7 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("messageType"));
  if (objc_msgSend((id)objc_opt_class(), "messageType") != v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_14:
      v22 = 0;
      goto LABEL_15;
    }
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138413058;
    v39 = v16;
    v40 = 2112;
    v41 = v17;
    v42 = 1024;
    v43 = objc_msgSend((id)objc_opt_class(), "messageType");
    v44 = 1024;
    v45 = v7;
    v18 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v19 = v9;
    v20 = 34;
LABEL_33:
    _os_log_error_impl(&dword_245521000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v38, v20);

    goto LABEL_14;
  }
  v8 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("interfaceVersion"));
  if (v8 != 1)
  {
    v21 = v8;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138412802;
    v39 = v16;
    v40 = 2112;
    v41 = v17;
    v42 = 1024;
    v43 = v21;
    v18 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v19 = v9;
    v20 = 28;
    goto LABEL_33;
  }
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sendDate"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageID"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lowPowerModeWarningState"));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = (int)-[NSObject intValue](v12, "intValue");
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = 138412546;
            v39 = v36;
            v40 = 2112;
            v41 = v37;
            _os_log_error_impl(&dword_245521000, v24, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing lowPowerModeWarningState, OK to proceed", (uint8_t *)&v38, 0x16u);

          }
          v14 = 0;
        }
        self = -[SMLowPowerModeWarningStateUpdateMessage initWithDate:messageID:sessionID:lowPowerModeWarningState:](self, "initWithDate:messageID:sessionID:lowPowerModeWarningState:", v9, v10, v11, v14);
        v22 = self;
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138412546;
          v39 = v33;
          v40 = 2112;
          v41 = v34;
          _os_log_error_impl(&dword_245521000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v38, 0x16u);

        }
        v22 = 0;
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138412546;
        v39 = v30;
        v40 = 2112;
        v41 = v31;
        _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v38, 0x16u);

      }
      v22 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138412546;
      v39 = v27;
      v40 = 2112;
      v41 = v28;
      _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v38, 0x16u);

    }
    v22 = 0;
  }

LABEL_15:
  return v22;
}

- (int64_t)lowPowerModeWarningState
{
  return self->_lowPowerModeWarningState;
}

@end
