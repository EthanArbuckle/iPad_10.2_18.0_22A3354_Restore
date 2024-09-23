@implementation PDSRequestQueue

- (PDSRequestQueue)initWithMessageDelivery:(id)a3 userTracker:(id)a4 queue:(id)a5 pushTokenBlock:(id)a6 entryStoreBlock:(id)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  PDSRequestQueue *v19;
  PDSRequestQueue *v20;
  uint64_t v21;
  id pushTokenBlock;
  uint64_t v23;
  id entryStoreBlock;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRequestQueue.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageDelivery"));

    if (v15)
    {
LABEL_3:
      if (v17)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRequestQueue.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userTracker"));

  if (v17)
  {
LABEL_4:
    if (v16)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRequestQueue.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v18)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRequestQueue.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pushTokenBlock"));

  if (!v16)
    goto LABEL_12;
LABEL_5:
  if (v18)
    goto LABEL_6;
LABEL_13:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSRequestQueue.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entryStoreBlock"));

LABEL_6:
  v31.receiver = self;
  v31.super_class = (Class)PDSRequestQueue;
  v19 = -[PDSRequestQueue init](&v31, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_messageDelivery, a3);
    objc_storeStrong((id *)&v20->_userTracker, a4);
    v21 = MEMORY[0x2199F31C4](v17);
    pushTokenBlock = v20->_pushTokenBlock;
    v20->_pushTokenBlock = (id)v21;

    v20->_authRetries = 0;
    objc_storeStrong((id *)&v20->_queue, a5);
    v23 = MEMORY[0x2199F31C4](v18);
    entryStoreBlock = v20->_entryStoreBlock;
    v20->_entryStoreBlock = (id)v23;

    v20->_messageTimeout = 36000;
  }

  return v20;
}

- (BOOL)enqueueRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;

  v4 = a3;
  -[PDSRequestQueue delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_4;
  -[PDSRequestQueue inflightRequest](self, "inflightRequest");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  v7 = (void *)v6;
  -[PDSRequestQueue inflightRequest](self, "inflightRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToSet:", v10);

  if ((v11 & 1) != 0)
  {
LABEL_4:
    v12 = 0;
  }
  else
  {
LABEL_5:
    -[PDSRequestQueue setQueuedRequest:](self, "setQueuedRequest:", v4);
    -[PDSRequestQueue _dequeueIfNeeded](self, "_dequeueIfNeeded");
    v12 = 1;
  }

  return v12;
}

- (void)_dequeueIfNeeded
{
  void *v3;
  id v4;

  -[PDSRequestQueue inflightRequest](self, "inflightRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PDSRequestQueue queuedRequest](self, "queuedRequest");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PDSRequestQueue setQueuedRequest:](self, "setQueuedRequest:", 0);
      -[PDSRequestQueue _flightRequest:](self, "_flightRequest:", v4);
    }

  }
}

- (id)_deviceInfo
{
  id v3;
  void *v4;
  PDSProtoMapEntry *v5;
  PDSProtoMapEntry *v6;
  void *v7;
  PDSProtoMapEntry *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[PDSRequestQueue _machineID](self, "_machineID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(PDSProtoMapEntry);
  -[PDSProtoMapEntry setKey:](v5, "setKey:", CFSTR("mid"));
  -[PDSProtoMapEntry setValue:](v5, "setValue:", v4);
  v6 = objc_alloc_init(PDSProtoMapEntry);
  -[PDSProtoMapEntry setKey:](v6, "setKey:", CFSTR("hwv"));
  -[PDSRequestQueue _hwVersion](self, "_hwVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSProtoMapEntry setValue:](v6, "setValue:", v7);

  v8 = objc_alloc_init(PDSProtoMapEntry);
  -[PDSProtoMapEntry setKey:](v8, "setKey:", CFSTR("osv"));
  -[PDSRequestQueue _osVersion](self, "_osVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSProtoMapEntry setValue:](v8, "setValue:", v9);

  objc_msgSend(v3, "addObject:", v5);
  objc_msgSend(v3, "addObject:", v6);
  objc_msgSend(v3, "addObject:", v8);

  return v3;
}

- (id)_machineID
{
  void *v2;
  id v3;
  void *v4;
  __CFString *v5;
  id v7;

  if (_machineID_onceToken != -1)
    dispatch_once(&_machineID_onceToken, &__block_literal_global_1);
  v7 = 0;
  objc_msgSend((id)_machineID_anisetteProvisioningController, "anisetteDataWithError:", &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  v4 = v3;
  if (v3)
    NSLog(CFSTR("anisetteDataWithError failure: %@"), v3);
  objc_msgSend(v2, "machineID");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v5, "length"))
  {

    v5 = CFSTR("Unknown");
  }

  return v5;
}

void __29__PDSRequestQueue__machineID__block_invoke()
{
  id v0;
  void *v1;

  _machineID___AKAnisetteProvisioningControllerClass = MEMORY[0x2199F2F00](CFSTR("AKAnisetteProvisioningController"), CFSTR("AuthKit"));
  v0 = objc_alloc_init((Class)_machineID___AKAnisetteProvisioningControllerClass);
  v1 = (void *)_machineID_anisetteProvisioningController;
  _machineID_anisetteProvisioningController = (uint64_t)v0;

}

- (id)_osVersion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BE50880], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "productName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE50880], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE50880], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "productBuildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@,%@,%@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_hwVersion
{
  void *v2;
  __CFString *v3;

  objc_msgSend(MEMORY[0x24BE50880], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v3, "length"))
  {

    v3 = CFSTR("Unknown");
  }
  return v3;
}

- (void)_flightRequest:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PDSProtoUserPushTokenRegRequest *v19;
  PDSProtoTopic *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
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
  PDSProtoUserAuth *v39;
  void *v40;
  int v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  int v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void (**v66)(_QWORD, _QWORD);
  void *v67;
  _BOOL4 v68;
  PDSProtoUserPushToken *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  NSObject *v86;
  void *v87;
  _BOOL4 v88;
  NSObject *v89;
  void *v90;
  NSObject *v91;
  void *v92;
  uint64_t v93;
  void (**v94)(_QWORD, _QWORD);
  void *v95;
  void *v96;
  _BOOL4 v97;
  void *v98;
  NSObject *v99;
  const __CFString *v100;
  const __CFString *v101;
  const __CFString *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  char v118;
  void *v119;
  char v120;
  uint64_t v121;
  void *v122;
  PDSProtoBatchRegisterReq *v123;
  void *v124;
  id v125;
  int v126;
  id v127;
  id v128;
  void *v129;
  id v130;
  PDSRegisterMessage *obj;
  void *v133;
  PDSProtoGSTokenAuth *v134;
  id v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  id v139;
  _QWORD v140[4];
  id v141;
  PDSRequestQueue *v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _BYTE buf[12];
  __int16 v153;
  id v154;
  _BYTE v155[128];
  uint64_t v156;

  v156 = *MEMORY[0x24BDAC8D0];
  v127 = a3;
  pds_defaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215E64000, v3, OS_LOG_TYPE_DEFAULT, "PDSRequestQueue: constructing request to flight", buf, 2u);
  }

  pds_defaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v127, "entries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_215E64000, v4, OS_LOG_TYPE_DEFAULT, "%lu total entries", buf, 0xCu);

  }
  objc_msgSend(v127, "entries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSRequestQueue _logEntries:](self, "_logEntries:", v7);

  -[PDSRequestQueue setInflightRequest:](self, "setInflightRequest:", v127);
  v123 = objc_alloc_init(PDSProtoBatchRegisterReq);
  v139 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v130 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v125 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[PDSRequestQueue delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend(v8, "ttlForRequest:", v127);

  -[PDSRequestQueue _deviceInfo](self, "_deviceInfo");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = 0u;
  v149 = 0u;
  v150 = 0u;
  v148 = 0u;
  objc_msgSend(v127, "entries");
  obj = (PDSRegisterMessage *)objc_claimAutoreleasedReturnValue();
  v138 = -[PDSRegisterMessage countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v148, v155, 16);
  if (v138)
  {
    v126 = 0;
    v118 = 0;
    v120 = 0;
    v137 = *(_QWORD *)v149;
    v119 = (void *)*MEMORY[0x24BE08720];
    v124 = (void *)*MEMORY[0x24BE08718];
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v149 != v137)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * v9);
        objc_msgSend(v10, "user");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "userID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "objectForKeyedSubscript:", v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(v10, "user");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "userID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "setObject:forKeyedSubscript:", v13, v15);

        }
        v16 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v10, "registration");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithChar:", objc_msgSend(v17, "pushEnvironment"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v18);
        v19 = (PDSProtoUserPushTokenRegRequest *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
LABEL_13:
          if (objc_msgSend(v10, "state") != 2)
          {
            v20 = objc_alloc_init(PDSProtoTopic);
            objc_msgSend(v10, "registration");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "topicString");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              objc_msgSend(v10, "registration");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "qualifierString");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v24 == 0;

              if (!v25)
              {
                objc_msgSend(v10, "registration");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "topicString");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[PDSProtoTopic setName:](v20, "setName:", v27);

                objc_msgSend(v10, "registration");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "qualifierString");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[PDSProtoTopic setQualifier:](v20, "setQualifier:", v29);

                -[PDSProtoUserPushTokenRegRequest addTopic:](v19, "addTopic:", v20);
                ++v126;
                goto LABEL_32;
              }
            }
            else
            {

            }
            pds_defaultLog();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_215E64000, v43, OS_LOG_TYPE_DEFAULT, "Missing required info for entry! Not including entry in request", buf, 2u);
            }

LABEL_32:
          }

          goto LABEL_34;
        }
        objc_msgSend(v10, "user");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "userID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v10, "registration");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "numberWithChar:", objc_msgSend(v34, "pushEnvironment"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v33) = objc_msgSend(v32, "containsObject:", v35);

        if ((_DWORD)v33)
        {
          pds_defaultLog();
          v20 = (PDSProtoTopic *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v20->super.super, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_215E64000, &v20->super.super, OS_LOG_TYPE_DEFAULT, "The user/env for this entry has been omitted from the request. Skipping entry", buf, 2u);
          }
          v19 = 0;
          goto LABEL_32;
        }
        -[PDSRequestQueue userTracker](self, "userTracker");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v147 = 0;
        objc_msgSend(v10, "user");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = 0;
        objc_msgSend(v36, "tokenAndIdentifier:forUser:withError:", &v147, v37, &v146);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = v147;
        v136 = v146;

        if (!v136 && v133 && v135)
        {
          objc_msgSend(v10, "user");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "setObject:forKeyedSubscript:", v38, v135);

          v134 = objc_alloc_init(PDSProtoGSTokenAuth);
          -[PDSProtoGSTokenAuth setGsAuthToken:](v134, "setGsAuthToken:", v133);
          v39 = objc_alloc_init(PDSProtoUserAuth);
          -[PDSProtoUserAuth setUserauthOneof:](v39, "setUserauthOneof:", 1);
          -[PDSProtoUserAuth setGsAuthToken:](v39, "setGsAuthToken:", v134);
          objc_msgSend(v10, "registration");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "pushEnvironment");

          v42 = v124;
          if (v41 == 1)
            goto LABEL_27;
          if (v41)
          {
            v128 = 0;
          }
          else
          {
            v42 = v119;
LABEL_27:
            v128 = v42;
          }
          -[PDSRequestQueue pushTokenBlock](self, "pushTokenBlock");
          v66 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v66)[2](v66, v128);
          v129 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v129, "__imHexString");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v67, "length") == 0;

          if (v68)
          {
            pds_defaultLog();
            v78 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v128;
              _os_log_impl(&dword_215E64000, v78, OS_LOG_TYPE_DEFAULT, "Missing push token for environment %@! Omitting from request", buf, 0xCu);
            }

            objc_msgSend(v10, "user");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "userID");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "objectForKeyedSubscript:", v80);
            v69 = (PDSProtoUserPushToken *)objc_claimAutoreleasedReturnValue();

            if (!v69)
            {
              v69 = (PDSProtoUserPushToken *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
              objc_msgSend(v10, "user");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "userID");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v130, "setObject:forKeyedSubscript:", v69, v82);

            }
            v83 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v10, "registration");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "numberWithChar:", objc_msgSend(v74, "pushEnvironment"));
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            -[PDSProtoUserPushToken addObject:](v69, "addObject:", v84);

            v19 = 0;
            v58 = 3;
            v120 = 1;
          }
          else
          {
            v69 = objc_alloc_init(PDSProtoUserPushToken);
            -[PDSProtoUserPushToken setUserId:](v69, "setUserId:", v135);
            objc_msgSend(v129, "__imHexString");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            -[PDSProtoUserPushToken setPushToken:](v69, "setPushToken:", v70);

            -[PDSProtoUserPushToken setUserAuth:](v69, "setUserAuth:", v39);
            pds_defaultLog();
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_215E64000, v71, OS_LOG_TYPE_DEFAULT, "Adding UserPushToken to request:", buf, 2u);
            }

            -[PDSRequestQueue _logProtoUserPushToken:](self, "_logProtoUserPushToken:", v69);
            v19 = objc_alloc_init(PDSProtoUserPushTokenRegRequest);
            -[PDSProtoUserPushTokenRegRequest setUserPushToken:](v19, "setUserPushToken:", v69);
            -[PDSProtoUserPushTokenRegRequest setDeviceInfos:](v19, "setDeviceInfos:", v122);
            -[PDSProtoUserPushTokenRegRequest setTtl:](v19, "setTtl:", v121);
            v72 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v10, "registration");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "numberWithChar:", objc_msgSend(v73, "pushEnvironment"));
            v74 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "user");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "userID");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v139, "objectForKeyedSubscript:", v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "setObject:forKeyedSubscript:", v19, v74);

            -[PDSProtoBatchRegisterReq addUserPushTokenRegRequests:](v123, "addUserPushTokenRegRequests:", v19);
            v58 = 0;
          }

          goto LABEL_60;
        }
        pds_defaultLog();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v136;
          v153 = 2112;
          v154 = v135;
          _os_log_impl(&dword_215E64000, v44, OS_LOG_TYPE_DEFAULT, "Issue obtaining token. Error: %@ -- DSID: %@", buf, 0x16u);
        }

        objc_msgSend(v136, "domain");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        if (v45 != (void *)*MEMORY[0x24BE6E550])
        {

LABEL_48:
          objc_msgSend(v10, "user");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDSRequestQueue _reAuthAndContinueWithRequest:forUser:](self, "_reAuthAndContinueWithRequest:forUser:", v127, v59);

          v60 = objc_alloc(MEMORY[0x24BE4FE78]);
          v61 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v127, "requestInfo");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "numberWithUnsignedInteger:", objc_msgSend(v62, "regReason"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "requestInfo");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "heartbeatDate");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v134 = (PDSProtoGSTokenAuth *)objc_msgSend(v60, "initWithFailureReason:registrationReason:heartbeatDate:", CFSTR("Auth issue - potentially recoverable"), v63, v65);

          objc_msgSend(MEMORY[0x24BE4FE10], "defaultLogger");
          v39 = (PDSProtoUserAuth *)objc_claimAutoreleasedReturnValue();
          -[PDSProtoUserAuth logMetric:](v39, "logMetric:", v134);
          v19 = 0;
          v58 = 1;
          goto LABEL_60;
        }
        v47 = objc_msgSend(v136, "code") == -102;

        if (!v47)
          goto LABEL_48;
        pds_defaultLog();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215E64000, v48, OS_LOG_TYPE_DEFAULT, "User is non-existent.  Skipping, removing dead entries for user, and continuing with request", buf, 2u);
        }

        objc_msgSend(v10, "user");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "userID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "objectForKeyedSubscript:", v50);
        v134 = (PDSProtoGSTokenAuth *)objc_claimAutoreleasedReturnValue();

        if (!v134)
        {
          v134 = (PDSProtoGSTokenAuth *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
          objc_msgSend(v10, "user");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "userID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "setObject:forKeyedSubscript:", v134, v52);

        }
        v53 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v10, "registration");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "numberWithChar:", objc_msgSend(v54, "pushEnvironment"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDSProtoGSTokenAuth addObject:](v134, "addObject:", v55);

        objc_msgSend(v10, "user");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v145 = 0;
        -[PDSRequestQueue _removeDeadEntriesForUser:withError:](self, "_removeDeadEntriesForUser:withError:", v56, &v145);
        v39 = (PDSProtoUserAuth *)v145;

        pds_defaultLog();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v39;
          _os_log_impl(&dword_215E64000, v57, OS_LOG_TYPE_DEFAULT, "Removed entries for user with error: %@", buf, 0xCu);
        }

        v19 = 0;
        v58 = 3;
        v118 = 1;
LABEL_60:

        if (!v58)
          goto LABEL_13;

        if (v58 != 3)
          goto LABEL_88;
LABEL_34:
        ++v9;
      }
      while (v138 != v9);
      v85 = -[PDSRegisterMessage countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v148, v155, 16);
      v138 = v85;
      if (!v85)
        goto LABEL_66;
    }
  }
  v126 = 0;
  v118 = 0;
  v120 = 0;
LABEL_66:

  pds_defaultLog();
  v86 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v126;
    _os_log_impl(&dword_215E64000, v86, OS_LOG_TYPE_DEFAULT, "Total active entries to flight: %d", buf, 8u);
  }

  -[PDSProtoBatchRegisterReq userPushTokenRegRequests](v123, "userPushTokenRegRequests");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "count") == 0;

  if (v88)
  {
    pds_defaultLog();
    v99 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E64000, v99, OS_LOG_TYPE_DEFAULT, "RegRequest is empty! Aborting", buf, 2u);
    }

    -[PDSRequestQueue setInflightRequest:](self, "setInflightRequest:", 0);
    v100 = CFSTR("Missing Token");
    v101 = CFSTR("Missing user");
    if ((v120 & 1) != 0)
      v101 = CFSTR("Missing Token & User");
    else
      v100 = 0;
    if ((v118 & 1) != 0)
      v102 = v101;
    else
      v102 = v100;
    v103 = objc_alloc(MEMORY[0x24BE4FE78]);
    v104 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v127, "requestInfo");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "numberWithUnsignedInteger:", objc_msgSend(v105, "regReason"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "requestInfo");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "heartbeatDate");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    obj = (PDSRegisterMessage *)objc_msgSend(v103, "initWithFailureReason:registrationReason:heartbeatDate:", v102, v106, v108);

    objc_msgSend(MEMORY[0x24BE4FE10], "defaultLogger");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "logMetric:", obj);
  }
  else
  {
    obj = objc_alloc_init(PDSRegisterMessage);
    -[PDSProtoBatchRegisterReq setRequestTtl:](v123, "setRequestTtl:", v121);
    pds_defaultLog();
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v121;
      _os_log_impl(&dword_215E64000, v89, OS_LOG_TYPE_DEFAULT, "Using request ttl: %ld", buf, 0xCu);
    }

    -[PDSRegisterMessage setProtoRequest:](obj, "setProtoRequest:", v123);
    objc_msgSend(v127, "requestInfo");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDSRegisterMessage setRegReason:](obj, "setRegReason:", objc_msgSend(v90, "regReason"));

    pds_defaultLog();
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v127, "requestInfo");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend(v92, "regReason");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v93;
      _os_log_impl(&dword_215E64000, v91, OS_LOG_TYPE_DEFAULT, "Setting registration reason: %ld", buf, 0xCu);

    }
    -[IDSBaseMessage setTimeout:](obj, "setTimeout:", (double)self->_messageTimeout);
    -[PDSRequestQueue pushTokenBlock](self, "pushTokenBlock");
    v94 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v94[2](v94, *MEMORY[0x24BE08720]);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v95, "__imHexString");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "length") == 0;

    if (v97)
    {
      pds_defaultLog();
      v109 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215E64000, v109, OS_LOG_TYPE_DEFAULT, "Missing push token! Failing request", buf, 2u);
      }

      v110 = objc_alloc(MEMORY[0x24BE4FE78]);
      v111 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v127, "requestInfo");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "numberWithUnsignedInteger:", objc_msgSend(v112, "regReason"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "requestInfo");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "heartbeatDate");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = (void *)objc_msgSend(v110, "initWithFailureReason:registrationReason:heartbeatDate:", CFSTR("Could not fetch production push token"), v113, v115);

      objc_msgSend(MEMORY[0x24BE4FE10], "defaultLogger");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "logMetric:", v116);

      -[PDSRequestQueue setInflightRequest:](self, "setInflightRequest:", 0);
    }
    else
    {
      -[FTIDSMessage setPushToken:](obj, "setPushToken:", v95);
      IDSAssignPushIdentityToMessage();
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v140[0] = MEMORY[0x24BDAC760];
      v140[1] = 3221225472;
      v140[2] = __34__PDSRequestQueue__flightRequest___block_invoke;
      v140[3] = &unk_24D4A7108;
      objc_copyWeak(&v144, (id *)buf);
      v141 = v125;
      v142 = self;
      v143 = v127;
      -[IDSBaseMessage setCompletionBlock:](obj, "setCompletionBlock:", v140);
      -[PDSRequestQueue _cancelPendingRequests](self, "_cancelPendingRequests");
      -[PDSRequestQueue messageDelivery](self, "messageDelivery");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "sendMessage:", obj);

      objc_destroyWeak(&v144);
      objc_destroyWeak((id *)buf);
    }
  }

LABEL_88:
}

void __34__PDSRequestQueue__flightRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__PDSRequestQueue__flightRequest___block_invoke_2;
    block[3] = &unk_24D4A70E0;
    block[4] = v5;
    v11 = v3;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    v12 = v7;
    v13 = v8;
    v14 = v9;
    dispatch_async(v6, block);

  }
}

void __34__PDSRequestQueue__flightRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  PDSResponse *v9;
  void *v10;
  PDSResponse *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  PDSResponse *v19;
  uint64_t v20;
  void *v21;
  PDSResponse *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  PDSResponse *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setInflightRequest:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_dequeueIfNeeded");
  objc_msgSend(*(id *)(a1 + 40), "protoResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v26 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v25 = v2;
  objc_msgSend(v2, "userPushTokenRegResponses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(PDSResponse **)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[PDSResponse userPushToken](v9, "userPushToken");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "userId");
        v11 = (PDSResponse *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PDSResponse status](v9, "status"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v12);

            if (objc_msgSend(*(id *)(a1 + 56), "_isAuthIssue:", (int)-[PDSResponse status](v9, "status"))
              && (objc_msgSend(v26, "containsObject:", v12) & 1) == 0)
            {
              pds_defaultLog();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                v15 = -[PDSResponse status](v9, "status");
                *(_DWORD *)buf = 67109120;
                LODWORD(v32) = v15;
                _os_log_impl(&dword_215E64000, v14, OS_LOG_TYPE_DEFAULT, "Auth issue: %i", buf, 8u);
              }

              objc_msgSend(*(id *)(a1 + 32), "_reAuthAndContinueWithRequest:forUser:", *(_QWORD *)(a1 + 64), v12);
              objc_msgSend(v26, "addObject:", v12);
            }
          }
          else
          {
            pds_defaultLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v11;
              _os_log_impl(&dword_215E64000, v16, OS_LOG_TYPE_DEFAULT, "A matching user for: %@ not found", buf, 0xCu);
            }

          }
        }
        else
        {
          pds_defaultLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v9;
            _os_log_impl(&dword_215E64000, v12, OS_LOG_TYPE_DEFAULT, "alDSID not included in response: %@", buf, 0xCu);
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "ttlForRequest:", *(_QWORD *)(a1 + 64));

  if (objc_msgSend(v25, "hasResponseTtl"))
    v18 = objc_msgSend(v25, "responseTtl");
  v19 = [PDSResponse alloc];
  v20 = (int)objc_msgSend(v25, "status");
  v21 = (void *)objc_msgSend(v3, "copy");
  v22 = -[PDSResponse initWithStatus:statusByUser:ttl:](v19, "initWithStatus:statusByUser:ttl:", v20, v21, v18);

  pds_oversizedLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v22;
    _os_log_impl(&dword_215E64000, v23, OS_LOG_TYPE_DEFAULT, "PDSRequestQueue: response received: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "requestQueue:processedRequest:withResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), v22);

}

- (BOOL)_isAuthIssue:(int64_t)a3
{
  return ((unint64_t)(a3 - 6004) < 5) & (0x13u >> (a3 - 116));
}

- (void)_reAuthAndContinueWithRequest:(id)a3 forUser:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *queue;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _BYTE buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pds_defaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = -[PDSRequestQueue authRetries](self, "authRetries");
    _os_log_impl(&dword_215E64000, v8, OS_LOG_TYPE_DEFAULT, "Attempting Reauth - Current reauth attempts: %ld", buf, 0xCu);
  }

  -[PDSRequestQueue lastReauthAttempt](self, "lastReauthAttempt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDSRequestQueue lastReauthAttempt](self, "lastReauthAttempt");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    v13 = v12;

    if (v13 > 43200.0)
      -[PDSRequestQueue setAuthRetries:](self, "setAuthRetries:", 0);
  }
  if (-[PDSRequestQueue authRetries](self, "authRetries") > 2)
  {
    pds_defaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E64000, v18, OS_LOG_TYPE_DEFAULT, "No reauth attempts remaining", buf, 2u);
    }

  }
  else
  {
    -[PDSRequestQueue setAuthRetries:](self, "setAuthRetries:", -[PDSRequestQueue authRetries](self, "authRetries") + 1);
    -[PDSRequestQueue setInflightRequest:](self, "setInflightRequest:", v6);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDSRequestQueue setLastReauthAttempt:](self, "setLastReauthAttempt:", v14);

    pds_defaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E64000, v15, OS_LOG_TYPE_DEFAULT, "We have retries left, attempting reauth", buf, 2u);
    }

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v16 = dispatch_time(0, 10000000000 * -[PDSRequestQueue authRetries](self, "authRetries") - 10000000000);
    queue = self->_queue;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke;
    v19[3] = &unk_24D4A7180;
    v19[4] = self;
    v20 = v7;
    objc_copyWeak(&v22, (id *)buf);
    v21 = v6;
    dispatch_after(v16, queue, v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

}

void __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  NSObject *WeakRetained;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userTracker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v11 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke_2;
  v8[3] = &unk_24D4A7158;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "refreshCredentialsForUser:withError:completion:", v3, &v11, v8);
  v4 = v11;

  if (v4)
  {
    pds_defaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke_cold_1((uint64_t *)(a1 + 40), (uint64_t)v4, v5);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    -[NSObject setInflightRequest:](WeakRetained, "setInflightRequest:", 0);
  }
  else
  {
    pds_defaultLog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_215E64000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Kicked off refresh for user %@", buf, 0xCu);
    }
  }

  objc_destroyWeak(&v10);
}

void __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke_3;
    block[3] = &unk_24D4A7130;
    block[4] = v6;
    v9 = v4;
    v10 = *(id *)(a1 + 32);
    dispatch_async(v7, block);

  }
}

uint64_t __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setInflightRequest:", 0);
  pds_defaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_215E64000, v2, OS_LOG_TYPE_DEFAULT, "Credential refresh completed: error: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "enqueueRequest:", *(_QWORD *)(a1 + 48));
}

- (void)_cancelPendingRequests
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[PDSRequestQueue messageDelivery](self, "messageDelivery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasQueuedItems");

  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[PDSRequestQueue messageDelivery](self, "messageDelivery", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queuedMessages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[PDSRequestQueue messageDelivery](self, "messageDelivery");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "cancelMessage:", v11);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)_logEntries:(id)a3
{
  int v3;
  __CFString *v4;
  uint64_t i;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  __CFString *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a3;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v19)
  {
    v3 = 0;
    v18 = *(_QWORD *)v22;
    v4 = CFSTR("\n");
    do
    {
      for (i = 0; i != v19; ++i)
      {
        v20 = v3;
        v6 = v4;
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v7, "registration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "qualifierString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "registration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "topicString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "state");
        PDSStringForEntryState();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "user");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "userID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("\t PDSEntry: Qual:%@ Topic:%@ State:%@ User:%@\n"), v9, v11, v12, v14);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v20 < 5)
        {
          v3 = v20 + 1;
        }
        else
        {
          pds_oversizedLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v4;
            _os_log_impl(&dword_215E64000, v15, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }

          v3 = 0;
          v4 = CFSTR("\n");
        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v19);
    if (v3 >= 1)
    {
      pds_oversizedLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v4;
        _os_log_impl(&dword_215E64000, v16, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

    }
  }
  else
  {
    v4 = CFSTR("\n");
  }

}

- (void)_logProtoUserPushToken:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  pds_defaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "userId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pushToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_215E64000, v4, OS_LOG_TYPE_DEFAULT, "PDSUserPushTokenRequest: UserID:%@ PushToken:%@", (uint8_t *)&v7, 0x16u);

  }
}

- (void)_removeDeadEntriesForUser:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  void (**v8)(void);
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  pds_defaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_215E64000, v7, OS_LOG_TYPE_DEFAULT, "Removing all entries with state [remove] for user: %@", (uint8_t *)&v11, 0xCu);
  }

  -[PDSRequestQueue entryStoreBlock](self, "entryStoreBlock");
  v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v8[2]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "deleteEntriesForUser:withState:withError:", v6, 2, a4);
  }
  else
  {
    pds_defaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_215E64000, v10, OS_LOG_TYPE_DEFAULT, "EntryStore is nil! aborting", (uint8_t *)&v11, 2u);
    }

  }
}

- (PDSRequestQueueDelegate)delegate
{
  return (PDSRequestQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)messageTimeout
{
  return self->_messageTimeout;
}

- (void)setMessageTimeout:(int64_t)a3
{
  self->_messageTimeout = a3;
}

- (PDSRequest)inflightRequest
{
  return self->_inflightRequest;
}

- (void)setInflightRequest:(id)a3
{
  objc_storeStrong((id *)&self->_inflightRequest, a3);
}

- (PDSRequest)queuedRequest
{
  return self->_queuedRequest;
}

- (void)setQueuedRequest:(id)a3
{
  objc_storeStrong((id *)&self->_queuedRequest, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (FTMessageDelivery)messageDelivery
{
  return self->_messageDelivery;
}

- (void)setMessageDelivery:(id)a3
{
  objc_storeStrong((id *)&self->_messageDelivery, a3);
}

- (PDSUserTracker)userTracker
{
  return self->_userTracker;
}

- (void)setUserTracker:(id)a3
{
  objc_storeStrong((id *)&self->_userTracker, a3);
}

- (id)pushTokenBlock
{
  return self->_pushTokenBlock;
}

- (void)setPushTokenBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)entryStoreBlock
{
  return self->_entryStoreBlock;
}

- (void)setEntryStoreBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)authRetries
{
  return self->_authRetries;
}

- (void)setAuthRetries:(int64_t)a3
{
  self->_authRetries = a3;
}

- (NSDate)lastReauthAttempt
{
  return self->_lastReauthAttempt;
}

- (void)setLastReauthAttempt:(id)a3
{
  objc_storeStrong((id *)&self->_lastReauthAttempt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReauthAttempt, 0);
  objc_storeStrong(&self->_entryStoreBlock, 0);
  objc_storeStrong(&self->_pushTokenBlock, 0);
  objc_storeStrong((id *)&self->_userTracker, 0);
  objc_storeStrong((id *)&self->_messageDelivery, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queuedRequest, 0);
  objc_storeStrong((id *)&self->_inflightRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __57__PDSRequestQueue__reAuthAndContinueWithRequest_forUser___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_215E64000, log, OS_LOG_TYPE_ERROR, "Credential refresh failed for user: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

@end
