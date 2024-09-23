@implementation SMResponseToTriggerPromptRemoteControlMessage

- (SMResponseToTriggerPromptRemoteControlMessage)initWithTriggerPromptResponse:(int64_t)a3 sessionID:(id)a4 sourceDeviceType:(int64_t)a5 sourceDeviceID:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  SMResponseToTriggerPromptRemoteControlMessage *v14;

  v10 = a6;
  v11 = a4;
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SMResponseToTriggerPromptRemoteControlMessage initWithDate:messageID:response:sessionID:sourceDeviceType:sourceDeviceID:](self, "initWithDate:messageID:response:sessionID:sourceDeviceType:sourceDeviceID:", v12, v13, a3, v11, a5, v10);

  return v14;
}

- (SMResponseToTriggerPromptRemoteControlMessage)initWithDate:(id)a3 messageID:(id)a4 response:(int64_t)a5 sessionID:(id)a6 sourceDeviceType:(int64_t)a7 sourceDeviceID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  SMResponseToTriggerPromptRemoteControlMessage *v18;
  SMResponseToTriggerPromptRemoteControlMessage *v19;
  SMResponseToTriggerPromptRemoteControlMessage *v20;
  NSObject *v21;
  const char *v22;
  objc_super v24;
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: date";
LABEL_13:
    _os_log_error_impl(&dword_245521000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_14;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: messageID";
    goto LABEL_13;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v22 = "Invalid parameter not satisfying: sessionID";
      goto LABEL_13;
    }
LABEL_14:

    v20 = 0;
    goto LABEL_15;
  }
  v24.receiver = self;
  v24.super_class = (Class)SMResponseToTriggerPromptRemoteControlMessage;
  v18 = -[SMMessage initWithDate:messageID:sessionID:](&v24, sel_initWithDate_messageID_sessionID_, v14, v15, v16);
  v19 = v18;
  if (v18)
  {
    v18->_response = a5;
    objc_storeStrong((id *)&v18->_sourceDeviceID, a8);
    v19->_sourceDeviceType = a7;
  }
  self = v19;
  v20 = self;
LABEL_15:

  return v20;
}

- (SMResponseToTriggerPromptRemoteControlMessage)initWithDictionary:(id)a3
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
  NSObject *v18;
  NSObject *v19;
  int v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  SMResponseToTriggerPromptRemoteControlMessage *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  NSObject *v37;
  objc_class *v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  void *v52;
  objc_class *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  int v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", buf, 2u);
    }
    goto LABEL_16;
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
LABEL_16:
      v29 = 0;
      goto LABEL_17;
    }
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v63 = v31;
    v64 = 2112;
    v65 = v32;
    v66 = 1024;
    v67 = objc_msgSend((id)objc_opt_class(), "messageType");
    v68 = 1024;
    v69 = v8;
    v33 = "#RemoteControl,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v34 = v12;
    v35 = 34;
LABEL_31:
    _os_log_error_impl(&dword_245521000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);

    goto LABEL_16;
  }
  objc_msgSend(v6, "valueForKey:", CFSTR("interfaceVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if (v10 != 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v63 = v31;
    v64 = 2112;
    v65 = v32;
    v66 = 1024;
    v67 = v10;
    v33 = "#RemoteControl,%@,%@,unrecognized interface version,%d";
    v34 = v12;
    v35 = 28;
    goto LABEL_31;
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
      objc_msgSend(v6, "valueForKey:", CFSTR("userTriggerResponse"));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v20 = -[NSObject intValue](v18, "intValue");
        v21 = objc_alloc(MEMORY[0x24BDD1880]);
        objc_msgSend(v6, "valueForKey:", CFSTR("sessionID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "initWithUUIDString:", v22);

        if (v23)
        {
          objc_msgSend(v6, "valueForKey:", CFSTR("idsDeviceType"));
          v24 = objc_claimAutoreleasedReturnValue();
          v61 = v24;
          if (v24)
          {
            v60 = v23;
            v25 = -[NSObject intValue](v24, "intValue");
            objc_msgSend(v6, "valueForKey:", CFSTR("sourceDeviceId"));
            v26 = objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              v27 = v26;
              v28 = v25;
              v23 = v60;
              self = -[SMResponseToTriggerPromptRemoteControlMessage initWithDate:messageID:response:sessionID:sourceDeviceType:sourceDeviceID:](self, "initWithDate:messageID:response:sessionID:sourceDeviceType:sourceDeviceID:", v14, v17, v20, v60, v28, v26);
              v29 = self;
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                v57 = (objc_class *)objc_opt_class();
                NSStringFromClass(v57);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v63 = v58;
                v64 = 2112;
                v65 = v59;
                _os_log_error_impl(&dword_245521000, v39, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing sourceDeviceID", buf, 0x16u);

              }
              v27 = 0;
              v29 = 0;
              v23 = v60;
            }
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v53 = (objc_class *)objc_opt_class();
              NSStringFromClass(v53);
              v54 = v23;
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v63 = v55;
              v64 = 2112;
              v65 = v56;
              _os_log_error_impl(&dword_245521000, v27, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing idsDeviceType", buf, 0x16u);

              v23 = v54;
            }
            v29 = 0;
          }

          v37 = v61;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v50 = (objc_class *)objc_opt_class();
            NSStringFromClass(v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v63 = v51;
            v64 = 2112;
            v65 = v52;
            _os_log_error_impl(&dword_245521000, v37, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing sessionID", buf, 0x16u);

            v23 = 0;
          }
          v29 = 0;
        }

      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v46 = (objc_class *)objc_opt_class();
          NSStringFromClass(v46);
          v47 = v23;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v63 = v48;
          v64 = 2112;
          v65 = v49;
          _os_log_error_impl(&dword_245521000, v47, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing UserTriggerResponse", buf, 0x16u);

          v23 = v47;
        }
        v29 = 0;
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v63 = v44;
        v64 = 2112;
        v65 = v45;
        _os_log_error_impl(&dword_245521000, v19, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing messageID", buf, 0x16u);

      }
      v29 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v63 = v41;
      v64 = 2112;
      v65 = v42;
      _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing date", buf, 0x16u);

    }
    v29 = 0;
  }

LABEL_17:
  return v29;
}

- (id)outputToDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SMResponseToTriggerPromptRemoteControlMessage;
  -[SMMessage outputToDictionary](&v8, sel_outputToDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMResponseToTriggerPromptRemoteControlMessage response](self, "response"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("userTriggerResponse"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMResponseToTriggerPromptRemoteControlMessage sourceDeviceType](self, "sourceDeviceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("idsDeviceType"));

  -[SMResponseToTriggerPromptRemoteControlMessage sourceDeviceID](self, "sourceDeviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("sourceDeviceId"));

  return v3;
}

+ (unint64_t)messageType
{
  return 19;
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
      v9 = "-[SMResponseToTriggerPromptRemoteControlMessage encodeWithCoder:]";
      v10 = 1024;
      v11 = 155;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }

  }
  v7.receiver = self;
  v7.super_class = (Class)SMResponseToTriggerPromptRemoteControlMessage;
  -[SMMessage encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMResponseToTriggerPromptRemoteControlMessage response](self, "response"), CFSTR("userTriggerResponse"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMResponseToTriggerPromptRemoteControlMessage sourceDeviceType](self, "sourceDeviceType"), CFSTR("idsDeviceType"));
  -[SMResponseToTriggerPromptRemoteControlMessage sourceDeviceID](self, "sourceDeviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sourceDeviceId"));

}

- (SMResponseToTriggerPromptRemoteControlMessage)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  SMResponseToTriggerPromptRemoteControlMessage *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int v22;
  objc_class *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
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
      goto LABEL_14;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138413058;
    v39 = v17;
    v40 = 2112;
    v41 = v18;
    v42 = 1024;
    v43 = objc_msgSend((id)objc_opt_class(), "messageType");
    v44 = 1024;
    v45 = v7;
    v19 = "#RemoteControl,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v20 = v9;
    v21 = 34;
LABEL_32:
    _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v38, v21);

    goto LABEL_14;
  }
  v8 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("interfaceVersion"));
  if (v8 == 1)
  {
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageID"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
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
        _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing messageID", (uint8_t *)&v38, 0x16u);

      }
      v15 = 0;
      goto LABEL_30;
    }
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sendDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
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
        _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing date", (uint8_t *)&v38, 0x16u);

      }
      v15 = 0;
      goto LABEL_29;
    }
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("userTriggerResponse"));
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceDeviceId"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = v13;
        self = -[SMResponseToTriggerPromptRemoteControlMessage initWithDate:messageID:response:sessionID:sourceDeviceType:sourceDeviceID:](self, "initWithDate:messageID:response:sessionID:sourceDeviceType:sourceDeviceID:", v10, v9, v12, v11, objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("idsDeviceType")), v13);
        v15 = self;
LABEL_28:

LABEL_29:
LABEL_30:

        goto LABEL_15;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
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
        _os_log_error_impl(&dword_245521000, v27, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing sourceDeviceID", (uint8_t *)&v38, 0x16u);

      }
      v14 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138412546;
        v39 = v25;
        v40 = 2112;
        v41 = v26;
        _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing sessionID", (uint8_t *)&v38, 0x16u);

      }
    }
    v15 = 0;
    goto LABEL_28;
  }
  v22 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138412802;
    v39 = v17;
    v40 = 2112;
    v41 = v18;
    v42 = 1024;
    v43 = v22;
    v19 = "#RemoteControl,%@,%@,unrecognized interface version,%d";
    v20 = v9;
    v21 = 28;
    goto LABEL_32;
  }
LABEL_14:
  v15 = 0;
LABEL_15:

  return v15;
}

- (int64_t)response
{
  return self->_response;
}

- (NSString)sourceDeviceID
{
  return self->_sourceDeviceID;
}

- (int64_t)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceDeviceID, 0);
}

@end
