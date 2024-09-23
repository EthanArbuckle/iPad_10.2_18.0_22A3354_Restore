@implementation SMEstimatedEndTimeUpdateMessage

- (SMEstimatedEndTimeUpdateMessage)initWithSessionID:(id)a3 estimatedEndTime:(id)a4 coarseEstimatedEndTime:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  SMEstimatedEndTimeUpdateMessage *v14;

  v8 = (void *)MEMORY[0x24BDBCE60];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SMEstimatedEndTimeUpdateMessage initWithDate:messageID:sessionID:estimatedEndTime:coarseEstimatedEndTime:](self, "initWithDate:messageID:sessionID:estimatedEndTime:coarseEstimatedEndTime:", v12, v13, v11, v10, v9);

  return v14;
}

- (SMEstimatedEndTimeUpdateMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 estimatedEndTime:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SMEstimatedEndTimeUpdateMessage *v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  __int16 v20;
  __int16 v21;
  __int16 v22;
  __int16 v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v23 = 0;
    v17 = "Invalid parameter not satisfying: date";
    v18 = (uint8_t *)&v23;
LABEL_14:
    _os_log_error_impl(&dword_245521000, v16, OS_LOG_TYPE_ERROR, v17, v18, 2u);
    goto LABEL_15;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v22 = 0;
    v17 = "Invalid parameter not satisfying: messageID";
    v18 = (uint8_t *)&v22;
    goto LABEL_14;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v21 = 0;
    v17 = "Invalid parameter not satisfying: sessionID";
    v18 = (uint8_t *)&v21;
    goto LABEL_14;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = 0;
      v17 = "Invalid parameter not satisfying: estimatedEndTime";
      v18 = (uint8_t *)&v20;
      goto LABEL_14;
    }
LABEL_15:

    v15 = 0;
    goto LABEL_16;
  }
  self = -[SMEstimatedEndTimeUpdateMessage initWithDate:messageID:sessionID:estimatedEndTime:coarseEstimatedEndTime:](self, "initWithDate:messageID:sessionID:estimatedEndTime:coarseEstimatedEndTime:", v10, v11, v12, v13, v13);
  v15 = self;
LABEL_16:

  return v15;
}

- (SMEstimatedEndTimeUpdateMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 estimatedEndTime:(id)a6 coarseEstimatedEndTime:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SMEstimatedEndTimeUpdateMessage *v17;
  id *p_isa;
  SMEstimatedEndTimeUpdateMessage *v19;
  NSObject *v20;
  const char *v21;
  objc_super v23;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: date";
LABEL_16:
    _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_17;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: messageID";
    goto LABEL_16;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: sessionID";
    goto LABEL_16;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "Invalid parameter not satisfying: estimatedEndTime";
      goto LABEL_16;
    }
LABEL_17:

    v19 = 0;
    goto LABEL_18;
  }
  v23.receiver = self;
  v23.super_class = (Class)SMEstimatedEndTimeUpdateMessage;
  v17 = -[SMMessage initWithDate:messageID:sessionID:](&v23, sel_initWithDate_messageID_sessionID_, v12, v13, v14);
  p_isa = (id *)&v17->super.super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_estimatedEndTime, a6);
    objc_storeStrong(p_isa + 6, a7);
  }
  self = p_isa;
  v19 = self;
LABEL_18:

  return v19;
}

- (SMEstimatedEndTimeUpdateMessage)initWithDictionary:(id)a3
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  SMEstimatedEndTimeUpdateMessage *v34;
  NSObject *v36;
  objc_class *v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  objc_class *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
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
    goto LABEL_15;
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
LABEL_15:
      v34 = 0;
      goto LABEL_16;
    }
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v57 = v29;
    v58 = 2112;
    v59 = v30;
    v60 = 1024;
    v61 = objc_msgSend((id)objc_opt_class(), "messageType");
    v62 = 1024;
    v63 = v8;
    v31 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v32 = v12;
    v33 = 34;
LABEL_30:
    _os_log_error_impl(&dword_245521000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);

    goto LABEL_15;
  }
  objc_msgSend(v6, "valueForKey:", CFSTR("interfaceVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if (v10 != 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v57 = v29;
    v58 = 2112;
    v59 = v30;
    v60 = 1024;
    v61 = v10;
    v31 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v32 = v12;
    v33 = 28;
    goto LABEL_30;
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
        objc_msgSend(v6, "valueForKey:", CFSTR("estimatedEndTime"));
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          v23 = (void *)MEMORY[0x24BDBCE60];
          -[NSObject doubleValue](v21, "doubleValue");
          objc_msgSend(v23, "dateWithTimeIntervalSince1970:");
          v55 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "valueForKey:", CFSTR("coarseEstimatedEndTime"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            v26 = (void *)MEMORY[0x24BDBCE60];
            objc_msgSend(v24, "doubleValue");
            objc_msgSend(v26, "dateWithTimeIntervalSince1970:");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              v52 = (objc_class *)objc_opt_class();
              NSStringFromClass(v52);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v57 = v54;
              v58 = 2112;
              v59 = v53;
              _os_log_error_impl(&dword_245521000, v38, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing coarseEstimatedEndTime", buf, 0x16u);

            }
            v27 = 0;
          }
          v36 = v55;
          self = -[SMEstimatedEndTimeUpdateMessage initWithDate:messageID:sessionID:estimatedEndTime:coarseEstimatedEndTime:](self, "initWithDate:messageID:sessionID:estimatedEndTime:coarseEstimatedEndTime:", v14, v17, v20, v55, v27, v54);

          v34 = self;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v48 = (objc_class *)objc_opt_class();
            NSStringFromClass(v48);
            v49 = v36;
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v57 = v50;
            v58 = 2112;
            v59 = v51;
            _os_log_error_impl(&dword_245521000, v49, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing estimatedEndTime", buf, 0x16u);

            v36 = v49;
          }
          v34 = 0;
        }

      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v45 = (objc_class *)objc_opt_class();
          NSStringFromClass(v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v57 = v46;
          v58 = 2112;
          v59 = v47;
          _os_log_error_impl(&dword_245521000, v22, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);

        }
        v34 = 0;
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v57 = v43;
        v58 = 2112;
        v59 = v44;
        _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);

      }
      v34 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v57 = v40;
      v58 = 2112;
      v59 = v41;
      _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);

    }
    v34 = 0;
  }

LABEL_16:
  return v34;
}

- (id)outputToDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SMEstimatedEndTimeUpdateMessage;
  -[SMMessage outputToDictionary](&v12, sel_outputToDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[SMEstimatedEndTimeUpdateMessage estimatedEndTime](self, "estimatedEndTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("estimatedEndTime"));

  -[SMEstimatedEndTimeUpdateMessage coarseEstimatedEndTime](self, "coarseEstimatedEndTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    -[SMEstimatedEndTimeUpdateMessage coarseEstimatedEndTime](self, "coarseEstimatedEndTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("coarseEstimatedEndTime"));

  }
  return v3;
}

+ (unint64_t)messageType
{
  return 10;
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
      v10 = "-[SMEstimatedEndTimeUpdateMessage encodeWithCoder:]";
      v11 = 1024;
      v12 = 156;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)SMEstimatedEndTimeUpdateMessage;
  -[SMMessage encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[SMEstimatedEndTimeUpdateMessage estimatedEndTime](self, "estimatedEndTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("estimatedEndTime"));

  -[SMEstimatedEndTimeUpdateMessage coarseEstimatedEndTime](self, "coarseEstimatedEndTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("coarseEstimatedEndTime"));

}

- (SMEstimatedEndTimeUpdateMessage)initWithCoder:(id)a3
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
  void *v14;
  SMEstimatedEndTimeUpdateMessage *v15;
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
    v19 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v20 = v9;
    v21 = 34;
LABEL_32:
    _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v38, v21);

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
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138412546;
        v39 = v30;
        v40 = 2112;
        v41 = v31;
        _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v38, 0x16u);

      }
      v15 = 0;
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
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138412546;
        v39 = v33;
        v40 = 2112;
        v41 = v34;
        _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v38, 0x16u);

      }
      v15 = 0;
      goto LABEL_29;
    }
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("estimatedEndTime"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = v12;
        objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coarseEstimatedEndTime"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[SMEstimatedEndTimeUpdateMessage initWithDate:messageID:sessionID:estimatedEndTime:coarseEstimatedEndTime:](self, "initWithDate:messageID:sessionID:estimatedEndTime:coarseEstimatedEndTime:", v9, v10, v11, v13, v14);

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
        _os_log_error_impl(&dword_245521000, v27, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing estimatedEndTime", (uint8_t *)&v38, 0x16u);

      }
      v13 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
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
        _os_log_error_impl(&dword_245521000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v38, 0x16u);

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
    v19 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v20 = v9;
    v21 = 28;
    goto LABEL_32;
  }
LABEL_14:
  v15 = 0;
LABEL_15:

  return v15;
}

- (NSDate)estimatedEndTime
{
  return self->_estimatedEndTime;
}

- (NSDate)coarseEstimatedEndTime
{
  return self->_coarseEstimatedEndTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coarseEstimatedEndTime, 0);
  objc_storeStrong((id *)&self->_estimatedEndTime, 0);
}

@end
