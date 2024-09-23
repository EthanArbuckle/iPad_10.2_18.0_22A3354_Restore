@implementation BRCFileProviderDaemonUtils

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__BRCFileProviderDaemonUtils_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

- (BOOL)boostFileProvider
{
  BRCFileProviderDaemonUtils *v2;
  BOOL fpReady;
  _BOOL4 shouldBoostFileProvider;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[6];
  __int128 buf;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  fpReady = v2->_fpReady;
  if (v2->_fpReady || !v2->_startedWaitingForFP)
  {
    objc_sync_exit(v2);

  }
  else
  {
    shouldBoostFileProvider = v2->_shouldBoostFileProvider;
    objc_sync_exit(v2);

    if (shouldBoostFileProvider)
    {
      +[BRCStringAdditions _br_currentMobileDocumentsDirForLegacy](BRCStringAdditions, "_br_currentMobileDocumentsDirForLegacy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v6, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v12 = 0x3032000000;
        v13 = __Block_byref_object_copy__52;
        v14 = __Block_byref_object_dispose__52;
        v15 = 0;
        objc_msgSend(MEMORY[0x24BDC8270], "synchronousSharedConnectionProxy");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __47__BRCFileProviderDaemonUtils_boostFileProvider__block_invoke;
        v10[3] = &unk_24FE49CD0;
        v10[4] = v2;
        v10[5] = &buf;
        objc_msgSend(v8, "wakeUpForURL:completionHandler:", v7, v10);

        fpReady = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) == 0;
        _Block_object_dispose(&buf, 8);

      }
      else
      {
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v7;
          _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find Mobile Documents path for current persona%@", (uint8_t *)&buf, 0xCu);
        }

        fpReady = 0;
      }

    }
    else
    {
      return 0;
    }
  }
  return fpReady;
}

- (id)_initWithSyncBubble:(BOOL)a3 isFPFS:(BOOL)a4
{
  BRCFileProviderDaemonUtils *v6;
  BRCFileProviderDaemonUtils *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *fileProviderReadyQueue;
  dispatch_semaphore_t v13;
  OS_dispatch_semaphore *waitForFPSemaphore;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BRCFileProviderDaemonUtils;
  v6 = -[BRCFileProviderDaemonUtils init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_inSyncBubble = a3;
    v6->_isFPFS = a4;
    *(_WORD *)&v6->_interrupted = 0;
    *(_WORD *)&v6->_startedWaitingForFP = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v9, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("file-provider-ready-queue", v10);

    fileProviderReadyQueue = v7->_fileProviderReadyQueue;
    v7->_fileProviderReadyQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_semaphore_create(0);
    waitForFPSemaphore = v7->_waitForFPSemaphore;
    v7->_waitForFPSemaphore = (OS_dispatch_semaphore *)v13;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_activate((dispatch_object_t)self->_fileProviderReadyQueue);
  v3.receiver = self;
  v3.super_class = (Class)BRCFileProviderDaemonUtils;
  -[BRCFileProviderDaemonUtils dealloc](&v3, sel_dealloc);
}

void __44__BRCFileProviderDaemonUtils_sharedInstance__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInSyncBubble");

  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithSyncBubble:isFPFS:", v3, 1);
  v5 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v4;

}

- (void)interrupt
{
  BRCFileProviderDaemonUtils *v2;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_230455000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] got interrupted%@", (uint8_t *)&v5, 0xCu);
  }

  v2->_interrupted = 1;
  dispatch_semaphore_signal((dispatch_semaphore_t)v2->_waitForFPSemaphore);
  objc_sync_exit(v2);

}

- (void)_signalFPReady
{
  BRCFileProviderDaemonUtils *v2;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_fpReady)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_230455000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] FP is now ready to accept xpc connections%@", (uint8_t *)&v5, 0xCu);
    }

    v2->_fpReady = 1;
    dispatch_semaphore_signal((dispatch_semaphore_t)v2->_waitForFPSemaphore);
  }
  objc_sync_exit(v2);

}

- (void)_waitIsOver
{
  BRCFileProviderDaemonUtils *v2;
  uint64_t v3;
  NSError *fpReadyError;
  BRCFileProviderDaemonUtils *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_fpReady)
  {
    if (obj->_interrupted)
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:description:", 4, CFSTR("BRCFileProviderDaemonUtils was interrupted while waiting for FP to accept xpc connections"));
    else
      objc_msgSend(MEMORY[0x24BDD1540], "brc_unkownErrorWithDescription:", CFSTR("Waiting without success for FP to accept xpc connections"));
    v3 = objc_claimAutoreleasedReturnValue();
    fpReadyError = obj->_fpReadyError;
    obj->_fpReadyError = (NSError *)v3;

    v2 = obj;
  }
  dispatch_activate((dispatch_object_t)v2->_fileProviderReadyQueue);
  objc_sync_exit(obj);

}

- (void)enableFileProviderBoosting
{
  BRCFileProviderDaemonUtils *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_shouldBoostFileProvider = 1;
  objc_sync_exit(obj);

}

- (BOOL)waitForFPToBeReadyToAcceptXPCWithError:(id *)a3
{
  BRCFileProviderDaemonUtils *v4;
  _BOOL4 startedWaitingForFP;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  NSObject *v23;
  BRCFileProviderDaemonUtils *v24;
  BOOL fpReady;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  NSObject *waitForFPSemaphore;
  dispatch_time_t v32;
  NSError *fpReadyError;
  BRCFileProviderDaemonUtils *v34;
  void *v35;
  NSObject *v36;
  BRCFileProviderDaemonUtils *v38;
  NSError *v39;
  BRCFileProviderDaemonUtils *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  _QWORD v51[5];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  BRCFileProviderDaemonUtils *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  if (!self->_isFPFS && self->_inSyncBubble)
  {
    brc_bread_crumbs();
    v22 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v22;
      _os_log_impl(&dword_230455000, v23, OS_LOG_TYPE_DEFAULT, "[NOTICE] Device is in sync bubble%@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorCantCallFPInSyncBubble");
    v24 = (BRCFileProviderDaemonUtils *)(id)objc_claimAutoreleasedReturnValue();
    fpReady = v24 == 0;
    if (v24)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      {
        v48 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v53 = "-[BRCFileProviderDaemonUtils waitForFPToBeReadyToAcceptXPCWithError:]";
        v54 = 2080;
        if (!a3)
          v48 = "(ignored by caller)";
        v55 = v48;
        v56 = 2112;
        v57 = v24;
        v58 = 2112;
        v59 = v26;
        _os_log_error_impl(&dword_230455000, v27, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a3)
      *a3 = objc_retainAutorelease(v24);

    goto LABEL_27;
  }
  v4 = self;
  objc_sync_enter(v4);
  startedWaitingForFP = v4->_startedWaitingForFP;
  v4->_startedWaitingForFP = 1;
  objc_sync_exit(v4);

  if (!startedWaitingForFP)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BRCFileProviderDaemonUtils waitForFPToBeReadyToAcceptXPCWithError:].cold.3((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    if (-[BRCFileProviderDaemonUtils boostFileProvider](v4, "boostFileProvider"))
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[BRCFileProviderDaemonUtils waitForFPToBeReadyToAcceptXPCWithError:].cold.2((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);

    }
    else
    {
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __69__BRCFileProviderDaemonUtils_waitForFPToBeReadyToAcceptXPCWithError___block_invoke;
      v51[3] = &unk_24FE417B8;
      v51[4] = v4;
      objc_msgSend(MEMORY[0x24BDC82F8], "beginMonitoringProviderDomainChangesWithHandler:", v51);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "fpReadyForXpcCheckMaxWaitTimeInSec");

      waitForFPSemaphore = v4->_waitForFPSemaphore;
      v32 = dispatch_time(0, 1000000000 * v30);
      dispatch_semaphore_wait(waitForFPSemaphore, v32);
      objc_msgSend(MEMORY[0x24BDC82F8], "endMonitoringProviderDomainChanges:", v28);

    }
    -[BRCFileProviderDaemonUtils _waitIsOver](v4, "_waitIsOver");
  }
  v24 = v4;
  objc_sync_enter(v24);
  fpReady = v24->_fpReady;
  if (v24->_fpReady)
  {
LABEL_26:
    objc_sync_exit(v24);
    goto LABEL_27;
  }
  fpReadyError = v24->_fpReadyError;
  if (fpReadyError)
  {
    v34 = fpReadyError;
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, (os_log_type_t)0x90u))
    {
      v47 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v53 = "-[BRCFileProviderDaemonUtils waitForFPToBeReadyToAcceptXPCWithError:]";
      v54 = 2080;
      if (!a3)
        v47 = "(ignored by caller)";
      v55 = v47;
      v56 = 2112;
      v57 = v34;
      v58 = 2112;
      v59 = v35;
      _os_log_error_impl(&dword_230455000, v36, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

    if (a3)
      *a3 = objc_retainAutorelease(v34);

    goto LABEL_26;
  }
  objc_sync_exit(v24);

  dispatch_sync((dispatch_queue_t)v24->_fileProviderReadyQueue, &__block_literal_global_65);
  v38 = v24;
  objc_sync_enter(v38);
  if (v24->_fpReady)
  {
    fpReady = 1;
  }
  else
  {
    v39 = v24->_fpReadyError;
    if (v39)
    {
      v40 = v39;
      brc_bread_crumbs();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, (os_log_type_t)0x90u))
      {
        v49 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v53 = "-[BRCFileProviderDaemonUtils waitForFPToBeReadyToAcceptXPCWithError:]";
        v54 = 2080;
        if (!a3)
          v49 = "(ignored by caller)";
        v55 = v49;
        v56 = 2112;
        v57 = v40;
        v58 = 2112;
        v59 = v41;
        _os_log_error_impl(&dword_230455000, v42, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      fpReady = 0;
    }
    else
    {
      brc_bread_crumbs();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        -[BRCFileProviderDaemonUtils waitForFPToBeReadyToAcceptXPCWithError:].cold.1((uint64_t)v43, v44);

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: FP is not ready but we don't have an error"));
      v40 = (BRCFileProviderDaemonUtils *)objc_claimAutoreleasedReturnValue();
      fpReady = v40 == 0;
      if (v40)
      {
        brc_bread_crumbs();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, (os_log_type_t)0x90u))
        {
          v50 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v53 = "-[BRCFileProviderDaemonUtils waitForFPToBeReadyToAcceptXPCWithError:]";
          v54 = 2080;
          if (!a3)
            v50 = "(ignored by caller)";
          v55 = v50;
          v56 = 2112;
          v57 = v40;
          v58 = 2112;
          v59 = v45;
          _os_log_error_impl(&dword_230455000, v46, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
    }
    if (a3)
      *a3 = objc_retainAutorelease(v40);

  }
  objc_sync_exit(v38);
  v24 = v38;
LABEL_27:

  return fpReady;
}

uint64_t __69__BRCFileProviderDaemonUtils_waitForFPToBeReadyToAcceptXPCWithError___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v3 = result;
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] Got com.apple.fileprovider.providers-changed notification. FP is ready to accept XPC calls%@", (uint8_t *)&v6, 0xCu);
    }

    return objc_msgSend(*(id *)(v3 + 32), "_signalFPReady");
  }
  return result;
}

void __47__BRCFileProviderDaemonUtils_boostFileProvider__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = v5;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_signalFPReady");
    v4 = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProviderReadyQueue, 0);
  objc_storeStrong((id *)&self->_waitForFPSemaphore, 0);
  objc_storeStrong((id *)&self->_fpReadyError, 0);
}

- (void)waitForFPToBeReadyToAcceptXPCWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: FP is not ready but we don't have an error%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)waitForFPToBeReadyToAcceptXPCWithError:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_230455000, a2, a3, "[DEBUG] FP is already ready to connect after boosting%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)waitForFPToBeReadyToAcceptXPCWithError:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_230455000, a2, a3, "[DEBUG] Starting to wait for FP to be ready to accept xpc connections%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

@end
