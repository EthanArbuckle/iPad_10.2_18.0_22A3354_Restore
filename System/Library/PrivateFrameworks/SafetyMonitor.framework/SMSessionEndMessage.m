@implementation SMSessionEndMessage

- (SMSessionEndMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 sessionEndReason:(unint64_t)a6
{
  return -[SMSessionEndMessage initWithDate:messageID:sessionID:sessionEndReason:sessionType:destinationType:destinationMapItem:](self, "initWithDate:messageID:sessionID:sessionEndReason:sessionType:destinationType:destinationMapItem:", a3, a4, a5, a6, 0, 0, 0);
}

- (SMSessionEndMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 sessionEndReason:(unint64_t)a6 sessionType:(unint64_t)a7 destinationType:(unint64_t)a8
{
  return -[SMSessionEndMessage initWithDate:messageID:sessionID:sessionEndReason:sessionType:destinationType:destinationMapItem:](self, "initWithDate:messageID:sessionID:sessionEndReason:sessionType:destinationType:destinationMapItem:", a3, a4, a5, a6, 0, 0, 0);
}

- (SMSessionEndMessage)initWithSessionID:(id)a3 sessionEndReason:(unint64_t)a4 sessionType:(unint64_t)a5 destinationType:(unint64_t)a6 destinationMapItem:(id)a7
{
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  SMSessionEndMessage *v17;

  v12 = (void *)MEMORY[0x24BDBCE60];
  v13 = a7;
  v14 = a3;
  objc_msgSend(v12, "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SMSessionEndMessage initWithDate:messageID:sessionID:sessionEndReason:sessionType:destinationType:destinationMapItem:](self, "initWithDate:messageID:sessionID:sessionEndReason:sessionType:destinationType:destinationMapItem:", v15, v16, v14, a4, a5, a6, v13);

  return v17;
}

- (SMSessionEndMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 sessionEndReason:(unint64_t)a6 sessionType:(unint64_t)a7 destinationType:(unint64_t)a8 destinationMapItem:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  SMSessionEndMessage *v19;
  SMSessionEndMessage *v20;
  SMSessionEndMessage *v21;
  NSObject *v22;
  const char *v23;
  objc_super v25;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  if (!v15)
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
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: messageID";
    goto LABEL_13;
  }
  if (!v17)
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
  v25.super_class = (Class)SMSessionEndMessage;
  v19 = -[SMMessage initWithDate:messageID:sessionID:](&v25, sel_initWithDate_messageID_sessionID_, v15, v16, v17);
  v20 = v19;
  if (v19)
  {
    v19->_sessionEndReason = a6;
    v19->_sessionType = a7;
    v19->_destinationType = a8;
    objc_storeStrong((id *)&v19->_destinationMapItem, a9);
  }
  self = v20;
  v21 = self;
LABEL_15:

  return v21;
}

- (SMSessionEndMessage)initWithDictionary:(id)a3
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
  NSObject *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  SMSessionEndMessage *v36;
  NSObject *v38;
  objc_class *v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  objc_class *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  void *v53;
  objc_class *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  int v71;
  __int16 v72;
  int v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
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
    goto LABEL_17;
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
LABEL_17:
      v36 = 0;
      goto LABEL_18;
    }
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v67 = v31;
    v68 = 2112;
    v69 = v32;
    v70 = 1024;
    v71 = objc_msgSend((id)objc_opt_class(), "messageType");
    v72 = 1024;
    v73 = v8;
    v33 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v34 = v12;
    v35 = 34;
LABEL_32:
    _os_log_error_impl(&dword_245521000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);

    goto LABEL_17;
  }
  objc_msgSend(v6, "valueForKey:", CFSTR("interfaceVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if (v10 != 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v67 = v31;
    v68 = 2112;
    v69 = v32;
    v70 = 1024;
    v71 = v10;
    v33 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v34 = v12;
    v35 = 28;
    goto LABEL_32;
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
        objc_msgSend(v6, "valueForKey:", CFSTR("sessionEndReason"));
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          v23 = -[NSObject intValue](v21, "intValue");
          objc_msgSend(v6, "valueForKey:", CFSTR("sessionType"));
          v24 = objc_claimAutoreleasedReturnValue();
          v65 = v24;
          if (v24)
          {
            v64 = v22;
            v25 = -[NSObject intValue](v24, "intValue");
            objc_msgSend(v6, "valueForKey:", CFSTR("sessionDestinationType"));
            v26 = objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              v27 = v26;
              v62 = v25;
              v63 = v23;
              v61 = (int)-[NSObject intValue](v26, "intValue");
              objc_msgSend(v6, "valueForKey:", CFSTR("sessionDestinationMapItem"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (v28)
                v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v28, 0);
              else
                v29 = 0;
              v22 = v64;
              self = -[SMSessionEndMessage initWithDate:messageID:sessionID:sessionEndReason:sessionType:destinationType:destinationMapItem:](self, "initWithDate:messageID:sessionID:sessionEndReason:sessionType:destinationType:destinationMapItem:", v14, v17, v20, v63, v62, v61, v29);

              v36 = self;
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                v58 = (objc_class *)objc_opt_class();
                NSStringFromClass(v58);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v67 = v59;
                v68 = 2112;
                v69 = v60;
                _os_log_error_impl(&dword_245521000, v40, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing destinationType", buf, 0x16u);

              }
              v27 = 0;
              v36 = 0;
              v22 = v64;
            }
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v54 = (objc_class *)objc_opt_class();
              NSStringFromClass(v54);
              v55 = v22;
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v67 = v56;
              v68 = 2112;
              v69 = v57;
              _os_log_error_impl(&dword_245521000, v27, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionType", buf, 0x16u);

              v22 = v55;
            }
            v36 = 0;
          }

          v38 = v65;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v51 = (objc_class *)objc_opt_class();
            NSStringFromClass(v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v67 = v52;
            v68 = 2112;
            v69 = v53;
            _os_log_error_impl(&dword_245521000, v38, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionEndReason", buf, 0x16u);

            v22 = 0;
          }
          v36 = 0;
        }

      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v47 = (objc_class *)objc_opt_class();
          NSStringFromClass(v47);
          v48 = v22;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v67 = v49;
          v68 = 2112;
          v69 = v50;
          _os_log_error_impl(&dword_245521000, v48, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);

          v22 = v48;
        }
        v36 = 0;
      }

    }
    else
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
        v67 = v45;
        v68 = 2112;
        v69 = v46;
        _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);

      }
      v36 = 0;
    }

  }
  else
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
      v67 = v42;
      v68 = 2112;
      v69 = v43;
      _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);

    }
    v36 = 0;
  }

LABEL_18:
  return v36;
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SMSessionEndMessage;
  -[SMMessage outputToDictionary](&v11, sel_outputToDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionEndMessage sessionEndReason](self, "sessionEndReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("sessionEndReason"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionEndMessage sessionType](self, "sessionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sessionType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionEndMessage destinationType](self, "destinationType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("sessionDestinationType"));

  -[SMSessionEndMessage destinationMapItem](self, "destinationMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SMSessionEndMessage destinationMapItem](self, "destinationMapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("sessionDestinationMapItem"));

  }
  return v3;
}

- (SMSessionEndMessage)initWithURL:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  NSObject *v36;
  int v37;
  int v38;
  int v39;
  void *v40;
  NSObject *v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  SMSessionEndMessage *v48;
  void *v49;
  objc_class *v51;
  void *v52;
  void *v53;
  const char *v54;
  NSObject *v55;
  uint32_t v56;
  objc_class *v57;
  void *v58;
  void *v59;
  objc_class *v60;
  int v61;
  objc_class *v62;
  void *v63;
  void *v64;
  objc_class *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  const char *v69;
  objc_class *v70;
  objc_class *v71;
  objc_class *v72;
  objc_class *v73;
  objc_class *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  id v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v85;
  uint64_t v86;
  NSObject *v87;
  os_log_t log;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  int v101;
  __int16 v102;
  int v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
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
    v48 = 0;
    goto LABEL_63;
  }
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
  v5 = v4;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v57 = (objc_class *)objc_opt_class();
      NSStringFromClass(v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v97 = v58;
      v98 = 2112;
      v99 = v59;
      _os_log_error_impl(&dword_245521000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing url components", buf, 0x16u);

    }
    v48 = 0;
    goto LABEL_62;
  }
  -[NSObject queryItems](v4, "queryItems");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v62 = (objc_class *)objc_opt_class();
      NSStringFromClass(v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v97 = v63;
      v98 = 2112;
      v99 = v64;
      _os_log_error_impl(&dword_245521000, v36, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing queryItems", buf, 0x16u);

    }
    v48 = 0;
    goto LABEL_61;
  }
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
  if (!v8)
  {
    v37 = objc_msgSend(0, "intValue");
    v36 = 0;
    v91 = 0;
    v47 = 0;
    v49 = 0;
    v82 = 0;
    v81 = 0;
    v80 = 0;
    v79 = 0;
    goto LABEL_58;
  }
  v77 = v5;
  v78 = v3;
  v79 = 0;
  v80 = 0;
  v81 = 0;
  v82 = 0;
  v89 = 0;
  v90 = 0;
  v91 = 0;
  v85 = 0;
  v87 = 0;
  v9 = *(_QWORD *)v93;
  do
  {
    v10 = v7;
    for (i = 0; i != v8; i = ((char *)i + 1))
    {
      if (*(_QWORD *)v93 != v9)
        objc_enumerationMutation(v10);
      v12 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v12, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v12, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("sendDate"));

        if (v15)
        {
          v16 = v91;
          v91 = v13;
        }
        else
        {
          objc_msgSend(v12, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("messageID"));

          if (v21)
          {
            v16 = v90;
            v90 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v13);
          }
          else
          {
            objc_msgSend(v12, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("sessionID"));

            if (v23)
            {
              v16 = v89;
              v89 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v13);
            }
            else
            {
              objc_msgSend(v12, "name");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("messageType"));

              if (v25)
              {
                v16 = v87;
                v87 = v13;
              }
              else
              {
                objc_msgSend(v12, "name");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("interfaceVersion"));

                if (v27)
                {
                  v16 = v85;
                  v85 = v13;
                }
                else
                {
                  objc_msgSend(v12, "name");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("sessionEndReason"));

                  if (v29)
                  {
                    v16 = v82;
                    v82 = v13;
                  }
                  else
                  {
                    objc_msgSend(v12, "name");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("sessionType"));

                    if (v31)
                    {
                      v16 = v81;
                      v81 = v13;
                    }
                    else
                    {
                      objc_msgSend(v12, "name");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("sessionDestinationType"));

                      if (v33)
                      {
                        v16 = v80;
                        v80 = v13;
                      }
                      else
                      {
                        objc_msgSend(v12, "name");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("sessionDestinationMapItem"));

                        if (!v35)
                          goto LABEL_31;
                        v16 = v79;
                        v79 = v13;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v97 = v18;
          v98 = 2112;
          v99 = v19;
          _os_log_error_impl(&dword_245521000, v16, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,queryItem missing value", buf, 0x16u);

        }
      }

LABEL_31:
    }
    v7 = v10;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
  }
  while (v8);
  v36 = v87;
  v37 = -[NSObject intValue](v87, "intValue");
  if (!v87)
  {
    v5 = v77;
    v3 = v78;
    v8 = v85;
    goto LABEL_57;
  }
  v5 = v77;
  v3 = v78;
  v8 = v85;
  if (objc_msgSend((id)objc_opt_class(), "messageType") != v37)
  {
LABEL_57:
    v49 = (void *)v89;
    v47 = (void *)v90;
LABEL_58:
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v60 = (objc_class *)objc_opt_class();
      NSStringFromClass(v60);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      log = v41;
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend((id)objc_opt_class(), "messageType");
      *(_DWORD *)buf = 138413058;
      v97 = v52;
      v98 = 2112;
      v99 = v53;
      v100 = 1024;
      v101 = v61;
      v102 = 1024;
      v103 = v37;
      v54 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
      v55 = log;
      v56 = 34;
      goto LABEL_67;
    }
LABEL_59:
    v48 = 0;
    goto LABEL_60;
  }
  v38 = -[NSObject intValue](v85, "intValue");
  v39 = v38;
  if (!v85 || v38 != 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v41 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)v89;
    v47 = (void *)v90;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      log = v41;
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v97 = v52;
      v98 = 2112;
      v99 = v53;
      v100 = 1024;
      v101 = v39;
      v54 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
      v55 = log;
      v56 = 28;
LABEL_67:
      _os_log_error_impl(&dword_245521000, v55, OS_LOG_TYPE_ERROR, v54, buf, v56);

      v41 = log;
      goto LABEL_59;
    }
    goto LABEL_59;
  }
  if (!v91)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v74 = (objc_class *)objc_opt_class();
      NSStringFromClass(v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v97 = v75;
      v98 = 2112;
      v99 = v76;
      _os_log_error_impl(&dword_245521000, v41, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);

    }
    v91 = 0;
    v48 = 0;
    v49 = (void *)v89;
    v47 = (void *)v90;
    goto LABEL_60;
  }
  v40 = (void *)MEMORY[0x24BDBCE60];
  -[NSObject doubleValue](v91, "doubleValue");
  objc_msgSend(v40, "dateWithTimeIntervalSince1970:");
  v41 = objc_claimAutoreleasedReturnValue();
  if (!v90)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v46 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      goto LABEL_82;
    v65 = (objc_class *)objc_opt_class();
    NSStringFromClass(v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v67 = v41;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v97 = v66;
    v98 = 2112;
    v99 = v68;
    v69 = "#SafetyCache,%@,%@,missing messageID";
LABEL_81:
    _os_log_error_impl(&dword_245521000, v46, OS_LOG_TYPE_ERROR, v69, buf, 0x16u);

    v41 = v67;
    goto LABEL_82;
  }
  if (!v89)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v46 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      goto LABEL_82;
    v70 = (objc_class *)objc_opt_class();
    NSStringFromClass(v70);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v67 = v41;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v97 = v66;
    v98 = 2112;
    v99 = v68;
    v69 = "#SafetyCache,%@,%@,missing sessionID";
    goto LABEL_81;
  }
  if (!v82)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v46 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      goto LABEL_82;
    v71 = (objc_class *)objc_opt_class();
    NSStringFromClass(v71);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v67 = v41;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v97 = v66;
    v98 = 2112;
    v99 = v68;
    v69 = "#SafetyCache,%@,%@,missing sessionEndReason";
    goto LABEL_81;
  }
  v42 = -[NSObject intValue](v82, "intValue");
  if (!v81)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v46 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      goto LABEL_82;
    v72 = (objc_class *)objc_opt_class();
    NSStringFromClass(v72);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v67 = v41;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v97 = v66;
    v98 = 2112;
    v99 = v68;
    v69 = "#SafetyCache,%@,%@,missing sessionType";
    goto LABEL_81;
  }
  v43 = -[NSObject intValue](v81, "intValue");
  if (!v80)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v73 = (objc_class *)objc_opt_class();
      NSStringFromClass(v73);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v67 = v41;
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v97 = v66;
      v98 = 2112;
      v99 = v68;
      v69 = "#SafetyCache,%@,%@,missing destinationType";
      goto LABEL_81;
    }
LABEL_82:
    v48 = 0;
    v49 = (void *)v89;
    v47 = (void *)v90;
    goto LABEL_83;
  }
  v86 = v42;
  v44 = v43;
  v45 = (int)-[NSObject intValue](v80, "intValue");
  v46 = v79;
  if (v79)
    v46 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v79, 0);
  v47 = (void *)v90;
  v48 = -[SMSessionEndMessage initWithDate:messageID:sessionID:sessionEndReason:sessionType:destinationType:destinationMapItem:](self, "initWithDate:messageID:sessionID:sessionEndReason:sessionType:destinationType:destinationMapItem:", v41, v90, v89, v86, v44, v45, v46);
  self = v48;
  v7 = v10;
  v49 = (void *)v89;
LABEL_83:

LABEL_60:
LABEL_61:

LABEL_62:
LABEL_63:

  return v48;
}

- (id)outputToURLComponents
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v3 = objc_alloc_init(MEMORY[0x24BDD1808]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25.receiver = self;
  v25.super_class = (Class)SMSessionEndMessage;
  -[SMMessage outputToURLComponents](&v25, sel_outputToURLComponents);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  v7 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionEndMessage sessionEndReason](self, "sessionEndReason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("sessionEndReason"), v9);
  objc_msgSend(v4, "addObject:", v10);

  v11 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionEndMessage sessionType](self, "sessionType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("sessionType"), v13);
  objc_msgSend(v4, "addObject:", v14);

  v15 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionEndMessage destinationType](self, "destinationType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("sessionDestinationType"), v17);
  objc_msgSend(v4, "addObject:", v18);

  -[SMSessionEndMessage destinationMapItem](self, "destinationMapItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_alloc(MEMORY[0x24BDD1838]);
    -[SMSessionEndMessage destinationMapItem](self, "destinationMapItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v20, "initWithName:value:", CFSTR("sessionDestinationMapItem"), v22);
    objc_msgSend(v4, "addObject:", v23);

  }
  objc_msgSend(v3, "setQueryItems:", v4);

  return v3;
}

+ (unint64_t)messageType
{
  return 2;
}

+ (unint64_t)sessionEndReasonFromDict:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "valueForKey:", CFSTR("sessionEndReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  return v4;
}

+ (unint64_t)sessionEndReasonFromURL:(id)a3
{
  id v3;
  void *v4;
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
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
    objc_msgSend(v4, "queryItems");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("sessionEndReason"));

          if (v12)
          {
            objc_msgSend(v10, "value");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (int)objc_msgSend(v14, "intValue");

            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
    v13 = 0;
  }

  return v13;
}

- (id)summaryText
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = -[SMSessionEndMessage sessionEndReason](self, "sessionEndReason");
  if (v3 == 8)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("END_MESSAGE_WORKOUT_ENDED_SUMMARY");
    v8 = CFSTR("Check In: Workout Ended");
  }
  else if (v3 == 1)
  {
    v4 = -[SMSessionEndMessage destinationType](self, "destinationType");
    switch(v4)
    {
      case 3uLL:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("END_MESSAGE_SAFE_ARRIVAL_SCHOOL_SUMMARY");
        v8 = CFSTR("Check In: Arrived at school");
        break;
      case 2uLL:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("END_MESSAGE_SAFE_ARRIVAL_WORK_SUMMARY");
        v8 = CFSTR("Check In: Arrived at work");
        break;
      case 1uLL:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("END_MESSAGE_SAFE_ARRIVAL_HOME_SUMMARY");
        v8 = CFSTR("Check In: Arrived at home");
        break;
      default:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("END_MESSAGE_SAFE_ARRIVAL_DEFAULT_DESTINATION_SUMMARY");
        v8 = CFSTR("Check In: Arrived at destination");
        break;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("END_MESSAGE_DEFAULT_SUMMARY");
    v8 = CFSTR("Check In: Ended");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[SMSessionEndMessage encodeWithCoder:]";
      v14 = 1024;
      v15 = 396;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }

  }
  v11.receiver = self;
  v11.super_class = (Class)SMSessionEndMessage;
  -[SMMessage encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionEndMessage sessionEndReason](self, "sessionEndReason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sessionEndReason"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionEndMessage sessionType](self, "sessionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sessionType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionEndMessage destinationType](self, "destinationType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("sessionDestinationType"));

  -[SMSessionEndMessage destinationMapItem](self, "destinationMapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SMSessionEndMessage destinationMapItem](self, "destinationMapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("sessionDestinationMapItem"));

  }
}

- (SMSessionEndMessage)initWithCoder:(id)a3
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
  int v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  SMSessionEndMessage *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  int v29;
  objc_class *v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", buf, 2u);
    }
    goto LABEL_16;
  }
  v7 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("messageType"));
  if (objc_msgSend((id)objc_opt_class(), "messageType") != v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      v22 = 0;
      goto LABEL_17;
    }
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v55 = v24;
    v56 = 2112;
    v57 = v25;
    v58 = 1024;
    v59 = objc_msgSend((id)objc_opt_class(), "messageType");
    v60 = 1024;
    v61 = v7;
    v26 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v27 = v9;
    v28 = 34;
LABEL_31:
    _os_log_error_impl(&dword_245521000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);

    goto LABEL_16;
  }
  v8 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("interfaceVersion"));
  if (v8 != 1)
  {
    v29 = v8;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v55 = v24;
    v56 = 2112;
    v57 = v25;
    v58 = 1024;
    v59 = v29;
    v26 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v27 = v9;
    v28 = 28;
    goto LABEL_31;
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
        objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionEndReason"));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = -[NSObject intValue](v12, "intValue");
          objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionType"));
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            v53 = v15;
            v17 = -[NSObject intValue](v15, "intValue");
            objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionDestinationType"));
            v18 = objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = v18;
              v52 = v14;
              v20 = (int)-[NSObject intValue](v18, "intValue");
              objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionDestinationMapItem"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              self = -[SMSessionEndMessage initWithDate:messageID:sessionID:sessionEndReason:sessionType:destinationType:destinationMapItem:](self, "initWithDate:messageID:sessionID:sessionEndReason:sessionType:destinationType:destinationMapItem:", v9, v10, v11, v52, v17, v20, v21);

              v22 = self;
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                v49 = (objc_class *)objc_opt_class();
                NSStringFromClass(v49);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v55 = v50;
                v56 = 2112;
                v57 = v51;
                _os_log_error_impl(&dword_245521000, v32, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing destinationType", buf, 0x16u);

              }
              v19 = 0;
              v22 = 0;
            }
            v16 = v53;
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v46 = (objc_class *)objc_opt_class();
              NSStringFromClass(v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v55 = v47;
              v56 = 2112;
              v57 = v48;
              _os_log_error_impl(&dword_245521000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionType", buf, 0x16u);

              v16 = 0;
            }
            v22 = 0;
          }

        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v42 = (objc_class *)objc_opt_class();
            NSStringFromClass(v42);
            v43 = v16;
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v55 = v44;
            v56 = 2112;
            v57 = v45;
            _os_log_error_impl(&dword_245521000, v43, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionEndReason", buf, 0x16u);

            v16 = v43;
          }
          v22 = 0;
        }

      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v39 = (objc_class *)objc_opt_class();
          NSStringFromClass(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v55 = v40;
          v56 = 2112;
          v57 = v41;
          _os_log_error_impl(&dword_245521000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);

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
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v55 = v37;
        v56 = 2112;
        v57 = v38;
        _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);

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
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v55 = v34;
      v56 = 2112;
      v57 = v35;
      _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);

    }
    v22 = 0;
  }

LABEL_17:
  return v22;
}

- (unint64_t)sessionEndReason
{
  return self->_sessionEndReason;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (unint64_t)destinationType
{
  return self->_destinationType;
}

- (NSData)destinationMapItem
{
  return self->_destinationMapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMapItem, 0);
}

@end
