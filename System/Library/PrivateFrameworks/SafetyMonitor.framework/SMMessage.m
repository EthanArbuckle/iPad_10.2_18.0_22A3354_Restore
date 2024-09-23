@implementation SMMessage

- (SMMessage)initWithSessionID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  SMMessage *v8;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SMMessage initWithDate:messageID:sessionID:](self, "initWithDate:messageID:sessionID:", v6, v7, v5);

  return v8;
}

- (SMMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  SMMessage *v13;
  id *p_isa;
  SMMessage *v15;
  NSObject *v16;
  const char *v17;
  objc_super v19;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
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
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: messageID";
    goto LABEL_13;
  }
  if (!v11)
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
  v19.super_class = (Class)SMMessage;
  v13 = -[SMMessage init](&v19, sel_init);
  p_isa = (id *)&v13->super.isa;
  if (v13)
  {
    v13->_interfaceVersion = 1;
    objc_storeStrong((id *)&v13->_date, a3);
    objc_storeStrong(p_isa + 3, a4);
    objc_storeStrong(p_isa + 4, a5);
  }
  self = p_isa;
  v15 = self;
LABEL_15:

  return v15;
}

- (SMMessage)initWithDictionary:(id)a3
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
  SMMessage *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  objc_class *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  objc_class *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v40) = 0;
      _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", (uint8_t *)&v40, 2u);
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
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 138413058;
    v41 = v23;
    v42 = 2112;
    v43 = v24;
    v44 = 1024;
    v45 = objc_msgSend((id)objc_opt_class(), "messageType");
    v46 = 1024;
    v47 = v8;
    v25 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v26 = v12;
    v27 = 34;
LABEL_27:
    _os_log_error_impl(&dword_245521000, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v40, v27);

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
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138412546;
        v41 = v35;
        v42 = 2112;
        v43 = v36;
        _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v40, 0x16u);

      }
      v21 = 0;
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
        self = -[SMMessage initWithDate:messageID:sessionID:](self, "initWithDate:messageID:sessionID:", v14, v17, v20);
        v21 = self;
LABEL_24:

LABEL_25:
        goto LABEL_14;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138412546;
        v41 = v38;
        v42 = 2112;
        v43 = v39;
        _os_log_error_impl(&dword_245521000, v32, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v40, 0x16u);

      }
      v20 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138412546;
        v41 = v30;
        v42 = 2112;
        v43 = v31;
        _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v40, 0x16u);

      }
    }
    v21 = 0;
    goto LABEL_24;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 138412802;
    v41 = v23;
    v42 = 2112;
    v43 = v24;
    v44 = 1024;
    v45 = v10;
    v25 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v26 = v12;
    v27 = 28;
    goto LABEL_27;
  }
LABEL_13:
  v21 = 0;
LABEL_14:

  return v21;
}

- (id)outputToDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "messageType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("messageType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMMessage interfaceVersion](self, "interfaceVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("interfaceVersion"));

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[SMMessage date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("sendDate"));

  -[SMMessage messageID](self, "messageID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("messageID"));

  -[SMMessage sessionID](self, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("sessionID"));

  return v3;
}

- (SMMessage)initWithURL:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  NSObject *v29;
  int v30;
  NSObject *v31;
  void *v32;
  int v33;
  int v34;
  void *v35;
  NSObject *v36;
  SMMessage *v37;
  objc_class *v39;
  void *v40;
  void *v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  objc_class *v45;
  void *v46;
  void *v47;
  objc_class *v48;
  int v49;
  objc_class *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  objc_class *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  id v65;
  NSObject *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  int v81;
  __int16 v82;
  int v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }
    v37 = 0;
    goto LABEL_49;
  }
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
  v5 = v4;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v77 = v46;
      v78 = 2112;
      v79 = v47;
      _os_log_error_impl(&dword_245521000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing url components", buf, 0x16u);

    }
    v37 = 0;
    goto LABEL_48;
  }
  -[NSObject queryItems](v4, "queryItems");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v77 = v51;
      v78 = 2112;
      v79 = v52;
      _os_log_error_impl(&dword_245521000, v29, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing queryItems", buf, 0x16u);

    }
    v37 = 0;
    goto LABEL_47;
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v8 = (void *)-[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
  if (!v8)
  {
    v30 = objc_msgSend(0, "intValue");
    v29 = 0;
    v31 = 0;
    v9 = 0;
    v32 = 0;
    goto LABEL_44;
  }
  v64 = v5;
  v65 = v3;
  v70 = 0;
  v71 = 0;
  v9 = 0;
  v68 = 0;
  v69 = 0;
  v10 = *(_QWORD *)v73;
  do
  {
    v11 = v7;
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v73 != v10)
        objc_enumerationMutation(v11);
      v13 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v13, "value", v64, v65);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v13, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("sendDate"));

        if (v16)
        {
          v17 = v9;
          v9 = v14;
        }
        else
        {
          objc_msgSend(v13, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("messageID"));

          if (v22)
          {
            v17 = v71;
            v71 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v14);
          }
          else
          {
            objc_msgSend(v13, "name");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("sessionID"));

            if (v24)
            {
              v17 = v70;
              v70 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v14);
            }
            else
            {
              objc_msgSend(v13, "name");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("messageType"));

              if (v26)
              {
                v17 = v69;
                v69 = v14;
              }
              else
              {
                objc_msgSend(v13, "name");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("interfaceVersion"));

                if (!v28)
                  goto LABEL_23;
                v17 = v68;
                v68 = v14;
              }
            }
          }
        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v77 = v19;
          v78 = 2112;
          v79 = v20;
          _os_log_error_impl(&dword_245521000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,queryItem missing value", buf, 0x16u);

        }
      }

LABEL_23:
    }
    v7 = v11;
    v8 = (void *)-[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
  }
  while (v8);
  v29 = v69;
  v30 = -[NSObject intValue](v69, "intValue");
  if (!v69)
  {
    v5 = v64;
    v3 = v65;
    v31 = v68;
    v8 = (void *)v70;
    v32 = (void *)v71;
    goto LABEL_44;
  }
  v5 = v64;
  v3 = v65;
  v31 = v68;
  v8 = (void *)v70;
  v32 = (void *)v71;
  if (objc_msgSend((id)objc_opt_class(), "messageType") != v30)
  {
LABEL_44:
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    v70 = (uint64_t)v8;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v71 = (uint64_t)v32;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend((id)objc_opt_class(), "messageType");
    *(_DWORD *)buf = 138413058;
    v77 = v40;
    v78 = 2112;
    v79 = v41;
    v80 = 1024;
    v81 = v49;
    v82 = 1024;
    v83 = v30;
    v42 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v43 = v36;
    v44 = 34;
LABEL_53:
    _os_log_error_impl(&dword_245521000, v43, OS_LOG_TYPE_ERROR, v42, buf, v44);

    v32 = (void *)v71;
    v8 = (void *)v70;
    goto LABEL_45;
  }
  v33 = -[NSObject intValue](v68, "intValue");
  v34 = v33;
  if (!v68 || v33 != 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v77 = v40;
    v78 = 2112;
    v79 = v41;
    v80 = 1024;
    v81 = v34;
    v42 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v43 = v36;
    v44 = 28;
    goto LABEL_53;
  }
  if (v9)
  {
    v35 = (void *)MEMORY[0x24BDBCE60];
    -[NSObject doubleValue](v9, "doubleValue");
    objc_msgSend(v35, "dateWithTimeIntervalSince1970:");
    v36 = objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      if (v70)
      {
        v37 = -[SMMessage initWithDate:messageID:sessionID:](self, "initWithDate:messageID:sessionID:", v36, v71, v70);
        self = v37;
        goto LABEL_46;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v61 = (objc_class *)objc_opt_class();
        NSStringFromClass(v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v77 = v62;
        v78 = 2112;
        v79 = v63;
        _os_log_error_impl(&dword_245521000, v54, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);

        v32 = (void *)v71;
      }

      v8 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v58 = (objc_class *)objc_opt_class();
        NSStringFromClass(v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v77 = v59;
        v78 = 2112;
        v79 = v60;
        _os_log_error_impl(&dword_245521000, v53, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);

        v8 = (void *)v70;
      }

      v32 = 0;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v77 = v56;
      v78 = 2112;
      v79 = v57;
      _os_log_error_impl(&dword_245521000, v36, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);

      v8 = (void *)v70;
    }
    v9 = 0;
  }
LABEL_45:
  v37 = 0;
LABEL_46:

LABEL_47:
LABEL_48:

LABEL_49:
  return v37;
}

- (id)outputToURLComponents
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = objc_alloc_init(MEMORY[0x24BDD1808]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "messageType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("messageType"), v7);
  objc_msgSend(v4, "addObject:", v8);

  v9 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMMessage interfaceVersion](self, "interfaceVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("interfaceVersion"), v11);
  objc_msgSend(v4, "addObject:", v12);

  v13 = (void *)MEMORY[0x24BDD16E0];
  -[SMMessage date](self, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  objc_msgSend(v13, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("sendDate"), v16);
  objc_msgSend(v4, "addObject:", v17);

  v18 = objc_alloc(MEMORY[0x24BDD1838]);
  -[SMMessage messageID](self, "messageID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("messageID"), v20);
  objc_msgSend(v4, "addObject:", v21);

  v22 = objc_alloc(MEMORY[0x24BDD1838]);
  -[SMMessage sessionID](self, "sessionID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v22, "initWithName:value:", CFSTR("sessionID"), v24);
  objc_msgSend(v4, "addObject:", v25);

  objc_msgSend(v3, "setQueryItems:", v4);
  return v3;
}

+ (id)createMessageFromDict:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  __objc2_class *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  objc_class *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  objc_class *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  objc_class *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  objc_class *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  objc_class *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  objc_class *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  objc_class *v82;
  void *v83;
  void *v84;
  objc_class *v86;
  int v87;
  void *v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    switch(objc_msgSend((id)objc_opt_class(), "messageTypeFromDict:", v4))
    {
      case 0:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          goto LABEL_40;
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = 138412546;
        v88 = v7;
        v89 = 2112;
        v90 = v8;
        v9 = "#SafetyCache,%@,%@,SMMessageTypeUnknown";
        goto LABEL_68;
      case 1:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v14;
          v89 = 2112;
          v90 = v15;
          _os_log_impl(&dword_245521000, v12, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionStart", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMSessionStartMessage;
        goto LABEL_65;
      case 2:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          v50 = (objc_class *)objc_opt_class();
          NSStringFromClass(v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v51;
          v89 = 2112;
          v90 = v52;
          _os_log_impl(&dword_245521000, v49, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionEnd", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMSessionEndMessage;
        goto LABEL_65;
      case 3:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v19;
          v89 = 2112;
          v90 = v20;
          _os_log_impl(&dword_245521000, v17, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeKeyRelease", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMKeyReleaseMessage;
        goto LABEL_65;
      case 6:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v23;
          v89 = 2112;
          v90 = v24;
          _os_log_impl(&dword_245521000, v21, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeCacheUpdated", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMCacheUpdatedMessage;
        goto LABEL_65;
      case 7:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v27;
          v89 = 2112;
          v90 = v28;
          _os_log_impl(&dword_245521000, v25, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSync", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMSessionStateSyncMessage;
        goto LABEL_65;
      case 8:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          v54 = (objc_class *)objc_opt_class();
          NSStringFromClass(v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v55;
          v89 = 2112;
          v90 = v56;
          _os_log_impl(&dword_245521000, v53, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeHandoff", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMSessionHandoffMessage;
        goto LABEL_65;
      case 9:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          v58 = (objc_class *)objc_opt_class();
          NSStringFromClass(v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v59;
          v89 = 2112;
          v90 = v60;
          _os_log_impl(&dword_245521000, v57, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeHandoffAck", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMSessionHandoffAckMessage;
        goto LABEL_65;
      case 10:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          v62 = (objc_class *)objc_opt_class();
          NSStringFromClass(v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v63;
          v89 = 2112;
          v90 = v64;
          _os_log_impl(&dword_245521000, v61, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMEstimatedEndTimeUpdateMessage", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMEstimatedEndTimeUpdateMessage;
        goto LABEL_65;
      case 11:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          v66 = (objc_class *)objc_opt_class();
          NSStringFromClass(v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v67;
          v89 = 2112;
          v90 = v68;
          _os_log_impl(&dword_245521000, v65, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMEmergencyContactsNotifiedSyncMessage", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMEmergencyContactsNotifiedSyncMessage;
        goto LABEL_65;
      case 12:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v31;
          v89 = 2112;
          v90 = v32;
          _os_log_impl(&dword_245521000, v29, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionStartInfoRequest", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMSessionStartInfoRequestMessage;
        goto LABEL_65;
      case 13:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v35;
          v89 = 2112;
          v90 = v36;
          _os_log_impl(&dword_245521000, v33, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionStartInfo", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMSessionStartInfoMessage;
        goto LABEL_65;
      case 14:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v39;
          v89 = 2112;
          v90 = v40;
          _os_log_impl(&dword_245521000, v37, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeKeyReleaseInfoRequest", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMKeyReleaseInfoRequestMessage;
        goto LABEL_65;
      case 15:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = (objc_class *)objc_opt_class();
          NSStringFromClass(v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v43;
          v89 = 2112;
          v90 = v44;
          _os_log_impl(&dword_245521000, v41, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeKeyReleaseInfo", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMKeyReleaseInfoMessage;
        goto LABEL_65;
      case 16:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          v70 = (objc_class *)objc_opt_class();
          NSStringFromClass(v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v71;
          v89 = 2112;
          v90 = v72;
          _os_log_impl(&dword_245521000, v69, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeStateUpdateReq", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMSessionStateUpdateReqMessage;
        goto LABEL_65;
      case 17:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          v74 = (objc_class *)objc_opt_class();
          NSStringFromClass(v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v75;
          v89 = 2112;
          v90 = v76;
          _os_log_impl(&dword_245521000, v73, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionEndRemoteControl", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMSessionEndRemoteControlMessage;
        goto LABEL_65;
      case 18:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          v78 = (objc_class *)objc_opt_class();
          NSStringFromClass(v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v79;
          v89 = 2112;
          v90 = v80;
          _os_log_impl(&dword_245521000, v77, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMSessionModifyConfigRemoteControlMessage", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMSessionModifyConfigRemoteControlMessage;
        goto LABEL_65;
      case 19:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
        {
          v82 = (objc_class *)objc_opt_class();
          NSStringFromClass(v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v83;
          v89 = 2112;
          v90 = v84;
          _os_log_impl(&dword_245521000, v81, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMResponseToTriggerPromptRemoteControlMessage", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMResponseToTriggerPromptRemoteControlMessage;
        goto LABEL_65;
      case 20:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = (objc_class *)objc_opt_class();
          NSStringFromClass(v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v47;
          v89 = 2112;
          v90 = v48;
          _os_log_impl(&dword_245521000, v45, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMLowPowerModeWarningStateUpdateMessage", (uint8_t *)&v87, 0x16u);

        }
        v16 = SMLowPowerModeWarningStateUpdateMessage;
LABEL_65:
        v11 = (void *)objc_msgSend([v16 alloc], "initWithDictionary:", v4);
        goto LABEL_66;
      default:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v86 = (objc_class *)objc_opt_class();
          NSStringFromClass(v86);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 138412546;
          v88 = v7;
          v89 = 2112;
          v90 = v8;
          v9 = "#SafetyCache,%@,%@,unknown message type";
LABEL_68:
          _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v87, 0x16u);

        }
LABEL_40:

        goto LABEL_8;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v87) = 0;
    _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", (uint8_t *)&v87, 2u);
  }

LABEL_8:
  v11 = 0;
LABEL_66:

  return v11;
}

+ (id)createMessageFromURL:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  __objc2_class *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  objc_class *v42;
  int v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    switch(objc_msgSend((id)objc_opt_class(), "messageTypeFromURL:", v4))
    {
      case 0:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          goto LABEL_18;
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 138412546;
        v44 = v7;
        v45 = 2112;
        v46 = v8;
        v9 = "#SafetyCache,%@,%@,SMMessageTypeUnknown";
        goto LABEL_35;
      case 1:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 138412546;
          v44 = v13;
          v45 = 2112;
          v46 = v14;
          _os_log_impl(&dword_245521000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionStart", (uint8_t *)&v43, 0x16u);

        }
        v15 = SMSessionStartMessage;
        goto LABEL_32;
      case 2:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 138412546;
          v44 = v18;
          v45 = 2112;
          v46 = v19;
          _os_log_impl(&dword_245521000, v16, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionEnd", (uint8_t *)&v43, 0x16u);

        }
        v15 = SMSessionEndMessage;
        goto LABEL_32;
      case 3:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 138412546;
          v44 = v22;
          v45 = 2112;
          v46 = v23;
          _os_log_impl(&dword_245521000, v20, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeKeyRelease", (uint8_t *)&v43, 0x16u);

        }
        v15 = SMKeyReleaseMessage;
        goto LABEL_32;
      case 6:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 138412546;
          v44 = v27;
          v45 = 2112;
          v46 = v28;
          _os_log_impl(&dword_245521000, v25, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeCacheUpdated", (uint8_t *)&v43, 0x16u);

        }
        v15 = SMCacheUpdatedMessage;
        goto LABEL_32;
      case 13:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 138412546;
          v44 = v31;
          v45 = 2112;
          v46 = v32;
          _os_log_impl(&dword_245521000, v29, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionStartInfo", (uint8_t *)&v43, 0x16u);

        }
        v15 = SMSessionStartInfoMessage;
        goto LABEL_32;
      case 14:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 138412546;
          v44 = v35;
          v45 = 2112;
          v46 = v36;
          _os_log_impl(&dword_245521000, v33, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeKeyReleaseInfoRequest", (uint8_t *)&v43, 0x16u);

        }
        v15 = SMKeyReleaseInfoRequestMessage;
        goto LABEL_32;
      case 15:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 138412546;
          v44 = v39;
          v45 = 2112;
          v46 = v40;
          _os_log_impl(&dword_245521000, v37, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeKeyReleaseInfo", (uint8_t *)&v43, 0x16u);

        }
        v15 = SMKeyReleaseInfoMessage;
LABEL_32:
        v24 = (void *)objc_msgSend([v15 alloc], "initWithURL:", v4);
        goto LABEL_33;
      default:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v42 = (objc_class *)objc_opt_class();
          NSStringFromClass(v42);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 138412546;
          v44 = v7;
          v45 = 2112;
          v46 = v8;
          v9 = "#SafetyCache,%@,%@,unknown message type";
LABEL_35:
          _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v43, 0x16u);

        }
LABEL_18:

        goto LABEL_19;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v43) = 0;
    _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", (uint8_t *)&v43, 2u);
  }

LABEL_19:
  v24 = 0;
LABEL_33:

  return v24;
}

+ (unint64_t)interfaceTypeFromMessageType:(unint64_t)a3
{
  if (a3 - 1 > 0x13)
    return 0;
  else
    return qword_245595578[a3 - 1];
}

+ (unint64_t)messageTypeFromDict:(id)a3
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  uint8_t v7[16];

  if (a3)
  {
    objc_msgSend(a3, "valueForKey:", CFSTR("messageType"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (int)objc_msgSend(v3, "intValue");

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", v7, 2u);
    }

    return 0;
  }
  return v4;
}

+ (unint64_t)messageTypeFromURL:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[16];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
    -[NSObject queryItems](v4, "queryItems");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "name", (_QWORD)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("messageType"));

          if (v12)
          {
            objc_msgSend(v10, "value");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (int)objc_msgSend(v14, "intValue");

            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v7)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_12:

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)messageIDFromDict:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v3, "valueForKey:", CFSTR("messageID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_245521000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)messageIDFromURL:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[16];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
    -[NSObject queryItems](v4, "queryItems");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "name", (_QWORD)v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("messageID"));

          if (v12)
          {
            v14 = objc_alloc(MEMORY[0x24BDD1880]);
            objc_msgSend(v10, "value");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);

            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v7)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_12:

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)sessionIDFromDict:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v3, "valueForKey:", CFSTR("sessionID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_245521000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)sessionIDFromURL:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[16];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
    -[NSObject queryItems](v4, "queryItems");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "name", (_QWORD)v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("sessionID"));

          if (v12)
          {
            v14 = objc_alloc(MEMORY[0x24BDD1880]);
            objc_msgSend(v10, "value");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);

            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v7)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_12:

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }
    v13 = 0;
  }

  return v13;
}

+ (unint64_t)messageType
{
  return 0;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SMMessage outputToDictionary](self, "outputToDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)summaryText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CHECK_IN_MESSAGE"), CFSTR("Check In"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
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
  void *v8;
  int v9;
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
      v9 = 136315394;
      v10 = "-[SMMessage encodeWithCoder:]";
      v11 = 1024;
      v12 = 559;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }

  }
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend((id)objc_opt_class(), "messageType"), CFSTR("messageType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMMessage interfaceVersion](self, "interfaceVersion"), CFSTR("interfaceVersion"));
  -[SMMessage date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sendDate"));

  -[SMMessage messageID](self, "messageID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("messageID"));

  -[SMMessage sessionID](self, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("sessionID"));

}

- (SMMessage)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  SMMessage *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  int v20;
  objc_class *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v33) = 0;
      _os_log_error_impl(&dword_245521000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", (uint8_t *)&v33, 2u);
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
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138413058;
    v34 = v15;
    v35 = 2112;
    v36 = v16;
    v37 = 1024;
    v38 = objc_msgSend((id)objc_opt_class(), "messageType");
    v39 = 1024;
    v40 = v7;
    v17 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v18 = v9;
    v19 = 34;
LABEL_27:
    _os_log_error_impl(&dword_245521000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v33, v19);

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
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138412546;
        v34 = v28;
        v35 = 2112;
        v36 = v29;
        _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v33, 0x16u);

      }
      v13 = 0;
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
        self = -[SMMessage initWithDate:messageID:sessionID:](self, "initWithDate:messageID:sessionID:", v9, v10, v11);
        v13 = self;
LABEL_24:

LABEL_25:
        goto LABEL_14;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138412546;
        v34 = v31;
        v35 = 2112;
        v36 = v32;
        _os_log_error_impl(&dword_245521000, v25, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v33, 0x16u);

      }
      v12 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138412546;
        v34 = v23;
        v35 = 2112;
        v36 = v24;
        _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v33, 0x16u);

      }
    }
    v13 = 0;
    goto LABEL_24;
  }
  v20 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138412802;
    v34 = v15;
    v35 = 2112;
    v36 = v16;
    v37 = 1024;
    v38 = v20;
    v17 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v18 = v9;
    v19 = 28;
    goto LABEL_27;
  }
LABEL_13:
  v13 = 0;
LABEL_14:

  return v13;
}

- (int64_t)interfaceVersion
{
  return self->_interfaceVersion;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)messageID
{
  return self->_messageID;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
