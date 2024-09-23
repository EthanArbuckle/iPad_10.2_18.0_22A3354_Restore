@implementation SMSessionModifyConfigRemoteControlMessage

- (SMSessionModifyConfigRemoteControlMessage)initWithSourceDeviceType:(int64_t)a3 sourceDeviceID:(id)a4 updatedSessionConfiguration:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  SMSessionModifyConfigRemoteControlMessage *v13;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SMSessionModifyConfigRemoteControlMessage initWithDate:messageID:sessionID:sourceDeviceType:sourceDeviceID:updatedSessionConfiguration:](self, "initWithDate:messageID:sessionID:sourceDeviceType:sourceDeviceID:updatedSessionConfiguration:", v10, v11, v12, a3, v9, v8);

  return v13;
}

- (SMSessionModifyConfigRemoteControlMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 sourceDeviceType:(int64_t)a6 sourceDeviceID:(id)a7 updatedSessionConfiguration:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  SMSessionModifyConfigRemoteControlMessage *v19;
  SMSessionModifyConfigRemoteControlMessage *v20;
  SMSessionModifyConfigRemoteControlMessage *v21;
  NSObject *v22;
  const char *v23;
  objc_super v25;
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: date";
LABEL_13:
    _os_log_error_impl(&dword_245521000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_14;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: messageID";
    goto LABEL_13;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = "Invalid parameter not satisfying: sessionID";
      goto LABEL_13;
    }
LABEL_14:

    v21 = 0;
    goto LABEL_15;
  }
  v25.receiver = self;
  v25.super_class = (Class)SMSessionModifyConfigRemoteControlMessage;
  v19 = -[SMMessage initWithDate:messageID:sessionID:](&v25, sel_initWithDate_messageID_sessionID_, v14, v15, v16);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_updatedSessionConfiguration, a8);
    objc_storeStrong((id *)&v20->_sourceDeviceID, a7);
    v20->_sourceDeviceType = a6;
  }
  self = v20;
  v21 = self;
LABEL_15:

  return v21;
}

- (SMSessionModifyConfigRemoteControlMessage)initWithDictionary:(id)a3
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
  int v23;
  SMSessionConfiguration *v24;
  NSObject *p_super;
  uint64_t v26;
  NSObject *v27;
  SMSessionModifyConfigRemoteControlMessage *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  objc_class *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  void *v49;
  objc_class *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
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
      goto LABEL_16;
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v59 = v30;
    v60 = 2112;
    v61 = v31;
    v62 = 1024;
    v63 = objc_msgSend((id)objc_opt_class(), "messageType");
    v64 = 1024;
    v65 = v8;
    v32 = "#RemoteControl%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v33 = v12;
    v34 = 34;
LABEL_31:
    _os_log_error_impl(&dword_245521000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);

    goto LABEL_16;
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
        v41 = (objc_class *)objc_opt_class();
        NSStringFromClass(v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v59 = v42;
        v60 = 2112;
        v61 = v43;
        _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing date", buf, 0x16u);

      }
      v28 = 0;
      goto LABEL_42;
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
        v44 = (objc_class *)objc_opt_class();
        NSStringFromClass(v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v59 = v45;
        v60 = 2112;
        v61 = v46;
        _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing messageID", buf, 0x16u);

      }
      v28 = 0;
      goto LABEL_41;
    }
    v18 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v6, "valueForKey:", CFSTR("sessionID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithUUIDString:", v19);

    if (!v20)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v59 = v48;
        v60 = 2112;
        v61 = v49;
        _os_log_error_impl(&dword_245521000, v22, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing sessionID", buf, 0x16u);

      }
      v28 = 0;
      goto LABEL_40;
    }
    objc_msgSend(v6, "valueForKey:", CFSTR("idsDeviceType"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v21)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v50 = (objc_class *)objc_opt_class();
        NSStringFromClass(v50);
        v51 = v27;
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v59 = v52;
        v60 = 2112;
        v61 = v53;
        _os_log_error_impl(&dword_245521000, v51, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing idsDeviceType", buf, 0x16u);

        v27 = v51;
      }
      v28 = 0;
      goto LABEL_39;
    }
    v23 = -[NSObject intValue](v21, "intValue");
    objc_msgSend(v6, "valueForKey:", CFSTR("sourceDeviceId"));
    v57 = objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      v24 = -[SMSessionConfiguration initWithDictionary:]([SMSessionConfiguration alloc], "initWithDictionary:", v6);
      if (v24)
      {
        p_super = &v24->super;
        v26 = v23;
        v27 = v57;
        self = -[SMSessionModifyConfigRemoteControlMessage initWithDate:messageID:sessionID:sourceDeviceType:sourceDeviceID:updatedSessionConfiguration:](self, "initWithDate:messageID:sessionID:sourceDeviceType:sourceDeviceID:updatedSessionConfiguration:", v14, v17, v20, v26, v57, v24);
        v28 = self;
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
LABEL_42:

        goto LABEL_17;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v59 = v55;
        v60 = 2112;
        v61 = v56;
        _os_log_error_impl(&dword_245521000, v40, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing updatedSessionConfig", buf, 0x16u);

      }
      p_super = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v59 = v38;
        v60 = 2112;
        v61 = v39;
        _os_log_error_impl(&dword_245521000, p_super, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing sourceDeviceID", buf, 0x16u);

      }
    }
    v28 = 0;
    v27 = v57;
    goto LABEL_38;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v59 = v30;
    v60 = 2112;
    v61 = v31;
    v62 = 1024;
    v63 = v10;
    v32 = "#RemoteControl%@,%@,unrecognized interface version,%d";
    v33 = v12;
    v34 = 28;
    goto LABEL_31;
  }
LABEL_16:
  v28 = 0;
LABEL_17:

  return v28;
}

- (id)outputToDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SMSessionModifyConfigRemoteControlMessage;
  -[SMMessage outputToDictionary](&v9, sel_outputToDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMSessionModifyConfigRemoteControlMessage sourceDeviceType](self, "sourceDeviceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("idsDeviceType"));

  -[SMSessionModifyConfigRemoteControlMessage sourceDeviceID](self, "sourceDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sourceDeviceId"));

  -[SMSessionModifyConfigRemoteControlMessage updatedSessionConfiguration](self, "updatedSessionConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputToDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v7);

  return v3;
}

+ (unint64_t)messageType
{
  return 18;
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
      v10 = "-[SMSessionModifyConfigRemoteControlMessage encodeWithCoder:]";
      v11 = 1024;
      v12 = 149;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)SMSessionModifyConfigRemoteControlMessage;
  -[SMMessage encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[SMSessionModifyConfigRemoteControlMessage updatedSessionConfiguration](self, "updatedSessionConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("updatedSessionConfiguration"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionModifyConfigRemoteControlMessage sourceDeviceType](self, "sourceDeviceType"), CFSTR("idsDeviceType"));
  -[SMSessionModifyConfigRemoteControlMessage sourceDeviceID](self, "sourceDeviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sourceDeviceId"));

}

- (SMSessionModifyConfigRemoteControlMessage)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  SMSessionModifyConfigRemoteControlMessage *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  int v23;
  objc_class *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v42) = 0;
      _os_log_error_impl(&dword_245521000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", (uint8_t *)&v42, 2u);
    }
    goto LABEL_15;
  }
  v7 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("messageType"));
  if (objc_msgSend((id)objc_opt_class(), "messageType") != v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138413058;
    v43 = v18;
    v44 = 2112;
    v45 = v19;
    v46 = 1024;
    v47 = objc_msgSend((id)objc_opt_class(), "messageType");
    v48 = 1024;
    v49 = v7;
    v20 = "#RemoteControl,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v21 = v9;
    v22 = 34;
LABEL_29:
    _os_log_error_impl(&dword_245521000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v42, v22);

    goto LABEL_15;
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
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 138412546;
        v43 = v31;
        v44 = 2112;
        v45 = v32;
        _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing messageID", (uint8_t *)&v42, 0x16u);

      }
      v16 = 0;
      goto LABEL_37;
    }
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sendDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 138412546;
        v43 = v34;
        v44 = 2112;
        v45 = v35;
        _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing date", (uint8_t *)&v42, 0x16u);

      }
      v16 = 0;
      goto LABEL_36;
    }
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 138412546;
        v43 = v37;
        v44 = 2112;
        v45 = v38;
        _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing sessionID", (uint8_t *)&v42, 0x16u);

      }
      v16 = 0;
      goto LABEL_35;
    }
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceDeviceId"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("idsDeviceType"));
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updatedSessionConfiguration"));
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = v14;
        self = -[SMSessionModifyConfigRemoteControlMessage initWithDate:messageID:sessionID:sourceDeviceType:sourceDeviceID:updatedSessionConfiguration:](self, "initWithDate:messageID:sessionID:sourceDeviceType:sourceDeviceID:updatedSessionConfiguration:", v10, v9, v11, v13, v12, v14);
        v16 = self;
LABEL_34:

LABEL_35:
LABEL_36:

LABEL_37:
        goto LABEL_16;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 138412546;
        v43 = v40;
        v44 = 2112;
        v45 = v41;
        _os_log_error_impl(&dword_245521000, v29, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing updatedSessionConfiguration", (uint8_t *)&v42, 0x16u);

      }
      v15 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 138412546;
        v43 = v26;
        v44 = 2112;
        v45 = v27;
        _os_log_error_impl(&dword_245521000, v15, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sourceDeviceID", (uint8_t *)&v42, 0x16u);

      }
    }
    v16 = 0;
    goto LABEL_34;
  }
  v23 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138412802;
    v43 = v18;
    v44 = 2112;
    v45 = v19;
    v46 = 1024;
    v47 = v23;
    v20 = "#RemoteControl,%@,%@,unrecognized interface version,%d";
    v21 = v9;
    v22 = 28;
    goto LABEL_29;
  }
LABEL_15:
  v16 = 0;
LABEL_16:

  return v16;
}

- (NSString)sourceDeviceID
{
  return self->_sourceDeviceID;
}

- (int64_t)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (SMSessionConfiguration)updatedSessionConfiguration
{
  return self->_updatedSessionConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedSessionConfiguration, 0);
  objc_storeStrong((id *)&self->_sourceDeviceID, 0);
}

@end
