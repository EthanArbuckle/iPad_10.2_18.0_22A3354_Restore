@implementation SMSessionStateUpdateReqMessage

+ (unint64_t)messageType
{
  return 16;
}

- (SMSessionStateUpdateReqMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 deviceToRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SMSessionStateUpdateReqMessage *v15;
  SMSessionStateUpdateReqMessage *v16;
  SMSessionStateUpdateReqMessage *v17;
  NSObject *v18;
  const char *v19;
  objc_super v21;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
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
    v19 = "Invalid parameter not satisfying: sessionID";
    goto LABEL_16;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: deviceToRequest";
      goto LABEL_16;
    }
LABEL_17:

    v17 = 0;
    goto LABEL_18;
  }
  v21.receiver = self;
  v21.super_class = (Class)SMSessionStateUpdateReqMessage;
  v15 = -[SMMessage initWithDate:messageID:sessionID:](&v21, sel_initWithDate_messageID_sessionID_, v10, v11, v12);
  v16 = v15;
  if (v15)
    objc_storeStrong((id *)&v15->_deviceToRequest, a6);
  self = v16;
  v17 = self;
LABEL_18:

  return v17;
}

- (id)initSessionID:(id)a3 deviceToRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SMSessionStateUpdateReqMessage *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SMSessionStateUpdateReqMessage initWithDate:messageID:sessionID:deviceToRequest:](self, "initWithDate:messageID:sessionID:deviceToRequest:", v8, v9, v7, v6);

  return v10;
}

- (SMSessionStateUpdateReqMessage)initWithDictionary:(id)a3
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
  id v21;
  void *v22;
  NSObject *v23;
  SMSessionStateUpdateReqMessage *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  objc_class *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  objc_class *v36;
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
      goto LABEL_14;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138413058;
    v47 = v26;
    v48 = 2112;
    v49 = v27;
    v50 = 1024;
    v51 = objc_msgSend((id)objc_opt_class(), "messageType");
    v52 = 1024;
    v53 = v8;
    v28 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v29 = v12;
    v30 = 34;
LABEL_32:
    _os_log_error_impl(&dword_245521000, v29, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&v46, v30);

    goto LABEL_14;
  }
  objc_msgSend(v6, "valueForKey:", CFSTR("interfaceVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if (v10 == 1)
  {
    objc_msgSend(v6, "valueForKey:", CFSTR("sendDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
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
        _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v46, 0x16u);

      }
      v24 = 0;
      goto LABEL_30;
    }
    v13 = (void *)MEMORY[0x24BDBCE60];
    -[NSObject doubleValue](v11, "doubleValue");
    objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v6, "valueForKey:", CFSTR("messageID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithUUIDString:", v16);

    if (!v17)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
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
        _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v46, 0x16u);

      }
      v24 = 0;
      goto LABEL_29;
    }
    v18 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v6, "valueForKey:", CFSTR("sessionID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithUUIDString:", v19);

    if (v20)
    {
      v21 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v6, "valueForKey:", CFSTR("deviceToRequest"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "initWithUUIDString:", v22);

      if (v23)
      {
        self = -[SMSessionStateUpdateReqMessage initWithDate:messageID:sessionID:deviceToRequest:](self, "initWithDate:messageID:sessionID:deviceToRequest:", v14, v17, v20, v23);
        v24 = self;
LABEL_28:

LABEL_29:
LABEL_30:

        goto LABEL_15;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
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
        _os_log_error_impl(&dword_245521000, v35, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing deviceToRequest", (uint8_t *)&v46, 0x16u);

      }
      v23 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138412546;
        v47 = v33;
        v48 = 2112;
        v49 = v34;
        _os_log_error_impl(&dword_245521000, v23, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v46, 0x16u);

      }
    }
    v24 = 0;
    goto LABEL_28;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138412802;
    v47 = v26;
    v48 = 2112;
    v49 = v27;
    v50 = 1024;
    v51 = v10;
    v28 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v29 = v12;
    v30 = 28;
    goto LABEL_32;
  }
LABEL_14:
  v24 = 0;
LABEL_15:

  return v24;
}

- (id)outputToDictionary
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SMSessionStateUpdateReqMessage;
  -[SMMessage outputToDictionary](&v7, sel_outputToDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionStateUpdateReqMessage deviceToRequest](self, "deviceToRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("deviceToRequest"));

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
      v9 = "-[SMSessionStateUpdateReqMessage encodeWithCoder:]";
      v10 = 1024;
      v11 = 106;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }

  }
  v7.receiver = self;
  v7.super_class = (Class)SMSessionStateUpdateReqMessage;
  -[SMMessage encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[SMSessionStateUpdateReqMessage deviceToRequest](self, "deviceToRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("deviceToRequest"));

}

- (SMSessionStateUpdateReqMessage)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  SMSessionStateUpdateReqMessage *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  int v21;
  objc_class *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v37) = 0;
      _os_log_error_impl(&dword_245521000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", (uint8_t *)&v37, 2u);
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
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138413058;
    v38 = v16;
    v39 = 2112;
    v40 = v17;
    v41 = 1024;
    v42 = objc_msgSend((id)objc_opt_class(), "messageType");
    v43 = 1024;
    v44 = v7;
    v18 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v19 = v9;
    v20 = 34;
LABEL_32:
    _os_log_error_impl(&dword_245521000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v37, v20);

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
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138412546;
        v38 = v29;
        v39 = 2112;
        v40 = v30;
        _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v37, 0x16u);

      }
      v14 = 0;
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
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138412546;
        v38 = v32;
        v39 = 2112;
        v40 = v33;
        _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v37, 0x16u);

      }
      v14 = 0;
      goto LABEL_29;
    }
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceToRequest"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = v12;
        self = -[SMSessionStateUpdateReqMessage initWithDate:messageID:sessionID:deviceToRequest:](self, "initWithDate:messageID:sessionID:deviceToRequest:", v10, v9, v11, v12);
        v14 = self;
LABEL_28:

LABEL_29:
LABEL_30:

        goto LABEL_15;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138412546;
        v38 = v35;
        v39 = 2112;
        v40 = v36;
        _os_log_error_impl(&dword_245521000, v26, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing deviceToRequest", (uint8_t *)&v37, 0x16u);

      }
      v13 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138412546;
        v38 = v24;
        v39 = 2112;
        v40 = v25;
        _os_log_error_impl(&dword_245521000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v37, 0x16u);

      }
    }
    v14 = 0;
    goto LABEL_28;
  }
  v21 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138412802;
    v38 = v16;
    v39 = 2112;
    v40 = v17;
    v41 = 1024;
    v42 = v21;
    v18 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v19 = v9;
    v20 = 28;
    goto LABEL_32;
  }
LABEL_14:
  v14 = 0;
LABEL_15:

  return v14;
}

- (NSUUID)deviceToRequest
{
  return self->_deviceToRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceToRequest, 0);
}

@end
