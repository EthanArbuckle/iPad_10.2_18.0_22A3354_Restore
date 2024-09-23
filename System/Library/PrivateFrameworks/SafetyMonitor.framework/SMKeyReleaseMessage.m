@implementation SMKeyReleaseMessage

- (SMKeyReleaseMessage)initWithSessionID:(id)a3 triggerDate:(id)a4 locationOfTrigger:(id)a5 triggerType:(unint64_t)a6 safetyCacheKey:(id)a7 safetyCacheToken:(id)a8 sessionType:(unint64_t)a9 destinationType:(unint64_t)a10 lowPowerModeWarningState:(int64_t)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  SMKeyReleaseMessage *v22;
  uint64_t v24;

  v15 = a8;
  v16 = a7;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = 0;
  v22 = -[SMKeyReleaseMessage initWithDate:messageID:sessionID:triggerDate:locationOfTrigger:triggerType:safetyCacheKey:safetyCacheToken:sessionType:destinationType:isSOSTrigger:lowPowerModeWarningState:](self, "initWithDate:messageID:sessionID:triggerDate:locationOfTrigger:triggerType:safetyCacheKey:safetyCacheToken:sessionType:destinationType:isSOSTrigger:lowPowerModeWarningState:", v20, v21, v19, v18, v17, a6, v16, v15, a9, a10, v24, a11);

  return v22;
}

- (SMKeyReleaseMessage)initWithSessionID:(id)a3 triggerDate:(id)a4 locationOfTrigger:(id)a5 triggerType:(unint64_t)a6 safetyCacheKey:(id)a7 safetyCacheToken:(id)a8 sessionType:(unint64_t)a9 destinationType:(unint64_t)a10 isSOSTrigger:(BOOL)a11 lowPowerModeWarningState:(int64_t)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  SMKeyReleaseMessage *v23;
  uint64_t v25;

  v16 = a8;
  v17 = a7;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = a11;
  v23 = -[SMKeyReleaseMessage initWithDate:messageID:sessionID:triggerDate:locationOfTrigger:triggerType:safetyCacheKey:safetyCacheToken:sessionType:destinationType:isSOSTrigger:lowPowerModeWarningState:](self, "initWithDate:messageID:sessionID:triggerDate:locationOfTrigger:triggerType:safetyCacheKey:safetyCacheToken:sessionType:destinationType:isSOSTrigger:lowPowerModeWarningState:", v21, v22, v20, v19, v18, a6, v17, v16, a9, a10, v25, a12);

  return v23;
}

- (SMKeyReleaseMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 triggerDate:(id)a6 locationOfTrigger:(id)a7 triggerType:(unint64_t)a8 safetyCacheKey:(id)a9 safetyCacheToken:(id)a10 sessionType:(unint64_t)a11 destinationType:(unint64_t)a12 isSOSTrigger:(BOOL)a13 lowPowerModeWarningState:(int64_t)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  SMKeyReleaseMessage *v25;
  SMKeyReleaseMessage *v26;
  SMKeyReleaseMessage *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;
  uint8_t buf[16];

  v20 = a3;
  v21 = a4;
  v22 = a5;
  v35 = a6;
  v23 = a7;
  v34 = a9;
  v24 = a10;
  if (!v20)
  {
    v28 = v24;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: date";
LABEL_17:
    _os_log_error_impl(&dword_245521000, v29, OS_LOG_TYPE_ERROR, v30, buf, 2u);
    goto LABEL_18;
  }
  if (!v21)
  {
    v28 = v24;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: messageID";
    goto LABEL_17;
  }
  if (!v22)
  {
    v28 = v24;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: sessionID";
    goto LABEL_17;
  }
  if (!v35)
  {
    v28 = v24;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v30 = "Invalid parameter not satisfying: triggerDate";
      goto LABEL_17;
    }
LABEL_18:

    v27 = 0;
    goto LABEL_19;
  }
  v33 = v24;
  if (v34)
  {
    v36.receiver = self;
    v36.super_class = (Class)SMKeyReleaseMessage;
    v25 = -[SMMessage initWithDate:messageID:sessionID:](&v36, sel_initWithDate_messageID_sessionID_, v20, v21, v22);
    v26 = v25;
    if (v25)
    {
      objc_storeStrong((id *)&v25->_triggerDate, a6);
      objc_storeStrong((id *)&v26->_locationOfTrigger, a7);
      v26->_triggerType = a8;
      objc_storeStrong((id *)&v26->_safetyCacheKey, a9);
      objc_storeStrong((id *)&v26->_safetyCacheToken, a10);
      v26->_sessionType = a11;
      v26->_destinationType = a12;
      v26->_isSOSTrigger = a13;
      v26->_lowPowerModeWarningState = a14;
    }
    self = v26;
    v27 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: safetyCacheKey", buf, 2u);
    }

    v27 = 0;
  }
  v28 = v33;
LABEL_19:

  return v27;
}

- (SMKeyReleaseMessage)initWithDictionary:(id)a3
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
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  objc_class *v50;
  void *v51;
  void *v52;
  const char *v53;
  NSObject *v54;
  uint32_t v55;
  SMKeyReleaseMessage *v56;
  objc_class *v58;
  objc_class *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  NSObject *v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  objc_class *v69;
  void *v70;
  void *v71;
  objc_class *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  objc_class *v76;
  void *v77;
  void *v78;
  objc_class *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  objc_class *v83;
  void *v84;
  void *v85;
  objc_class *v86;
  void *v87;
  void *v88;
  objc_class *v89;
  void *v90;
  void *v91;
  objc_class *v92;
  void *v93;
  void *v94;
  objc_class *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  NSObject *v104;
  void *v105;
  int v106;
  NSObject *v107;
  NSObject *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  NSObject *log;
  NSObject *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint8_t buf[4];
  void *v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  int v129;
  __int16 v130;
  int v131;
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
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
    goto LABEL_27;
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
LABEL_27:
      v56 = 0;
      goto LABEL_28;
    }
    v50 = (objc_class *)objc_opt_class();
    NSStringFromClass(v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v125 = v51;
    v126 = 2112;
    v127 = v52;
    v128 = 1024;
    v129 = objc_msgSend((id)objc_opt_class(), "messageType");
    v130 = 1024;
    v131 = v8;
    v53 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v54 = v12;
    v55 = 34;
LABEL_42:
    _os_log_error_impl(&dword_245521000, v54, OS_LOG_TYPE_ERROR, v53, buf, v55);

    goto LABEL_27;
  }
  objc_msgSend(v6, "valueForKey:", CFSTR("interfaceVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if (v10 != 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v58 = (objc_class *)objc_opt_class();
    NSStringFromClass(v58);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v125 = v51;
    v126 = 2112;
    v127 = v52;
    v128 = 1024;
    v129 = v10;
    v53 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v54 = v12;
    v55 = 28;
    goto LABEL_42;
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
        objc_msgSend(v6, "valueForKey:", CFSTR("triggerTime"));
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          v111 = v17;
          v23 = (void *)MEMORY[0x24BDBCE60];
          -[NSObject doubleValue](v21, "doubleValue");
          objc_msgSend(v23, "dateWithTimeIntervalSince1970:");
          v114 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "valueForKey:", CFSTR("latitude"));
          v24 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "valueForKey:", CFSTR("longitude"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "valueForKey:", CFSTR("hunc"));
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "valueForKey:", CFSTR("altitude"));
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "valueForKey:", CFSTR("vunc"));
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "valueForKey:", CFSTR("timeOfLocation"));
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "valueForKey:", CFSTR("referenceFrame"));
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "valueForKey:", CFSTR("speed"));
          v26 = objc_claimAutoreleasedReturnValue();
          v117 = (void *)v24;
          v118 = 0;
          v113 = v22;
          v115 = (void *)v26;
          v116 = v25;
          if (v24 && v25 && v123 && v122 && v121 && v120 && v119 && v26)
          {
            v27 = (void *)MEMORY[0x24BDBCE60];
            objc_msgSend(v120, "doubleValue");
            objc_msgSend(v27, "dateWithTimeIntervalSince1970:");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_alloc(MEMORY[0x24BE27EB0]);
            objc_msgSend(v117, "doubleValue");
            v31 = v30;
            objc_msgSend(v25, "doubleValue");
            v33 = v32;
            objc_msgSend(v123, "doubleValue");
            v35 = v34;
            objc_msgSend(v122, "doubleValue");
            v37 = v36;
            objc_msgSend(v121, "doubleValue");
            v39 = v38;
            v40 = objc_msgSend(v119, "intValue");
            objc_msgSend(v115, "doubleValue");
            v41 = v40;
            v22 = v113;
            v118 = (void *)objc_msgSend(v29, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:", v28, v41, v31, v33, v35, v37, v39, v42);

          }
          objc_msgSend(v6, "valueForKey:", CFSTR("triggerType"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v43;
          v17 = v111;
          if (v43)
          {
            v109 = v43;
            v106 = objc_msgSend(v43, "intValue");
            objc_msgSend(v6, "valueForKey:", CFSTR("safetyCacheKey"));
            v45 = objc_claimAutoreleasedReturnValue();
            v46 = v114;
            log = v45;
            if (v45)
            {
              v47 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v45, 0);
              v110 = v47;
              if (v47)
              {
                v48 = v47;
                objc_msgSend(v6, "valueForKey:", CFSTR("safetyCacheToken"));
                v49 = objc_claimAutoreleasedReturnValue();
                v108 = v49;
                if (v49)
                  v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v49, 0);
                else
                  v105 = 0;
                v22 = v113;
                objc_msgSend(v6, "valueForKey:", CFSTR("sessionType"));
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = v114;
                v103 = v62;
                if (v62)
                {
                  v63 = objc_msgSend(v62, "intValue");
                  objc_msgSend(v6, "valueForKey:", CFSTR("sessionDestinationType"));
                  v64 = objc_claimAutoreleasedReturnValue();
                  v104 = v64;
                  if (v64)
                  {
                    v101 = v63;
                    v102 = v106;
                    v65 = (int)-[NSObject intValue](v64, "intValue");
                    objc_msgSend(v6, "valueForKey:", CFSTR("isSOSTrigger"));
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    v100 = objc_msgSend(v66, "BOOLValue");

                    objc_msgSend(v6, "valueForKey:", CFSTR("lowPowerModeWarningState"));
                    v67 = objc_claimAutoreleasedReturnValue();
                    v107 = v67;
                    if (v67)
                    {
                      v68 = (int)-[NSObject intValue](v67, "intValue");
                      v22 = v113;
                    }
                    else
                    {
                      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                      v75 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
                      {
                        v76 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v76);
                        v77 = (void *)objc_claimAutoreleasedReturnValue();
                        NSStringFromSelector(a2);
                        v78 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412546;
                        v125 = v77;
                        v126 = 2112;
                        v127 = v78;
                        _os_log_impl(&dword_245521000, v75, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@ ,missing lowPowerModeWarningStateNumber, OK to proceed", buf, 0x16u);

                      }
                      v68 = 0;
                      v22 = v113;
                      v48 = (uint64_t)v110;
                    }
                    LOBYTE(v99) = v100;
                    v98 = v65;
                    v46 = v114;
                    self = -[SMKeyReleaseMessage initWithDate:messageID:sessionID:triggerDate:locationOfTrigger:triggerType:safetyCacheKey:safetyCacheToken:sessionType:destinationType:isSOSTrigger:lowPowerModeWarningState:](self, "initWithDate:messageID:sessionID:triggerDate:locationOfTrigger:triggerType:safetyCacheKey:safetyCacheToken:sessionType:destinationType:isSOSTrigger:lowPowerModeWarningState:", v14, v111, v20, v114, v118, v102, v48, v105, v101, v98, v99, v68);
                    v56 = self;
                    v44 = v109;
                  }
                  else
                  {
                    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                    v107 = objc_claimAutoreleasedReturnValue();
                    v44 = v109;
                    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
                    {
                      v95 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v95);
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(a2);
                      v97 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v125 = v96;
                      v126 = 2112;
                      v127 = v97;
                      _os_log_error_impl(&dword_245521000, v107, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing destinationType", buf, 0x16u);

                      v44 = v109;
                      v22 = v113;
                    }
                    v56 = 0;
                    v46 = v114;
                  }

                }
                else
                {
                  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  v104 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                  {
                    v92 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v92);
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v125 = v93;
                    v126 = 2112;
                    v127 = v94;
                    _os_log_error_impl(&dword_245521000, v104, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionType", buf, 0x16u);

                    v22 = v113;
                  }
                  v56 = 0;
                  v44 = v109;
                }

              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                v108 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                {
                  v89 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v89);
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v125 = v90;
                  v126 = 2112;
                  v127 = v91;
                  _os_log_error_impl(&dword_245521000, v108, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to convert safetyCacheKey to NSData", buf, 0x16u);

                }
                v56 = 0;
                v22 = v113;
                v44 = v109;
              }

            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v110 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
              {
                v86 = (objc_class *)objc_opt_class();
                NSStringFromClass(v86);
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v125 = v87;
                v126 = 2112;
                v127 = v88;
                _os_log_error_impl(&dword_245521000, v110, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing safetyCacheKey", buf, 0x16u);

                v22 = v113;
              }
              v56 = 0;
              v44 = v109;
            }

          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            log = objc_claimAutoreleasedReturnValue();
            v46 = v114;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              v83 = (objc_class *)objc_opt_class();
              NSStringFromClass(v83);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v125 = v84;
              v126 = 2112;
              v127 = v85;
              _os_log_error_impl(&dword_245521000, log, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing triggerType", buf, 0x16u);

              v44 = 0;
              v22 = v113;
            }
            v56 = 0;
          }

        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v79 = (objc_class *)objc_opt_class();
            NSStringFromClass(v79);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v81 = v46;
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v125 = v80;
            v126 = 2112;
            v127 = v82;
            _os_log_error_impl(&dword_245521000, v81, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing triggerTime", buf, 0x16u);

            v46 = v81;
          }
          v56 = 0;
        }

      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v72 = (objc_class *)objc_opt_class();
          NSStringFromClass(v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v125 = v73;
          v126 = 2112;
          v127 = v74;
          _os_log_error_impl(&dword_245521000, v22, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);

        }
        v56 = 0;
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v69 = (objc_class *)objc_opt_class();
        NSStringFromClass(v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v125 = v70;
        v126 = 2112;
        v127 = v71;
        _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);

      }
      v56 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v59 = (objc_class *)objc_opt_class();
      NSStringFromClass(v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v125 = v60;
      v126 = 2112;
      v127 = v61;
      _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);

    }
    v56 = 0;
  }

LABEL_28:
  return v56;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)SMKeyReleaseMessage;
  -[SMMessage outputToDictionary](&v44, sel_outputToDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[SMKeyReleaseMessage triggerDate](self, "triggerDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("triggerTime"));

  -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "latitude");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("latitude"));

    v11 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "longitude");
    objc_msgSend(v11, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("longitude"));

    v14 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "horizontalUncertainty");
    objc_msgSend(v14, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("hunc"));

    v17 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "altitude");
    objc_msgSend(v17, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("altitude"));

    v20 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "verticalUncertainty");
    objc_msgSend(v20, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("vunc"));

    v23 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSince1970");
    objc_msgSend(v23, "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("timeOfLocation"));

    v27 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithUnsignedInt:", objc_msgSend(v28, "referenceFrame"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("referenceFrame"));

    v30 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "speed");
    objc_msgSend(v30, "numberWithDouble:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("speed"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMKeyReleaseMessage triggerType](self, "triggerType"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("triggerType"));

  -[SMKeyReleaseMessage safetyCacheKey](self, "safetyCacheKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "base64EncodedStringWithOptions:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("safetyCacheKey"));

  -[SMKeyReleaseMessage safetyCacheToken](self, "safetyCacheToken");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[SMKeyReleaseMessage safetyCacheToken](self, "safetyCacheToken");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "base64EncodedStringWithOptions:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("safetyCacheToken"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMKeyReleaseMessage sessionType](self, "sessionType"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("sessionType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMKeyReleaseMessage destinationType](self, "destinationType"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("sessionDestinationType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SMKeyReleaseMessage isSOSTrigger](self, "isSOSTrigger"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("isSOSTrigger"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMKeyReleaseMessage lowPowerModeWarningState](self, "lowPowerModeWarningState"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("lowPowerModeWarningState"));

  return v3;
}

- (SMKeyReleaseMessage)initWithURL:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t i;
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
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  int v56;
  void *v57;
  int v58;
  void *v59;
  int v60;
  int v61;
  int v62;
  int v63;
  void *v64;
  NSObject *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  uint64_t v82;
  double v83;
  int v84;
  uint64_t v85;
  NSObject *v86;
  NSObject *v87;
  SMKeyReleaseMessage *v88;
  NSObject *v89;
  objc_class *v91;
  void *v92;
  void *v93;
  objc_class *v94;
  void *v95;
  NSObject *v96;
  NSObject *v97;
  void *v98;
  int v99;
  objc_class *v100;
  void *v101;
  void *v102;
  objc_class *v103;
  void *v104;
  void *v105;
  const char *v106;
  objc_class *v107;
  void *v108;
  void *v109;
  objc_class *v110;
  void *v111;
  void *v112;
  const char *v113;
  objc_class *v114;
  void *v115;
  void *v116;
  objc_class *v117;
  void *v118;
  void *v119;
  int v120;
  uint64_t v121;
  uint64_t v122;
  char v123;
  uint64_t v124;
  NSObject *v125;
  objc_class *v126;
  void *v127;
  void *v128;
  const char *v129;
  objc_class *v130;
  void *v131;
  void *v132;
  NSObject *v133;
  objc_class *v134;
  uint64_t v135;
  void *v136;
  objc_class *v137;
  objc_class *v138;
  objc_class *v139;
  uint64_t v140;
  id v141;
  NSObject *v142;
  NSObject *v143;
  NSObject *v144;
  NSObject *v145;
  NSObject *v146;
  NSObject *v147;
  NSObject *v148;
  NSObject *v149;
  NSObject *v150;
  NSObject *v151;
  NSObject *v152;
  NSObject *v153;
  NSObject *v154;
  NSObject *v155;
  NSObject *v156;
  NSObject *v157;
  NSObject *v158;
  void *v161;
  NSObject *v162;
  uint64_t v163;
  NSObject *v164;
  uint64_t v165;
  NSObject *v166;
  NSObject *v167;
  NSObject *obj;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  uint8_t buf[4];
  void *v174;
  __int16 v175;
  uint64_t v176;
  __int16 v177;
  int v178;
  __int16 v179;
  int v180;
  _BYTE v181[128];
  uint64_t v182;

  v182 = *MEMORY[0x24BDAC8D0];
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
    v88 = 0;
    goto LABEL_97;
  }
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
  v5 = v4;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v91 = (objc_class *)objc_opt_class();
      NSStringFromClass(v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v174 = v92;
      v175 = 2112;
      v176 = (uint64_t)v93;
      _os_log_error_impl(&dword_245521000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing url components", buf, 0x16u);

    }
    v88 = 0;
    goto LABEL_96;
  }
  -[NSObject queryItems](v4, "queryItems");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      v100 = (objc_class *)objc_opt_class();
      NSStringFromClass(v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v174 = v101;
      v175 = 2112;
      v176 = (uint64_t)v102;
      _os_log_error_impl(&dword_245521000, v89, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing queryItems", buf, 0x16u);

    }
    v88 = 0;
    goto LABEL_95;
  }
  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v169, v181, 16);
  if (!v8)
  {
    v61 = objc_msgSend(0, "intValue");
    v89 = 0;
    v162 = 0;
    v10 = 0;
    v166 = 0;
    v167 = 0;
    v158 = 0;
    v157 = 0;
    v156 = 0;
    v154 = 0;
    v155 = 0;
    v152 = 0;
    v153 = 0;
    v150 = 0;
    v151 = 0;
    v148 = 0;
    v149 = 0;
    v146 = 0;
    v147 = 0;
    v144 = 0;
    v145 = 0;
    v143 = 0;
LABEL_91:
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v94 = (objc_class *)objc_opt_class();
      NSStringFromClass(v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v96 = v89;
      v97 = v7;
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend((id)objc_opt_class(), "messageType");
      *(_DWORD *)buf = 138413058;
      v174 = v95;
      v175 = 2112;
      v176 = (uint64_t)v98;
      v177 = 1024;
      v178 = v99;
      v179 = 1024;
      v180 = v61;
      _os_log_error_impl(&dword_245521000, v65, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d", buf, 0x22u);

      v7 = v97;
      v89 = v96;

    }
    v88 = 0;
    goto LABEL_94;
  }
  v9 = v8;
  v167 = 0;
  obj = v7;
  v141 = v3;
  v142 = v5;
  v143 = 0;
  v144 = 0;
  v145 = 0;
  v146 = 0;
  v147 = 0;
  v148 = 0;
  v149 = 0;
  v150 = 0;
  v151 = 0;
  v152 = 0;
  v153 = 0;
  v154 = 0;
  v155 = 0;
  v156 = 0;
  v157 = 0;
  v158 = 0;
  v166 = 0;
  v10 = 0;
  v162 = 0;
  v164 = 0;
  v11 = *(_QWORD *)v170;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v170 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * i);
      objc_msgSend(v13, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v13, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("sendDate"));

        if (v16)
        {
          v17 = v10;
          v10 = v14;
        }
        else
        {
          objc_msgSend(v13, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("messageID"));

          if (v22)
          {
            v17 = v167;
            v167 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v14);
          }
          else
          {
            objc_msgSend(v13, "name");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("sessionID"));

            if (v24)
            {
              v17 = v166;
              v166 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v14);
            }
            else
            {
              objc_msgSend(v13, "name");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("messageType"));

              if (v26)
              {
                v17 = v164;
                v164 = v14;
              }
              else
              {
                objc_msgSend(v13, "name");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("interfaceVersion"));

                if (v28)
                {
                  v17 = v162;
                  v162 = v14;
                }
                else
                {
                  objc_msgSend(v13, "name");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("triggerTime"));

                  if (v30)
                  {
                    v17 = v158;
                    v158 = v14;
                  }
                  else
                  {
                    objc_msgSend(v13, "name");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("latitude"));

                    if (v32)
                    {
                      v17 = v157;
                      v157 = v14;
                    }
                    else
                    {
                      objc_msgSend(v13, "name");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("longitude"));

                      if (v34)
                      {
                        v17 = v156;
                        v156 = v14;
                      }
                      else
                      {
                        objc_msgSend(v13, "name");
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("hunc"));

                        if (v36)
                        {
                          v17 = v155;
                          v155 = v14;
                        }
                        else
                        {
                          objc_msgSend(v13, "name");
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("altitude"));

                          if (v38)
                          {
                            v17 = v154;
                            v154 = v14;
                          }
                          else
                          {
                            objc_msgSend(v13, "name");
                            v39 = (void *)objc_claimAutoreleasedReturnValue();
                            v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("vunc"));

                            if (v40)
                            {
                              v17 = v153;
                              v153 = v14;
                            }
                            else
                            {
                              objc_msgSend(v13, "name");
                              v41 = (void *)objc_claimAutoreleasedReturnValue();
                              v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("timeOfLocation"));

                              if (v42)
                              {
                                v17 = v152;
                                v152 = v14;
                              }
                              else
                              {
                                objc_msgSend(v13, "name");
                                v43 = (void *)objc_claimAutoreleasedReturnValue();
                                v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("referenceFrame"));

                                if (v44)
                                {
                                  v17 = v151;
                                  v151 = v14;
                                }
                                else
                                {
                                  objc_msgSend(v13, "name");
                                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                                  v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("speed"));

                                  if (v46)
                                  {
                                    v17 = v150;
                                    v150 = v14;
                                  }
                                  else
                                  {
                                    objc_msgSend(v13, "name");
                                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                                    v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("triggerType"));

                                    if (v48)
                                    {
                                      v17 = v149;
                                      v149 = v14;
                                    }
                                    else
                                    {
                                      objc_msgSend(v13, "name");
                                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                                      v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("safetyCacheKey"));

                                      if (v50)
                                      {
                                        v17 = v148;
                                        v148 = v14;
                                      }
                                      else
                                      {
                                        objc_msgSend(v13, "name");
                                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                                        v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("safetyCacheToken"));

                                        if (v52)
                                        {
                                          v17 = v147;
                                          v147 = v14;
                                        }
                                        else
                                        {
                                          objc_msgSend(v13, "name");
                                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                                          v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("sessionType"));

                                          if (v54)
                                          {
                                            v17 = v146;
                                            v146 = v14;
                                          }
                                          else
                                          {
                                            objc_msgSend(v13, "name");
                                            v55 = (void *)objc_claimAutoreleasedReturnValue();
                                            v56 = objc_msgSend(v55, "isEqualToString:", CFSTR("sessionDestinationType"));

                                            if (v56)
                                            {
                                              v17 = v145;
                                              v145 = v14;
                                            }
                                            else
                                            {
                                              objc_msgSend(v13, "name");
                                              v57 = (void *)objc_claimAutoreleasedReturnValue();
                                              v58 = objc_msgSend(v57, "isEqualToString:", CFSTR("isSOSTrigger"));

                                              if (v58)
                                              {
                                                v17 = v144;
                                                v144 = v14;
                                              }
                                              else
                                              {
                                                objc_msgSend(v13, "name");
                                                v59 = (void *)objc_claimAutoreleasedReturnValue();
                                                v60 = objc_msgSend(v59, "isEqualToString:", CFSTR("lowPowerModeWarningState"));

                                                if (!v60)
                                                  goto LABEL_55;
                                                v17 = v143;
                                                v143 = v14;
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
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
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v174 = v19;
          v175 = 2112;
          v176 = (uint64_t)v20;
          _os_log_error_impl(&dword_245521000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,queryItem missing value", buf, 0x16u);

        }
      }

LABEL_55:
    }
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v169, v181, 16);
  }
  while (v9);
  v61 = -[NSObject intValue](v164, "intValue");
  if (!v164)
  {
    v89 = 0;
    v3 = v141;
    v5 = v142;
    v7 = obj;
    goto LABEL_91;
  }
  v5 = v142;
  v7 = obj;
  if (objc_msgSend((id)objc_opt_class(), "messageType") != v61)
  {
    v3 = v141;
    v89 = v164;
    goto LABEL_91;
  }
  v62 = -[NSObject intValue](v162, "intValue");
  v63 = v62;
  if (!v162 || v62 != 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v65 = objc_claimAutoreleasedReturnValue();
    v3 = v141;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v107 = (objc_class *)objc_opt_class();
      NSStringFromClass(v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v174 = v108;
      v175 = 2112;
      v176 = (uint64_t)v109;
      v177 = 1024;
      v178 = v63;
      _os_log_error_impl(&dword_245521000, v65, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,unrecognized interface version,%d", buf, 0x1Cu);

      v7 = obj;
    }
    v88 = 0;
    goto LABEL_104;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v117 = (objc_class *)objc_opt_class();
      NSStringFromClass(v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v174 = v118;
      v175 = 2112;
      v176 = (uint64_t)v119;
      _os_log_error_impl(&dword_245521000, v65, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);

    }
    v10 = 0;
    v88 = 0;
    v3 = v141;
LABEL_104:
    v89 = v164;
    goto LABEL_94;
  }
  v64 = (void *)MEMORY[0x24BDBCE60];
  -[NSObject doubleValue](v10, "doubleValue");
  objc_msgSend(v64, "dateWithTimeIntervalSince1970:");
  v65 = objc_claimAutoreleasedReturnValue();
  if (!v167)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v67 = objc_claimAutoreleasedReturnValue();
    v3 = v141;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      v130 = (objc_class *)objc_opt_class();
      NSStringFromClass(v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v174 = v131;
      v175 = 2112;
      v176 = (uint64_t)v132;
      _os_log_error_impl(&dword_245521000, v67, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);

      v7 = obj;
    }
    v88 = 0;
    goto LABEL_134;
  }
  if (!v166)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v67 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
LABEL_111:
      v88 = 0;
      v3 = v141;
      goto LABEL_134;
    }
    v103 = (objc_class *)objc_opt_class();
    NSStringFromClass(v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v174 = v104;
    v175 = 2112;
    v176 = (uint64_t)v105;
    v106 = "#SafetyCache,%@,%@,missing sessionID";
LABEL_136:
    _os_log_error_impl(&dword_245521000, v67, OS_LOG_TYPE_ERROR, v106, buf, 0x16u);

    v7 = obj;
    goto LABEL_111;
  }
  if (!v158)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v67 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      goto LABEL_111;
    v137 = (objc_class *)objc_opt_class();
    NSStringFromClass(v137);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v174 = v104;
    v175 = 2112;
    v176 = (uint64_t)v105;
    v106 = "#SafetyCache,%@,%@,missing triggerTime";
    goto LABEL_136;
  }
  v66 = (void *)MEMORY[0x24BDBCE60];
  -[NSObject doubleValue](v158, "doubleValue");
  objc_msgSend(v66, "dateWithTimeIntervalSince1970:");
  v67 = objc_claimAutoreleasedReturnValue();
  v68 = 0;
  if (v157 && v156 && v155 && v154 && v153 && v152 && v151 && v150)
  {
    v69 = (void *)MEMORY[0x24BDBCE60];
    -[NSObject doubleValue](v152, "doubleValue");
    objc_msgSend(v69, "dateWithTimeIntervalSince1970:");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_alloc(MEMORY[0x24BE27EB0]);
    -[NSObject doubleValue](v157, "doubleValue");
    v73 = v72;
    -[NSObject doubleValue](v156, "doubleValue");
    v75 = v74;
    -[NSObject doubleValue](v155, "doubleValue");
    v77 = v76;
    -[NSObject doubleValue](v154, "doubleValue");
    v79 = v78;
    -[NSObject doubleValue](v153, "doubleValue");
    v81 = v80;
    v82 = -[NSObject intValue](v151, "intValue");
    -[NSObject doubleValue](v150, "doubleValue");
    v68 = (void *)objc_msgSend(v71, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:", v70, v82, v73, v75, v77, v79, v81, v83);

  }
  if (!v149)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v86 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
LABEL_115:
      v88 = 0;
      v3 = v141;
      goto LABEL_133;
    }
    v110 = (objc_class *)objc_opt_class();
    NSStringFromClass(v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v174 = v111;
    v175 = 2112;
    v176 = (uint64_t)v112;
    v113 = "#SafetyCache,%@,%@,missing triggerType";
LABEL_138:
    _os_log_error_impl(&dword_245521000, v86, OS_LOG_TYPE_ERROR, v113, buf, 0x16u);

    v5 = v142;
    goto LABEL_115;
  }
  v84 = -[NSObject intValue](v149, "intValue");
  if (!v148)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v86 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      goto LABEL_115;
    v138 = (objc_class *)objc_opt_class();
    NSStringFromClass(v138);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v174 = v111;
    v175 = 2112;
    v176 = (uint64_t)v112;
    v113 = "#SafetyCache,%@,%@,missing safetyCacheKey";
    goto LABEL_138;
  }
  LODWORD(v85) = v84;
  v86 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v148, 0);
  if (!v86)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v87 = objc_claimAutoreleasedReturnValue();
    v3 = v141;
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      v114 = (objc_class *)objc_opt_class();
      NSStringFromClass(v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v174 = v115;
      v175 = 2112;
      v176 = (uint64_t)v116;
      _os_log_error_impl(&dword_245521000, v87, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to convert safetyCacheKey to NSData", buf, 0x16u);

    }
    goto LABEL_127;
  }
  if (v147)
    v87 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v147, 0);
  else
    v87 = 0;
  v3 = v141;
  if (!v146)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v125 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
    {
LABEL_126:

LABEL_127:
      v88 = 0;
      goto LABEL_132;
    }
    v126 = (objc_class *)objc_opt_class();
    NSStringFromClass(v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v174 = v127;
    v175 = 2112;
    v176 = (uint64_t)v128;
    v129 = "#SafetyCache,%@,%@,missing sessionType";
LABEL_140:
    _os_log_error_impl(&dword_245521000, v125, OS_LOG_TYPE_ERROR, v129, buf, 0x16u);

    goto LABEL_126;
  }
  v120 = -[NSObject intValue](v146, "intValue");
  if (!v145)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v125 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
      goto LABEL_126;
    v139 = (objc_class *)objc_opt_class();
    NSStringFromClass(v139);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v174 = v127;
    v175 = 2112;
    v176 = (uint64_t)v128;
    v129 = "#SafetyCache,%@,%@,missing destinationType";
    goto LABEL_140;
  }
  v85 = (int)v85;
  v121 = v120;
  v122 = (int)-[NSObject intValue](v145, "intValue");
  v123 = -[NSObject BOOLValue](v144, "BOOLValue");
  if (v143)
  {
    v124 = (int)-[NSObject intValue](v143, "intValue");
  }
  else
  {
    v165 = (int)v85;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v133 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
    {
      v134 = (objc_class *)objc_opt_class();
      NSStringFromClass(v134);
      v163 = v121;
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v135 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v174 = v161;
      v175 = 2112;
      v176 = v135;
      v136 = (void *)v135;
      _os_log_impl(&dword_245521000, v133, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,missing lowPowerModeWarningState, OK to proceed", buf, 0x16u);

      v121 = v163;
    }

    v124 = 0;
    v85 = v165;
  }
  LOBYTE(v140) = v123;
  v88 = -[SMKeyReleaseMessage initWithDate:messageID:sessionID:triggerDate:locationOfTrigger:triggerType:safetyCacheKey:safetyCacheToken:sessionType:destinationType:isSOSTrigger:lowPowerModeWarningState:](self, "initWithDate:messageID:sessionID:triggerDate:locationOfTrigger:triggerType:safetyCacheKey:safetyCacheToken:sessionType:destinationType:isSOSTrigger:lowPowerModeWarningState:", v65, v167, v166, v67, v68, v85, v86, v87, v121, v122, v140, v124);
  self = v88;
  v3 = v141;
LABEL_132:

  v5 = v142;
LABEL_133:

  v7 = obj;
LABEL_134:
  v89 = v164;

LABEL_94:
LABEL_95:

LABEL_96:
LABEL_97:

  return v88;
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
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  objc_super v94;

  v3 = objc_alloc_init(MEMORY[0x24BDD1808]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v94.receiver = self;
  v94.super_class = (Class)SMKeyReleaseMessage;
  -[SMMessage outputToURLComponents](&v94, sel_outputToURLComponents);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  v7 = objc_alloc(MEMORY[0x24BDD1838]);
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[SMKeyReleaseMessage triggerDate](self, "triggerDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("triggerTime"), v11);
  objc_msgSend(v4, "addObject:", v12);

  -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x24BDD1838]);
    v15 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "latitude");
    objc_msgSend(v15, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("latitude"), v18);
    objc_msgSend(v4, "addObject:", v19);

    v20 = objc_alloc(MEMORY[0x24BDD1838]);
    v21 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "longitude");
    objc_msgSend(v21, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v20, "initWithName:value:", CFSTR("longitude"), v24);
    objc_msgSend(v4, "addObject:", v25);

    v26 = objc_alloc(MEMORY[0x24BDD1838]);
    v27 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "horizontalUncertainty");
    objc_msgSend(v27, "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v26, "initWithName:value:", CFSTR("hunc"), v30);
    objc_msgSend(v4, "addObject:", v31);

    v32 = objc_alloc(MEMORY[0x24BDD1838]);
    v33 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "altitude");
    objc_msgSend(v33, "numberWithDouble:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v32, "initWithName:value:", CFSTR("altitude"), v36);
    objc_msgSend(v4, "addObject:", v37);

    v38 = objc_alloc(MEMORY[0x24BDD1838]);
    v39 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "verticalUncertainty");
    objc_msgSend(v39, "numberWithDouble:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringValue");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v38, "initWithName:value:", CFSTR("vunc"), v42);
    objc_msgSend(v4, "addObject:", v43);

    v44 = objc_alloc(MEMORY[0x24BDD1838]);
    v45 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "date");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "timeIntervalSince1970");
    objc_msgSend(v45, "numberWithDouble:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stringValue");
    v49 = v3;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v44, "initWithName:value:", CFSTR("timeOfLocation"), v50);
    objc_msgSend(v4, "addObject:", v51);

    v3 = v49;
    v52 = objc_alloc(MEMORY[0x24BDD1838]);
    v53 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "numberWithUnsignedInt:", objc_msgSend(v54, "referenceFrame"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "stringValue");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v52, "initWithName:value:", CFSTR("referenceFrame"), v56);
    objc_msgSend(v4, "addObject:", v57);

    v58 = objc_alloc(MEMORY[0x24BDD1838]);
    v59 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "speed");
    objc_msgSend(v59, "numberWithDouble:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "stringValue");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v58, "initWithName:value:", CFSTR("speed"), v62);
    objc_msgSend(v4, "addObject:", v63);

  }
  v64 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMKeyReleaseMessage triggerType](self, "triggerType"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "stringValue");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)objc_msgSend(v64, "initWithName:value:", CFSTR("triggerType"), v66);
  objc_msgSend(v4, "addObject:", v67);

  v68 = objc_alloc(MEMORY[0x24BDD1838]);
  -[SMKeyReleaseMessage safetyCacheKey](self, "safetyCacheKey");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "base64EncodedStringWithOptions:", 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)objc_msgSend(v68, "initWithName:value:", CFSTR("safetyCacheKey"), v70);
  objc_msgSend(v4, "addObject:", v71);

  -[SMKeyReleaseMessage safetyCacheToken](self, "safetyCacheToken");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    v73 = objc_alloc(MEMORY[0x24BDD1838]);
    -[SMKeyReleaseMessage safetyCacheToken](self, "safetyCacheToken");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "base64EncodedStringWithOptions:", 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (void *)objc_msgSend(v73, "initWithName:value:", CFSTR("safetyCacheToken"), v75);
    objc_msgSend(v4, "addObject:", v76);

  }
  v77 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMKeyReleaseMessage sessionType](self, "sessionType"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "stringValue");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)objc_msgSend(v77, "initWithName:value:", CFSTR("sessionType"), v79);
  objc_msgSend(v4, "addObject:", v80);

  v81 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMKeyReleaseMessage destinationType](self, "destinationType"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "stringValue");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend(v81, "initWithName:value:", CFSTR("sessionDestinationType"), v83);
  objc_msgSend(v4, "addObject:", v84);

  v85 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SMKeyReleaseMessage isSOSTrigger](self, "isSOSTrigger"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "stringValue");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)objc_msgSend(v85, "initWithName:value:", CFSTR("isSOSTrigger"), v87);
  objc_msgSend(v4, "addObject:", v88);

  v89 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMKeyReleaseMessage lowPowerModeWarningState](self, "lowPowerModeWarningState"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "stringValue");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)objc_msgSend(v89, "initWithName:value:", CFSTR("lowPowerModeWarningState"), v91);
  objc_msgSend(v4, "addObject:", v92);

  objc_msgSend(v3, "setQueryItems:", v4);
  return v3;
}

+ (unint64_t)messageType
{
  return 3;
}

- (id)summaryText
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  switch(-[SMKeyReleaseMessage triggerType](self, "triggerType"))
  {
    case 10uLL:
    case 12uLL:
    case 14uLL:
      goto LABEL_2;
    case 11uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("KEY_RELEASE_MESSAGE_SOS_CAR_CRASH_EVENT_SUMMARY");
      v6 = CFSTR("Check In: Emergency services called, car crash detected, location shared");
      break;
    case 13uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("KEY_RELEASE_MESSAGE_SOS_HARD_FALL_EVENT_SUMMARY");
      v6 = CFSTR("Check In: Emergency services called, fall detected, location shared");
      break;
    case 15uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("KEY_RELEASE_MESSAGE_SCHEDULED_SEND_SUMMARY");
      v6 = CFSTR("Check In: Device offline, location shared");
      break;
    default:
      if (-[SMKeyReleaseMessage isSOSTrigger](self, "isSOSTrigger"))
      {
LABEL_2:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v3;
        v5 = CFSTR("KEY_RELEASE_MESSAGE_SOS_EVENT_SUMMARY");
        v6 = CFSTR("Check In: Emergency services called, location shared");
      }
      else
      {
        switch(-[SMKeyReleaseMessage sessionType](self, "sessionType"))
        {
          case 1uLL:
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = v3;
            v5 = CFSTR("KEY_RELEASE_MESSAGE_TIME_BOUND_SUMMARY");
            v6 = CFSTR("Check In: Has not checked in when expected, location shared");
            break;
          case 2uLL:
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = v3;
            v5 = CFSTR("KEY_RELEASE_MESSAGE_DESTINATION_BOUND_SUMMARY");
            v6 = CFSTR("Check In: Has not arrived as expected, location shared");
            break;
          case 3uLL:
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = v3;
            v5 = CFSTR("KEY_RELEASE_MESSAGE_ROUNDTRIP_SUMMARY");
            v6 = CFSTR("Check In: Has not arrived back as expected, location shared");
            break;
          case 4uLL:
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = v3;
            v5 = CFSTR("KEY_RELEASE_MESSAGE_WORKOUT_SUMMARY");
            v6 = CFSTR("Check In: Has not completed workout as expected, location shared");
            break;
          default:
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = v3;
            v5 = CFSTR("KEY_RELEASE_MESSAGE_DEFAULT_SUMMARY");
            v6 = CFSTR("Check In: Location available");
            break;
        }
      }
      break;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[SMKeyReleaseMessage encodeWithCoder:]";
      v42 = 1024;
      v43 = 594;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }

  }
  v39.receiver = self;
  v39.super_class = (Class)SMKeyReleaseMessage;
  -[SMMessage encodeWithCoder:](&v39, sel_encodeWithCoder_, v4);
  -[SMKeyReleaseMessage triggerDate](self, "triggerDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("triggerTime"));

  -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "latitude");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("latitude"));

    v11 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "longitude");
    objc_msgSend(v11, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("longitude"));

    v14 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "horizontalUncertainty");
    objc_msgSend(v14, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("hunc"));

    v17 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "altitude");
    objc_msgSend(v17, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("altitude"));

    v20 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "verticalUncertainty");
    objc_msgSend(v20, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("vunc"));

    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("timeOfLocation"));

    v25 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberWithUnsignedInt:", objc_msgSend(v26, "referenceFrame"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("referenceFrame"));

    v28 = (void *)MEMORY[0x24BDD16E0];
    -[SMKeyReleaseMessage locationOfTrigger](self, "locationOfTrigger");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "speed");
    objc_msgSend(v28, "numberWithDouble:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("speed"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMKeyReleaseMessage triggerType](self, "triggerType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("triggerType"));

  -[SMKeyReleaseMessage safetyCacheKey](self, "safetyCacheKey");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("safetyCacheKey"));

  -[SMKeyReleaseMessage safetyCacheToken](self, "safetyCacheToken");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[SMKeyReleaseMessage safetyCacheToken](self, "safetyCacheToken");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v34, CFSTR("safetyCacheToken"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMKeyReleaseMessage sessionType](self, "sessionType"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, CFSTR("sessionType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMKeyReleaseMessage destinationType](self, "destinationType"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v36, CFSTR("sessionDestinationType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SMKeyReleaseMessage isSOSTrigger](self, "isSOSTrigger"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, CFSTR("isSOSTrigger"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMKeyReleaseMessage lowPowerModeWarningState](self, "lowPowerModeWarningState"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v38, CFSTR("lowPowerModeWarningState"));

}

- (SMKeyReleaseMessage)initWithCoder:(id)a3
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  int v50;
  SMKeyReleaseMessage *v51;
  objc_class *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  objc_class *v61;
  void *v62;
  void *v63;
  objc_class *v64;
  void *v65;
  void *v66;
  objc_class *v67;
  void *v68;
  void *v69;
  objc_class *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  objc_class *v74;
  void *v75;
  void *v76;
  objc_class *v77;
  void *v78;
  void *v79;
  objc_class *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  void *v90;
  NSObject *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  NSObject *v96;
  void *v97;
  NSObject *log;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  int v111;
  __int16 v112;
  int v113;
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
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
    goto LABEL_28;
  }
  v7 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("messageType"));
  if (objc_msgSend((id)objc_opt_class(), "messageType") != v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_28:
      v51 = 0;
      goto LABEL_29;
    }
    v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v107 = v45;
    v108 = 2112;
    v109 = v46;
    v110 = 1024;
    v111 = objc_msgSend((id)objc_opt_class(), "messageType");
    v112 = 1024;
    v113 = v7;
    v47 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v48 = v9;
    v49 = 34;
LABEL_43:
    _os_log_error_impl(&dword_245521000, v48, OS_LOG_TYPE_ERROR, v47, buf, v49);

    goto LABEL_28;
  }
  v8 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("interfaceVersion"));
  if (v8 != 1)
  {
    v50 = v8;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    v53 = (objc_class *)objc_opt_class();
    NSStringFromClass(v53);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v107 = v45;
    v108 = 2112;
    v109 = v46;
    v110 = 1024;
    v111 = v50;
    v47 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v48 = v9;
    v49 = 28;
    goto LABEL_43;
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
        objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triggerTime"));
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v96 = v11;
          objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latitude"));
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("longitude"));
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hunc"));
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altitude"));
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vunc"));
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeOfLocation"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceFrame"));
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("speed"));
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = 0;
          v99 = v13;
          v100 = (void *)v16;
          v101 = (void *)v14;
          if (v13 && v14 && v105 && v104 && v103 && v15 && v102 && v16)
          {
            v18 = v15;
            v19 = objc_alloc(MEMORY[0x24BE27EB0]);
            -[NSObject doubleValue](v13, "doubleValue");
            v21 = v20;
            objc_msgSend(v101, "doubleValue");
            v23 = v22;
            objc_msgSend(v105, "doubleValue");
            v25 = v24;
            objc_msgSend(v104, "doubleValue");
            v27 = v26;
            objc_msgSend(v103, "doubleValue");
            v29 = v28;
            v30 = objc_msgSend(v102, "intValue");
            objc_msgSend(v100, "doubleValue");
            v31 = v19;
            v15 = v18;
            v17 = objc_msgSend(v31, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:", v18, v30, v21, v23, v25, v27, v29, v32);
          }
          v97 = (void *)v17;
          objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triggerType"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          v11 = v96;
          if (v33)
          {
            v92 = v12;
            v93 = v15;
            v35 = objc_msgSend(v33, "intValue");
            objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("safetyCacheKey"));
            log = objc_claimAutoreleasedReturnValue();
            if (log)
            {
              objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("safetyCacheToken"));
              v95 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionType"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = v36;
              if (v36)
              {
                v37 = objc_msgSend(v36, "intValue");
                objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionDestinationType"));
                v38 = objc_claimAutoreleasedReturnValue();
                v91 = v38;
                if (v38)
                {
                  v88 = v35;
                  v39 = v37;
                  v87 = (int)-[NSObject intValue](v38, "intValue");
                  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isSOSTrigger"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v86 = objc_msgSend(v40, "intValue");

                  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lowPowerModeWarningState"));
                  v41 = objc_claimAutoreleasedReturnValue();
                  v89 = v41;
                  if (v41)
                  {
                    v42 = (int)-[NSObject intValue](v41, "intValue");
                    v43 = v99;
                    v15 = v93;
                  }
                  else
                  {
                    v85 = v39;
                    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                    v60 = objc_claimAutoreleasedReturnValue();
                    v43 = v99;
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
                    {
                      v61 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v61);
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(a2);
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v107 = v62;
                      v108 = 2112;
                      v109 = v63;
                      _os_log_impl(&dword_245521000, v60, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,missing lowPowerModeWarningStateNumber", buf, 0x16u);

                    }
                    v42 = 0;
                    v15 = v93;
                    v39 = v85;
                  }
                  v83 = v39;
                  LOBYTE(v84) = v86 != 0;
                  v12 = v92;
                  self = -[SMKeyReleaseMessage initWithDate:messageID:sessionID:triggerDate:locationOfTrigger:triggerType:safetyCacheKey:safetyCacheToken:sessionType:destinationType:isSOSTrigger:lowPowerModeWarningState:](self, "initWithDate:messageID:sessionID:triggerDate:locationOfTrigger:triggerType:safetyCacheKey:safetyCacheToken:sessionType:destinationType:isSOSTrigger:lowPowerModeWarningState:", v9, v10, v96, v92, v97, v88, log, v95, v83, v87, v84, v42);
                  v51 = self;
                }
                else
                {
                  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  v89 = objc_claimAutoreleasedReturnValue();
                  v12 = v92;
                  v15 = v93;
                  v43 = v99;
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                  {
                    v80 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v80);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v107 = v81;
                    v108 = 2112;
                    v109 = v82;
                    _os_log_error_impl(&dword_245521000, v89, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing destinationType", buf, 0x16u);

                    v12 = v92;
                    v15 = v93;
                  }
                  v51 = 0;
                }

              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                v91 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                {
                  v77 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v77);
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v107 = v78;
                  v108 = 2112;
                  v109 = v79;
                  _os_log_error_impl(&dword_245521000, v91, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionType", buf, 0x16u);

                }
                v51 = 0;
                v12 = v92;
                v15 = v93;
                v43 = v99;
              }

            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v95 = objc_claimAutoreleasedReturnValue();
              v12 = v92;
              v43 = v99;
              if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
              {
                v74 = (objc_class *)objc_opt_class();
                NSStringFromClass(v74);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v107 = v75;
                v108 = 2112;
                v109 = v76;
                _os_log_error_impl(&dword_245521000, v95, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing safetyCacheKey", buf, 0x16u);

                v12 = v92;
                v15 = v93;
              }
              v51 = 0;
            }

          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            log = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              v70 = (objc_class *)objc_opt_class();
              NSStringFromClass(v70);
              v94 = v15;
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v72 = v12;
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v107 = v71;
              v108 = 2112;
              v109 = v73;
              _os_log_error_impl(&dword_245521000, log, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing triggerType", buf, 0x16u);

              v12 = v72;
              v15 = v94;
            }
            v51 = 0;
            v43 = v99;
          }

        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            v67 = (objc_class *)objc_opt_class();
            NSStringFromClass(v67);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v107 = v68;
            v108 = 2112;
            v109 = v69;
            _os_log_error_impl(&dword_245521000, v43, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing triggerDate", buf, 0x16u);

          }
          v51 = 0;
        }

      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v64 = (objc_class *)objc_opt_class();
          NSStringFromClass(v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v107 = v65;
          v108 = 2112;
          v109 = v66;
          _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);

        }
        v51 = 0;
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v57 = (objc_class *)objc_opt_class();
        NSStringFromClass(v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v107 = v58;
        v108 = 2112;
        v109 = v59;
        _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);

      }
      v51 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v54 = (objc_class *)objc_opt_class();
      NSStringFromClass(v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v107 = v55;
      v108 = 2112;
      v109 = v56;
      _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);

    }
    v51 = 0;
  }

LABEL_29:
  return v51;
}

- (NSDate)triggerDate
{
  return self->_triggerDate;
}

- (RTLocation)locationOfTrigger
{
  return self->_locationOfTrigger;
}

- (unint64_t)triggerType
{
  return self->_triggerType;
}

- (NSData)safetyCacheKey
{
  return self->_safetyCacheKey;
}

- (NSData)safetyCacheToken
{
  return self->_safetyCacheToken;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (unint64_t)destinationType
{
  return self->_destinationType;
}

- (BOOL)isSOSTrigger
{
  return self->_isSOSTrigger;
}

- (int64_t)lowPowerModeWarningState
{
  return self->_lowPowerModeWarningState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safetyCacheToken, 0);
  objc_storeStrong((id *)&self->_safetyCacheKey, 0);
  objc_storeStrong((id *)&self->_locationOfTrigger, 0);
  objc_storeStrong((id *)&self->_triggerDate, 0);
}

@end
