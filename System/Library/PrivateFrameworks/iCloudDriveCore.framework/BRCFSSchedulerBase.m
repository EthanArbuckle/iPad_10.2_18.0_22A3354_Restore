@implementation BRCFSSchedulerBase

- (BOOL)closed
{
  void *v2;
  BOOL v3;

  -[BRCFSSchedulerBase hasWorkGroup](self, "hasWorkGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)setHasWork:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *hasWorkGroup;
  id v6;

  v3 = a3;
  if (!-[BRCFSSchedulerBase closed](self, "closed") && self->_hasWork != v3)
  {
    hasWorkGroup = self->_hasWorkGroup;
    if (v3)
      dispatch_group_enter(hasWorkGroup);
    else
      dispatch_group_leave(hasWorkGroup);
    self->_hasWork = v3;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("BRCFSSchedulerBaseDidUpdateHasWorkNotification"), 0);

  }
}

- (void)setHasActiveWork:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *hasWorkGroup;

  v3 = a3;
  if (!-[BRCFSSchedulerBase closed](self, "closed") && self->_hasActiveWork != v3)
  {
    hasWorkGroup = self->_hasWorkGroup;
    if (v3)
    {
      dispatch_group_enter(hasWorkGroup);
      dispatch_group_enter((dispatch_group_t)self->_hasActiveWorkGroup);
    }
    else
    {
      dispatch_group_leave(hasWorkGroup);
      dispatch_group_leave((dispatch_group_t)self->_hasActiveWorkGroup);
    }
    self->_hasActiveWork = v3;
  }
}

- (BRCFSSchedulerBase)initWithSession:(id)a3 name:(id)a4 tableName:(id)a5
{
  id v9;
  id v10;
  id v11;
  BRCFSSchedulerBase *v12;
  BRCFSSchedulerBase *v13;
  uint64_t v14;
  PQLNameInjection *tableName;
  dispatch_group_t v16;
  OS_dispatch_group *hasWorkGroup;
  dispatch_group_t v18;
  OS_dispatch_group *hasActiveWorkGroup;
  uint64_t v20;
  OS_dispatch_workloop *schedulerWorkloop;
  BRCDeadlineSource *v22;
  void *v23;
  uint64_t v24;
  BRCDeadlineSource *schedulerSource;
  void *v26;
  BRCDeadlineSource *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  id location;
  objc_super v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v35.receiver = self;
  v35.super_class = (Class)BRCFSSchedulerBase;
  v12 = -[BRCFSSchedulerBase init](&v35, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_session, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    objc_msgSend(MEMORY[0x24BEDD640], "nameWithString:", v11);
    v14 = objc_claimAutoreleasedReturnValue();
    tableName = v13->_tableName;
    v13->_tableName = (PQLNameInjection *)v14;

    v16 = dispatch_group_create();
    hasWorkGroup = v13->_hasWorkGroup;
    v13->_hasWorkGroup = (OS_dispatch_group *)v16;

    v18 = dispatch_group_create();
    hasActiveWorkGroup = v13->_hasActiveWorkGroup;
    v13->_hasActiveWorkGroup = (OS_dispatch_group *)v18;

    objc_msgSend(v9, "clientTruthWorkloop");
    v20 = objc_claimAutoreleasedReturnValue();
    schedulerWorkloop = v13->_schedulerWorkloop;
    v13->_schedulerWorkloop = (OS_dispatch_workloop *)v20;

    v22 = [BRCDeadlineSource alloc];
    -[BRCAccountSessionFPFS defaultScheduler](v13->_session, "defaultScheduler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[BRCDeadlineSource initWithScheduler:name:](v22, "initWithScheduler:name:", v23, v13->_name);
    schedulerSource = v13->_schedulerSource;
    v13->_schedulerSource = (BRCDeadlineSource *)v24;

    objc_msgSend(v9, "clientTruthWorkloop");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCDeadlineSource setWorkloop:](v13->_schedulerSource, "setWorkloop:", v26);

    objc_initWeak(&location, v13);
    v27 = v13->_schedulerSource;
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __53__BRCFSSchedulerBase_initWithSession_name_tableName___block_invoke;
    v32 = &unk_24FE3F9C8;
    objc_copyWeak(&v33, &location);
    -[BRCDeadlineSource setEventHandler:](v27, "setEventHandler:", &v29);
    -[BRCFSSchedulerBase signal](v13, "signal", v29, v30, v31, v32);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __53__BRCFSSchedulerBase_initWithSession_name_tableName___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9[3];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2348B9F14]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"-[BRCFSSchedulerBase initWithSession:name:tableName:]_block_invoke", 191, v9);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (WeakRetained)
      v8 = WeakRetained[4];
    else
      v8 = 0;
    *(_DWORD *)buf = 134218498;
    v11 = v9[0];
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: scheduling%@", buf, 0x20u);
  }

  if (objc_msgSend(WeakRetained, "isCancelled"))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __53__BRCFSSchedulerBase_initWithSession_name_tableName___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(WeakRetained, "schedule");
  }
  __brc_leave_section(v9);

  objc_autoreleasePoolPop(v2);
}

- (BOOL)haveActiveJobsMatching:(id)a3
{
  BRCAccountSessionFPFS *session;
  id v5;
  void *v6;
  PQLNameInjection *tableName;
  void *v8;
  void *v9;

  session = self->_session;
  v5 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  tableName = self->_tableName;
  objc_msgSend(v5, "matchingJobsWhereSQLClause");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v6, "numberWithSQL:", CFSTR("SELECT 1 FROM %@ WHERE %@ AND throttle_state = 1 LIMIT 1"), tableName, v8);
  LOBYTE(v8) = objc_msgSend(v9, "BOOLValue");

  return (char)v8;
}

- (int)jobStateFor:(id)a3
{
  BRCAccountSessionFPFS *session;
  id v5;
  void *v6;
  PQLNameInjection *tableName;
  void *v8;
  void *v9;
  int v10;

  session = self->_session;
  v5 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  tableName = self->_tableName;
  objc_msgSend(v5, "matchingJobsWhereSQLClause");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v6, "numberWithSQL:", CFSTR("SELECT throttle_state FROM %@ WHERE %@ AND throttle_state != 0"), tableName, v8);
  if (v9)
    v10 = objc_msgSend(v9, "intValue");
  else
    v10 = 0;

  return v10;
}

- (id)descriptionForJobsMatching:(id)a3 ordering:(id)a4 additionalColumns:(id)a5 additionalValuesHandler:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  PQLNameInjection *tableName;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void (**v26)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;

  v12 = a3;
  v41 = a4;
  v13 = a5;
  v43 = a6;
  v14 = a7;
  objc_msgSend(v14, "db");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v39 = v17;

  v40 = v13;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ",", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  tableName = self->_tableName;
  objc_msgSend(v12, "matchingJobsWhereSQLClause");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v41)
  {
    v23 = (void *)objc_msgSend(v39, "fetch:", CFSTR("SELECT zone_rowid, throttle_id, throttle_state, retry_count, last_try_stamp, next_retry_stamp, expire_stamp%@%@ FROM %@ WHERE %@%@"), v18, v19, tableName, v21, v41);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v39, "fetch:", CFSTR("SELECT zone_rowid, throttle_id, throttle_state, retry_count, last_try_stamp, next_retry_stamp, expire_stamp%@%@ FROM %@ WHERE %@%@"), v18, v19, tableName, v22, v24);

  }
  if (!v40)

  v38 = v12;
  if ((objc_msgSend(v23, "next") & 1) == 0)
  {
    objc_msgSend(v23, "close");
    v25 = 0;
    v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v43;
    goto LABEL_35;
  }
  v42 = 0;
  v25 = 0;
  v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v43;
  do
  {
    v27 = objc_msgSend(v23, "unsignedIntAtIndex:", 2);
    v28 = objc_msgSend(v23, "unsignedIntAtIndex:", 3);
    v29 = objc_msgSend(v23, "longLongAtIndex:", 4);
    v30 = objc_msgSend(v23, "longLongAtIndex:", 5);
    v31 = objc_msgSend(v23, "longLongAtIndex:", 6);
    if (!objc_msgSend(v14, "onlyActiveStuff") || (_DWORD)v27)
    {
      if ((_DWORD)v27
        || (+[BRCDumpContext nowFromContext:](BRCDumpContext, "nowFromContext:", v14),
            !brc_is_before_deadline()))
      {
        if (v25)
          objc_msgSend(v25, "appendString:", CFSTR(" "));
        else
          v25 = objc_alloc_init(MEMORY[0x24BDD16A8]);
        objc_msgSend(v25, "appendString:", CFSTR("["));
        if (v26)
          ((void (**)(_QWORD, id, void *, uint64_t, uint64_t))v26)[2](v26, v25, v23, 7, v27);
        +[BRCDumpContext stringFromThrottleState:context:](BRCDumpContext, "stringFromThrottleState:context:", v27, v14);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "appendFormat:", CFSTR(" %@ attempts:%d"), v32, v28);

        +[BRCDumpContext stringFromDueStamp:allowsPast:context:](BRCDumpContext, "stringFromDueStamp:allowsPast:context:", v29, 1, v14);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "appendFormat:", CFSTR(" last:%@"), v33);

        if ((_DWORD)v27)
        {
          +[BRCDumpContext stringFromDueStamp:allowsPast:context:](BRCDumpContext, "stringFromDueStamp:allowsPast:context:", v30, 0, v14);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "appendFormat:", CFSTR(" next:%@"), v34);

        }
        +[BRCDumpContext stringFromDueStamp:allowsPast:context:](BRCDumpContext, "stringFromDueStamp:allowsPast:context:", v31, 0, v14);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "appendFormat:", CFSTR(" cleanup:%@"), v35);

        objc_msgSend(v25, "appendString:", CFSTR("]"));
        v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v43;
      }
      else
      {
        ++v42;
      }
    }
  }
  while ((objc_msgSend(v23, "next") & 1) != 0);
  objc_msgSend(v23, "close");
  if (v42)
  {
    if (v25)
    {
      objc_msgSend(v25, "appendString:", CFSTR(" "));
      if (v14)
      {
LABEL_31:
        objc_msgSend(v14, "highlightedString:type:", CFSTR("old"), 6);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "appendFormat:", CFSTR("[%ld %@]"), v42, v36);

        goto LABEL_35;
      }
    }
    else
    {
      v25 = objc_alloc_init(MEMORY[0x24BDD16A8]);
      if (v14)
        goto LABEL_31;
    }
    objc_msgSend(v25, "appendFormat:", CFSTR("[%ld %@]"), v42, CFSTR("old"));
  }
LABEL_35:

  return v25;
}

- (id)descriptionForJobsMatching:(id)a3 context:(id)a4
{
  return -[BRCFSSchedulerBase descriptionForJobsMatching:ordering:additionalColumns:additionalValuesHandler:context:](self, "descriptionForJobsMatching:ordering:additionalColumns:additionalValuesHandler:context:", a3, 0, 0, 0, a4);
}

- (void)describeInBuffer:(id)a3 aggregateOfJobsMatching:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  PQLNameInjection *tableName;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  tableName = self->_tableName;
  objc_msgSend(v8, "matchingJobsWhereSQLClause");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "fetch:", CFSTR("SELECT throttle_state, COUNT(*) FROM %@ WHERE %@ GROUP BY throttle_state"), tableName, v15);

  if (objc_msgSend(v16, "next"))
  {
    do
    {
      v17 = objc_msgSend(v16, "unsignedIntAtIndex:", 0);
      v18 = objc_msgSend(v16, "unsignedLongAtIndex:", 1);
      +[BRCDumpContext stringFromThrottleState:context:](BRCDumpContext, "stringFromThrottleState:context:", v17, v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "appendFormat:", CFSTR(" %@:%lld"), v19, v18);

    }
    while ((objc_msgSend(v16, "next") & 1) != 0);
  }

}

- (id)aggregateDescriptionForJobsMatching:(id)a3 context:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  __CFString *v10;

  v6 = (objc_class *)MEMORY[0x24BDD16A8];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  -[BRCFSSchedulerBase describeInBuffer:aggregateOfJobsMatching:context:](self, "describeInBuffer:aggregateOfJobsMatching:context:", v9, v8, v7);

  if (objc_msgSend(v9, "length"))
    v10 = (__CFString *)v9;
  else
    v10 = CFSTR(" idle");

  return v10;
}

- (unint64_t)postponeJobID:(id)a3 withThrottle:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  PQLNameInjection *tableName;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  NSString *name;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  __int128 v23;
  _OWORD v24[2];
  uint8_t buf[4];
  NSString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  memset(v24, 0, sizeof(v24));
  -[BRCFSSchedulerBase computeStamps:forJobID:throttle:shouldBackoff:](self, "computeStamps:forJobID:throttle:shouldBackoff:", v24, v6, a4, 1);
  if (DWORD1(v24[0]) == -1)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCFSSchedulerBase postponeJobID:withThrottle:].cold.2();

  }
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    name = self->_name;
    *(_DWORD *)buf = 138412802;
    v26 = name;
    v27 = 2112;
    v28 = v6;
    v29 = 2112;
    v30 = v7;
    _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@[%@]: post-poning job%@", buf, 0x20u);
  }

  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  tableName = self->_tableName;
  v23 = *(_OWORD *)((char *)v24 + 8);
  v11 = *((_QWORD *)&v24[1] + 1);
  v12 = LODWORD(v24[0]);
  objc_msgSend(v6, "matchingJobsWhereSQLClause");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "execute:", CFSTR("UPDATE %@ SET   throttle_state = 1, retry_count = %u, last_try_stamp = %llu, next_retry_stamp = %llu, expire_stamp = %llu WHERE %@"), tableName, v12, v23, v11, v13);

  -[BRCFSSchedulerBase signalWithDeadline:](self, "signalWithDeadline:", *(_QWORD *)&v24[1]);
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "changes");

  if (v15 >= 2)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[BRCFSSchedulerBase postponeJobID:withThrottle:].cold.1();

  }
  v16 = LODWORD(v24[0]);

  return v16;
}

- (brc_job_update)insertOrUpdateJobID:(id)a3 throttle:(id)a4 withState:(int)a5 insertedSQLColumn:(id)a6 insertedSQLValues:(id)a7 updatedSQLValues:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id *p_isa;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;
  int64_t v48;
  NSString *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  NSObject *v53;
  uint32_t v54;
  NSString *name;
  uint64_t v56;
  const char *v57;
  id v58;
  void *v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  PQLNameInjection *tableName;
  uint64_t v69;
  PQLNameInjection *v70;
  void *v71;
  BRCFSSchedulerBase *v72;
  void *v73;
  id v74;
  id v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  void *v88;
  uint64_t v89;
  brc_job_update result;

  v76 = *(_QWORD *)&a5;
  v89 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v75 = a8;
  v77 = 0u;
  v78 = 0u;
  -[BRCFSSchedulerBase computeStamps:forJobID:throttle:shouldBackoff:](self, "computeStamps:forJobID:throttle:shouldBackoff:", &v77, v14, a4, 0);
  if (!v14)
  {
    v58 = v16;
    brc_bread_crumbs();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
      -[BRCFSSchedulerBase insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:].cold.2();

    v16 = v58;
  }
  v73 = v16;
  v74 = v15;
  v72 = self;
  if (DWORD1(v77) == -1)
  {
    -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    tableName = self->_tableName;
    objc_msgSend(v14, "columns");
    v69 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ",", 1);
      v67 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
      v67 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = v77;
    v31 = brc_current_date_nsec();
    v32 = v78;
    objc_msgSend(v14, "columnsValues");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ",", 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v16;
      v63 = v31;
      v35 = (void *)v67;
      v37 = (void *)v69;
      v36 = v71;
      v25 = objc_msgSend(v71, "execute:", CFSTR("INSERT INTO %@( throttle_state, retry_count, last_try_stamp, next_retry_stamp, expire_stamp, %@ %@ %@) VALUES( %u, %u, %lld, %lld, %lld, %@ %@ %@)"), tableName, v69, v67, v15, v76, v30, v63, v32, v33, v34, v65);
    }
    else
    {
      v66 = v14;
      objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v31;
      v35 = (void *)v67;
      v37 = (void *)v69;
      v36 = v71;
      v25 = objc_msgSend(v71, "execute:", CFSTR("INSERT INTO %@( throttle_state, retry_count, last_try_stamp, next_retry_stamp, expire_stamp, %@ %@ %@) VALUES( %u, %u, %lld, %lld, %lld, %@ %@ %@)"), tableName, v69, v67, v15, v76, v30, v64, v32, v33, v34, v38);

      v14 = v66;
    }

    v28 = v74;
    if (!v74)

    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      p_isa = (id *)&v72->super.isa;
      goto LABEL_23;
    }
    p_isa = (id *)&v72->super.isa;
    name = v72->_name;
    v56 = BRCPrettyPrintEnum();
    *(_DWORD *)buf = 138413058;
    v80 = (const char *)name;
    v81 = 2112;
    v82 = (const char *)v14;
    v83 = 2080;
    v84 = v56;
    v85 = 2112;
    v86 = (uint64_t)v26;
    v52 = "[DEBUG] %@[%@]: created job with state %s%@";
    v53 = v27;
    v54 = 42;
  }
  else
  {
    if (!DWORD1(v77) || (v17 = *((_QWORD *)&v77 + 1)) == 0)
      v17 = brc_current_date_nsec();
    -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = self->_tableName;
    v19 = v77;
    v20 = v78;
    if (v75)
    {
      objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ",", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v75;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = v14;
    objc_msgSend(v14, "matchingJobsWhereSQLClause");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v18, "execute:", CFSTR("UPDATE %@ SET  throttle_state = %d, retry_count = %u, last_try_stamp = %lld, next_retry_stamp = %lld, expire_stamp = %lld%@ %@  WHERE %@"), v70, v76, v19, v17, v20, v21, v22, v24);

    if (!v75)
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v15;
    p_isa = (id *)&v72->super.isa;
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v14 = v23;
      goto LABEL_23;
    }
    v49 = v72->_name;
    v50 = BRCPrettyPrintEnum();
    v51 = BRCPrettyPrintEnum();
    *(_DWORD *)buf = 138413314;
    v80 = (const char *)v49;
    v81 = 2112;
    v14 = v23;
    v82 = (const char *)v23;
    v83 = 2080;
    v84 = v50;
    v85 = 2080;
    v86 = v51;
    v87 = 2112;
    v88 = v26;
    v52 = "[DEBUG] %@[%@]: updated job %s->%s%@";
    v53 = v27;
    v54 = 52;
  }
  _os_log_debug_impl(&dword_230455000, v53, OS_LOG_TYPE_DEBUG, v52, buf, v54);
LABEL_23:

  objc_msgSend(p_isa[1], "clientDB");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "changes");

  if (v40 < 2)
  {
    if ((v25 & 1) != 0)
      goto LABEL_31;
    goto LABEL_25;
  }
  brc_bread_crumbs();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
    -[BRCFSSchedulerBase postponeJobID:withThrottle:].cold.1();

  if ((v25 & 1) == 0)
  {
LABEL_25:
    objc_msgSend(p_isa[1], "clientDB");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "lastError");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      brc_bread_crumbs();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, (os_log_type_t)0x90u))
      {
        v57 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v80 = "-[BRCFSSchedulerBase insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:]";
        v81 = 2080;
        if (!a9)
          v57 = "(ignored by caller)";
        v82 = v57;
        v83 = 2112;
        v84 = (uint64_t)v42;
        v85 = 2112;
        v86 = (uint64_t)v43;
        _os_log_error_impl(&dword_230455000, v44, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a9)
      *a9 = objc_retainAutorelease(v42);

  }
LABEL_31:
  if ((_DWORD)v76 == 1)
    objc_msgSend(p_isa, "signalWithDeadline:", (_QWORD)v78);
  v45 = DWORD1(v77);
  v46 = v78;

  v47 = v45;
  v48 = v46;
  result.var1 = v48;
  result.var0 = v47;
  return result;
}

- (void)rescheduleSuspendedJobsMatching:(id)a3 inState:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  PQLNameInjection *tableName;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSString *name;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t buf[4];
  NSString *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = *(_QWORD *)&a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)v4 <= 1)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCFSSchedulerBase rescheduleSuspendedJobsMatching:inState:].cold.1();

  }
  tableName = self->_tableName;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "AND ", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "matchingJobsWhereSQLClause");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "execute:", CFSTR("UPDATE %@ SET throttle_state = 1 WHERE throttle_state = %u %@%@"), tableName, v4, v9, v10);

  v11 = objc_msgSend(v7, "changes");
  if (v11)
  {
    v12 = v11;
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      objc_msgSend(v6, "jobsDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v20 = name;
      v21 = 2048;
      v22 = v12;
      v23 = 2112;
      v24 = v16;
      v25 = 2080;
      v26 = BRCPrettyPrintEnum();
      v27 = 2112;
      v28 = v13;
      _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: retrying %lld suspended jobs matching %@ in %s%@", buf, 0x34u);

    }
    -[BRCFSSchedulerBase signal](self, "signal");
  }

}

- (int64_t)updateStamps:(throttle_stamps *)a3 throttle:(id)a4 now:(int64_t)a5
{
  id v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  void *v13;
  NSObject *v14;
  unsigned int var0;

  v7 = a4;
  if (!v7)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCFSSchedulerBase updateStamps:throttle:now:].cold.1();

  }
  v8 = objc_msgSend(v7, "nsecsToNextRetry:retryCount:now:", a3->var2, a3, a5);
  v9 = v8;
  if (!v8)
  {
    a3->var2 = a5;
    var0 = a3->var0;
    v8 = objc_msgSend(v7, "nsecsToNextRetry:retryCount:now:", a5, &var0, a5);
  }
  v10 = v8 + a5;
  if (a5 < 0)
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  a3->var3 = v10;
  v11 = objc_msgSend(v7, "nsecsBeforeForgettingCounter") + a5;
  a3->var4 = v11;
  if (v11 < objc_msgSend(v7, "nsecsBeforeForgettingCounter"))
    a3->var4 = 0x7FFFFFFFFFFFFFFFLL;

  return v9;
}

- (void)computeStamps:(throttle_stamps *)a3 forJobID:(id)a4 throttle:(id)a5 shouldBackoff:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  PQLNameInjection *tableName;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSString *name;
  unsigned int var0;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint8_t buf[4];
  NSString *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v6 = a6;
  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = brc_current_date_nsec();
  if (!v10)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[BRCFSSchedulerBase insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:].cold.2();

  }
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  tableName = self->_tableName;
  objc_msgSend(v10, "matchingJobsWhereSQLClause");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "fetch:", CFSTR("SELECT retry_count, last_try_stamp, next_retry_stamp, expire_stamp, throttle_state FROM %@ WHERE %@"), tableName, v15);

  if (!objc_msgSend(v16, "next"))
  {
    *(_OWORD *)&a3->var0 = 0u;
    *(_OWORD *)&a3->var3 = 0u;
    a3->var1 = -1;
    a3->var4 = objc_msgSend(v11, "nsecsBeforeForgettingCounter") + v12;
    if (!v6)
      goto LABEL_11;
    goto LABEL_7;
  }
  a3->var0 = objc_msgSend(v16, "unsignedIntAtIndex:", 0);
  a3->var2 = objc_msgSend(v16, "longLongAtIndex:", 1);
  a3->var3 = objc_msgSend(v16, "longLongAtIndex:", 2);
  a3->var4 = objc_msgSend(v16, "longLongAtIndex:", 3);
  a3->var1 = objc_msgSend(v16, "unsignedIntAtIndex:", 4);
  if (objc_msgSend(v16, "next"))
  {
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[BRCFSSchedulerBase computeStamps:forJobID:throttle:shouldBackoff:].cold.1();

  }
  objc_msgSend(v16, "close");
  if (v6)
  {
LABEL_7:
    if (-[BRCFSSchedulerBase updateStamps:throttle:now:](self, "updateStamps:throttle:now:", a3, v11, v12))
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        name = self->_name;
        brc_interval_from_nsec();
        var0 = a3->var0;
        *(_DWORD *)buf = 138413314;
        v27 = name;
        v28 = 2112;
        v29 = v10;
        v30 = 2048;
        v31 = v21;
        v32 = 1024;
        v33 = var0;
        v34 = 2112;
        v35 = v17;
        _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] %@[%@]: backing off %.3fs (count: %d)%@", buf, 0x30u);
      }

    }
  }
LABEL_11:

}

- (BOOL)setState:(int)a3 forJobID:(id)a4
{
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v9;
  NSObject *v10;

  v5 = -[BRCFSSchedulerBase setState:forJobsMatching:](self, "setState:forJobsMatching:", *(_QWORD *)&a3, a4);
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "changes");

  if (v7 >= 2)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCFSSchedulerBase postponeJobID:withThrottle:].cold.1();

  }
  return v5;
}

- (BOOL)setState:(int)a3 forJobsMatching:(id)a4
{
  id v6;
  void *v7;
  PQLNameInjection *tableName;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSString *name;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  int v20;
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  tableName = self->_tableName;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __47__BRCFSSchedulerBase_setState_forJobsMatching___block_invoke;
  v19[3] = &unk_24FE41C40;
  v20 = a3;
  v19[4] = self;
  v9 = (void *)MEMORY[0x2348BA0DC](v19);
  objc_msgSend(v6, "matchingJobsWhereSQLClause");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "execute:", CFSTR("UPDATE %@   SET throttle_state = call_block(%@, next_retry_stamp) WHERE %@"), tableName, v9, v10);

  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "changes");

  if (v12)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      objc_msgSend(v6, "jobsDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = BRCPrettyPrintEnum();
      *(_DWORD *)buf = 138413314;
      v22 = name;
      v23 = 2112;
      v24 = v17;
      v25 = 2048;
      v26 = v12;
      v27 = 2080;
      v28 = v18;
      v29 = 2112;
      v30 = v13;
      _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] %@[%@]: Updated %lld jobs to state %s%@", buf, 0x34u);

    }
  }

  return v12 != 0;
}

void __47__BRCFSSchedulerBase_setState_forJobsMatching___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  int v5;

  v5 = *(_DWORD *)(a1 + 40);
  if (v5 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "signalWithDeadline:", sqlite3_value_int64(*a4));
    v5 = *(_DWORD *)(a1 + 40);
  }
  sqlite3_result_int(a2, v5);
}

- (void)deleteJobsMatching:(id)a3
{
  id v4;
  void *v5;
  PQLNameInjection *tableName;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSString *name;
  void *v13;
  uint8_t buf[4];
  NSString *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  tableName = self->_tableName;
  objc_msgSend(v4, "matchingJobsWhereSQLClause");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "execute:", CFSTR("DELETE FROM %@ WHERE %@"), tableName, v7);

  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "changes");

  if (v9)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      objc_msgSend(v4, "jobsDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v15 = name;
      v16 = 2112;
      v17 = v13;
      v18 = 2048;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %@[%@]: Deleted %lld jobs%@", buf, 0x2Au);

    }
    -[BRCFSSchedulerBase checkIfHasWork](self, "checkIfHasWork");
  }

}

- (void)resetBackoffForJobWithID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  PQLNameInjection *tableName;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *name;
  void *v13;
  NSObject *v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    name = self->_name;
    *(_DWORD *)buf = 138412802;
    v16 = name;
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v5;
    _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@[%@]: resetting backoff for job%@", buf, 0x20u);
  }

  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  tableName = self->_tableName;
  objc_msgSend(v4, "matchingJobsWhereSQLClause");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "execute:", CFSTR("UPDATE %@   SET retry_count = 0, next_retry_stamp = 0 WHERE %@"), tableName, v9);

  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "changes");

  if (v11 >= 2)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCFSSchedulerBase postponeJobID:withThrottle:].cold.1();

  }
}

- (void)deleteExpiredJobs
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSString *name;
  uint8_t buf[4];
  NSString *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "execute:", CFSTR("DELETE FROM %@ WHERE throttle_state = 0 AND expire_stamp <= %lld"), self->_tableName, brc_current_date_nsec());

  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "changes");

  if (v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      *(_DWORD *)buf = 138412802;
      v10 = name;
      v11 = 2048;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Cleaned up %lld expired jobs%@", buf, 0x20u);
    }

  }
}

- (unint64_t)recoverAndReportMissingJobs
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCFSSchedulerBase recoverAndReportMissingJobs].cold.1();

  return 0;
}

- (void)checkIfHasWork
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSString *name;
  uint8_t buf[4];
  NSString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!-[BRCFSSchedulerBase hasActiveWork](self, "hasActiveWork") && -[BRCFSSchedulerBase hasWork](self, "hasWork"))
  {
    -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "numberWithSQL:", CFSTR("SELECT throttle_id FROM %@ WHERE throttle_state > 0 LIMIT 1"), self->_tableName);

    if (v4)
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        name = self->_name;
        *(_DWORD *)buf = 138412802;
        v9 = name;
        v10 = 2112;
        v11 = v4;
        v12 = 2112;
        v13 = v5;
        _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Throttle id %@ has work%@", buf, 0x20u);
      }

    }
    -[BRCFSSchedulerBase setHasWork:](self, "setHasWork:", v4 != 0);

  }
}

- (void)signalWithDeadline:(int64_t)a3
{
  -[BRCFSSchedulerBase setHasActiveWork:](self, "setHasActiveWork:", 1);
  -[BRCFSSchedulerBase setHasWork:](self, "setHasWork:", 1);
  -[BRCDeadlineSource signalWithDeadline:](self->_schedulerSource, "signalWithDeadline:", a3);
}

- (void)signal
{
  -[BRCFSSchedulerBase signalWithDeadline:](self, "signalWithDeadline:", 0);
}

- (void)schedule
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_fault_impl(&dword_230455000, v3, OS_LOG_TYPE_FAULT, "[CRIT] API MISUSE: should be implemented by subclass%@", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)canScheduleMoreJobs
{
  return 1;
}

- (void)scheduleWithBatchSize:(int)a3 whereSQLClause:(id)a4 columns:(id)a5 actionHandler:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void (**v12)(id, void *, uint64_t);
  uint64_t v13;
  void *v14;
  void *v15;
  PQLNameInjection *tableName;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSString *name;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  NSString *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v8 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *, uint64_t))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerWorkloop);
  v13 = brc_current_date_nsec();
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCAccountSessionFPFS isCancelled](self->_session, "isCancelled"))
  {
    v15 = 0;
    goto LABEL_21;
  }
  v28 = v11;
  if (!self->_firstSchedulingAfterStartupDone)
  {
    -[BRCFSSchedulerBase performFirstSchedulingAfterStartupInDB:](self, "performFirstSchedulingAfterStartupInDB:", v14);
    self->_firstSchedulingAfterStartupDone = 1;
  }
  tableName = self->_tableName;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "AND (", 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ")", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "fetch:", CFSTR("  SELECT next_retry_stamp, %@     FROM %@    WHERE throttle_state = 1          %@%@%@      AND next_retry_stamp >= 0 ORDER BY next_retry_stamp    LIMIT %u"), v11, tableName, v17, v10, v18, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "fetch:", CFSTR("  SELECT next_retry_stamp, %@     FROM %@    WHERE throttle_state = 1          %@%@%@      AND next_retry_stamp >= 0 ORDER BY next_retry_stamp    LIMIT %u"), v11, tableName, v17, v18, v19, v8);

    v10 = 0;
  }

  if (!objc_msgSend(v15, "next"))
  {
    -[BRCFSSchedulerBase setHasActiveWork:](self, "setHasActiveWork:", 0);
LABEL_18:
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[BRCFSSchedulerBase scheduleWithBatchSize:whereSQLClause:columns:actionHandler:].cold.1();

    -[BRCFSSchedulerBase checkIfHasWork](self, "checkIfHasWork");
    goto LABEL_21;
  }
  v20 = objc_msgSend(v15, "longLongAtIndex:", 0);
  if (-[BRCFSSchedulerBase canScheduleMoreJobs](self, "canScheduleMoreJobs"))
  {
    do
    {
      objc_msgSend(v15, "longLongAtIndex:", 0);
      if (!brc_is_before_deadline())
        break;
      v21 = (void *)MEMORY[0x2348B9F14]();
      if (-[BRCFSSchedulerBase isCancelled](self, "isCancelled")
        || (v12[2](v12, v15, 1), (objc_msgSend(v15, "next") & 1) == 0))
      {
        objc_autoreleasePoolPop(v21);
        break;
      }
      objc_autoreleasePoolPop(v21);
    }
    while (-[BRCFSSchedulerBase canScheduleMoreJobs](self, "canScheduleMoreJobs"));
  }
  objc_msgSend(v15, "close");
  if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_18;
  if (self->_hasActiveWork)
  {
    if (v20 <= v13)
    {
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[BRCFSSchedulerBase scheduleWithBatchSize:whereSQLClause:columns:actionHandler:].cold.2();
    }
    else
    {
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        name = self->_name;
        brc_interval_from_nsec();
        *(_DWORD *)buf = 138412802;
        v30 = name;
        v11 = v28;
        v31 = 2048;
        v32 = v27;
        v33 = 2112;
        v34 = v24;
        _os_log_debug_impl(&dword_230455000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: going to sleep for %.3fs%@", buf, 0x20u);
      }
    }

    -[BRCDeadlineSource signalWithDeadline:](self->_schedulerSource, "signalWithDeadline:", v20);
  }
LABEL_21:

}

- (void)resume
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] %@: resuming!%@");
  OUTLINED_FUNCTION_0();
}

- (void)suspend
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] %@: suspending!%@");
  OUTLINED_FUNCTION_0();
}

- (void)cancel
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] %@: cancelling!%@");
  OUTLINED_FUNCTION_0();
}

- (void)_close
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.isCancelled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)close
{
  NSObject *schedulerWorkloop;
  _QWORD block[5];

  schedulerWorkloop = self->_schedulerWorkloop;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__BRCFSSchedulerBase_close__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_async_and_wait(schedulerWorkloop, block);
}

uint64_t __27__BRCFSSchedulerBase_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_close");
}

- (OS_dispatch_group)hasWorkGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHasWorkGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_group)hasActiveWorkGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHasActiveWorkGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)hasActiveWork
{
  return self->_hasActiveWork;
}

- (BOOL)hasWork
{
  return self->_hasWork;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (PQLNameInjection)tableName
{
  return (PQLNameInjection *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_hasActiveWorkGroup, 0);
  objc_storeStrong((id *)&self->_hasWorkGroup, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_schedulerWorkloop, 0);
  objc_storeStrong((id *)&self->_schedulerSource, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __53__BRCFSSchedulerBase_initWithSession_name_tableName___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_230455000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] cancelled%@", v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)postponeJobID:withThrottle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _session.clientDB.changes <= 1%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)postponeJobID:withThrottle:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: stamps.state != BRCJobStateInvalid%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: jobID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)rescheduleSuspendedJobsMatching:inState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: state >= BRCJobStateSuspendedBase%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateStamps:throttle:now:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: throttle%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)computeStamps:forJobID:throttle:shouldBackoff:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !rs.next%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)recoverAndReportMissingJobs
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: must be implemented in subclass%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)scheduleWithBatchSize:whereSQLClause:columns:actionHandler:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  const char *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  v4 = *(unsigned __int8 *)(v3 + 41);
  v6 = 138412802;
  if (v4)
    v5 = "with active work";
  else
    v5 = "";
  v7 = v2;
  v8 = 2080;
  v9 = v5;
  v10 = 2112;
  v11 = v0;
  _os_log_debug_impl(&dword_230455000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: nothing schedulable, going to sleep %s%@", (uint8_t *)&v6, 0x20u);
}

- (void)scheduleWithBatchSize:whereSQLClause:columns:actionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] %@: Finishing batch and allowing other jobs to run%@");
  OUTLINED_FUNCTION_0();
}

@end
