@implementation SMSessionStartMessage

- (SMSessionStartMessage)initWithSessionID:(id)a3 invitationTokenDict:(id)a4 sessionType:(unint64_t)a5 estimatedEndTime:(id)a6 coarseEstimatedEndTime:(id)a7 destinationType:(unint64_t)a8 destinationMapItem:(id)a9 lowPowerModeWarningState:(int64_t)a10
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  SMSessionStartMessage *v24;

  v16 = (void *)MEMORY[0x24BDBCE60];
  v17 = a9;
  v18 = a7;
  v19 = a6;
  v20 = a4;
  v21 = a3;
  objc_msgSend(v16, "now");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SMSessionStartMessage initWithDate:messageID:sessionID:invitationTokenDict:sessionType:estimatedEndTime:coarseEstimatedEndTime:destinationType:destinationMapItem:lowPowerModeWarningState:](self, "initWithDate:messageID:sessionID:invitationTokenDict:sessionType:estimatedEndTime:coarseEstimatedEndTime:destinationType:destinationMapItem:lowPowerModeWarningState:", v22, v23, v21, v20, a5, v19, v18, a8, v17, a10);

  return v24;
}

- (SMSessionStartMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 invitationToken:(id)a6 sessionType:(unint64_t)a7 estimatedEndTime:(id)a8 coarseEstimatedEndTime:(id)a9 destinationType:(unint64_t)a10 destinationMapItem:(id)a11 lowPowerModeWarningState:(int64_t)a12
{
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  SMSessionStartMessage *v26;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v30 = CFSTR("receiverHandle");
  v31[0] = a6;
  v17 = (void *)MEMORY[0x24BDBCE70];
  v18 = a11;
  v19 = a9;
  v20 = a8;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[SMSessionStartMessage initWithDate:messageID:sessionID:invitationTokenDict:sessionType:estimatedEndTime:coarseEstimatedEndTime:destinationType:destinationMapItem:lowPowerModeWarningState:](self, "initWithDate:messageID:sessionID:invitationTokenDict:sessionType:estimatedEndTime:coarseEstimatedEndTime:destinationType:destinationMapItem:lowPowerModeWarningState:", v24, v23, v22, v25, a7, v20, v19, a10, v18, a12);
  return v26;
}

- (SMSessionStartMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 invitationTokenDict:(id)a6 sessionType:(unint64_t)a7 estimatedEndTime:(id)a8 coarseEstimatedEndTime:(id)a9 destinationType:(unint64_t)a10 destinationMapItem:(id)a11 lowPowerModeWarningState:(int64_t)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SMSessionStartMessage *v23;
  SMSessionStartMessage *v24;
  SMSessionStartMessage *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;
  uint8_t buf[16];

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v33 = a6;
  v32 = a8;
  v21 = a9;
  v22 = a11;
  if (!v18)
  {
    v26 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: date";
LABEL_20:
    _os_log_error_impl(&dword_245521000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
    goto LABEL_21;
  }
  if (!v19)
  {
    v26 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: messageID";
    goto LABEL_20;
  }
  if (!v20)
  {
    v26 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: sessionID";
    goto LABEL_20;
  }
  if (!v33)
  {
    v26 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: invitationTokenDict";
    goto LABEL_20;
  }
  if (!v32)
  {
    v26 = v22;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "Invalid parameter not satisfying: estimatedEndTime";
      goto LABEL_20;
    }
LABEL_21:

    v25 = 0;
    goto LABEL_22;
  }
  v31 = v22;
  if (a7)
  {
    v34.receiver = self;
    v34.super_class = (Class)SMSessionStartMessage;
    v23 = -[SMMessage initWithDate:messageID:sessionID:](&v34, sel_initWithDate_messageID_sessionID_, v18, v19, v20);
    v24 = v23;
    if (v23)
    {
      objc_storeStrong((id *)&v23->_invitationTokenDict, a6);
      v24->_sessionType = a7;
      objc_storeStrong((id *)&v24->_estimatedEndTime, a8);
      objc_storeStrong((id *)&v24->_coarseEstimatedEndTime, a9);
      v24->_destinationType = a10;
      objc_storeStrong((id *)&v24->_destinationMapItem, a11);
      v24->_lowPowerModeWarningState = a12;
    }
    self = v24;
    v25 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionType != SMSessionTypeUnknown", buf, 2u);
    }

    v25 = 0;
  }
  v26 = v31;
LABEL_22:

  return v25;
}

- (SMSessionStartMessage)initWithDictionary:(id)a3
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
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  int i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  void *v48;
  char *v49;
  objc_class *v50;
  void *v51;
  char *v52;
  const char *v53;
  NSObject *v54;
  uint32_t v55;
  SMSessionStartMessage *v56;
  NSObject *v58;
  objc_class *v59;
  void *v60;
  char *v61;
  void *v62;
  int v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  objc_class *v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  int v76;
  NSObject *v77;
  void *v78;
  void *v79;
  objc_class *v80;
  void *v81;
  char *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  SMSessionStartMessage *v87;
  objc_class *v88;
  void *v89;
  char *v90;
  objc_class *v91;
  void *v92;
  char *v93;
  objc_class *v94;
  void *v95;
  char *v96;
  objc_class *v97;
  void *v98;
  char *v99;
  objc_class *v100;
  void *v101;
  char *v102;
  objc_class *v103;
  void *v104;
  char *v105;
  objc_class *v106;
  void *v107;
  char *v108;
  objc_class *v109;
  void *v110;
  NSObject *v111;
  NSObject *v112;
  NSObject *v113;
  void *v114;
  SMSessionStartMessage *v115;
  const char *aSelector;
  char *aSelectora;
  NSObject *log;
  NSObject *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  int v123;
  os_log_t v124;
  NSObject *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  NSObject *v131;
  uint8_t buf[4];
  void *v133;
  __int16 v134;
  char *v135;
  __int16 v136;
  _BYTE v137[10];
  void *v138;
  __int16 v139;
  void *v140;
  uint64_t v141;

  v141 = *MEMORY[0x24BDAC8D0];
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
    goto LABEL_38;
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
LABEL_38:
      v56 = 0;
      goto LABEL_39;
    }
    v50 = (objc_class *)objc_opt_class();
    NSStringFromClass(v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v52 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v133 = v51;
    v134 = 2112;
    v135 = v52;
    v136 = 1024;
    *(_DWORD *)v137 = objc_msgSend((id)objc_opt_class(), "messageType");
    *(_WORD *)&v137[4] = 1024;
    *(_DWORD *)&v137[6] = v8;
    v53 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v54 = v12;
    v55 = 34;
LABEL_59:
    _os_log_error_impl(&dword_245521000, v54, OS_LOG_TYPE_ERROR, v53, buf, v55);

    goto LABEL_38;
  }
  objc_msgSend(v6, "valueForKey:", CFSTR("interfaceVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if (v10 != 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    v71 = (objc_class *)objc_opt_class();
    NSStringFromClass(v71);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v52 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v133 = v51;
    v134 = 2112;
    v135 = v52;
    v136 = 1024;
    *(_DWORD *)v137 = v10;
    v53 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v54 = v12;
    v55 = 28;
    goto LABEL_59;
  }
  objc_msgSend(v6, "valueForKey:", CFSTR("sendDate"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v80 = (objc_class *)objc_opt_class();
      NSStringFromClass(v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v82 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v133 = v81;
      v134 = 2112;
      v135 = v82;
      _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);

    }
    v56 = 0;
    goto LABEL_87;
  }
  aSelector = a2;
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
      v88 = (objc_class *)objc_opt_class();
      NSStringFromClass(v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v90 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v133 = v89;
      v134 = 2112;
      v135 = v90;
      _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);

    }
    v56 = 0;
    goto LABEL_86;
  }
  v18 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(v6, "valueForKey:", CFSTR("sessionID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "initWithUUIDString:", v19);

  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v91 = (objc_class *)objc_opt_class();
      NSStringFromClass(v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v93 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v133 = v92;
      v134 = 2112;
      v135 = v93;
      _os_log_error_impl(&dword_245521000, log, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);

    }
    v56 = 0;
    goto LABEL_85;
  }
  v113 = v20;
  v114 = v17;
  v111 = v12;
  v112 = v14;
  v115 = self;
  log = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  for (i = 0; ; ++i)
  {
    v129 = v22;
    if (!i)
      break;
    v126 = v21;
    v27 = (i + 1);
    objc_msgSend(CFSTR("receiverHandle"), "stringByAppendingFormat:", CFSTR("%d"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", v28);
    v127 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("sharingInvitationData"), "stringByAppendingFormat:", CFSTR("%d"), v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v6;
    objc_msgSend(v6, "valueForKey:", v29);
    v31 = objc_claimAutoreleasedReturnValue();

    v128 = (void *)v31;
    v123 = i;
    if (v31)
      v32 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v31, 0);
    else
      v32 = 0;
    v36 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(CFSTR("shareURL"), "stringByAppendingFormat:", CFSTR("%d"), (i + 1));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "valueForKey:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "URLWithString:", v38);
    v39 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("participantID"), "stringByAppendingFormat:", CFSTR("%d"), v27);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)v39;
    objc_msgSend(v30, "valueForKey:", v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (__CFString *)v127;
    v35 = (void *)v32;
    if (!v127 || !v32 || !v39 || !v42)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v58 = objc_claimAutoreleasedReturnValue();
      self = v115;
      v21 = v126;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        v59 = (objc_class *)objc_opt_class();
        NSStringFromClass(v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v61 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v133 = v60;
        v134 = 2112;
        v135 = v61;
        v136 = 1024;
        *(_DWORD *)v137 = v123;
        _os_log_impl(&dword_245521000, v58, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,finished parsing invitation tokens,found %d tokens", buf, 0x1Cu);

      }
      v6 = v30;
      objc_msgSend(v30, "valueForKey:", CFSTR("sessionType"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "intValue");

      if (v63)
      {
        objc_msgSend(v30, "valueForKey:", CFSTR("estimatedEndTime"));
        v64 = objc_claimAutoreleasedReturnValue();
        v20 = v113;
        v17 = v114;
        v131 = v64;
        if (v64)
        {
          v65 = (void *)MEMORY[0x24BDBCE60];
          -[NSObject doubleValue](v64, "doubleValue");
          objc_msgSend(v65, "dateWithTimeIntervalSince1970:");
          v124 = (os_log_t)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "valueForKey:", CFSTR("coarseEstimatedEndTime"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v66;
          if (v66)
          {
            v68 = (void *)MEMORY[0x24BDBCE60];
            objc_msgSend(v66, "doubleValue");
            objc_msgSend(v68, "dateWithTimeIntervalSince1970:");
            v69 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v73 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
            {
              v103 = (objc_class *)objc_opt_class();
              NSStringFromClass(v103);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v105 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v133 = v104;
              v134 = 2112;
              v135 = v105;
              _os_log_error_impl(&dword_245521000, v73, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing coarseEstimatedEndTimeNumber", buf, 0x16u);

            }
            v69 = 0;
          }
          objc_msgSend(v6, "valueForKey:", CFSTR("sessionDestinationType"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v74;
          v121 = (void *)v69;
          v122 = v67;
          if (v74)
          {
            v76 = objc_msgSend(v74, "intValue");
            objc_msgSend(v6, "valueForKey:", CFSTR("sessionDestinationMapItem"));
            v77 = objc_claimAutoreleasedReturnValue();
            v120 = v63;
            if (v77)
              v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v77, 0);
            else
              v78 = 0;
            v83 = v76;
            objc_msgSend(v6, "valueForKey:", CFSTR("lowPowerModeWarningState"));
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v84;
            if (v84)
            {
              v86 = (int)objc_msgSend(v84, "intValue");
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v119 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
              {
                v109 = (objc_class *)objc_opt_class();
                NSStringFromClass(v109);
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(aSelector);
                aSelectora = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v133 = v110;
                v134 = 2112;
                v135 = aSelectora;
                _os_log_error_impl(&dword_245521000, v119, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing lowPowerModeWarningState, OK to proceed", buf, 0x16u);

              }
              v86 = 0;
            }
            v79 = v121;
            v87 = -[SMSessionStartMessage initWithDate:messageID:sessionID:invitationTokenDict:sessionType:estimatedEndTime:coarseEstimatedEndTime:destinationType:destinationMapItem:lowPowerModeWarningState:](v115, "initWithDate:messageID:sessionID:invitationTokenDict:sessionType:estimatedEndTime:coarseEstimatedEndTime:destinationType:destinationMapItem:lowPowerModeWarningState:", v112, v114, v113, log, v120, v124, v121, v83, v78, v86);

            self = v87;
            v56 = v87;
            v21 = v126;
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v77 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            {
              v106 = (objc_class *)objc_opt_class();
              NSStringFromClass(v106);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v108 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v133 = v107;
              v134 = 2112;
              v135 = v108;
              _os_log_error_impl(&dword_245521000, v77, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing destinationType", buf, 0x16u);

              self = v115;
              v21 = v126;

              v56 = 0;
            }
            else
            {
              v56 = 0;
              self = v115;
            }
            v79 = v121;
          }

          v20 = v113;
          v17 = v114;
          v72 = v124;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            v100 = (objc_class *)objc_opt_class();
            NSStringFromClass(v100);
            v125 = v72;
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v102 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v133 = v101;
            v134 = 2112;
            v135 = v102;
            _os_log_error_impl(&dword_245521000, v125, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing estimatedEndTimeNumber", buf, 0x16u);

            v72 = v125;
          }
          v56 = 0;
        }

        v70 = (void *)v127;
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v131 = objc_claimAutoreleasedReturnValue();
        v20 = v113;
        v17 = v114;
        v70 = (void *)v127;
        if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
        {
          v97 = (objc_class *)objc_opt_class();
          NSStringFromClass(v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v99 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v133 = v98;
          v134 = 2112;
          v135 = v99;
          _os_log_error_impl(&dword_245521000, v131, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionType", buf, 0x16u);

          v70 = (void *)v127;
        }
        v56 = 0;
      }
      goto LABEL_84;
    }
    v22 = v42;
    v23 = (void *)v39;
    v24 = v128;
    v21 = v126;
    v6 = v30;
    i = v123;
LABEL_27:
    v45 = objc_msgSend(objc_alloc(MEMORY[0x24BDB9080]), "initWithSharingInvitationData:shareURL:participantID:", v35, v23, v22);

    if (v45)
    {
      -[NSObject setObject:forKey:](log, "setObject:forKey:", v45, v25);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v130 = v22;
        v49 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v133 = v48;
        v134 = 2112;
        v135 = v49;
        _os_log_fault_impl(&dword_245521000, v46, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,Invitation token creation failed", buf, 0x16u);

        v22 = v130;
      }

    }
    v21 = (void *)v45;
  }
  objc_msgSend(v6, "valueForKey:", CFSTR("receiverHandle"));
  v33 = objc_claimAutoreleasedReturnValue();

  if (v33)
    v25 = (__CFString *)v33;
  else
    v25 = CFSTR("receiverHandle");
  objc_msgSend(v6, "valueForKey:", CFSTR("sharingInvitationData"));
  v34 = objc_claimAutoreleasedReturnValue();

  v128 = (void *)v34;
  if (v34)
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v34, 0);
  else
    v35 = 0;
  v43 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v6, "valueForKey:", CFSTR("shareURL"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "URLWithString:", v44);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForKey:", CFSTR("participantID"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35 && v41 && v42)
  {
    v22 = v42;
    v23 = v41;
    v24 = v128;
    goto LABEL_27;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v131 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
  {
    v94 = (objc_class *)objc_opt_class();
    NSStringFromClass(v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v96 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v133 = v95;
    v134 = 2112;
    v135 = v96;
    v136 = 2112;
    *(_QWORD *)v137 = v35;
    *(_WORD *)&v137[8] = 2112;
    v138 = v41;
    v139 = 2112;
    v140 = v42;
    _os_log_error_impl(&dword_245521000, v131, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing details for Invitation token creation,sharingInvitationData:%@,shareURL:%@,participantID:%@", buf, 0x34u);

  }
  v56 = 0;
  v70 = v25;
  self = v115;
  v20 = v113;
  v17 = v114;
LABEL_84:

  v12 = v111;
  v14 = v112;
LABEL_85:

LABEL_86:
LABEL_87:

LABEL_39:
  return v56;
}

- (id)outputToDictionary
{
  void *v3;
  void *v4;
  id v5;
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
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[3];
  int v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SMSessionStartMessage;
  -[SMMessage outputToDictionary](&v27, sel_outputToDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  -[SMSessionStartMessage invitationTokenDict](self, "invitationTokenDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __43__SMSessionStartMessage_outputToDictionary__block_invoke;
  v22 = &unk_25166E050;
  v24 = v25;
  v5 = v3;
  v23 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v19);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionStartMessage sessionType](self, "sessionType", v19, v20, v21, v22));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("sessionType"));

  v7 = (void *)MEMORY[0x24BDD16E0];
  -[SMSessionStartMessage estimatedEndTime](self, "estimatedEndTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("estimatedEndTime"));

  -[SMSessionStartMessage coarseEstimatedEndTime](self, "coarseEstimatedEndTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD16E0];
    -[SMSessionStartMessage coarseEstimatedEndTime](self, "coarseEstimatedEndTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    objc_msgSend(v11, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("coarseEstimatedEndTime"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionStartMessage destinationType](self, "destinationType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("sessionDestinationType"));

  -[SMSessionStartMessage destinationMapItem](self, "destinationMapItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SMSessionStartMessage destinationMapItem](self, "destinationMapItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("sessionDestinationMapItem"));

  }
  _Block_object_dispose(v25, 8);
  return v5;
}

void __43__SMSessionStartMessage_outputToDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
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
  id v27;

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v5 = *(void **)(a1 + 32);
  v6 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = a3;
  v8 = a2;
  if ((_DWORD)v6 == 1)
  {
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("receiverHandle"));

    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "sharingInvitationData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("sharingInvitationData"));

    v12 = *(void **)(a1 + 32);
    objc_msgSend(v7, "shareURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("shareURL"));

    v15 = *(void **)(a1 + 32);
    objc_msgSend(v7, "participantID");
    v27 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setObject:forKey:", v27, CFSTR("participantID"));
  }
  else
  {
    objc_msgSend(CFSTR("receiverHandle"), "stringByAppendingFormat:", CFSTR("%d"), v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, v16);

    v17 = *(void **)(a1 + 32);
    objc_msgSend(v7, "sharingInvitationData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "base64EncodedStringWithOptions:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("sharingInvitationData"), "stringByAppendingFormat:", CFSTR("%d"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v19, v20);

    v21 = *(void **)(a1 + 32);
    objc_msgSend(v7, "shareURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "absoluteString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("shareURL"), "stringByAppendingFormat:", CFSTR("%d"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v23, v24);

    v25 = *(void **)(a1 + 32);
    objc_msgSend(v7, "participantID");
    v27 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("participantID"), "stringByAppendingFormat:", CFSTR("%d"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v27, v26);

  }
}

- (SMSessionStartMessage)initWithURL:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  int v28;
  id v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  int v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  int v42;
  NSObject *v43;
  int v44;
  void *v45;
  int v46;
  id v47;
  void *v48;
  int v49;
  id v50;
  void *v51;
  int v52;
  id v53;
  void *v54;
  int v55;
  NSObject *v56;
  void *v57;
  int v58;
  id v59;
  uint64_t v60;
  SMSessionStartMessage *v61;
  int v62;
  int v63;
  int v64;
  NSObject *v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  int v69;
  __CFString *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  NSObject *v89;
  objc_class *v90;
  void *v91;
  void *v92;
  objc_class *v94;
  void *v95;
  void *v96;
  const char *v97;
  NSObject *v98;
  uint32_t v99;
  objc_class *v100;
  void *v101;
  void *v102;
  objc_class *v103;
  void *v104;
  void *v105;
  objc_class *v106;
  int v107;
  objc_class *v108;
  void *v109;
  void *v110;
  const char *v111;
  objc_class *v112;
  NSObject *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  objc_class *v117;
  void *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  objc_class *v124;
  void *v125;
  void *v126;
  const char *v127;
  NSObject *v128;
  int v129;
  void *v130;
  NSObject *v131;
  objc_class *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  NSObject *v136;
  objc_class *v137;
  objc_class *v138;
  void *v139;
  void *v140;
  objc_class *v141;
  objc_class *v142;
  void *v143;
  void *v144;
  objc_class *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  NSObject *v150;
  void *v151;
  id v152;
  NSObject *v153;
  NSObject *v154;
  void *v155;
  void *v156;
  void *v157;
  NSObject *v158;
  id v159;
  id v160;
  id v161;
  NSObject *v162;
  id v163;
  void *v166;
  void *v167;
  NSObject *log;
  uint64_t v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  uint8_t buf[4];
  void *v179;
  __int16 v180;
  uint64_t v181;
  __int16 v182;
  _BYTE v183[10];
  void *v184;
  __int16 v185;
  void *v186;
  _BYTE v187[128];
  uint64_t v188;

  v188 = *MEMORY[0x24BDAC8D0];
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
    v61 = 0;
    goto LABEL_96;
  }
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
  v5 = v4;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v103 = (objc_class *)objc_opt_class();
      NSStringFromClass(v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v179 = v104;
      v180 = 2112;
      v181 = (uint64_t)v105;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing url components", buf, 0x16u);

      v5 = 0;
    }
    v61 = 0;
    goto LABEL_95;
  }
  -[NSObject queryItems](v4, "queryItems");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v112 = (objc_class *)objc_opt_class();
      NSStringFromClass(v112);
      v113 = v5;
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v179 = v114;
      v180 = 2112;
      v181 = (uint64_t)v115;
      _os_log_error_impl(&dword_245521000, log, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing queryItems", buf, 0x16u);

      v5 = v113;
    }
    v61 = 0;
    goto LABEL_94;
  }
  v150 = v5;
  v152 = v3;
  v163 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v161 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v160 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v159 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v174 = 0u;
  v175 = 0u;
  v176 = 0u;
  v177 = 0u;
  v153 = v6;
  v7 = v6;
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v174, v187, 16);
  if (!v8)
  {
    v154 = 0;
    v155 = 0;
    v151 = 0;
    v156 = 0;
    v157 = 0;
    v149 = 0;
    v170 = 0;
    v172 = 0;
    v173 = 0;
    v166 = 0;
    log = 0;
    goto LABEL_58;
  }
  v9 = v8;
  v154 = 0;
  v155 = 0;
  v151 = 0;
  v156 = 0;
  v157 = 0;
  v149 = 0;
  v170 = 0;
  v172 = 0;
  v173 = 0;
  v166 = 0;
  log = 0;
  v10 = *(_QWORD *)v175;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v175 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * v11);
      objc_msgSend(v12, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "name");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v179 = v31;
          v180 = 2112;
          v181 = (uint64_t)v32;
          v182 = 2112;
          *(_QWORD *)v183 = v33;
          _os_log_error_impl(&dword_245521000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,queryItem missing value,queryName,%@", buf, 0x20u);

        }
        goto LABEL_14;
      }
      objc_msgSend(v12, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("sendDate"));

      if (v15)
      {
        v16 = v13;

        v173 = v16;
        goto LABEL_23;
      }
      objc_msgSend(v12, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("messageID"));

      if (v19)
      {
        v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v13);

        v172 = (void *)v20;
      }
      else
      {
        objc_msgSend(v12, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("sessionID"));

        if (v22)
        {
          v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v13);

          v170 = (void *)v23;
        }
        else
        {
          objc_msgSend(v12, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("messageType"));

          if (v25)
          {
            v26 = v13;

            log = v26;
          }
          else
          {
            objc_msgSend(v12, "name");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("interfaceVersion"));

            if (v28)
            {
              v29 = v13;

              v166 = v29;
            }
            else
            {
              objc_msgSend(v12, "name");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "hasPrefix:", CFSTR("receiverHandle"));

              objc_msgSend(v12, "name");
              v36 = objc_claimAutoreleasedReturnValue();
              v17 = v36;
              if (v35)
              {
                v37 = v163;
                goto LABEL_33;
              }
              v38 = -[NSObject hasPrefix:](v36, "hasPrefix:", CFSTR("sharingInvitationData"));

              objc_msgSend(v12, "name");
              v39 = objc_claimAutoreleasedReturnValue();
              v17 = v39;
              if (v38)
              {
                v37 = v161;
                goto LABEL_33;
              }
              v40 = -[NSObject hasPrefix:](v39, "hasPrefix:", CFSTR("shareURL"));

              objc_msgSend(v12, "name");
              v41 = objc_claimAutoreleasedReturnValue();
              v17 = v41;
              if (v40)
              {
                v37 = v160;
                goto LABEL_33;
              }
              v42 = -[NSObject hasPrefix:](v41, "hasPrefix:", CFSTR("participantID"));

              objc_msgSend(v12, "name");
              v43 = objc_claimAutoreleasedReturnValue();
              v17 = v43;
              if (v42)
              {
                v37 = v159;
LABEL_33:
                objc_msgSend(v37, "setObject:forKey:", v13, v17);
LABEL_14:

                goto LABEL_23;
              }
              v44 = -[NSObject isEqualToString:](v43, "isEqualToString:", CFSTR("sessionType"));

              if (v44)
              {
                v149 = (int)objc_msgSend(v13, "intValue");
              }
              else
              {
                objc_msgSend(v12, "name");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("estimatedEndTime"));

                if (v46)
                {
                  v47 = v13;

                  v157 = v47;
                }
                else
                {
                  objc_msgSend(v12, "name");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("coarseEstimatedEndTime"));

                  if (v49)
                  {
                    v50 = v13;

                    v156 = v50;
                  }
                  else
                  {
                    objc_msgSend(v12, "name");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("sessionDestinationType"));

                    if (v52)
                    {
                      v53 = v13;

                      v155 = v53;
                    }
                    else
                    {
                      objc_msgSend(v12, "name");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      v55 = objc_msgSend(v54, "isEqualToString:", CFSTR("sessionDestinationMapItem"));

                      if (v55)
                      {
                        v56 = v13;

                        v154 = v56;
                      }
                      else
                      {
                        objc_msgSend(v12, "name");
                        v57 = (void *)objc_claimAutoreleasedReturnValue();
                        v58 = objc_msgSend(v57, "isEqualToString:", CFSTR("lowPowerModeWarningState"));

                        if (v58)
                        {
                          v59 = v13;

                          v151 = v59;
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
LABEL_23:

      ++v11;
    }
    while (v9 != v11);
    v60 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v174, v187, 16);
    v9 = v60;
  }
  while (v60);
LABEL_58:

  v62 = -[NSObject intValue](log, "intValue");
  if (!log || objc_msgSend((id)objc_opt_class(), "messageType") != v62)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v68 = objc_claimAutoreleasedReturnValue();
    v3 = v152;
    v6 = v153;
    v65 = v154;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v106 = (objc_class *)objc_opt_class();
      NSStringFromClass(v106);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = objc_msgSend((id)objc_opt_class(), "messageType");
      *(_DWORD *)buf = 138413058;
      v179 = v95;
      v180 = 2112;
      v181 = (uint64_t)v96;
      v182 = 1024;
      *(_DWORD *)v183 = v107;
      *(_WORD *)&v183[4] = 1024;
      *(_DWORD *)&v183[6] = v62;
      v97 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
      v98 = v68;
      v99 = 34;
      goto LABEL_102;
    }
LABEL_92:
    v61 = 0;
    v5 = v150;
    goto LABEL_93;
  }
  v63 = objc_msgSend(v166, "intValue");
  v64 = v63;
  v3 = v152;
  v6 = v153;
  v65 = v154;
  if (!v166 || v63 != 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v94 = (objc_class *)objc_opt_class();
      NSStringFromClass(v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v179 = v95;
      v180 = 2112;
      v181 = (uint64_t)v96;
      v182 = 1024;
      *(_DWORD *)v183 = v64;
      v97 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
      v98 = v68;
      v99 = 28;
LABEL_102:
      _os_log_error_impl(&dword_245521000, v98, OS_LOG_TYPE_ERROR, v97, buf, v99);

      goto LABEL_92;
    }
    goto LABEL_92;
  }
  if (!v173)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v100 = (objc_class *)objc_opt_class();
      NSStringFromClass(v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v179 = v101;
      v180 = 2112;
      v181 = (uint64_t)v102;
      _os_log_error_impl(&dword_245521000, v68, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);

    }
    goto LABEL_92;
  }
  v66 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v173, "doubleValue");
  objc_msgSend(v66, "dateWithTimeIntervalSince1970:");
  v67 = objc_claimAutoreleasedReturnValue();
  v68 = v67;
  if (!v172)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v162 = objc_claimAutoreleasedReturnValue();
    v5 = v150;
    if (!os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
    {
LABEL_112:
      v61 = 0;
      goto LABEL_136;
    }
    v108 = (objc_class *)objc_opt_class();
    NSStringFromClass(v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v179 = v109;
    v180 = 2112;
    v181 = (uint64_t)v110;
    v111 = "#SafetyCache,%@,%@,missing messageID";
LABEL_138:
    _os_log_error_impl(&dword_245521000, v162, OS_LOG_TYPE_ERROR, v111, buf, 0x16u);

    v5 = v150;
    goto LABEL_112;
  }
  if (!v170)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v162 = objc_claimAutoreleasedReturnValue();
    v5 = v150;
    if (!os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    v137 = (objc_class *)objc_opt_class();
    NSStringFromClass(v137);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v179 = v109;
    v180 = 2112;
    v181 = (uint64_t)v110;
    v111 = "#SafetyCache,%@,%@,missing sessionID";
    goto LABEL_138;
  }
  v158 = v67;
  v162 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v69 = 0;
  v70 = 0;
  v71 = 0;
  v72 = 0;
  v73 = 0;
  v74 = 0;
  objc_msgSend(v163, "valueForKey:", CFSTR("receiverHandle"));
LABEL_68:
  v79 = objc_claimAutoreleasedReturnValue();

  if (v79)
    v70 = (__CFString *)v79;
  else
    v70 = CFSTR("receiverHandle");
  objc_msgSend(v161, "valueForKey:", CFSTR("sharingInvitationData"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
    v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v77, 0);
  else
    v78 = 0;
  v86 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v160, "valueForKey:", CFSTR("shareURL"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "URLWithString:", v87);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v159, "valueForKey:", CFSTR("participantID"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78 && v83 && v85)
  {
    v71 = v77;
    v72 = v83;
    v73 = v85;
    while (1)
    {
      v88 = objc_msgSend(objc_alloc(MEMORY[0x24BDB9080]), "initWithSharingInvitationData:shareURL:participantID:", v78, v72, v73);

      if (v88)
      {
        -[NSObject setObject:forKey:](v162, "setObject:forKey:", v88, v70);
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_FAULT))
        {
          v90 = (objc_class *)objc_opt_class();
          NSStringFromClass(v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v179 = v91;
          v180 = 2112;
          v181 = (uint64_t)v92;
          _os_log_fault_impl(&dword_245521000, v89, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,Invitation token creation failed", buf, 0x16u);

        }
      }

      ++v69;
      v74 = (void *)v88;
      if (!v69)
      {
        objc_msgSend(v163, "valueForKey:", CFSTR("receiverHandle"));
        goto LABEL_68;
      }
      v171 = (void *)v88;
      objc_msgSend(CFSTR("receiverHandle"), "stringByAppendingFormat:", CFSTR("%d"), (v69 + 1));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "valueForKey:", v75);
      v169 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(CFSTR("sharingInvitationData"), "stringByAppendingFormat:", CFSTR("%d"), (v69 + 1));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "valueForKey:", v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      v78 = v77
          ? (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v77, 0)
          : 0;
      v80 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(CFSTR("shareURL"), "stringByAppendingFormat:", CFSTR("%d"), (v69 + 1));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "valueForKey:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "URLWithString:", v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(CFSTR("participantID"), "stringByAppendingFormat:", CFSTR("%d"), (v69 + 1));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "valueForKey:", v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      v70 = (__CFString *)v169;
      if (!v169 || !v78 || !v83 || !v85)
        break;
      v71 = v77;
      v72 = v83;
      v73 = v85;
      v74 = v171;
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v116 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
    {
      v117 = (objc_class *)objc_opt_class();
      NSStringFromClass(v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v179 = v118;
      v180 = 2112;
      v181 = (uint64_t)v119;
      v182 = 1024;
      *(_DWORD *)v183 = v69;
      _os_log_impl(&dword_245521000, v116, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,finished parsing invitation tokens,found %d tokens", buf, 0x1Cu);

    }
    v68 = v158;
    if (v149)
    {
      v3 = v152;
      if (v157)
      {
        v120 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v157, "doubleValue");
        objc_msgSend(v120, "dateWithTimeIntervalSince1970:");
        v121 = objc_claimAutoreleasedReturnValue();
        if (v156)
        {
          v122 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v156, "doubleValue");
          objc_msgSend(v122, "dateWithTimeIntervalSince1970:");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v128 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
          {
            v142 = (objc_class *)objc_opt_class();
            NSStringFromClass(v142);
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v179 = v143;
            v180 = 2112;
            v181 = (uint64_t)v144;
            _os_log_error_impl(&dword_245521000, v128, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing coarseEstimatedEndTimeString", buf, 0x16u);

            v68 = v158;
          }

          v123 = 0;
        }
        if (v155)
        {
          v129 = objc_msgSend(v155, "intValue");
          v130 = v151;
          if (!v151)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v131 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
            {
              v132 = (objc_class *)objc_opt_class();
              NSStringFromClass(v132);
              v167 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v133 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v179 = v167;
              v180 = 2112;
              v181 = v133;
              v134 = (void *)v133;
              _os_log_impl(&dword_245521000, v131, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,missing lowPowerModeWarningState", buf, 0x16u);

            }
            v130 = 0;
          }
          v135 = (int)objc_msgSend(v130, "intValue");
          v136 = v154;
          if (v154)
            v136 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v154, 0);
          v148 = v135;
          v68 = v158;
          v61 = -[SMSessionStartMessage initWithDate:messageID:sessionID:invitationTokenDict:sessionType:estimatedEndTime:coarseEstimatedEndTime:destinationType:destinationMapItem:lowPowerModeWarningState:](self, "initWithDate:messageID:sessionID:invitationTokenDict:sessionType:estimatedEndTime:coarseEstimatedEndTime:destinationType:destinationMapItem:lowPowerModeWarningState:", v158, v172, v170, v162, v149, v121, v123, v129, v136, v148);
          self = v61;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v136 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
          {
            v145 = (objc_class *)objc_opt_class();
            NSStringFromClass(v145);
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v179 = v146;
            v180 = 2112;
            v181 = (uint64_t)v147;
            _os_log_error_impl(&dword_245521000, v136, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing destinationType", buf, 0x16u);

            v68 = v158;
          }
          v61 = 0;
        }

        v70 = (__CFString *)v169;
        goto LABEL_135;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v121 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
      {
LABEL_119:
        v61 = 0;
        goto LABEL_135;
      }
      v141 = (objc_class *)objc_opt_class();
      NSStringFromClass(v141);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v179 = v125;
      v180 = 2112;
      v181 = (uint64_t)v126;
      v127 = "#SafetyCache,%@,%@,missing estimatedEndTimeString";
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v121 = objc_claimAutoreleasedReturnValue();
      v3 = v152;
      if (!os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        goto LABEL_119;
      v124 = (objc_class *)objc_opt_class();
      NSStringFromClass(v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v179 = v125;
      v180 = 2112;
      v181 = (uint64_t)v126;
      v127 = "#SafetyCache,%@,%@,missing sessionType";
    }
    _os_log_error_impl(&dword_245521000, v121, OS_LOG_TYPE_ERROR, v127, buf, 0x16u);

    goto LABEL_119;
  }
  v171 = v74;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v121 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
  {
    v138 = (objc_class *)objc_opt_class();
    NSStringFromClass(v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v179 = v139;
    v180 = 2112;
    v181 = (uint64_t)v140;
    v182 = 2112;
    *(_QWORD *)v183 = v78;
    *(_WORD *)&v183[8] = 2112;
    v184 = v83;
    v185 = 2112;
    v186 = v85;
    _os_log_error_impl(&dword_245521000, v121, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing details for Invitation token creation,sharingInvitationData:%@,shareURL:%@,participantID:%@", buf, 0x34u);

  }
  v61 = 0;
  v3 = v152;
  v68 = v158;
LABEL_135:

  v5 = v150;
  v6 = v153;
  v65 = v154;
LABEL_136:

LABEL_93:
LABEL_94:

LABEL_95:
LABEL_96:

  return v61;
}

- (id)outputToURLComponents
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
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
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *, void *);
  void *v41;
  id v42;
  _QWORD *v43;
  _QWORD v44[3];
  int v45;
  objc_super v46;

  v3 = objc_alloc_init(MEMORY[0x24BDD1808]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v46.receiver = self;
  v46.super_class = (Class)SMSessionStartMessage;
  -[SMMessage outputToURLComponents](&v46, sel_outputToURLComponents);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v45 = 0;
  -[SMSessionStartMessage invitationTokenDict](self, "invitationTokenDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = MEMORY[0x24BDAC760];
  v39 = 3221225472;
  v40 = __46__SMSessionStartMessage_outputToURLComponents__block_invoke;
  v41 = &unk_25166E050;
  v43 = v44;
  v8 = v4;
  v42 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v38);

  v9 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionStartMessage sessionType](self, "sessionType", v38, v39, v40, v41));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("sessionType"), v11);
  objc_msgSend(v8, "addObject:", v12);

  v13 = (void *)MEMORY[0x24BDD16E0];
  -[SMSessionStartMessage estimatedEndTime](self, "estimatedEndTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  objc_msgSend(v13, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("estimatedEndTime"), v16);
  objc_msgSend(v8, "addObject:", v17);

  -[SMSessionStartMessage coarseEstimatedEndTime](self, "coarseEstimatedEndTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x24BDD16E0];
    -[SMSessionStartMessage coarseEstimatedEndTime](self, "coarseEstimatedEndTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSince1970");
    objc_msgSend(v19, "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("coarseEstimatedEndTime"), v22);
    objc_msgSend(v8, "addObject:", v23);

  }
  v24 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionStartMessage destinationType](self, "destinationType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v24, "initWithName:value:", CFSTR("sessionDestinationType"), v26);
  objc_msgSend(v8, "addObject:", v27);

  -[SMSessionStartMessage destinationMapItem](self, "destinationMapItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = objc_alloc(MEMORY[0x24BDD1838]);
    -[SMSessionStartMessage destinationMapItem](self, "destinationMapItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "base64EncodedStringWithOptions:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v29, "initWithName:value:", CFSTR("sessionDestinationMapItem"), v31);
    objc_msgSend(v8, "addObject:", v32);

  }
  v33 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SMSessionStartMessage lowPowerModeWarningState](self, "lowPowerModeWarningState"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringValue");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v33, "initWithName:value:", CFSTR("lowPowerModeWarningState"), v35);
  objc_msgSend(v8, "addObject:", v36);

  objc_msgSend(v3, "setQueryItems:", v8);
  _Block_object_dispose(v44, 8);

  return v3;
}

void __46__SMSessionStartMessage_outputToURLComponents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v5 = *(void **)(a1 + 32);
  v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = (objc_class *)MEMORY[0x24BDD1838];
  v8 = a3;
  v9 = a2;
  v10 = [v7 alloc];
  v11 = v10;
  if (v6 == 1)
  {
    v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("receiverHandle"), v9);

    objc_msgSend(v5, "addObject:", v12);
    v13 = *(void **)(a1 + 32);
    v14 = objc_alloc(MEMORY[0x24BDD1838]);
    objc_msgSend(v8, "sharingInvitationData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("sharingInvitationData"), v16);
    objc_msgSend(v13, "addObject:", v17);

    v18 = *(void **)(a1 + 32);
    v19 = objc_alloc(MEMORY[0x24BDD1838]);
    objc_msgSend(v8, "shareURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "absoluteString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v19, "initWithName:value:", CFSTR("shareURL"), v21);
    objc_msgSend(v18, "addObject:", v22);

    v23 = *(void **)(a1 + 32);
    v24 = objc_alloc(MEMORY[0x24BDD1838]);
    objc_msgSend(v8, "participantID");
    v43 = (id)objc_claimAutoreleasedReturnValue();

    v25 = (void *)objc_msgSend(v24, "initWithName:value:", CFSTR("participantID"), v43);
    objc_msgSend(v23, "addObject:", v25);
  }
  else
  {
    objc_msgSend(CFSTR("receiverHandle"), "stringByAppendingFormat:", CFSTR("%d"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v11, "initWithName:value:", v26, v9);

    objc_msgSend(v5, "addObject:", v27);
    v28 = *(void **)(a1 + 32);
    v29 = objc_alloc(MEMORY[0x24BDD1838]);
    objc_msgSend(CFSTR("sharingInvitationData"), "stringByAppendingFormat:", CFSTR("%d"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharingInvitationData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "base64EncodedStringWithOptions:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v29, "initWithName:value:", v30, v32);
    objc_msgSend(v28, "addObject:", v33);

    v34 = *(void **)(a1 + 32);
    v35 = objc_alloc(MEMORY[0x24BDD1838]);
    objc_msgSend(CFSTR("shareURL"), "stringByAppendingFormat:", CFSTR("%d"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shareURL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "absoluteString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v35, "initWithName:value:", v36, v38);
    objc_msgSend(v34, "addObject:", v39);

    v40 = *(void **)(a1 + 32);
    v41 = objc_alloc(MEMORY[0x24BDD1838]);
    objc_msgSend(CFSTR("participantID"), "stringByAppendingFormat:", CFSTR("%d"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "participantID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = (void *)objc_msgSend(v41, "initWithName:value:", v43, v25);
    objc_msgSend(v40, "addObject:", v42);

  }
}

+ (unint64_t)messageType
{
  return 1;
}

- (id)summaryText
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  unint64_t v7;
  void *v8;

  switch(-[SMSessionStartMessage sessionType](self, "sessionType"))
  {
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("START_MESSAGE_TIME_BOUND_SUMMARY_FORMAT");
      v6 = CFSTR("Check In: Timer Started");
      break;
    case 2uLL:
      v7 = -[SMSessionStartMessage destinationType](self, "destinationType");
      switch(v7)
      {
        case 3uLL:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = v3;
          v5 = CFSTR("START_MESSAGE_SCHOOL_SUMMARY_FORMAT");
          v6 = CFSTR("Check In: School");
          break;
        case 2uLL:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = v3;
          v5 = CFSTR("START_MESSAGE_WORK_SUMMARY_FORMAT");
          v6 = CFSTR("Check In: Work");
          break;
        case 1uLL:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = v3;
          v5 = CFSTR("START_MESSAGE_HOME_SUMMARY_FORMAT");
          v6 = CFSTR("Check In: Home");
          break;
        default:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = v3;
          v5 = CFSTR("START_MESSAGE_DEFAULT_DESTINATION_SUMMARY_FORMAT");
          v6 = CFSTR("Check In: Destination");
          break;
      }
      break;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("START_MESSAGE_ROUNDTRIP_DEFAULT_SUMMARY_FORMAT");
      v6 = CFSTR("Check In: Round trip");
      break;
    case 4uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("START_MESSAGE_WORKOUT_BOUND_SUMMARY_FORMAT");
      v6 = CFSTR("Check In: Workout Started");
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("CHECK_IN_MESSAGE");
      v6 = CFSTR("Check In");
      break;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  _BYTE *v19;
  objc_super v20;
  _BYTE buf[24];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMSessionStartMessage encodeWithCoder:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 620;
      _os_log_error_impl(&dword_245521000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }

  }
  v20.receiver = self;
  v20.super_class = (Class)SMSessionStartMessage;
  -[SMMessage encodeWithCoder:](&v20, sel_encodeWithCoder_, v4);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v22 = 0;
  -[SMSessionStartMessage invitationTokenDict](self, "invitationTokenDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __41__SMSessionStartMessage_encodeWithCoder___block_invoke;
  v17 = &unk_25166E050;
  v19 = buf;
  v7 = v4;
  v18 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v14);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[SMSessionStartMessage sessionType](self, "sessionType", v14, v15, v16, v17));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v8, CFSTR("sessionType"));

  -[SMSessionStartMessage estimatedEndTime](self, "estimatedEndTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v9, CFSTR("estimatedEndTime"));

  -[SMSessionStartMessage coarseEstimatedEndTime](self, "coarseEstimatedEndTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v10, CFSTR("coarseEstimatedEndTime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[SMSessionStartMessage destinationType](self, "destinationType"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v11, CFSTR("sessionDestinationType"));

  -[SMSessionStartMessage destinationMapItem](self, "destinationMapItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = v12 == 0;

  if ((v11 & 1) == 0)
  {
    -[SMSessionStartMessage destinationMapItem](self, "destinationMapItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v13, CFSTR("sessionDestinationMapItem"));

  }
  _Block_object_dispose(buf, 8);

}

void __41__SMSessionStartMessage_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
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
  id v23;

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v5 = *(void **)(a1 + 32);
  v6 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = a3;
  v8 = a2;
  if ((_DWORD)v6 == 1)
  {
    objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("receiverHandle"));

    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "sharingInvitationData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v10, CFSTR("sharingInvitationData"));

    v11 = *(void **)(a1 + 32);
    objc_msgSend(v7, "shareURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v12, CFSTR("shareURL"));

    v13 = *(void **)(a1 + 32);
    objc_msgSend(v7, "participantID");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "encodeObject:forKey:", v23, CFSTR("participantID"));
  }
  else
  {
    objc_msgSend(CFSTR("receiverHandle"), "stringByAppendingFormat:", CFSTR("%d"), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v8, v14);

    v15 = *(void **)(a1 + 32);
    objc_msgSend(v7, "sharingInvitationData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("sharingInvitationData"), "stringByAppendingFormat:", CFSTR("%d"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v16, v17);

    v18 = *(void **)(a1 + 32);
    objc_msgSend(v7, "shareURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("shareURL"), "stringByAppendingFormat:", CFSTR("%d"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v19, v20);

    v21 = *(void **)(a1 + 32);
    objc_msgSend(v7, "participantID");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("participantID"), "stringByAppendingFormat:", CFSTR("%d"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "encodeObject:forKey:", v23, v22);

  }
}

- (SMSessionStartMessage)initWithCoder:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  int i;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  int v43;
  SMSessionStartMessage *v44;
  NSObject *v46;
  objc_class *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  int v51;
  NSObject *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  objc_class *v59;
  objc_class *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  objc_class *v64;
  objc_class *v65;
  void *v66;
  void *v67;
  objc_class *v68;
  void *v69;
  void *v70;
  objc_class *v71;
  void *v72;
  void *v73;
  void *v74;
  objc_class *v75;
  void *v76;
  void *v77;
  objc_class *v78;
  void *v79;
  void *v80;
  objc_class *v81;
  void *v82;
  void *v83;
  const char *aSelector;
  NSObject *v85;
  NSObject *v86;
  NSObject *v87;
  SMSessionStartMessage *v88;
  NSObject *log;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  NSObject *v95;
  void *v96;
  void *v97;
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  _BYTE v103[10];
  void *v104;
  __int16 v105;
  void *v106;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
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
    goto LABEL_32;
  }
  v7 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("messageType"));
  if (objc_msgSend((id)objc_opt_class(), "messageType") != v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_32:
      v44 = 0;
      goto LABEL_33;
    }
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v99 = v38;
    v100 = 2112;
    v101 = v39;
    v102 = 1024;
    *(_DWORD *)v103 = objc_msgSend((id)objc_opt_class(), "messageType");
    *(_WORD *)&v103[4] = 1024;
    *(_DWORD *)&v103[6] = v7;
    v40 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v41 = v9;
    v42 = 34;
LABEL_54:
    _os_log_error_impl(&dword_245521000, v41, OS_LOG_TYPE_ERROR, v40, buf, v42);

    goto LABEL_32;
  }
  v8 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("interfaceVersion"));
  if (v8 != 1)
  {
    v43 = v8;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v59 = (objc_class *)objc_opt_class();
    NSStringFromClass(v59);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v99 = v38;
    v100 = 2112;
    v101 = v39;
    v102 = 1024;
    *(_DWORD *)v103 = v43;
    v40 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v41 = v9;
    v42 = 28;
    goto LABEL_54;
  }
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sendDate"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v60 = (objc_class *)objc_opt_class();
      NSStringFromClass(v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v99 = v61;
      v100 = 2112;
      v101 = v62;
      _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);

    }
    v44 = 0;
    goto LABEL_74;
  }
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageID"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v65 = (objc_class *)objc_opt_class();
      NSStringFromClass(v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v99 = v66;
      v100 = 2112;
      v101 = v67;
      _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);

    }
    v44 = 0;
    goto LABEL_73;
  }
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v68 = (objc_class *)objc_opt_class();
      NSStringFromClass(v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v99 = v69;
      v100 = 2112;
      v101 = v70;
      _os_log_error_impl(&dword_245521000, log, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);

    }
    v44 = 0;
    goto LABEL_72;
  }
  aSelector = a2;
  v85 = v9;
  v86 = v11;
  v87 = v10;
  v88 = self;
  log = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  for (i = 0; ; ++i)
  {
    v19 = objc_opt_class();
    if (!i)
      break;
    v96 = v13;
    v20 = (i + 1);
    objc_msgSend(CFSTR("receiverHandle"), "stringByAppendingFormat:", CFSTR("%d"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v19, v21);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v23 = objc_opt_class();
    objc_msgSend(CFSTR("sharingInvitationData"), "stringByAppendingFormat:", CFSTR("%d"), v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_opt_class();
    objc_msgSend(CFSTR("shareURL"), "stringByAppendingFormat:", CFSTR("%d"), v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_opt_class();
    objc_msgSend(CFSTR("participantID"), "stringByAppendingFormat:", CFSTR("%d"), v20);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22 || !v25 || !v28 || !v31)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v46 = objc_claimAutoreleasedReturnValue();
      self = v88;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v99 = v48;
        v100 = 2112;
        v101 = v49;
        v102 = 1024;
        *(_DWORD *)v103 = i;
        _os_log_impl(&dword_245521000, v46, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,finished parsing invitation tokens,found %d tokens", buf, 0x1Cu);

      }
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionType"));
      v50 = objc_claimAutoreleasedReturnValue();
      v95 = v50;
      if (v50)
      {
        v51 = -[NSObject intValue](v50, "intValue");
        objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("estimatedEndTime"));
        v94 = objc_claimAutoreleasedReturnValue();
        if (v94)
        {
          objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coarseEstimatedEndTime"));
          v52 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionDestinationType"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v53;
          if (v53)
          {
            v93 = v51;
            v92 = (int)objc_msgSend(v53, "intValue");
            objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionDestinationMapItem"));
            v55 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lowPowerModeWarningState"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = v56;
            if (v56)
            {
              v58 = (int)objc_msgSend(v56, "intValue");
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
              {
                v64 = (objc_class *)objc_opt_class();
                NSStringFromClass(v64);
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(aSelector);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v99 = v91;
                v100 = 2112;
                v101 = v90;
                _os_log_impl(&dword_245521000, v63, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,missing lowPowerModeWarningState, OK to proceed", buf, 0x16u);

              }
              v58 = 0;
            }
            v44 = -[SMSessionStartMessage initWithDate:messageID:sessionID:invitationTokenDict:sessionType:estimatedEndTime:coarseEstimatedEndTime:destinationType:destinationMapItem:lowPowerModeWarningState:](v88, "initWithDate:messageID:sessionID:invitationTokenDict:sessionType:estimatedEndTime:coarseEstimatedEndTime:destinationType:destinationMapItem:lowPowerModeWarningState:", v85, v87, v86, log, v93, v94, v52, v92, v55, v58);

            self = v44;
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              v81 = (objc_class *)objc_opt_class();
              NSStringFromClass(v81);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v99 = v82;
              v100 = 2112;
              v101 = v83;
              _os_log_error_impl(&dword_245521000, v55, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing destinationType", buf, 0x16u);

              self = v88;
            }
            v44 = 0;
          }

        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            v78 = (objc_class *)objc_opt_class();
            NSStringFromClass(v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v99 = v79;
            v100 = 2112;
            v101 = v80;
            _os_log_error_impl(&dword_245521000, v52, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing estimatedEndTime", buf, 0x16u);

          }
          v44 = 0;
        }

        v9 = v85;
        v13 = v96;
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v94 = objc_claimAutoreleasedReturnValue();
        v13 = v96;
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        {
          v75 = (objc_class *)objc_opt_class();
          NSStringFromClass(v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v99 = v76;
          v100 = 2112;
          v101 = v77;
          _os_log_error_impl(&dword_245521000, v94, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionType", buf, 0x16u);

          v13 = v96;
        }
        v44 = 0;
        v9 = v85;
      }

      goto LABEL_71;
    }
    v14 = v31;
    v15 = v28;
    v16 = v25;
    v17 = v22;
    v13 = v96;
LABEL_21:
    v33 = objc_msgSend(objc_alloc(MEMORY[0x24BDB9080]), "initWithSharingInvitationData:shareURL:participantID:", v16, v15, v14);

    if (v33)
    {
      -[NSObject setObject:forKey:](log, "setObject:forKey:", v33, v17);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v99 = v36;
        v100 = 2112;
        v101 = v97;
        _os_log_fault_impl(&dword_245521000, v34, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,Invitation token creation failed", buf, 0x16u);

      }
    }
    v13 = (void *)v33;
  }
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", v19, CFSTR("receiverHandle"));
  v32 = objc_claimAutoreleasedReturnValue();

  if (v32)
    v17 = (__CFString *)v32;
  else
    v17 = CFSTR("receiverHandle");
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingInvitationData"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareURL"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("participantID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25 && v28 && v31)
  {
    v14 = v31;
    v15 = v28;
    v16 = v25;
    goto LABEL_21;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v95 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
  {
    v71 = (objc_class *)objc_opt_class();
    NSStringFromClass(v71);
    v72 = v13;
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v99 = v73;
    v100 = 2112;
    v101 = v74;
    v102 = 2112;
    *(_QWORD *)v103 = v25;
    *(_WORD *)&v103[8] = 2112;
    v104 = v28;
    v105 = 2112;
    v106 = v31;
    _os_log_error_impl(&dword_245521000, v95, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing details for Invitation token creation,sharingInvitationData:%@,shareURL:%@,participantID:%@", buf, 0x34u);

    v13 = v72;
  }
  v44 = 0;
  v22 = v17;
  self = v88;
  v9 = v85;
LABEL_71:

  v12 = v86;
  v10 = v87;
LABEL_72:

LABEL_73:
LABEL_74:

LABEL_33:
  return v44;
}

- (NSDictionary)invitationTokenDict
{
  return self->_invitationTokenDict;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (NSDate)estimatedEndTime
{
  return self->_estimatedEndTime;
}

- (NSDate)coarseEstimatedEndTime
{
  return self->_coarseEstimatedEndTime;
}

- (unint64_t)destinationType
{
  return self->_destinationType;
}

- (NSData)destinationMapItem
{
  return self->_destinationMapItem;
}

- (int64_t)lowPowerModeWarningState
{
  return self->_lowPowerModeWarningState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMapItem, 0);
  objc_storeStrong((id *)&self->_coarseEstimatedEndTime, 0);
  objc_storeStrong((id *)&self->_estimatedEndTime, 0);
  objc_storeStrong((id *)&self->_invitationTokenDict, 0);
}

@end
