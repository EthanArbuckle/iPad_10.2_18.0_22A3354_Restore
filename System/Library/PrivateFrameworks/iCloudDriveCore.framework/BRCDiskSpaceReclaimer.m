@implementation BRCDiskSpaceReclaimer

+ (int)simpleUrgencyForCacheDeleteUrgency:(int)a3
{
  if ((a3 - 1) >= 4)
    return 3;
  else
    return a3;
}

- (BRCDiskSpaceReclaimer)initWithAccountSession:(id)a3
{
  id v5;
  BRCDiskSpaceReclaimer *v6;
  BRCDiskSpaceReclaimer *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  dispatch_block_t v12;
  void *v13;
  int v14;
  dispatch_time_t v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BRCDiskSpaceReclaimer;
  v6 = -[BRCDiskSpaceReclaimer init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.bird.cache-delete", v9);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    objc_initWeak(&location, v5);
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke;
    v20 = &unk_24FE3F9C8;
    objc_copyWeak(&v21, &location);
    v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, &v17);
    +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager", v17, v18, v19, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "connectedToPowerSource");

    if (v14)
    {
      v15 = dispatch_time(0, 5000000000);
      dispatch_after(v15, (dispatch_queue_t)v7->_queue, v12);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id WeakRetained;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "connectedToPowerSource");

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "clientDB");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = MEMORY[0x24BDAC760];
    if (v4)
    {
      objc_msgSend(WeakRetained, "clientDB");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serialQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_2;
      block[3] = &unk_24FE3FA18;
      v15 = WeakRetained;
      dispatch_sync(v7, block);

    }
    objc_msgSend(WeakRetained, "serverDB");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(WeakRetained, "serverDB");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "serialQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v12[0] = v5;
      v12[1] = 3221225472;
      v12[2] = __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_3;
      v12[3] = &unk_24FE3FA18;
      v13 = WeakRetained;
      dispatch_sync(v10, v12);

    }
  }
}

void __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "autovacuumIfNeeded");

}

void __48__BRCDiskSpaceReclaimer_initWithAccountSession___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "serverDB");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "autovacuumIfNeeded");

}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__BRCDiskSpaceReclaimer_close__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __30__BRCDiskSpaceReclaimer_close__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = 1;
  return result;
}

- (void)computePurgeableSpaceForAllUrgenciesWithReply:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke;
  v7[3] = &unk_24FE409B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void (**v38)(_QWORD, _QWORD, _QWORD);
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  _QWORD v57[5];
  _QWORD v58[6];
  _QWORD block[6];
  uint64_t v60[3];
  _BYTE v61[32];
  _BYTE v62[32];
  _BYTE buf[24];
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 16) || *(_BYTE *)(v2 + 17))
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorOperationCancelled");
    v56 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0);

    return;
  }
  objc_msgSend(*(id *)(v2 + 8), "clientState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("purgeableSpaceDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v6);
  v9 = v8;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cacheDeleteRecomputeInterval");
  v12 = v11;

  if (!v6 || v9 >= v12)
    goto LABEL_14;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("purgeableSpace"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nonPurgeableSpace"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v13 || !v14)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_230455000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] could not retrieve cached purgeable space%@", buf, 0xCu);
    }

LABEL_14:
    memset(v60, 0, sizeof(v60));
    __brc_create_section(0, (uint64_t)"-[BRCDiskSpaceReclaimer computePurgeableSpaceForAllUrgenciesWithReply:]_block_invoke", 145, v60);
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_4(v60);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v64 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "serialQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_12;
    block[3] = &unk_24FE429C0;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = buf;
    dispatch_sync(v23, block);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "serverDB");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "serialQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    v58[0] = v24;
    v58[1] = 3221225472;
    v58[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2;
    v58[3] = &unk_24FE429C0;
    v58[4] = *(_QWORD *)(a1 + 32);
    v58[5] = buf;
    dispatch_sync(v26, v58);

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "dbReclaimableSpaceThreshold");

    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = (*(_QWORD *)(*(_QWORD *)&buf[8] + 24) - v28) & ~((*(_QWORD *)(*(_QWORD *)&buf[8] + 24)
                                                                                               - v28) >> 63);
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24), 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_3(v31, (uint64_t)v29, (uint64_t)v62);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stageRegistry");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "purgableSpace");

    brc_bread_crumbs();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", v33, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_2(v36, (uint64_t)v34, (uint64_t)v61);
    }

    v37 = objc_msgSend(*(id *)(a1 + 32), "_computeCiconiaSizeInBytes:", 0);
    v57[0] = v24;
    v57[1] = 3221225472;
    v57[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_15;
    v57[3] = &unk_24FE49D00;
    v57[4] = *(_QWORD *)(a1 + 32);
    v38 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2348BA0DC](v57);
    brc_bread_crumbs();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_1((uint64_t)v39, v40, v41, v42, v43, v44, v45, v46);

    v47 = (void *)objc_opt_new();
    v48 = v37 + v33;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v48 + *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v49, &unk_24FEB3BC0);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v48 + *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v50, &unk_24FEB3BD8);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v48 + *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v51, &unk_24FEB3BF0);

    v52 = objc_msgSend(*(id *)(a1 + 32), "nonPurgeableSizeWithPurgeableSize:", v48 + *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v38)[2](v38, v47, v53);

    v54 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v52);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, _QWORD))(v54 + 16))(v54, v47, v55, 0);

    _Block_object_dispose(buf, 8);
    __brc_leave_section(v60);
    goto LABEL_23;
  }
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v64 = v16;
    _os_log_debug_impl(&dword_230455000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] returning purgeable info from cache\npurgeableSpaceByUrgency:%@\nnonPurgeableSpace:%@%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_23:

}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_12(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v2, "autovacuumableSpaceInBytes");

}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "serverDB");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v2, "autovacuumableSpaceInBytes");

}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2_16;
  block[3] = &unk_24FE3FA88;
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v8, block);

}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_2_16(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 8), "clientState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("purgeableSpaceDate"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", a1[5], CFSTR("purgeableSpace"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", a1[6], CFSTR("nonPurgeableSpace"));
  objc_msgSend(*(id *)(a1[4] + 8), "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceBatchStart");

}

- (int64_t)_computeCiconiaSizeInBytes:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  BOOL v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  char v27;
  id v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  unsigned __int8 v41;
  _BYTE v42[128];
  uint64_t v43;

  v3 = a3;
  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "brc_ciconiaDumpDirForCurrentPersona");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v6, &v41);
  v8 = v41;

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v5, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributesOfItemAtPath:error:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileCreationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "timeIntervalSinceNow");
    v10 = 0;
    if (fabs(v14) > 86400.0)
    {
      v32 = v3;
      v33 = v13;
      v15 = *MEMORY[0x24BDBCC48];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *MEMORY[0x24BDBCC48]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v4;
      objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v16, 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v19)
      {
        v20 = v19;
        v21 = 0;
        v10 = 0;
        v22 = *(_QWORD *)v38;
        do
        {
          v23 = 0;
          v24 = v21;
          do
          {
            if (*(_QWORD *)v38 != v22)
              objc_enumerationMutation(v18);
            v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v23);
            v36 = 0;
            v26 = objc_msgSend(v25, "getResourceValue:forKey:error:", &v36, v15, 0);
            v21 = v36;

            if (v26)
              v10 += objc_msgSend(v21, "unsignedLongLongValue");
            ++v23;
            v24 = v21;
          }
          while (v20 != v23);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v20);
      }
      else
      {
        v21 = 0;
        v10 = 0;
      }

      if (v32)
      {
        v35 = 0;
        v4 = v34;
        v27 = objc_msgSend(v34, "removeItemAtURL:error:", v5, &v35);
        v28 = v35;
        if ((v27 & 1) == 0)
        {
          brc_bread_crumbs();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
            -[BRCDiskSpaceReclaimer _computeCiconiaSizeInBytes:].cold.1((uint64_t)v28);

          v10 = 0;
        }

      }
      else
      {
        v4 = v34;
      }

      v13 = v33;
    }

  }
  return v10;
}

- (int64_t)_dbSizeInBytes:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(v3, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __40__BRCDiskSpaceReclaimer__dbSizeInBytes___block_invoke;
    v8[3] = &unk_24FE429C0;
    v10 = &v11;
    v9 = v4;
    dispatch_sync(v5, v8);

    v6 = v12[3];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __40__BRCDiskSpaceReclaimer__dbSizeInBytes___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "sizeInBytes");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_dbAutovacuumableSpaceInBytes:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(v3, "serialQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v5);

  }
  if (v3)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    objc_msgSend(v3, "serialQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __55__BRCDiskSpaceReclaimer__dbAutovacuumableSpaceInBytes___block_invoke;
    v9[3] = &unk_24FE429C0;
    v11 = &v12;
    v10 = v3;
    dispatch_sync(v6, v9);

    v7 = v13[3];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __55__BRCDiskSpaceReclaimer__dbAutovacuumableSpaceInBytes___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "autovacuumableSpaceInBytes");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_fullVacuumIfPossible:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int64_t v7;

  v4 = a3;
  objc_msgSend(v4, "serialQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "serialQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v6);

  }
  if (v4)
    v7 = -[BRCDiskSpaceReclaimer _doIncrementalVacuum:amount:](self, "_doIncrementalVacuum:amount:", v4, -[BRCDiskSpaceReclaimer _dbAutovacuumableSpaceInBytes:](self, "_dbAutovacuumableSpaceInBytes:", v4));
  else
    v7 = 0;

  return v7;
}

- (int64_t)_doIncrementalVacuum:(id)a3 amount:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  NSObject *v14;
  int64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v23;
  _QWORD block[4];
  id v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "serialQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v8);

  }
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v23, "dbAutovacuumBatchSize");
  if (v9)
    v10 = v9;
  else
    v10 = a4;
  mach_absolute_time();
  v11 = -[BRCDiskSpaceReclaimer _dbSizeInBytes:](self, "_dbSizeInBytes:", v6);
  if (a4 >= 1)
  {
    v12 = 0;
    v13 = MEMORY[0x24BDAC760];
    do
    {
      objc_msgSend(v6, "serialQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = v13;
      block[1] = 3221225472;
      block[2] = __53__BRCDiskSpaceReclaimer__doIncrementalVacuum_amount___block_invoke;
      block[3] = &unk_24FE44CF0;
      v25 = v6;
      v26 = a4;
      v27 = v12;
      v28 = v10;
      dispatch_sync(v14, block);

      v12 += v10;
    }
    while (v12 < a4);
  }
  v15 = v11 - -[BRCDiskSpaceReclaimer _dbSizeInBytes:](self, "_dbSizeInBytes:", v6);
  mach_absolute_time();
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_monotonic_time_diff_to_interval();
    v20 = v19;
    +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", v15, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v30 = v18;
    v31 = 2048;
    v32 = v20;
    v33 = 2112;
    v34 = v21;
    v35 = 2048;
    v36 = (double)v15 * 100.0 / (double)v11;
    v37 = 2112;
    v38 = v16;
    _os_log_impl(&dword_230455000, v17, OS_LOG_TYPE_INFO, "[INFO] Incremental vacuuming %@ took %f seconds reclaimed %@ (size reduction %.2f percent)%@", buf, 0x34u);

  }
  return v15;
}

uint64_t __53__BRCDiskSpaceReclaimer__doIncrementalVacuum_amount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(a1 + 40) - v1 >= *(_QWORD *)(a1 + 56))
    v2 = *(_QWORD *)(a1 + 56);
  else
    v2 = *(_QWORD *)(a1 + 40) - v1;
  return objc_msgSend(*(id *)(a1 + 32), "incrementalVacuum:", v2);
}

- (int64_t)_vacuumDB:(id)a3 amount:(int64_t)a4 withUrgency:(int)a5
{
  id v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;

  v8 = a3;
  v9 = -[BRCDiskSpaceReclaimer _dbAutovacuumableSpaceInBytes:](self, "_dbAutovacuumableSpaceInBytes:", v8);
  if (v8)
  {
    if (a5 < 3 || 2 * v9 >= a4)
      v10 = -[BRCDiskSpaceReclaimer _doIncrementalVacuum:amount:](self, "_doIncrementalVacuum:amount:", v8, a4);
    else
      v10 = -[BRCDiskSpaceReclaimer _fullVacuumIfPossible:](self, "_fullVacuumIfPossible:", v8);
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_asyncAutovacuumIfNeeds:(id)a3
{
  id v4;
  NSObject *v5;
  BRCAccountSessionFPFS *session;
  _QWORD block[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    session = self->_session;
    if (session)
    {
      if (!-[BRCAccountSessionFPFS isCancelled](session, "isCancelled"))
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __49__BRCDiskSpaceReclaimer__asyncAutovacuumIfNeeds___block_invoke;
        block[3] = &unk_24FE3FA18;
        v8 = v4;
        dispatch_async(v5, block);

      }
    }
  }

}

uint64_t __49__BRCDiskSpaceReclaimer__asyncAutovacuumIfNeeds___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "autovacuumIfNeeded");
}

- (int64_t)_garbageCollectGroupContainerStage
{
  void *v3;
  double v4;
  int64_t v5;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadStageAgeDelta");
  v5 = -[BRCDiskSpaceReclaimer _garbageCollectGroupContainersStageOfType:maxAgeDelta:](self, "_garbageCollectGroupContainersStageOfType:maxAgeDelta:", 0, (uint64_t)v4);

  return v5;
}

- (int64_t)_garbageCollectGroupContainersStageOfType:(signed __int16)a3 maxAgeDelta:(int64_t)a4
{
  void *v5;
  time_t v6;
  id v7;
  int64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  uint64_t *v13;
  time_t v14;
  int64_t v15;
  _QWORD v16[3];
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  -[BRCAccountSessionFPFS groupContainerStagePathForCurrentPersonaFromStageType:](self->_session, "groupContainerStagePathForCurrentPersonaFromStageType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = time(0);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__BRCDiskSpaceReclaimer__garbageCollectGroupContainersStageOfType_maxAgeDelta___block_invoke;
  v10[3] = &unk_24FE49D28;
  v12 = v16;
  v7 = v5;
  v14 = v6;
  v15 = a4;
  v11 = v7;
  v13 = &v18;
  BRCRemoveFolderInAutoreleasepool(v7, v10, 1, 0);
  v8 = v19[3];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

uint64_t __79__BRCDiskSpaceReclaimer__garbageCollectGroupContainersStageOfType_maxAgeDelta___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  int v6;
  uint64_t result;

  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24)
    || (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", a1[4]),
        v5,
        !v6))
  {
    if (a3 && a1[7] - *(_QWORD *)(a3 + 48) >= a1[8])
    {
      result = 0;
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += *(_QWORD *)(a3 + 96);
    }
    else
    {
      return 1;
    }
  }
  else
  {
    result = 0;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  return result;
}

- (void)_cleanFPCreationItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  NSObject *v22;

  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCDiskSpaceReclaimer _cleanFPCreationItemIdentifier:].cold.2((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  -[BRCAccountSessionFPFS clientState](self->_session, "clientState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("most-recent-item-creation-date"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "itemsCreationAgeDelta");
  v17 = v16;

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", v14);
    v20 = v19;

    if (v20 > (double)(uint64_t)v17)
    {
      objc_msgSend(v4, "execute:", CFSTR("UPDATE client_items SET fp_creation_item_identifier = NULL WHERE fp_creation_item_identifier IS NOT NULL"));
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[BRCDiskSpaceReclaimer _cleanFPCreationItemIdentifier:].cold.1(v4, (uint64_t)v21, v22);

    }
  }

}

- (int64_t)_purgeSpaceUnderQueue:(int64_t)a3 withUrgency:(int)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSObject *v23;

  if (a3 <= 0)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:].cold.1(a3, (uint64_t)v17, v18);

    +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "connectedToPowerSource");

    if (v20)
    {
      -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCDiskSpaceReclaimer _asyncAutovacuumIfNeeds:](self, "_asyncAutovacuumIfNeeds:", v21);

      -[BRCAccountSessionFPFS serverDB](self->_session, "serverDB");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCDiskSpaceReclaimer _asyncAutovacuumIfNeeds:](self, "_asyncAutovacuumIfNeeds:", v22);

    }
    return 0;
  }
  else
  {
    v6 = *(_QWORD *)&a4;
    -[BRCAccountSessionFPFS stageRegistry](self->_session, "stageRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "purgeSpace:withUrgency:", a3, v6);

    v9 = -[BRCDiskSpaceReclaimer _garbageCollectGroupContainerStage](self, "_garbageCollectGroupContainerStage") + v8;
    if (a3 <= v9)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[BRCDiskSpaceReclaimer _purgeSpaceUnderQueue:withUrgency:].cold.2(v9, (uint64_t)v16, v23);

    }
    else
    {
      -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 += -[BRCDiskSpaceReclaimer _vacuumDB:amount:withUrgency:](self, "_vacuumDB:amount:withUrgency:", v10, a3 - v9, v6);

      v11 = a3 <= v9;
      v12 = a3 - v9;
      if (!v11)
      {
        -[BRCAccountSessionFPFS serverDB](self->_session, "serverDB");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v9 += -[BRCDiskSpaceReclaimer _vacuumDB:amount:withUrgency:](self, "_vacuumDB:amount:withUrgency:", v13, v12, v6);

      }
      -[BRCAccountSessionFPFS clientState](self->_session, "clientState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, CFSTR("purgeableSpaceDate"));

      -[BRCAccountSessionFPFS clientState](self->_session, "clientState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, CFSTR("purgeableSpace"));

      -[BRCAccountSessionFPFS clientState](self->_session, "clientState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, CFSTR("nonPurgeableSpace"));
    }

  }
  return v9;
}

- (int64_t)purgeSpace:(int64_t)a3 withUrgency:(int)a4
{
  NSObject *queue;
  int64_t v5;
  _QWORD v7[7];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__BRCDiskSpaceReclaimer_purgeSpace_withUrgency___block_invoke;
  v7[3] = &unk_24FE49D50;
  v7[4] = self;
  v7[5] = &v9;
  v7[6] = a3;
  v8 = a4;
  dispatch_sync(queue, v7);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __48__BRCDiskSpaceReclaimer_purgeSpace_withUrgency___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[16])
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v2, "_purgeSpaceUnderQueue:withUrgency:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(*(id *)(a1 + 32), "_computeCiconiaSizeInBytes:", 1);
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", *(_QWORD *)(a1 + 48), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_DWORD *)(a1 + 56);
      v8 = 138413058;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      v12 = 1024;
      v13 = v7;
      v14 = 2112;
      v15 = v3;
      _os_log_debug_impl(&dword_230455000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] Purged %@ when asked to purge %@ for urgency %d%@", (uint8_t *)&v8, 0x26u);

    }
  }
}

- (int64_t)periodicReclaimSpace
{
  BRCAccountSessionFPFS *v3;
  NSObject *queue;
  BRCAccountSessionFPFS *v5;
  int64_t v6;
  _QWORD block[5];
  BRCAccountSessionFPFS *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = self->_session;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke;
  block[3] = &unk_24FE49D78;
  v9 = v3;
  v10 = &v11;
  block[4] = self;
  v5 = v3;
  dispatch_sync(queue, block);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  uint64_t v19;
  id v20;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    objc_msgSend(*(id *)(v1 + 8), "stageRegistry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "purgeSpace:withUrgency:", 0x7FFFFFFFFFFFFFFFLL, 4294967294);
    v6 = *(_QWORD *)(a1 + 48);
    v5 = a1 + 48;
    *(_QWORD *)(*(_QWORD *)(v6 + 8) + 24) += v4;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) += objc_msgSend(*(id *)(v5 - 16), "_computeCiconiaSizeInBytes:", 1);
    objc_msgSend(*(id *)(v5 - 8), "clientDB");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_2;
    v18 = &unk_24FE41988;
    v8 = *(void **)(v5 - 8);
    v19 = *(_QWORD *)(v5 - 16);
    v20 = v8;
    objc_msgSend(v7, "performWithFlags:action:", 1, &v15);

    v9 = *(void **)(v5 - 16);
    objc_msgSend(*(id *)(v5 - 8), "clientDB", v15, v16, v17, v18, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) += objc_msgSend(v9, "_fullVacuumIfPossible:", v10);

    v11 = *(void **)(v5 - 16);
    objc_msgSend(*(id *)(v5 - 8), "serverDB");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) += objc_msgSend(v11, "_fullVacuumIfPossible:", v12);

    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_cold_1(v5, (uint64_t)v13, v14);

  }
}

uint64_t __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_cleanFPCreationItemIdentifier:", v4);
  objc_msgSend(*(id *)(a1 + 40), "namedThrottleManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cleanNamedThrottleTable:", v4);

  objc_msgSend(*(id *)(a1 + 40), "fsUploader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteExpiredJobs");

  objc_msgSend(*(id *)(a1 + 40), "fsDownloader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteExpiredJobs");

  objc_msgSend(*(id *)(a1 + 40), "applyScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteExpiredJobs");

  objc_msgSend(*(id *)(a1 + 40), "syncUpScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteExpiredJobs");

  objc_msgSend(*(id *)(a1 + 40), "analyticsReporter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deleteMissingErrorThrottles");

  return 1;
}

- (int)urgencyForCacheDeleteUrgency:(int)a3
{
  void *v4;

  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertOnQueue");

  if ((a3 - 1) >= 4)
    return 3;
  else
    return a3;
}

+ (double)accessTimeDeltaForUrgency:(int)a3
{
  double v3;
  void *v4;
  double v5;

  v3 = 978307200.0;
  switch(a3)
  {
    case -2:
    case 1:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessTimeDeltaInLowUrgency");
      goto LABEL_6;
    case 2:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessTimeDeltaInMedUrgency");
      goto LABEL_6;
    case 3:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessTimeDeltaInHighUrgency");
      goto LABEL_6;
    case 4:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessTimeDeltaInVeryHighUrgency");
LABEL_6:
      v3 = v5;

      break;
    default:
      return v3;
  }
  return v3;
}

- (BOOL)renameAndUnlinkInBackgroundItemAt:(int)a3 path:(id)a4
{
  uint64_t v4;
  BRCAccountSessionFPFS *session;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  session = self->_session;
  v6 = a4;
  -[BRCAccountSessionFPFS fileUnlinker](session, "fileUnlinker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "renameAndUnlinkInBackgroundItemAt:path:", v4, v6);

  return v4;
}

- (int64_t)cachedPurgeableSpaceForUrgency:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = *(_QWORD *)&a3;
  -[BRCAccountSessionFPFS clientState](self->_session, "clientState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("purgeableSpace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  return v8;
}

- (int64_t)cachedNonPurgeableSpace
{
  void *v2;
  void *v3;
  int64_t v4;

  -[BRCAccountSessionFPFS clientState](self->_session, "clientState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nonPurgeableSpace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (BOOL)performOptimizeStorageWithTimeDelta:(double)a3 onDiskAccessTimeDelta:(double)a4 error:(id *)a5
{
  void *v6;
  char *v7;
  NSObject *v8;
  dispatch_time_t v9;
  intptr_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  brc_task_tracker_create("com.apple.bird.eviction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v7 = (char *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v7;
    _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] evicting for storage optimization%@", (uint8_t *)&v18, 0xCu);
  }

  v9 = dispatch_time(0, 60000000000);
  v10 = brc_task_tracker_wait_timeout((uint64_t)v6, v9);
  if (v10)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      -[BRCDiskSpaceReclaimer performOptimizeStorageWithTimeDelta:onDiskAccessTimeDelta:error:].cold.1((uint64_t)v11, v12);

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:description:", 60, CFSTR("timed out waiting for eviction"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        v17 = "(passed to caller)";
        v18 = 136315906;
        v19 = "-[BRCDiskSpaceReclaimer performOptimizeStorageWithTimeDelta:onDiskAccessTimeDelta:error:]";
        v20 = 2080;
        if (!a5)
          v17 = "(ignored by caller)";
        v21 = v17;
        v22 = 2112;
        v23 = v13;
        v24 = 2112;
        v25 = v14;
        _os_log_error_impl(&dword_230455000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v18, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v13);

  }
  return v10 == 0;
}

- (unint64_t)_recursivelySizeDirectoryAtPath:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  unint64_t v6;
  int v7;
  int v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v17[2];
  _BYTE buf[24];
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:].cold.1((uint64_t)v12, v13, v14);

LABEL_14:
    v6 = 0;
    goto LABEL_24;
  }
  v4 = objc_retainAutorelease(v3);
  v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");
  v6 = (unint64_t)v5;
  if (v5)
  {
    v7 = open(v5, 1048832);
    if ((v7 & 0x80000000) == 0)
    {
      v8 = v7;
      v19 = 0u;
      *(_OWORD *)&buf[8] = 0u;
      *(_QWORD *)buf = 1;
      if (ffsctl(v7, 0xC0284A20uLL, buf, 0) < 0
        && (*__error() != 45
         || (v17[0] = 0, ffsctl(v8, 0x80084A02uLL, v17, 0) < 0)
         || ffsctl(v8, 0xC0284A20uLL, buf, 0) < 0))
      {
        v17[0] = 0;
        v17[1] = 0;
        if (dirstat_np())
        {
          brc_bread_crumbs();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
            -[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:].cold.3((uint64_t)v4, (uint64_t)v9, v10);
          v6 = 0;
          goto LABEL_23;
        }
        v6 = v17[0];
        brc_bread_crumbs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
LABEL_23:

          close(v8);
          goto LABEL_24;
        }
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v4;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&v19 = v9;
        v11 = "[DEBUG] space for %@ is %llu bytes (hfs compat. dirstat)%@";
      }
      else
      {
        v6 = v19;
        brc_bread_crumbs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          goto LABEL_23;
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v4;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&v19 = v9;
        v11 = "[DEBUG] space for %@ is %llu bytes (apfs dirstat)%@";
      }
      _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, v11, buf, 0x20u);
      goto LABEL_23;
    }
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:].cold.2((uint64_t)v4);

    goto LABEL_14;
  }
LABEL_24:

  return v6;
}

- (unint64_t)nonPurgeableSizeWithPurgeableSize:(unint64_t)a3
{
  unint64_t v4;

  v4 = -[BRCDiskSpaceReclaimer totalSize](self, "totalSize");
  if (v4 >= a3)
    return v4 - a3;
  else
    return 0;
}

- (unint64_t)totalSize
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  -[BRCAccountSessionFPFS sessionDirPath](self->_session, "sessionDirPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:](self, "_recursivelySizeDirectoryAtPath:", v3);

  -[BRCAccountSessionFPFS cacheDirPath](self->_session, "cacheDirPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:](self, "_recursivelySizeDirectoryAtPath:", v5) + v4;

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_230455000, a2, a3, "[DEBUG] not account for local document because we are on FPFS%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_2(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_230455000, v6, v4, "[DEBUG] reclaimable size from stage is %@%@", v5);

}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_3(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_230455000, v6, v4, "[DEBUG] reclaimable size from db is %@%@", v5);

}

void __71__BRCDiskSpaceReclaimer_computePurgeableSpaceForAllUrgenciesWithReply___block_invoke_cold_4(uint64_t *a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v3 = 134218242;
  v4 = v1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_230455000, v2, (uint64_t)v2, "[DEBUG] ┏%llx recomputing purgeable space for all urgencies%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)_computeCiconiaSizeInBytes:(uint64_t)a1 .cold.1(uint64_t a1)
{
  os_log_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_230455000, v1, (os_log_type_t)0x90u, "[ERROR] Failed removing ciconia_diagnose: %@%@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)_cleanFPCreationItemIdentifier:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "changes");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v4, "[DEBUG] Changed %lld items%@", v5);
}

- (void)_cleanFPCreationItemIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_230455000, a2, a3, "[DEBUG] Cleaning FP Creation Item Identifier%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)_purgeSpaceUnderQueue:(NSObject *)a3 withUrgency:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", a1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v5, "[DEBUG] no need to evict, amount requested is %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_purgeSpaceUnderQueue:(NSObject *)a3 withUrgency:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", a1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v5, "[DEBUG] evicted %@ from stage%@", v6);

  OUTLINED_FUNCTION_6();
}

void __45__BRCDiskSpaceReclaimer_periodicReclaimSpace__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 24), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v5, "[DEBUG] Periodicly reclaimed %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)performOptimizeStorageWithTimeDelta:(uint64_t)a1 onDiskAccessTimeDelta:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_230455000, a2, (os_log_type_t)0x90u, "[ERROR] Timed out waiting for eviction!%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)_recursivelySizeDirectoryAtPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[BRCDiskSpaceReclaimer _recursivelySizeDirectoryAtPath:]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_4_0(&dword_230455000, a2, a3, "[CRIT] UNREACHABLE: calling %s with empty path%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)_recursivelySizeDirectoryAtPath:(uint64_t)a1 .cold.2(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: can't open %@%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_0();
}

- (void)_recursivelySizeDirectoryAtPath:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int *v6;
  char *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = __error();
  v7 = strerror(*v6);
  v8 = 138412802;
  v9 = a1;
  v10 = 2080;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_fault_impl(&dword_230455000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't get size for %@ : %s%@", (uint8_t *)&v8, 0x20u);
}

@end
