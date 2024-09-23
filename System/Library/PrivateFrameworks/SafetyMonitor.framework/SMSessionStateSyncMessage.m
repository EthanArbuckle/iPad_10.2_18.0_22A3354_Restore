@implementation SMSessionStateSyncMessage

- (SMSessionStateSyncMessage)initWithSessionManagerState:(id)a3 stateTransitionType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  SMSessionStateSyncMessage *v9;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SMSessionStateSyncMessage initWithDate:messageID:sessionManagerState:stateTransitionType:](self, "initWithDate:messageID:sessionManagerState:stateTransitionType:", v7, v8, v6, a4);

  return v9;
}

- (SMSessionStateSyncMessage)initWithDate:(id)a3 messageID:(id)a4 sessionManagerState:(id)a5 stateTransitionType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  SMSessionStateSyncMessage *v16;
  SMSessionStateSyncMessage *v17;
  NSObject *v18;
  const char *v19;
  objc_super v21;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: date";
LABEL_16:
    _os_log_error_impl(&dword_245521000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_17;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: messageID";
    goto LABEL_16;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: sessionManagerState";
    goto LABEL_16;
  }
  if (!objc_msgSend(v12, "sessionState"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: sessionManagerState.sessionState";
      goto LABEL_16;
    }
LABEL_17:

    v17 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v13, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sessionID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)SMSessionStateSyncMessage;
  v16 = -[SMMessage initWithDate:messageID:sessionID:](&v21, sel_initWithDate_messageID_sessionID_, v10, v11, v15);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_sessionManagerState, a5);
    v16->_stateTransitionType = a6;
  }
  self = v16;
  v17 = self;
LABEL_18:

  return v17;
}

- (SMSessionStateSyncMessage)initWithDictionary:(id)a3
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
  SMSessionManagerState *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  SMSessionStateSyncMessage *v28;
  NSObject *v30;
  objc_class *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v44) = 0;
      _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", (uint8_t *)&v44, 2u);
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
      v28 = 0;
      goto LABEL_15;
    }
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 138413058;
    v45 = v23;
    v46 = 2112;
    v47 = v24;
    v48 = 1024;
    v49 = objc_msgSend((id)objc_opt_class(), "messageType");
    v50 = 1024;
    v51 = v8;
    v25 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v26 = v12;
    v27 = 34;
LABEL_33:
    _os_log_error_impl(&dword_245521000, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v44, v27);

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
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 138412802;
    v45 = v23;
    v46 = 2112;
    v47 = v24;
    v48 = 1024;
    v49 = v10;
    v25 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v26 = v12;
    v27 = 28;
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
      v18 = -[SMSessionManagerState initWithDictionary:]([SMSessionManagerState alloc], "initWithDictionary:", v6);
      if (v18)
      {
        objc_msgSend(v6, "valueForKey:", CFSTR("stateTransitionType"));
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          v21 = (int)-[NSObject intValue](v19, "intValue");
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v41 = (objc_class *)objc_opt_class();
            NSStringFromClass(v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = 138412546;
            v45 = v42;
            v46 = 2112;
            v47 = v43;
            _os_log_error_impl(&dword_245521000, v30, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing stateTransitionType", (uint8_t *)&v44, 0x16u);

          }
          v21 = 0;
        }
        self = -[SMSessionStateSyncMessage initWithDate:messageID:sessionManagerState:stateTransitionType:](self, "initWithDate:messageID:sessionManagerState:stateTransitionType:", v14, v17, v18, v21);
        v28 = self;
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 138412546;
          v45 = v39;
          v46 = 2112;
          v47 = v40;
          _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache, %@, %@, sessionManagerState is nil", (uint8_t *)&v44, 0x16u);

        }
        v28 = 0;
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v18 = (SMSessionManagerState *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_ERROR))
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 138412546;
        v45 = v36;
        v46 = 2112;
        v47 = v37;
        _os_log_error_impl(&dword_245521000, &v18->super, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v44, 0x16u);

      }
      v28 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138412546;
      v45 = v33;
      v46 = 2112;
      v47 = v34;
      _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v44, 0x16u);

    }
    v28 = 0;
  }

LABEL_15:
  return v28;
}

- (id)outputToDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SMSessionStateSyncMessage;
  -[SMMessage outputToDictionary](&v8, sel_outputToDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionStateSyncMessage sessionManagerState](self, "sessionManagerState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputToDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v5);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionStateSyncMessage stateTransitionType](self, "stateTransitionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("stateTransitionType"));

  return v3;
}

+ (unint64_t)messageType
{
  return 7;
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
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[SMSessionStateSyncMessage encodeWithCoder:]";
      v11 = 1024;
      v12 = 132;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)SMSessionStateSyncMessage;
  -[SMMessage encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[SMSessionStateSyncMessage sessionManagerState](self, "sessionManagerState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sessionState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[SMSessionStateSyncMessage stateTransitionType](self, "stateTransitionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("stateTransitionType"));

}

- (SMSessionStateSyncMessage)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int v22;
  SMSessionStateSyncMessage *v23;
  NSObject *v25;
  objc_class *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v39) = 0;
      _os_log_error_impl(&dword_245521000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", (uint8_t *)&v39, 2u);
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
      v23 = 0;
      goto LABEL_15;
    }
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138413058;
    v40 = v17;
    v41 = 2112;
    v42 = v18;
    v43 = 1024;
    v44 = objc_msgSend((id)objc_opt_class(), "messageType");
    v45 = 1024;
    v46 = v7;
    v19 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v20 = v9;
    v21 = 34;
LABEL_33:
    _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v39, v21);

    goto LABEL_14;
  }
  v8 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("interfaceVersion"));
  if (v8 != 1)
  {
    v22 = v8;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138412802;
    v40 = v17;
    v41 = 2112;
    v42 = v18;
    v43 = 1024;
    v44 = v22;
    v19 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v20 = v9;
    v21 = 28;
    goto LABEL_33;
  }
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageID"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sendDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionState"));
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stateTransitionType"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = (int)objc_msgSend(v13, "intValue");
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v36 = (objc_class *)objc_opt_class();
            NSStringFromClass(v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = 138412546;
            v40 = v37;
            v41 = 2112;
            v42 = v38;
            _os_log_error_impl(&dword_245521000, v25, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing stateTransitionType", (uint8_t *)&v39, 0x16u);

          }
          v15 = 0;
        }
        self = -[SMSessionStateSyncMessage initWithDate:messageID:sessionManagerState:stateTransitionType:](self, "initWithDate:messageID:sessionManagerState:stateTransitionType:", v10, v9, v12, v15);

        v23 = self;
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 138412546;
          v40 = v34;
          v41 = 2112;
          v42 = v35;
          _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v39, 0x16u);

        }
        v23 = 0;
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138412546;
        v40 = v31;
        v41 = 2112;
        v42 = v32;
        _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v39, 0x16u);

      }
      v23 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412546;
      v40 = v28;
      v41 = 2112;
      v42 = v29;
      _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v39, 0x16u);

    }
    v23 = 0;
  }

LABEL_15:
  return v23;
}

- (SMSessionManagerState)sessionManagerState
{
  return self->_sessionManagerState;
}

- (unint64_t)stateTransitionType
{
  return self->_stateTransitionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionManagerState, 0);
}

@end
