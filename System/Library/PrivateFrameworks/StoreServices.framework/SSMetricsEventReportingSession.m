@implementation SSMetricsEventReportingSession

- (SSMetricsEventReportingSession)initWithReportingURL:(id)a3 insertTimestamp:(int64_t)a4 eventController:(id)a5
{
  id v9;
  id v10;
  SSMetricsEventReportingSession *v11;
  SSMetricsEventReportingSession *v12;
  NSArray *unreportedEvents;
  NSMutableArray *v14;
  NSMutableArray *unreportedEventPIDs;

  v9 = a3;
  v10 = a5;
  v11 = -[SSMetricsEventReportingSession init](self, "init");
  v12 = v11;
  if (v11)
  {
    v11->_insertTimestamp = a4;
    unreportedEvents = v11->_unreportedEvents;
    v11->_unreportedEvents = 0;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    unreportedEventPIDs = v12->_unreportedEventPIDs;
    v12->_unreportedEventPIDs = v14;

    objc_storeStrong((id *)&v12->_eventController, a5);
    objc_storeStrong((id *)&v12->_reportingURL, a3);
  }

  return v12;
}

- (SSMetricsEventReportingSession)initWithReportingURL:(id)a3 insertTimestamp:(int64_t)a4 suppressUserInfo:(BOOL)a5 eventController:(id)a6
{
  SSMetricsEventReportingSession *result;

  result = -[SSMetricsEventReportingSession initWithReportingURL:insertTimestamp:eventController:](self, "initWithReportingURL:insertTimestamp:eventController:", a3, a4, a6);
  if (result)
    result->_suppressUserInfo = a5;
  return result;
}

- (BOOL)anyUnreportedEvents
{
  void *v2;
  BOOL v3;

  -[SSMetricsEventReportingSession _unreportedEvents](self, "_unreportedEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)markEventsAsReported
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  NSMutableArray *unreportedEventPIDs;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  NSMutableArray *v18;
  NSArray *unreportedEvents;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (v5)
  {
    v7 = (void *)objc_opt_class();
    unreportedEventPIDs = self->_unreportedEventPIDs;
    v9 = v7;
    v22 = 138412546;
    v23 = v7;
    v24 = 1024;
    v25 = -[NSMutableArray count](unreportedEventPIDs, "count");
    LODWORD(v21) = 18;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v22, v21);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog(v3, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v6);
  }

LABEL_12:
  if (!-[NSMutableArray count](self->_unreportedEventPIDs, "count"))
    return 0;
  v17 = -[SSMetricsEventController markEventsAsReported:](self->_eventController, "markEventsAsReported:", self->_unreportedEventPIDs);
  v18 = self->_unreportedEventPIDs;
  self->_unreportedEventPIDs = 0;

  unreportedEvents = self->_unreportedEvents;
  self->_unreportedEvents = 0;

  return v17;
}

- (id)sessionCanaryIdentifier
{
  NSString *sessionCanaryIdentifier;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  sessionCanaryIdentifier = self->_sessionCanaryIdentifier;
  if (sessionCanaryIdentifier)
    return sessionCanaryIdentifier;
  -[SSMetricsEventReportingSession _unreportedEvents](self, "_unreportedEvents");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "reportingDictionary", (_QWORD)v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("canary"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v11 = 0;
  }

  v12 = (NSString *)objc_msgSend(v11, "copy");
  v13 = self->_sessionCanaryIdentifier;
  self->_sessionCanaryIdentifier = v12;

  v14 = self->_sessionCanaryIdentifier;
  return v14;
}

- (id)writeEventsToStream:(id)a3
{
  return -[SSMetricsEventReportingSession writeEventsToStream:uncompressedMaxSize:](self, "writeEventsToStream:uncompressedMaxSize:", a3, -1);
}

- (id)writeEventsToStream:(id)a3 uncompressedMaxSize:(int64_t)a4
{
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *unreportedEventPIDs;
  id v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  int v42;
  NSObject *v43;
  int v44;
  void *v45;
  id v46;
  void *v47;
  int v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  NSObject *v63;
  int v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  int v75;
  int v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int *v87;
  uint64_t v88;
  id v89;
  id v90;
  SSMetricsEventReportingSession *v91;
  id obj;
  uint64_t v93;
  uint64_t v94;
  void *v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  int v102;
  void *v103;
  __int16 v104;
  _QWORD v105[2];
  _QWORD v106[3];
  _QWORD v107[3];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v89 = a3;
  -[SSMetricsEventReportingSession _unreportedEvents](self, "_unreportedEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  unreportedEventPIDs = self->_unreportedEventPIDs;
  self->_unreportedEventPIDs = v6;

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SSMetricsEventReportingSession sessionCanaryIdentifier](self, "sessionCanaryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  obj = v5;
  v90 = v8;
  v91 = self;
  v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
  if (v94)
  {
    v10 = 0;
    v93 = *(_QWORD *)v99;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v99 != v93)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v11);
      if ((a4 & 0x8000000000000000) == 0 && v10 > a4)
        goto LABEL_27;
      objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * v11), "reportingDictionary", v87, v88);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("canary"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v9))
      {

        goto LABEL_27;
      }
      v16 = self->_unreportedEventPIDs;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "persistentID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v16, "addObject:", v17);

      v18 = -[SSMetricsEventReportingSession _estimateSizeOfJsonObject:](self, "_estimateSizeOfJsonObject:", v13);
      if (v18 < 0)
        break;
      v10 += v18;
      objc_msgSend(v8, "addObject:", v13);
LABEL_23:

      if (v94 == ++v11)
      {
        v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
        if (v94)
          goto LABEL_3;
        goto LABEL_27;
      }
    }
    v19 = v9;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("topic"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = objc_msgSend(v21, "shouldLog");
    if (objc_msgSend(v21, "shouldLogToDisk"))
      v22 |= 2u;
    objc_msgSend(v21, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      v22 &= 2u;
    if (v22)
    {
      v24 = (void *)objc_opt_class();
      v102 = 138412546;
      v103 = v24;
      v104 = 2112;
      v105[0] = v20;
      v25 = v24;
      LODWORD(v88) = 22;
      v87 = &v102;
      v26 = (void *)_os_log_send_and_compose_impl();

      v8 = v90;
      if (!v26)
      {
LABEL_22:

        v9 = v19;
        self = v91;
        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v26, 4, &v102, v88);
      v23 = objc_claimAutoreleasedReturnValue();
      free(v26);
      SSFileLog(v21, CFSTR("%@"), v27, v28, v29, v30, v31, v32, (uint64_t)v23);
    }

    goto LABEL_22;
  }
LABEL_27:

  if (objc_msgSend(v8, "count"))
  {
    v107[0] = &unk_1E481E970;
    v106[0] = CFSTR("deliveryVersion");
    v106[1] = CFSTR("postTime");
    v33 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "timeIntervalSince1970");
    objc_msgSend(v33, "numberWithInteger:", (uint64_t)(v35 * 1000.0));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v106[2] = CFSTR("events");
    v107[1] = v36;
    v107[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v97 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v37, 0, &v97);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v97;
    if (v39)
    {
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v89;
      if (!v40)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v42 = objc_msgSend(v40, "shouldLog", v87);
      if (objc_msgSend(v40, "shouldLogToDisk"))
        v42 |= 2u;
      objc_msgSend(v40, "OSLogObject");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        v44 = v42;
      else
        v44 = v42 & 2;
      if (!v44)
        goto LABEL_74;
      v45 = (void *)objc_opt_class();
      v102 = 138543619;
      v103 = v45;
      v104 = 2113;
      v105[0] = v37;
      v46 = v45;
      LODWORD(v88) = 22;
      v47 = (void *)_os_log_send_and_compose_impl();

      if (!v47)
        goto LABEL_75;
      goto LABEL_73;
    }
    v96 = v9;
    v58 = objc_retainAutorelease(v38);
    v41 = v89;
    v59 = objc_msgSend(v89, "write:maxLength:", objc_msgSend(v58, "bytes"), objc_msgSend(v58, "length"));
    v60 = objc_msgSend(v58, "length");
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v61 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v61;
    if (v59 != v60)
    {
      if (!v61)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v75 = objc_msgSend(v40, "shouldLog", v87);
      if (objc_msgSend(v40, "shouldLogToDisk"))
        v75 |= 2u;
      objc_msgSend(v40, "OSLogObject");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        v76 = v75;
      else
        v76 = v75 & 2;
      if (!v76)
      {
        v9 = v96;
        goto LABEL_74;
      }
      v77 = (void *)objc_opt_class();
      v78 = v77;
      v79 = objc_msgSend(v58, "length");
      v102 = 138543874;
      v103 = v77;
      v104 = 1026;
      LODWORD(v105[0]) = v59;
      WORD2(v105[0]) = 2050;
      *(_QWORD *)((char *)v105 + 6) = v79;
      LODWORD(v88) = 28;
      v47 = (void *)_os_log_send_and_compose_impl();

      v41 = v89;
      v9 = v96;
      if (!v47)
      {
LABEL_75:

        v51 = 0;
LABEL_76:

        v8 = v90;
        goto LABEL_77;
      }
LABEL_73:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v47, 4, &v102, v88);
      v43 = objc_claimAutoreleasedReturnValue();
      free(v47);
      SSFileLog(v40, CFSTR("%@"), v80, v81, v82, v83, v84, v85, (uint64_t)v43);
LABEL_74:

      goto LABEL_75;
    }
    if (!v61)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v62 = objc_msgSend(v40, "shouldLog", v87);
    if (objc_msgSend(v40, "shouldLogToDisk"))
      v62 |= 2u;
    objc_msgSend(v40, "OSLogObject");
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      v64 = v62;
    else
      v64 = v62 & 2;
    if (v64)
    {
      v65 = (void *)objc_opt_class();
      v102 = 138543618;
      v103 = v65;
      v104 = 1026;
      LODWORD(v105[0]) = v59;
      v66 = v65;
      LODWORD(v88) = 18;
      v67 = (void *)_os_log_send_and_compose_impl();

      if (!v67)
      {
LABEL_60:

        v74 = malloc_type_malloc(0x14uLL, 0x67FF8560uLL);
        v51 = v74;
        if (v74)
        {
          *v74 = 0;
          v74[1] = 0;
          *((_DWORD *)v74 + 4) = 0;
          CC_SHA1((const void *)objc_msgSend(objc_retainAutorelease(v58), "bytes"), v59, (unsigned __int8 *)v74);
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v51, 20);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v9 = v96;
        goto LABEL_76;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v67, 4, &v102, v88);
      v63 = objc_claimAutoreleasedReturnValue();
      free(v67);
      SSFileLog(v40, CFSTR("%@"), v68, v69, v70, v71, v72, v73, (uint64_t)v63);
    }

    goto LABEL_60;
  }
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v37)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v48 = objc_msgSend(v37, "shouldLog", v87);
  if (objc_msgSend(v37, "shouldLogToDisk"))
    v48 |= 2u;
  objc_msgSend(v37, "OSLogObject");
  v39 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    v48 &= 2u;
  if (!v48)
  {
    v51 = 0;
    v41 = v89;
    goto LABEL_77;
  }
  v49 = (void *)objc_opt_class();
  v102 = 138543362;
  v103 = v49;
  v50 = v49;
  LODWORD(v88) = 12;
  v51 = (void *)_os_log_send_and_compose_impl();

  v41 = v89;
  if (v51)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v51, 4, &v102, v88);
    v39 = objc_claimAutoreleasedReturnValue();
    free(v51);
    SSFileLog(v37, CFSTR("%@"), v52, v53, v54, v55, v56, v57, (uint64_t)v39);
    v51 = 0;
LABEL_77:

  }
  return v51;
}

- (int64_t)_estimateSizeOfJsonObject:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  int v19;
  int v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  char v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = v3;
  objc_msgSend(v4, "addObject:", v3);
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  while (1)
  {
    if (!objc_msgSend(v4, "count"))
    {
      v12 = v42[3];
      goto LABEL_16;
    }
    v5 = objc_msgSend(v4, "count") - 1;
    objc_msgSend(v4, "objectAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42[3] += 2;
      v7 = objc_msgSend(v6, "lengthOfBytesUsingEncoding:", 4);
      v8 = v42;
      v9 = v42[3] + v7;
LABEL_5:
      v8[3] = v9;
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "lengthOfBytesUsingEncoding:", 4);
      v42[3] += v11;

      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v42;
      v9 = v42[3] + 4;
      goto LABEL_5;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42[3] += 2;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __60__SSMetricsEventReportingSession__estimateSizeOfJsonObject___block_invoke;
      v37[3] = &unk_1E47C06D8;
      v40 = 1;
      v39 = &v41;
      v38 = v4;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v37);

      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    v42[3] += 2;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __60__SSMetricsEventReportingSession__estimateSizeOfJsonObject___block_invoke_2;
    v33[3] = &unk_1E47C0700;
    v36 = 1;
    v35 = &v41;
    v34 = v4;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v33);

LABEL_8:
    objc_msgSend(v4, "removeObjectAtIndex:", v5);

  }
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = objc_msgSend(v14, "shouldLog");
  v16 = objc_msgSend(v14, "shouldLogToDisk");
  objc_msgSend(v14, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
    v19 = v15 | 2;
  else
    v19 = v15;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    v20 = v19;
  else
    v20 = v19 & 2;
  if (v20)
  {
    v21 = (id)objc_opt_class();
    v22 = (void *)objc_opt_class();
    v45 = 138543874;
    v46 = v21;
    v47 = 2112;
    v48 = v6;
    v49 = 2114;
    v50 = v22;
    v23 = v22;
    LODWORD(v31) = 32;
    v24 = (void *)_os_log_send_and_compose_impl();

    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v24, 4, &v45, v31);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      free(v24);
      SSFileLog(v14, CFSTR("%@"), v25, v26, v27, v28, v29, v30, (uint64_t)v18);
      goto LABEL_28;
    }
  }
  else
  {
LABEL_28:

  }
  v12 = -1;
LABEL_16:
  _Block_object_dispose(&v41, 8);

  return v12;
}

void __60__SSMetricsEventReportingSession__estimateSizeOfJsonObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  if (!*(_BYTE *)(a1 + 48))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "addObject:", a2);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

uint64_t __60__SSMetricsEventReportingSession__estimateSizeOfJsonObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a1 + 48))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)_unreportedEvents
{
  NSArray *unreportedEvents;
  NSArray *v4;
  NSArray *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  NSArray *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  unreportedEvents = self->_unreportedEvents;
  if (!unreportedEvents)
  {
    -[SSMetricsEventController unreportedEventsForURL:since:suppressUserInfo:](self->_eventController, "unreportedEventsForURL:since:suppressUserInfo:", self->_reportingURL, self->_insertTimestamp, self->_suppressUserInfo);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_unreportedEvents;
    self->_unreportedEvents = v4;

    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      v8 &= 2u;
    if (v8)
    {
      v10 = (void *)objc_opt_class();
      v11 = self->_unreportedEvents;
      v12 = v10;
      v22 = 138412546;
      v23 = v10;
      v24 = 1024;
      v25 = -[NSArray count](v11, "count");
      LODWORD(v21) = 18;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_13:

        unreportedEvents = self->_unreportedEvents;
        return unreportedEvents;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v22, v21);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v6, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v9);
    }

    goto LABEL_13;
  }
  return unreportedEvents;
}

- (void)_writeString:(id)a3 toData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x1A8585BF8]();
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendData:", v7);

  objc_autoreleasePoolPop(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionCanaryIdentifier, 0);
  objc_storeStrong((id *)&self->_eventController, 0);
  objc_storeStrong((id *)&self->_unreportedEventPIDs, 0);
  objc_storeStrong((id *)&self->_unreportedEvents, 0);
  objc_storeStrong((id *)&self->_reportingURL, 0);
}

@end
