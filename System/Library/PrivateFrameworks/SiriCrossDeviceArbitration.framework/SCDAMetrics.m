@implementation SCDAMetrics

- (id)_getRequestType:(unint64_t)a3
{
  if (a3 - 2 > 6)
    return CFSTR("Unknown");
  else
    return off_25174A208[a3 - 2];
}

- (int)_getCDASchemaCDATriggerType:(unint64_t)a3
{
  if (a3 - 2 > 6)
    return 0;
  else
    return dword_2462437B0[a3 - 2];
}

- (unsigned)getVersion:(MyriadMetricsDataV2 *)a3
{
  if (a3)
    return a3->version;
  else
    return 0;
}

- (double)getSessionId:(MyriadMetricsDataV2 *)a3
{
  if (a3)
    return (double)a3->sessionId;
  else
    return 0.0;
}

- (BOOL)isMyriadMetricsMessage:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", scdaAccessoryMetricsMessageKey);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)getCDASessionId:(MyriadMetricsDataV2 *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc(MEMORY[0x24BDD1880]);
  v5 = v4;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("00000000-0000-0000-0000-%012u"), a3->sessionId);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);

  }
  else
  {
    v7 = (void *)objc_msgSend(v4, "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  }
  return v7;
}

- (id)getDeviceElectionParticipantId:(MyriadMetricsDataV2 *)a3
{
  return -[SCDAMetrics _getElectionParticipantIdWithLowBits:withHighBits:](self, "_getElectionParticipantIdWithLowBits:withHighBits:", a3->deviceElectionParticipantIdLowBits, a3->deviceElectionParticipantIdHighBits);
}

- (id)getDeviceRotatedElectionParticipantId:(MyriadMetricsDataV2 *)a3
{
  return -[SCDAMetrics _getElectionParticipantIdWithLowBits:withHighBits:](self, "_getElectionParticipantIdWithLowBits:withHighBits:", a3->deviceRotatedElectionParticipantIdLowBits, a3->deviceRotatedElectionParticipantIdHighBits);
}

- (id)getElectionParticipantId:(MyriadMetricsDataV2 *)a3 forParticipant:(int)a4
{
  return -[SCDAMetrics _getElectionParticipantIdWithLowBits:withHighBits:](self, "_getElectionParticipantIdWithLowBits:withHighBits:", a3->electionParticipantIdLowBits[a4], a3->electionParticipantIdHighBits[a4]);
}

- (id)_getElectionParticipantIdWithLowBits:(unint64_t)a3 withHighBits:(unint64_t)a4
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  if (!(a4 | a3))
    return 0;
  v5[0] = veor_s8(vdup_n_s8(a4 >> 2), (int8x8_t)0x8101820283038);
  v5[1] = veor_s8(vdup_n_s8(a3 >> 2), (int8x8_t)0x8101820283038);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v5);
}

- (id)_createEndAnalyticContexFromIntermediateContext:(id)a3 forVersion:(unsigned int)a4 sessionId:(double)a5
{
  uint64_t v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v6 = *(_QWORD *)&a4;
  v7 = (objc_class *)MEMORY[0x24BDBCED8];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "addEntriesFromDictionary:", v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("version"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("session_id"));

  return v9;
}

- (void)_submitMyriadMetrics:(MyriadMetricsDataV2 *)a3 additionalContext:(id)a4 instrumentation:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, void *);
  unint64_t requestType;
  uint64_t state;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  double advDelay;
  double advInterval;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  uint64_t v73;
  int v74;
  int v75;
  int v76;
  _QWORD v77[7];
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  uint64_t v87;
  const __CFString *v88;
  void *v89;
  _QWORD v90[2];
  _QWORD v91[2];
  const __CFString *v92;
  void *v93;
  _QWORD v94[3];
  _QWORD v95[3];
  const __CFString *v96;
  void *v97;
  _QWORD v98[2];
  _QWORD v99[4];

  v99[2] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *, void *))a6;
  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__1106;
  v82 = __Block_byref_object_dispose__1107;
  v83 = 0;
  if (a3)
  {
    switch(a3->eventType)
    {
      case 0u:
        requestType = a3->requestType;
        state = a3->state;
        v98[0] = CFSTR("state");
        v74 = state;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), state);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v98[1] = CFSTR("trigger");
        v99[0] = v15;
        -[SCDAMetrics _getRequestType:](self, "_getRequestType:", requestType);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v99[1] = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v99, v98, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[SCDAMetrics getVersion:](self, "getVersion:", a3);
        -[SCDAMetrics getSessionId:](self, "getSessionId:", a3);
        -[SCDAMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v17, v18);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v79[5];
        v79[5] = v19;

        if (v11)
        {
          v21 = -[SCDAMetrics _getCDASchemaCDATriggerType:](self, "_getCDASchemaCDATriggerType:", requestType);
          -[SCDAMetrics getCDASessionId:](self, "getCDASessionId:", a3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", (v74 + 1), v21, v22, mach_absolute_time());

        }
        break;
      case 1u:
        v25 = a3->state;
        v96 = CFSTR("state");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = v26;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[SCDAMetrics getVersion:](self, "getVersion:", a3);
        -[SCDAMetrics getSessionId:](self, "getSessionId:", a3);
        -[SCDAMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v27, v28);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v79[5];
        v79[5] = v29;

        if (v11)
        {
          -[SCDAMetrics getCDASessionId:](self, "getCDASessionId:", a3);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "logCDADeviceStateActivityEnded:withCdaId:withTimestamp:", (v25 + 1), v31, mach_absolute_time());

        }
        break;
      case 2u:
        v32 = a3->state;
        advDelay = a3->advDelay;
        advInterval = a3->advInterval;
        v94[0] = CFSTR("state");
        v75 = v32;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v95[0] = v35;
        v94[1] = CFSTR("adv-delay");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", advDelay);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v95[1] = v36;
        v94[2] = CFSTR("adv-interval");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", advInterval);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v95[2] = v37;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v95, v94, 3);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[SCDAMetrics getVersion:](self, "getVersion:", a3);
        -[SCDAMetrics getSessionId:](self, "getSessionId:", a3);
        -[SCDAMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v38, v39);
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = (void *)v79[5];
        v79[5] = v40;

        if (v11)
        {
          -[SCDAMetrics getCDASessionId:](self, "getCDASessionId:", a3);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = mach_absolute_time();
          *(float *)&v44 = advDelay;
          *(float *)&v45 = advInterval;
          LODWORD(v46) = 0;
          objc_msgSend(v11, "logCDAElectionAdvertisingStarting:withDelay:withInterval:withVoiceTriggerLatency:withCdaId:withTimestamp:", (v75 + 1), v42, v43, v44, v45, v46);

        }
        break;
      case 3u:
        v47 = a3->state;
        v92 = CFSTR("state");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = v48;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = -[SCDAMetrics getVersion:](self, "getVersion:", a3);
        -[SCDAMetrics getSessionId:](self, "getSessionId:", a3);
        -[SCDAMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v49, v50);
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = (void *)v79[5];
        v79[5] = v51;

        if (v11)
        {
          -[SCDAMetrics getCDASessionId:](self, "getCDASessionId:", a3);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "logCDAElectionAdvertisingStarted:withCdaId:withTimestamp:", (v47 + 1), v53, mach_absolute_time());

        }
        break;
      case 4u:
        v54 = a3->state;
        v90[0] = CFSTR("state");
        v76 = v54;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v90[1] = CFSTR("unixTime");
        v91[0] = v55;
        v56 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "timeIntervalSince1970");
        objc_msgSend(v56, "numberWithDouble:");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v91[1] = v58;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = -[SCDAMetrics getVersion:](self, "getVersion:", a3);
        -[SCDAMetrics getSessionId:](self, "getSessionId:", a3);
        -[SCDAMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v59, v60);
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = (void *)v79[5];
        v79[5] = v61;

        if (v11)
        {
          -[SCDAMetrics getCDASessionId:](self, "getCDASessionId:", a3);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "logCDAElectionTimerEnded:withCdaId:withTimestamp:", (v76 + 1), v63, mach_absolute_time());

        }
        break;
      case 5u:
        v64 = a3->state;
        v88 = CFSTR("state");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v65;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = -[SCDAMetrics getVersion:](self, "getVersion:", a3);
        -[SCDAMetrics getSessionId:](self, "getSessionId:", a3);
        -[SCDAMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v66, v67);
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = (void *)v79[5];
        v79[5] = v68;

        if (v11)
        {
          -[SCDAMetrics getCDASessionId:](self, "getCDASessionId:", a3);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "logCDAElectionAdvertisingEnded:withCdaId:withTimestamp:", (v64 + 1), v70, mach_absolute_time());

        }
        break;
      case 6u:
        v77[0] = MEMORY[0x24BDAC760];
        v77[1] = 3221225472;
        v77[2] = __81__SCDAMetrics__submitMyriadMetrics_additionalContext_instrumentation_completion___block_invoke;
        v77[3] = &unk_25174A1E8;
        v77[4] = self;
        v77[5] = &v78;
        v77[6] = a3;
        -[SCDAMetrics _decisionMadeContext:additionalContext:instrumentation:completion:](self, "_decisionMadeContext:additionalContext:instrumentation:completion:", a3, v10, v11, v77);
        break;
      default:
        v23 = 2201;
        goto LABEL_6;
    }
    v24 = 0;
  }
  else
  {
    v23 = 2202;
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kSCDAErrorDomain"), v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v71 = SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v73 = v79[5];
    *(_DWORD *)buf = 136315394;
    v85 = "-[SCDAMetrics _submitMyriadMetrics:additionalContext:instrumentation:completion:]";
    v86 = 2112;
    v87 = v73;
    _os_log_debug_impl(&dword_246211000, v71, OS_LOG_TYPE_DEBUG, "%s Myriad endpoint metrics context: %@", buf, 0x16u);
    if (!v12)
      goto LABEL_23;
    goto LABEL_22;
  }
  if (v12)
  {
LABEL_22:
    v72 = (void *)objc_msgSend((id)v79[5], "copy");
    v12[2](v12, v24, v72);

  }
LABEL_23:

  _Block_object_dispose(&v78, 8);
}

- (void)_decisionMadeContext:(MyriadMetricsDataV2 *)a3 additionalContext:(id)a4 instrumentation:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, id);
  id v12;
  uint64_t electionParticipantCount;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  SCDAMetrics *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  SCDAMetrics *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t i;
  id v59;
  SCDAMetrics *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  SCDAMetrics *v69;
  uint64_t j;
  id v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  int v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void (**v83)(id, id);
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[5];

  v94[3] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, id))a6;
  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (a3->version)
    {
      v83 = v11;
      v84 = v9;
      v87 = v10;
      electionParticipantCount = a3->electionParticipantCount;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), electionParticipantCount);
      v14 = 0x24BDBC000uLL;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v12;
      objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("device_count"));

      v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", electionParticipantCount);
      v17 = (void *)v16;
      v85 = electionParticipantCount;
      if (electionParticipantCount >= 0x32)
        v18 = 50;
      else
        v18 = electionParticipantCount;
      v19 = self;
      v88 = v18;
      v89 = (void *)v16;
      if ((_DWORD)v18)
      {
        v20 = 0;
        do
        {
          v21 = objc_alloc(*(Class *)(v14 + 3800));
          v93[0] = CFSTR("dc");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a3->electionParticipantDeviceType[v20]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v94[0] = v22;
          v93[1] = CFSTR("pt");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a3->electionParticipantProductType[v20]);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v94[1] = v23;
          v93[2] = CFSTR("goodness");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a3->electionParticipantGoodnessScore[v20]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v94[2] = v24;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v94, v93, 3);
          v25 = v14;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend(v21, "initWithDictionary:", v26);

          v19 = self;
          -[SCDAMetrics getElectionParticipantId:forParticipant:](self, "getElectionParticipantId:forParticipant:", a3, v20);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "UUIDString");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setValue:forKey:", v29, CFSTR("id"));

          v14 = v25;
          v17 = v89;
          objc_msgSend(v89, "addObject:", v27);

          ++v20;
        }
        while (v88 != v20);
      }
      v30 = v19;
      v12 = v86;
      objc_msgSend(v86, "setObject:forKey:", v17, CFSTR("goodness_scores"));
      if (a3->previousDecision)
        v31 = CFSTR("YES");
      else
        v31 = CFSTR("NO");
      objc_msgSend(v86, "setObject:forKey:", v31, CFSTR("previous_decision"));
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), (unint64_t)a3->previousDecisionTime);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setObject:forKey:", v32, CFSTR("previous_decision_time"));

      if (a3->decision)
        v33 = CFSTR("YES");
      else
        v33 = CFSTR("NO");
      objc_msgSend(v86, "setObject:forKey:", v33, CFSTR("decision"));
      if ((_DWORD)v85)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%hhu"), a3->electionParticipantGoodnessScore[0]);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setObject:forKey:", v34, CFSTR("winner_goodness"));

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a3->electionParticipantDeviceType[0]);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setObject:forKey:", v35, CFSTR("winner_device_class"));

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a3->electionParticipantProductType[0]);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setObject:forKey:", v36, CFSTR("winner_product_type"));

        -[SCDAMetrics getElectionParticipantId:forParticipant:](v30, "getElectionParticipantId:forParticipant:", a3, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "UUIDString");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setValue:forKey:", v38, CFSTR("winner_election_participant_id"));

      }
      if (a3->homepodInvolved)
        v39 = CFSTR("YES");
      else
        v39 = CFSTR("NO");
      objc_msgSend(v86, "setObject:forKey:", v39, CFSTR("homepod_involved"));
      v9 = v84;
      if ((_DWORD)v85 && !a3->decision)
      {
        if (a3->electionParticipantGoodnessScore[0] == 255)
          v40 = CFSTR("YES");
        else
          v40 = CFSTR("NO");
        objc_msgSend(v86, "setObject:forKey:", v40, CFSTR("winner_sent_suppresssion"));
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a3->version);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setObject:forKey:", v41, CFSTR("version"));

      if (a3->lateToElection)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setObject:forKey:", v42, CFSTR("late_for_device_arbitration"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3->advInterval);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setObject:forKey:", v43, CFSTR("device_arbitration_delay"));

      }
      v10 = v87;
      if (v84)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%hhu"), objc_msgSend(v84, "rawGoodnessScore"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setObject:forKey:", v44, CFSTR("raw_goodness_score"));

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%hhu"), objc_msgSend(v84, "goodnessScore"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setObject:forKey:", v45, CFSTR("my_goodness"));

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v84, "deviceClass"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setObject:forKey:", v46, CFSTR("my_device_class"));

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v84, "deviceProductType"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setObject:forKey:", v47, CFSTR("my_product_type"));

      }
      if (v87)
      {
        v48 = objc_alloc_init(MEMORY[0x24BE94A78]);
        objc_msgSend(v48, "setDeviceClass:", a3->electionParticipantDeviceType[0]);
        objc_msgSend(v48, "setProductType:", a3->electionParticipantProductType[0]);
        objc_msgSend(v48, "setGoodnessScore:", a3->electionParticipantGoodnessScore[0]);
        -[SCDAMetrics getElectionParticipantId:forParticipant:](v30, "getElectionParticipantId:forParticipant:", a3, 0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        SCDAToSISchemaUUID(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v48;
        objc_msgSend(v48, "setElectionParticipantId:", v50);

        v51 = objc_alloc_init(MEMORY[0x24BE94A78]);
        objc_msgSend(v51, "setDeviceClass:", objc_msgSend(v84, "deviceClass"));
        objc_msgSend(v51, "setProductType:", objc_msgSend(v84, "deviceProductType"));
        objc_msgSend(v51, "setGoodnessScore:", objc_msgSend(v84, "goodnessScore"));
        -[SCDAMetrics getDeviceElectionParticipantId:](v30, "getDeviceElectionParticipantId:", a3);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        SCDAToSISchemaUUID(v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setElectionParticipantId:", v53);

        -[SCDAMetrics getDeviceRotatedElectionParticipantId:](v30, "getDeviceRotatedElectionParticipantId:", a3);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        SCDAToSISchemaUUID(v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v51;
        objc_msgSend(v51, "setRotatedElectionParticipantId:", v55);

        v56 = v88;
        v57 = 0x24BDBC000uLL;
        if ((_DWORD)v88)
        {
          for (i = 0; i != v88; ++i)
          {
            v59 = objc_alloc(*(Class *)(v57 + 3800));
            v91[0] = CFSTR("dc");
            v60 = v30;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a3->electionParticipantDeviceType[i]);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v92[0] = v61;
            v91[1] = CFSTR("pt");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a3->electionParticipantProductType[i]);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v92[1] = v62;
            v91[2] = CFSTR("goodness");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a3->electionParticipantGoodnessScore[i]);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v92[2] = v63;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v92, v91, 3);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = (void *)objc_msgSend(v59, "initWithDictionary:", v64);

            v56 = v88;
            v30 = v60;

            -[SCDAMetrics getElectionParticipantId:forParticipant:](v60, "getElectionParticipantId:forParticipant:", a3, i);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "UUIDString");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "setValue:forKey:", v67, CFSTR("id"));

            objc_msgSend(v89, "addObject:", v65);
            v57 = 0x24BDBC000;
          }
        }
        v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v85);
        v69 = v30;
        if ((_DWORD)v56)
        {
          for (j = 0; j != v56; ++j)
          {
            v71 = objc_alloc_init(MEMORY[0x24BE94A78]);
            objc_msgSend(v71, "setDeviceClass:", a3->electionParticipantDeviceType[j]);
            objc_msgSend(v71, "setProductType:", a3->electionParticipantProductType[j]);
            objc_msgSend(v71, "setGoodnessScore:", a3->electionParticipantGoodnessScore[j]);
            -[SCDAMetrics getElectionParticipantId:forParticipant:](v69, "getElectionParticipantId:forParticipant:", a3, j);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            SCDAToSISchemaUUID(v72);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setElectionParticipantId:", v73);

            objc_msgSend(v68, "addObject:", v71);
          }
        }
        if (a3->decision)
          v74 = 1;
        else
          v74 = 2;
        if (a3->previousDecision)
          v75 = 1;
        else
          v75 = 2;
        v76 = mach_absolute_time();
        if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
          dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_28);
        v9 = v84;
        v77 = (unint64_t)(((double)(unint64_t)(*(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v76)
                                - a3->previousDecisionTime)
                               / 1000000.0);
        v78 = objc_msgSend(v84, "rawGoodnessScore");
        -[SCDAMetrics getCDASessionId:](v69, "getCDASessionId:", a3);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v80) = v78;
        v10 = v87;
        objc_msgSend(v87, "logCDAElectionDecisionMade:withDecision:withPreviousDecision:timeSincePreviousDecision:withWinningDevice:withThisDevice:withParticipants:withRawScore:withBoost:withCdaId:currentRequestId:withTimestamp:", 11, v74, v75, v77, v82, v81, v68, v80, 0, v79, 0, mach_absolute_time());

        v12 = v86;
      }

      v11 = v83;
    }
    v11[2](v11, v12);

  }
}

- (void)submitAccessoryMyriadMetricsToAnalyticsStream:(id)a3 payload:(id)a4 instrumentation:(id)a5 completion:(id)a6
{
  -[SCDAMetrics submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:instrumentation:completion:](self, "submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:instrumentation:completion:", a3, a4, 0, a5, a6);
}

- (void)submitAccessoryMyriadMetricsToAnalyticsStream:(id)a3 payload:(id)a4 additionalContext:(id)a5 instrumentation:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *, _QWORD);
  SCDAAccessoryMetricMessage *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _BYTE v24[18];
  __int16 v25;
  id v26;
  __int16 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *, _QWORD))a7;
  if (v12)
  {
    v17 = -[SCDAAccessoryMetricMessage initWithMetricData:]([SCDAAccessoryMetricMessage alloc], "initWithMetricData:", v13);
    if (v17)
    {
      v18 = v17;
      v19 = (void *)SCDALogContextAnalytics;
      if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_INFO))
      {
        v20 = v19;
        *(_DWORD *)v24 = 136315906;
        *(_QWORD *)&v24[4] = "-[SCDAMetrics submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:instr"
                             "umentation:completion:]";
        *(_WORD *)&v24[12] = 1024;
        *(_DWORD *)&v24[14] = objc_msgSend(v18, "version");
        v25 = 2048;
        v26 = v12;
        v27 = 2112;
        *(_QWORD *)&v28 = v14;
        _os_log_impl(&dword_246211000, v20, OS_LOG_TYPE_INFO, "%s version = %u analytics stream = %p additional = [%@]", v24, 0x26u);

      }
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(v18, "messageAsStruct", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0);
      -[SCDAMetrics _submitMyriadMetrics:additionalContext:instrumentation:completion:](self, "_submitMyriadMetrics:additionalContext:instrumentation:completion:", v24, v14, v15, v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kSCDAErrorDomain"), 2202, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        v16[2](v16, v22, 0);
      v23 = SCDALogContextAnalytics;
      if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v24 = 136315138;
        *(_QWORD *)&v24[4] = "-[SCDAMetrics submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:instr"
                             "umentation:completion:]";
        _os_log_error_impl(&dword_246211000, v23, OS_LOG_TYPE_ERROR, "%s Invalid analytics data received", v24, 0xCu);
      }

      v18 = 0;
    }
  }
  else
  {
    v21 = SCDALogContextAnalytics;
    if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v24 = 136315138;
      *(_QWORD *)&v24[4] = "-[SCDAMetrics submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:instrum"
                           "entation:completion:]";
      _os_log_error_impl(&dword_246211000, v21, OS_LOG_TYPE_ERROR, "%s Invalid analytics stream.", v24, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kSCDAErrorDomain"), 2202, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v16[2](v16, v18, 0);
  }

}

void __81__SCDAMetrics__submitMyriadMetrics_additionalContext_instrumentation_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = a2;
  v6 = objc_msgSend(v3, "getVersion:", v4);
  objc_msgSend(*(id *)(a1 + 32), "getSessionId:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

+ (void)initialize
{
  if (SCDALogInitIfNeeded_once != -1)
    dispatch_once(&SCDALogInitIfNeeded_once, &__block_literal_global_512);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1133);
  return (id)sharedInstance_metrics;
}

void __29__SCDAMetrics_sharedInstance__block_invoke()
{
  SCDAMetrics *v0;
  void *v1;

  v0 = objc_alloc_init(SCDAMetrics);
  v1 = (void *)sharedInstance_metrics;
  sharedInstance_metrics = (uint64_t)v0;

}

@end
