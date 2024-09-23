@implementation SMEmergencyContactsNotifiedSyncMessage

- (SMEmergencyContactsNotifiedSyncMessage)initWithSessionID:(id)a3 triggerCategory:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  SMEmergencyContactsNotifiedSyncMessage *v10;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a3;
  objc_msgSend(v6, "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SMEmergencyContactsNotifiedSyncMessage initWithDate:messageID:sessionID:triggerCategory:](self, "initWithDate:messageID:sessionID:triggerCategory:", v8, v9, v7, a4);

  return v10;
}

- (SMEmergencyContactsNotifiedSyncMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 triggerCategory:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  SMEmergencyContactsNotifiedSyncMessage *v14;
  SMEmergencyContactsNotifiedSyncMessage *v15;
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
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: date";
LABEL_16:
    _os_log_error_impl(&dword_245521000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_17;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: messageID";
    goto LABEL_16;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: sessionID";
    goto LABEL_16;
  }
  if (a6 - 1 >= 0x16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: triggerCategory > SMTriggerCategoryUnknown && triggerCategory < SMTriggerCategoryMax";
      goto LABEL_16;
    }
LABEL_17:

    v15 = 0;
    goto LABEL_18;
  }
  v19.receiver = self;
  v19.super_class = (Class)SMEmergencyContactsNotifiedSyncMessage;
  v14 = -[SMMessage initWithDate:messageID:sessionID:](&v19, sel_initWithDate_messageID_sessionID_, v10, v11, v12);
  if (v14)
    v14->_triggerCategory = a6;
  self = v14;
  v15 = self;
LABEL_18:

  return v15;
}

- (SMEmergencyContactsNotifiedSyncMessage)initWithDictionary:(id)a3
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
  SMEmergencyContactsNotifiedSyncMessage *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  objc_class *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  objc_class *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", (uint8_t *)&v45, 2u);
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
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 138413058;
    v46 = v25;
    v47 = 2112;
    v48 = v26;
    v49 = 1024;
    v50 = objc_msgSend((id)objc_opt_class(), "messageType");
    v51 = 1024;
    v52 = v8;
    v27 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v28 = v12;
    v29 = 34;
LABEL_32:
    _os_log_error_impl(&dword_245521000, v28, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v45, v29);

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
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 138412546;
        v46 = v37;
        v47 = 2112;
        v48 = v38;
        _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v45, 0x16u);

      }
      v23 = 0;
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
        v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 138412546;
        v46 = v40;
        v47 = 2112;
        v48 = v41;
        _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v45, 0x16u);

      }
      v23 = 0;
      goto LABEL_29;
    }
    v18 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v6, "valueForKey:", CFSTR("sessionID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithUUIDString:", v19);

    if (v20)
    {
      objc_msgSend(v6, "valueForKey:", CFSTR("triggerCategory"));
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = v21;
        self = -[SMEmergencyContactsNotifiedSyncMessage initWithDate:messageID:sessionID:triggerCategory:](self, "initWithDate:messageID:sessionID:triggerCategory:", v14, v17, v20, (int)-[NSObject intValue](v21, "intValue"));
        v23 = self;
LABEL_28:

LABEL_29:
LABEL_30:

        goto LABEL_15;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 138412546;
        v46 = v43;
        v47 = 2112;
        v48 = v44;
        _os_log_error_impl(&dword_245521000, v34, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing triggerCategory", (uint8_t *)&v45, 0x16u);

      }
      v22 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 138412546;
        v46 = v32;
        v47 = 2112;
        v48 = v33;
        _os_log_error_impl(&dword_245521000, v22, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v45, 0x16u);

      }
    }
    v23 = 0;
    goto LABEL_28;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 138412802;
    v46 = v25;
    v47 = 2112;
    v48 = v26;
    v49 = 1024;
    v50 = v10;
    v27 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v28 = v12;
    v29 = 28;
    goto LABEL_32;
  }
LABEL_14:
  v23 = 0;
LABEL_15:

  return v23;
}

- (id)outputToDictionary
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SMEmergencyContactsNotifiedSyncMessage;
  -[SMMessage outputToDictionary](&v6, sel_outputToDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMEmergencyContactsNotifiedSyncMessage triggerCategory](self, "triggerCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("triggerCategory"));

  return v3;
}

+ (unint64_t)messageType
{
  return 11;
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
      v9 = "-[SMEmergencyContactsNotifiedSyncMessage encodeWithCoder:]";
      v10 = 1024;
      v11 = 124;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }

  }
  v7.receiver = self;
  v7.super_class = (Class)SMEmergencyContactsNotifiedSyncMessage;
  -[SMMessage encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMEmergencyContactsNotifiedSyncMessage triggerCategory](self, "triggerCategory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("triggerCategory"));

}

- (SMEmergencyContactsNotifiedSyncMessage)initWithCoder:(id)a3
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
  SMEmergencyContactsNotifiedSyncMessage *v14;
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
        v37 = 138412546;
        v38 = v29;
        v39 = 2112;
        v40 = v30;
        _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v37, 0x16u);

      }
      v14 = 0;
      goto LABEL_30;
    }
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageID"));
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
        _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v37, 0x16u);

      }
      v14 = 0;
      goto LABEL_29;
    }
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triggerCategory"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = v12;
        self = -[SMEmergencyContactsNotifiedSyncMessage initWithDate:messageID:sessionID:triggerCategory:](self, "initWithDate:messageID:sessionID:triggerCategory:", v9, v10, v11, (int)-[NSObject intValue](v12, "intValue"));
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
        _os_log_error_impl(&dword_245521000, v26, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing triggerCategory", (uint8_t *)&v37, 0x16u);

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

- (unint64_t)triggerCategory
{
  return self->_triggerCategory;
}

@end
