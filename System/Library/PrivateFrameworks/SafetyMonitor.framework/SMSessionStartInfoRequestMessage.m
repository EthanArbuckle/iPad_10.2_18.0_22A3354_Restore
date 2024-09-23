@implementation SMSessionStartInfoRequestMessage

- (SMSessionStartInfoRequestMessage)initWithSessionID:(id)a3 receiverHandle:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  SMSessionStartInfoRequestMessage *v11;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SMSessionStartInfoRequestMessage initWithDate:messageID:sessionID:receiverHandle:](self, "initWithDate:messageID:sessionID:receiverHandle:", v9, v10, v8, v7);

  return v11;
}

- (SMSessionStartInfoRequestMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 receiverHandle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SMSessionStartInfoRequestMessage *v14;
  SMSessionStartInfoRequestMessage *v15;
  SMSessionStartInfoRequestMessage *v16;
  NSObject *v17;
  const char *v18;
  objc_super v20;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: date";
LABEL_13:
    _os_log_error_impl(&dword_245521000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_14;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: messageID";
    goto LABEL_13;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v18 = "Invalid parameter not satisfying: sessionID";
      goto LABEL_13;
    }
LABEL_14:

    v16 = 0;
    goto LABEL_15;
  }
  v20.receiver = self;
  v20.super_class = (Class)SMSessionStartInfoRequestMessage;
  v14 = -[SMMessage initWithDate:messageID:sessionID:](&v20, sel_initWithDate_messageID_sessionID_, v10, v11, v12);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_receiverHandle, a6);
  self = v15;
  v16 = self;
LABEL_15:

  return v16;
}

- (SMSessionStartInfoRequestMessage)initWithDictionary:(id)a3
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
  void *v21;
  SMSessionStartInfoRequestMessage *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  objc_class *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  objc_class *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v41) = 0;
      _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", (uint8_t *)&v41, 2u);
    }
    goto LABEL_13;
  }
  objc_msgSend(v5, "valueForKey:", CFSTR("messageType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  if (objc_msgSend((id)objc_opt_class(), "messageType") != v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138413058;
    v42 = v24;
    v43 = 2112;
    v44 = v25;
    v45 = 1024;
    v46 = objc_msgSend((id)objc_opt_class(), "messageType");
    v47 = 1024;
    v48 = v8;
    v26 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v27 = v12;
    v28 = 34;
LABEL_27:
    _os_log_error_impl(&dword_245521000, v27, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v41, v28);

    goto LABEL_13;
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
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138412546;
        v42 = v36;
        v43 = 2112;
        v44 = v37;
        _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v41, 0x16u);

      }
      v22 = 0;
      goto LABEL_25;
    }
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
        objc_msgSend(v6, "valueForKey:", CFSTR("receiverHandle"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[SMSessionStartInfoRequestMessage initWithDate:messageID:sessionID:receiverHandle:](self, "initWithDate:messageID:sessionID:receiverHandle:", v14, v17, v20, v21);

        v22 = self;
LABEL_24:

LABEL_25:
        goto LABEL_14;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138412546;
        v42 = v39;
        v43 = 2112;
        v44 = v40;
        _os_log_error_impl(&dword_245521000, v33, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v41, 0x16u);

      }
      v20 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138412546;
        v42 = v31;
        v43 = 2112;
        v44 = v32;
        _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v41, 0x16u);

      }
    }
    v22 = 0;
    goto LABEL_24;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138412802;
    v42 = v24;
    v43 = 2112;
    v44 = v25;
    v45 = 1024;
    v46 = v10;
    v26 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v27 = v12;
    v28 = 28;
    goto LABEL_27;
  }
LABEL_13:
  v22 = 0;
LABEL_14:

  return v22;
}

- (id)outputToDictionary
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SMSessionStartInfoRequestMessage;
  -[SMMessage outputToDictionary](&v7, sel_outputToDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionStartInfoRequestMessage receiverHandle](self, "receiverHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SMSessionStartInfoRequestMessage receiverHandle](self, "receiverHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("receiverHandle"));

  }
  return v3;
}

+ (unint64_t)messageType
{
  return 12;
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
      v9 = "-[SMSessionStartInfoRequestMessage encodeWithCoder:]";
      v10 = 1024;
      v11 = 119;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }

  }
  v7.receiver = self;
  v7.super_class = (Class)SMSessionStartInfoRequestMessage;
  -[SMMessage encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[SMSessionStartInfoRequestMessage receiverHandle](self, "receiverHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("receiverHandle"));

}

- (SMSessionStartInfoRequestMessage)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  SMSessionStartInfoRequestMessage *v14;
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
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v34) = 0;
      _os_log_error_impl(&dword_245521000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", (uint8_t *)&v34, 2u);
    }
    goto LABEL_13;
  }
  v7 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("messageType"));
  if (objc_msgSend((id)objc_opt_class(), "messageType") != v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138413058;
    v35 = v16;
    v36 = 2112;
    v37 = v17;
    v38 = 1024;
    v39 = objc_msgSend((id)objc_opt_class(), "messageType");
    v40 = 1024;
    v41 = v7;
    v18 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v19 = v9;
    v20 = 34;
LABEL_27:
    _os_log_error_impl(&dword_245521000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v34, v20);

    goto LABEL_13;
  }
  v8 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("interfaceVersion"));
  if (v8 == 1)
  {
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sendDate"));
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
        v34 = 138412546;
        v35 = v29;
        v36 = 2112;
        v37 = v30;
        _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v34, 0x16u);

      }
      v14 = 0;
      goto LABEL_25;
    }
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageID"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = v11;
        objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receiverHandle"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[SMSessionStartInfoRequestMessage initWithDate:messageID:sessionID:receiverHandle:](self, "initWithDate:messageID:sessionID:receiverHandle:", v9, v10, v12, v13);

        v14 = self;
LABEL_24:

LABEL_25:
        goto LABEL_14;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138412546;
        v35 = v32;
        v36 = 2112;
        v37 = v33;
        _os_log_error_impl(&dword_245521000, v26, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v34, 0x16u);

      }
      v12 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138412546;
        v35 = v24;
        v36 = 2112;
        v37 = v25;
        _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v34, 0x16u);

      }
    }
    v14 = 0;
    goto LABEL_24;
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
    v34 = 138412802;
    v35 = v16;
    v36 = 2112;
    v37 = v17;
    v38 = 1024;
    v39 = v21;
    v18 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v19 = v9;
    v20 = 28;
    goto LABEL_27;
  }
LABEL_13:
  v14 = 0;
LABEL_14:

  return v14;
}

- (NSString)receiverHandle
{
  return self->_receiverHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverHandle, 0);
}

@end
