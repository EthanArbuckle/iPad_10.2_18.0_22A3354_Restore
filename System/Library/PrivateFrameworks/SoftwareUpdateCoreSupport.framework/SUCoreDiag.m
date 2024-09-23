@implementation SUCoreDiag

+ (id)sharedDiag
{
  if (sharedDiag_diagOnce != -1)
    dispatch_once(&sharedDiag_diagOnce, &__block_literal_global_6);
  return (id)sharedDiag_diag;
}

uint64_t __24__SUCoreDiag_sharedDiag__block_invoke()
{
  SUCoreDiag *v0;
  void *v1;

  v0 = -[SUCoreDiag initWithAppendedDomain:appendingDumpFilename:]([SUCoreDiag alloc], "initWithAppendedDomain:appendingDumpFilename:", CFSTR("shared"), CFSTR("SUDiagDump.plist"));
  v1 = (void *)sharedDiag_diag;
  sharedDiag_diag = (uint64_t)v0;

  return objc_msgSend((id)sharedDiag_diag, "setIsSharedDiag:", 1);
}

- (SUCoreDiag)initWithAppendedDomain:(id)a3 appendingDumpFilename:(id)a4
{
  id v7;
  id v8;
  SUCoreDiag *v9;
  SUCoreDiag *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *trackingQueue;
  OS_dispatch_queue *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *trackingHistory;
  SUCoreDiagStats *v31;
  SUCoreDiagStats *trackStats;
  NSString *lastReportedUUID;
  objc_super v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)SUCoreDiag;
  v9 = -[SUCoreDiag init](&v35, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uniqueInstanceName, a3);
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[SUCore sharedCore](SUCore, "sharedCore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "commonDomain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@.%@.%@"), v13, CFSTR("core.diag.tracking"), v7);

    v15 = objc_retainAutorelease(v14);
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create(v16, v17);
    trackingQueue = v10->_trackingQueue;
    v10->_trackingQueue = (OS_dispatch_queue *)v18;

    v20 = v10->_trackingQueue;
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "oslog");
    v22 = objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v37 = v15;
        _os_log_impl(&dword_1B05B8000, v22, OS_LOG_TYPE_DEFAULT, "[DIAG] DISPATCH: created dispatch queue domain(%{public}@)", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      -[SUCoreDiag initWithAppendedDomain:appendingDumpFilename:].cold.1((uint64_t)v15, v22, v23, v24, v25, v26, v27, v28);
    }

    v29 = objc_opt_new();
    trackingHistory = v10->_trackingHistory;
    v10->_trackingHistory = (NSMutableArray *)v29;

    v31 = objc_alloc_init(SUCoreDiagStats);
    trackStats = v10->_trackStats;
    v10->_trackStats = v31;

    objc_storeStrong((id *)&v10->_appendingDumpFilename, a4);
    lastReportedUUID = v10->_lastReportedUUID;
    v10->_lastReportedUUID = 0;

    v10->_isSharedDiag = 0;
  }

  return v10;
}

- (void)trackBegin:(id)a3
{
  -[SUCoreDiag trackBegin:atLevel:forModule:withIdentifier:](self, "trackBegin:atLevel:forModule:withIdentifier:", a3, 1, 0, 0);
}

- (void)trackBegin:(id)a3 atLevel:(int)a4
{
  -[SUCoreDiag trackBegin:atLevel:forModule:withIdentifier:](self, "trackBegin:atLevel:forModule:withIdentifier:", a3, *(_QWORD *)&a4, 0, 0);
}

- (void)trackBegin:(id)a3 atLevel:(int)a4 forModule:(id)a5
{
  -[SUCoreDiag trackBegin:atLevel:forModule:withIdentifier:](self, "trackBegin:atLevel:forModule:withIdentifier:", a3, *(_QWORD *)&a4, a5, 0);
}

- (void)trackBegin:(id)a3 atLevel:(int)a4 forModule:(id)a5 withIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  SUCoreDiag *v21;
  id v22;
  int v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v13);

  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SUCoreDiag_trackBegin_atLevel_forModule_withIdentifier___block_invoke;
  block[3] = &unk_1E611CFF0;
  v19 = v10;
  v20 = v12;
  v23 = a4;
  v21 = self;
  v22 = v11;
  v15 = v11;
  v16 = v12;
  v17 = v10;
  dispatch_sync(v14, block);

}

void __58__SUCoreDiag_trackBegin_atLevel_forModule_withIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  id v23;
  _BYTE v24[24];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = -[SUCoreDiagPoint initOfType:fromLocation:forReason:withCode:withError:]([SUCoreDiagPoint alloc], "initOfType:fromLocation:forReason:withCode:withError:", 1, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);
  objc_msgSend(*(id *)(a1 + 48), "_appendToHistory:", v2);
  objc_msgSend(*(id *)(a1 + 48), "trackStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBeginCount:", objc_msgSend(v3, "beginCount") + 1);

  if (*(int *)(a1 + 64) < 1)
    goto LABEL_16;
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 40);
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (!v5)
    {
      if (v8)
      {
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v24 = 138543362;
        *(_QWORD *)&v24[4] = v19;
        v12 = "%{public}@...";
        v13 = v7;
        v14 = 12;
        goto LABEL_14;
      }
      goto LABEL_15;
    }
    if (!v8)
      goto LABEL_15;
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v24 = 138543618;
    *(_QWORD *)&v24[4] = v15;
    *(_WORD *)&v24[12] = 2114;
    *(_QWORD *)&v24[14] = v16;
    v12 = "%{public}@... (%{public}@)";
LABEL_11:
    v13 = v7;
    v14 = 22;
    goto LABEL_14;
  }
  if (!v5)
  {
    if (!v8)
      goto LABEL_15;
    v17 = *(_QWORD *)(a1 + 56);
    v18 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v24 = 138543618;
    *(_QWORD *)&v24[4] = v17;
    *(_WORD *)&v24[12] = 2114;
    *(_QWORD *)&v24[14] = v18;
    v12 = "[%{public}@]%{public}@...";
    goto LABEL_11;
  }
  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v24 = 138543874;
    *(_QWORD *)&v24[4] = v9;
    *(_WORD *)&v24[12] = 2114;
    *(_QWORD *)&v24[14] = v10;
    *(_WORD *)&v24[22] = 2114;
    v25 = v11;
    v12 = "[%{public}@]%{public}@... (%{public}@)";
    v13 = v7;
    v14 = 32;
LABEL_14:
    _os_log_impl(&dword_1B05B8000, v13, OS_LOG_TYPE_DEFAULT, v12, v24, v14);
  }
LABEL_15:

LABEL_16:
  +[SUCoreSimulate sharedSimulator](SUCoreSimulate, "sharedSimulator", *(_OWORD *)v24, *(_QWORD *)&v24[16], v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (*(_QWORD *)(a1 + 56))
    v22 = *(const __CFString **)(a1 + 56);
  else
    v22 = CFSTR("!");
  v23 = (id)objc_msgSend(v20, "begin:atFunction:", v22, *(_QWORD *)(a1 + 32));

}

- (void)trackEnd:(id)a3
{
  -[SUCoreDiag trackEnd:atLevel:forModule:withIdentifier:withResult:withError:](self, "trackEnd:atLevel:forModule:withIdentifier:withResult:withError:", a3, 1, 0, 0, 0, 0);
}

- (void)trackEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
  -[SUCoreDiag trackEnd:atLevel:forModule:withIdentifier:withResult:withError:](self, "trackEnd:atLevel:forModule:withIdentifier:withResult:withError:", a3, 1, 0, 0, a4, a5);
}

- (void)trackEnd:(id)a3 atLevel:(int)a4
{
  -[SUCoreDiag trackEnd:atLevel:forModule:withIdentifier:withResult:withError:](self, "trackEnd:atLevel:forModule:withIdentifier:withResult:withError:", a3, *(_QWORD *)&a4, 0, 0, 0, 0);
}

- (void)trackEnd:(id)a3 atLevel:(int)a4 withResult:(int64_t)a5 withError:(id)a6
{
  -[SUCoreDiag trackEnd:atLevel:forModule:withIdentifier:withResult:withError:](self, "trackEnd:atLevel:forModule:withIdentifier:withResult:withError:", a3, *(_QWORD *)&a4, 0, 0, a5, a6);
}

- (void)trackEnd:(id)a3 atLevel:(int)a4 forModule:(id)a5
{
  -[SUCoreDiag trackEnd:atLevel:forModule:withIdentifier:withResult:withError:](self, "trackEnd:atLevel:forModule:withIdentifier:withResult:withError:", a3, *(_QWORD *)&a4, a5, 0, 0, 0);
}

- (void)trackEnd:(id)a3 atLevel:(int)a4 forModule:(id)a5 withResult:(int64_t)a6 withError:(id)a7
{
  -[SUCoreDiag trackEnd:atLevel:forModule:withIdentifier:withResult:withError:](self, "trackEnd:atLevel:forModule:withIdentifier:withResult:withError:", a3, *(_QWORD *)&a4, a5, 0, a6, a7);
}

- (void)trackEnd:(id)a3 atLevel:(int)a4 forModule:(id)a5 withIdentifier:(id)a6 withResult:(int64_t)a7 withError:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  SUCoreDiag *v28;
  id v29;
  int64_t v30;
  int v31;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v18);

  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SUCoreDiag_trackEnd_atLevel_forModule_withIdentifier_withResult_withError___block_invoke;
  block[3] = &unk_1E611D018;
  v25 = v14;
  v26 = v16;
  v27 = v17;
  v28 = self;
  v31 = a4;
  v29 = v15;
  v30 = a7;
  v20 = v15;
  v21 = v17;
  v22 = v16;
  v23 = v14;
  dispatch_sync(v19, block);

}

void __77__SUCoreDiag_trackEnd_atLevel_forModule_withIdentifier_withResult_withError___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  id v46;
  _BYTE v47[24];
  void *v48;
  _BYTE v49[24];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = -[SUCoreDiagPoint initOfType:fromLocation:forReason:withCode:withError:]([SUCoreDiagPoint alloc], "initOfType:fromLocation:forReason:withCode:withError:", 2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "_appendToHistory:", v2);
  if (!*(_QWORD *)(a1 + 72) && !*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 56), "trackStats");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setEndSuccessCount:", objc_msgSend(v22, "endSuccessCount") + 1);

    if (*(int *)(a1 + 80) < 1)
      goto LABEL_34;
    v23 = *(_QWORD *)(a1 + 64);
    v24 = *(_QWORD *)(a1 + 40);
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    v26 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v24)
      {
        if (!v26)
          goto LABEL_33;
        v27 = *(_QWORD *)(a1 + 64);
        v28 = *(_QWORD *)(a1 + 32);
        v29 = *(void **)(a1 + 40);
        *(_DWORD *)v47 = 138543874;
        *(_QWORD *)&v47[4] = v27;
        *(_WORD *)&v47[12] = 2114;
        *(_QWORD *)&v47[14] = v28;
        *(_WORD *)&v47[22] = 2114;
        v48 = v29;
        v30 = "...[%{public}@]%{public}@ (%{public}@) | SUCCESS";
        v31 = v9;
        v32 = 32;
LABEL_32:
        _os_log_impl(&dword_1B05B8000, v31, OS_LOG_TYPE_DEFAULT, v30, v47, v32);
        goto LABEL_33;
      }
      if (!v26)
        goto LABEL_33;
      v40 = *(_QWORD *)(a1 + 64);
      v41 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v47 = 138543618;
      *(_QWORD *)&v47[4] = v40;
      *(_WORD *)&v47[12] = 2114;
      *(_QWORD *)&v47[14] = v41;
      v30 = "...[%{public}@]%{public}@ | SUCCESS";
    }
    else
    {
      if (!v24)
      {
        if (!v26)
          goto LABEL_33;
        v42 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v47 = 138543362;
        *(_QWORD *)&v47[4] = v42;
        v30 = "...%{public}@ | SUCCESS";
        v31 = v9;
        v32 = 12;
        goto LABEL_32;
      }
      if (!v26)
        goto LABEL_33;
      v38 = *(_QWORD *)(a1 + 32);
      v39 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v47 = 138543618;
      *(_QWORD *)&v47[4] = v38;
      *(_WORD *)&v47[12] = 2114;
      *(_QWORD *)&v47[14] = v39;
      v30 = "...%{public}@ (%{public}@) | SUCCESS";
    }
    v31 = v9;
    v32 = 22;
    goto LABEL_32;
  }
  objc_msgSend(*(id *)(a1 + 56), "trackStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEndFailCount:", objc_msgSend(v3, "endFailCount") + 1);

  if (objc_msgSend(v2, "checkedIndications"))
  {
    objc_msgSend(*(id *)(a1 + 56), "trackStats");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEndFailIndicationsCount:", objc_msgSend(v4, "endFailIndicationsCount") + 1);

    objc_msgSend(*(id *)(a1 + 56), "trackStats");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEndFailAllIndications:", objc_msgSend(v5, "endFailAllIndications") | objc_msgSend(v2, "checkedIndications"));

  }
  if (*(int *)(a1 + 80) >= 1)
  {
    v6 = *(_QWORD *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 40);
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v7)
      {
        if (v10)
        {
          v11 = *(_QWORD *)(a1 + 32);
          v12 = *(void **)(a1 + 40);
          v13 = *(_QWORD *)(a1 + 64);
          v14 = *(_QWORD *)(a1 + 72);
          objc_msgSend(*(id *)(a1 + 48), "checkedDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v47 = 138544386;
          *(_QWORD *)&v47[4] = v13;
          *(_WORD *)&v47[12] = 2114;
          *(_QWORD *)&v47[14] = v11;
          *(_WORD *)&v47[22] = 2114;
          v48 = v12;
          *(_WORD *)v49 = 2048;
          *(_QWORD *)&v49[2] = v14;
          *(_WORD *)&v49[10] = 2114;
          *(_QWORD *)&v49[12] = v15;
          v16 = "[DIAG_END] ...[%{public}@]%{public}@ (%{public}@) | result=%ld error:%{public}@";
          v17 = v9;
          v18 = 52;
LABEL_23:
          _os_log_error_impl(&dword_1B05B8000, v17, OS_LOG_TYPE_ERROR, v16, v47, v18);

        }
LABEL_33:

        goto LABEL_34;
      }
      if (!v10)
        goto LABEL_33;
      v33 = *(_QWORD *)(a1 + 32);
      v34 = *(_QWORD *)(a1 + 64);
      v35 = *(void **)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 48), "checkedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v47 = 138544130;
      *(_QWORD *)&v47[4] = v34;
      *(_WORD *)&v47[12] = 2114;
      *(_QWORD *)&v47[14] = v33;
      *(_WORD *)&v47[22] = 2048;
      v48 = v35;
      *(_WORD *)v49 = 2114;
      *(_QWORD *)&v49[2] = v15;
      v16 = "[DIAG_END] ...[%{public}@]%{public}@ | result=%ld error:%{public}@";
    }
    else
    {
      if (!v7)
      {
        if (v10)
        {
          v36 = *(_QWORD *)(a1 + 32);
          v37 = *(_QWORD *)(a1 + 72);
          objc_msgSend(*(id *)(a1 + 48), "checkedDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v47 = 138543874;
          *(_QWORD *)&v47[4] = v36;
          *(_WORD *)&v47[12] = 2048;
          *(_QWORD *)&v47[14] = v37;
          *(_WORD *)&v47[22] = 2114;
          v48 = v15;
          v16 = "[DIAG_END] ...%{public}@ | result=%ld error:%{public}@";
          v17 = v9;
          v18 = 32;
          goto LABEL_23;
        }
        goto LABEL_33;
      }
      if (!v10)
        goto LABEL_33;
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(void **)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 48), "checkedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v47 = 138544130;
      *(_QWORD *)&v47[4] = v19;
      *(_WORD *)&v47[12] = 2114;
      *(_QWORD *)&v47[14] = v20;
      *(_WORD *)&v47[22] = 2048;
      v48 = v21;
      *(_WORD *)v49 = 2114;
      *(_QWORD *)&v49[2] = v15;
      v16 = "[DIAG_END] ...%{public}@ (%{public}@) | result=%ld error:%{public}@";
    }
    v17 = v9;
    v18 = 42;
    goto LABEL_23;
  }
LABEL_34:
  +[SUCoreSimulate sharedSimulator](SUCoreSimulate, "sharedSimulator", *(_OWORD *)v47, *(_QWORD *)&v47[16], v48, *(_OWORD *)v49, *(_QWORD *)&v49[16], v50);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (*(_QWORD *)(a1 + 64))
    v45 = *(const __CFString **)(a1 + 64);
  else
    v45 = CFSTR("!");
  v46 = (id)objc_msgSend(v43, "end:atFunction:", v45, *(_QWORD *)(a1 + 32));

}

- (void)trackError:(id)a3 forReason:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  SUCoreDiag *v21;
  int64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SUCoreDiag_trackError_forReason_withResult_withError___block_invoke;
  block[3] = &unk_1E611D040;
  v18 = v10;
  v19 = v11;
  v21 = self;
  v22 = a5;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

void __56__SUCoreDiag_trackError_forReason_withResult_withError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = -[SUCoreDiagPoint initOfType:fromLocation:forReason:withCode:withError:]([SUCoreDiagPoint alloc], "initOfType:fromLocation:forReason:withCode:withError:", 4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "_appendToHistory:", v6);
  objc_msgSend(*(id *)(a1 + 56), "trackStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setErrorCount:", objc_msgSend(v2, "errorCount") + 1);

  if (objc_msgSend(v6, "checkedIndications"))
  {
    objc_msgSend(*(id *)(a1 + 56), "trackStats");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setErrorIndicationsCount:", objc_msgSend(v3, "errorIndicationsCount") + 1);

    objc_msgSend(*(id *)(a1 + 56), "trackStats");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setErrorAllIndications:", objc_msgSend(v4, "errorAllIndications") | objc_msgSend(v6, "checkedIndications"));

  }
  if (objc_msgSend(*(id *)(a1 + 56), "isSharedDiag"))
  {
    objc_msgSend(*(id *)(a1 + 56), "_logTrackedError:fromLocation:forReason:withResult:withError:", CFSTR("ERROR"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackError:forReason:withResult:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

  }
}

- (void)trackAnomaly:(id)a3 forReason:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  SUCoreDiag *v21;
  int64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SUCoreDiag_trackAnomaly_forReason_withResult_withError___block_invoke;
  block[3] = &unk_1E611D040;
  v18 = v10;
  v19 = v11;
  v21 = self;
  v22 = a5;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

void __58__SUCoreDiag_trackAnomaly_forReason_withResult_withError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = -[SUCoreDiagPoint initOfType:fromLocation:forReason:withCode:withError:]([SUCoreDiagPoint alloc], "initOfType:fromLocation:forReason:withCode:withError:", 8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "_appendToHistory:", v6);
  objc_msgSend(*(id *)(a1 + 56), "trackStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAnomalyCount:", objc_msgSend(v2, "anomalyCount") + 1);

  if (objc_msgSend(v6, "checkedIndications"))
  {
    objc_msgSend(*(id *)(a1 + 56), "trackStats");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAnomalyIndicationsCount:", objc_msgSend(v3, "anomalyIndicationsCount") + 1);

    objc_msgSend(*(id *)(a1 + 56), "trackStats");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAnomalyAllIndications:", objc_msgSend(v4, "anomalyAllIndications") | objc_msgSend(v6, "checkedIndications"));

  }
  if (objc_msgSend(*(id *)(a1 + 56), "isSharedDiag"))
  {
    objc_msgSend(*(id *)(a1 + 56), "_logTrackedError:fromLocation:forReason:withResult:withError:", CFSTR("ANOMALY"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

  }
}

- (void)trackFailure:(id)a3 forReason:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  SUCoreDiag *v21;
  int64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SUCoreDiag_trackFailure_forReason_withResult_withError___block_invoke;
  block[3] = &unk_1E611D040;
  v18 = v10;
  v19 = v11;
  v21 = self;
  v22 = a5;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

void __58__SUCoreDiag_trackFailure_forReason_withResult_withError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = -[SUCoreDiagPoint initOfType:fromLocation:forReason:withCode:withError:]([SUCoreDiagPoint alloc], "initOfType:fromLocation:forReason:withCode:withError:", 16, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "_appendToHistory:", v6);
  objc_msgSend(*(id *)(a1 + 56), "trackStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFailureCount:", objc_msgSend(v2, "failureCount") + 1);

  if (objc_msgSend(v6, "checkedIndications"))
  {
    objc_msgSend(*(id *)(a1 + 56), "trackStats");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFailureIndicationsCount:", objc_msgSend(v3, "failureIndicationsCount") + 1);

    objc_msgSend(*(id *)(a1 + 56), "trackStats");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFailureAllIndications:", objc_msgSend(v4, "failureAllIndications") | objc_msgSend(v6, "checkedIndications"));

  }
  if (objc_msgSend(*(id *)(a1 + 56), "isSharedDiag"))
    objc_msgSend(*(id *)(a1 + 56), "_logTrackedError:fromLocation:forReason:withResult:withError:", CFSTR("FAILURE"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "_dumpTracked:dumpingTo:usingFilename:clearingStatistics:clearingHistory:", CFSTR("FAILURE"), 5, 0, 0, 0);
  if ((objc_msgSend(*(id *)(a1 + 56), "isSharedDiag") & 1) == 0)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackFailure:forReason:withResult:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

  }
}

- (void)trackFault:(id)a3 forReason:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  SUCoreDiag *v21;
  int64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SUCoreDiag_trackFault_forReason_withResult_withError___block_invoke;
  block[3] = &unk_1E611D040;
  v18 = v10;
  v19 = v11;
  v21 = self;
  v22 = a5;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

void __56__SUCoreDiag_trackFault_forReason_withResult_withError___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = -[SUCoreDiagPoint initOfType:fromLocation:forReason:withCode:withError:]([SUCoreDiagPoint alloc], "initOfType:fromLocation:forReason:withCode:withError:", 32, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "_appendToHistory:", v2);
  objc_msgSend(*(id *)(a1 + 56), "trackStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFaultCount:", objc_msgSend(v3, "faultCount") + 1);

  if (objc_msgSend(v2, "checkedIndications"))
  {
    objc_msgSend(*(id *)(a1 + 56), "trackStats");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFaultIndicationsCount:", objc_msgSend(v4, "faultIndicationsCount") + 1);

    objc_msgSend(*(id *)(a1 + 56), "trackStats");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFaultAllIndications:", objc_msgSend(v5, "faultAllIndications") | objc_msgSend(v2, "checkedIndications"));

  }
  objc_msgSend(*(id *)(a1 + 56), "_dumpTracked:dumpingTo:usingFilename:clearingStatistics:clearingHistory:", CFSTR("FAULT"), 5, 0, 0, 0);
  if (objc_msgSend(*(id *)(a1 + 56), "isSharedDiag"))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);
    if (v7)
    {
      if (v6)
      {
        if (v10)
        {
          v11 = *(_QWORD *)(a1 + 32);
          v12 = *(_QWORD *)(a1 + 40);
          v13 = *(void **)(a1 + 64);
          objc_msgSend(*(id *)(a1 + 48), "checkedDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138544130;
          v24 = v11;
          v25 = 2114;
          v26 = v12;
          v27 = 2048;
          v28 = v13;
          v29 = 2114;
          v30 = v14;
          v15 = "[DIAG_FAULT] FAULT:%{public}@, reason=%{public}@ result=%ld error:%{public}@";
          v16 = v9;
          v17 = 42;
LABEL_13:
          _os_log_fault_impl(&dword_1B05B8000, v16, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v23, v17);

        }
      }
      else if (v10)
      {
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(_QWORD *)(a1 + 40);
        v22 = *(void **)(a1 + 64);
        v23 = 138543874;
        v24 = v20;
        v25 = 2114;
        v26 = v21;
        v27 = 2048;
        v28 = v22;
        _os_log_fault_impl(&dword_1B05B8000, v9, OS_LOG_TYPE_FAULT, "[DIAG_FAULT] FAULT:%{public}@, reason=%{public}@ result=%ld", (uint8_t *)&v23, 0x20u);
      }
    }
    else if (v6)
    {
      if (v10)
      {
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(_QWORD *)(a1 + 64);
        objc_msgSend(*(id *)(a1 + 48), "checkedDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543874;
        v24 = v18;
        v25 = 2048;
        v26 = v19;
        v27 = 2114;
        v28 = v14;
        v15 = "[DIAG_FAULT] FAULT:%{public}@, result=%ld error:%{public}@";
        v16 = v9;
        v17 = 32;
        goto LABEL_13;
      }
    }
    else if (v10)
    {
      __56__SUCoreDiag_trackFault_forReason_withResult_withError___block_invoke_cold_1((uint64_t *)(a1 + 32), (uint64_t *)(a1 + 64), v9);
    }
  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject trackFault:forReason:withResult:withError:](v9, "trackFault:forReason:withResult:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  }

}

- (void)trackStateEvent:(id)a3 previousState:(id)a4 handlingEvent:(id)a5 nextState:(id)a6 performingAction:(id)a7 withInfo:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  SUCoreDiag *v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__SUCoreDiag_trackStateEvent_previousState_handlingEvent_nextState_performingAction_withInfo___block_invoke;
  block[3] = &unk_1E611D068;
  v28 = v19;
  v29 = v14;
  v30 = v15;
  v31 = v16;
  v32 = v17;
  v33 = v18;
  v34 = self;
  v21 = v18;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v14;
  v26 = v19;
  dispatch_async(v20, block);

}

void __94__SUCoreDiag_trackStateEvent_previousState_handlingEvent_nextState_performingAction_withInfo___block_invoke(uint64_t a1)
{
  char isKindOfClass;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "description");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v6 = -[SUCoreDiagPoint initStateEventForFSM:previousState:fsmEvent:nextState:fsmAction:eventInfo:]([SUCoreDiagPoint alloc], "initStateEventForFSM:previousState:fsmEvent:nextState:fsmAction:eventInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v4);
  objc_msgSend(*(id *)(a1 + 80), "_appendToHistory:", v6);
  objc_msgSend(*(id *)(a1 + 80), "trackStats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStateEventCount:", objc_msgSend(v7, "stateEventCount") + 1);

  if (objc_msgSend(*(id *)(a1 + 80), "isSharedDiag"))
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1B05B8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v11, 0xCu);
    }

  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackStateEvent:previousState:handlingEvent:nextState:performingAction:withInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));

  }
}

- (void)trackLastReportedUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__SUCoreDiag_trackLastReportedUUID___block_invoke;
  v7[3] = &unk_1E611BF60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __36__SUCoreDiag_trackLastReportedUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setLastReportedUUID:", *(_QWORD *)(a1 + 40));
  if ((objc_msgSend(*(id *)(a1 + 32), "isSharedDiag") & 1) == 0)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "trackLastReportedUUID:", *(_QWORD *)(a1 + 40));

  }
}

- (int64_t)allIndications
{
  void *v2;
  int64_t v3;

  -[SUCoreDiag trackStats](self, "trackStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allIndications");

  return v3;
}

- (id)copyTrackedStatsClearingAfter:(BOOL)a3
{
  return -[SUCoreDiag copyTrackedStatsClearingAfter:droppingMatchedIndications:](self, "copyTrackedStatsClearingAfter:droppingMatchedIndications:", a3, 0);
}

- (id)copyTrackedStatsClearingAfter:(BOOL)a3 droppingMatchedIndications:(int64_t)a4
{
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[7];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__SUCoreDiag_copyTrackedStatsClearingAfter_droppingMatchedIndications___block_invoke;
  v11[3] = &unk_1E611D090;
  v11[4] = self;
  v11[5] = &v13;
  v12 = a3;
  v11[6] = a4;
  dispatch_sync(v8, v11);

  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __71__SUCoreDiag_copyTrackedStatsClearingAfter_droppingMatchedIndications___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyTrackedStatsClearingAfter:droppingMatchedIndications:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)collectTrackedStatsClearingAfter:(BOOL)a3 completion:(id)a4
{
  -[SUCoreDiag collectTrackedStatsClearingAfter:droppingMatchedIndications:completion:](self, "collectTrackedStatsClearingAfter:droppingMatchedIndications:completion:", a3, 0, a4);
}

- (void)collectTrackedStatsClearingAfter:(BOOL)a3 droppingMatchedIndications:(int64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  BOOL v14;

  v8 = a5;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__SUCoreDiag_collectTrackedStatsClearingAfter_droppingMatchedIndications_completion___block_invoke;
  v11[3] = &unk_1E611D0B8;
  v14 = a3;
  v12 = v8;
  v13 = a4;
  v11[4] = self;
  v10 = v8;
  dispatch_async(v9, v11);

}

void __85__SUCoreDiag_collectTrackedStatsClearingAfter_droppingMatchedIndications_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyTrackedStatsClearingAfter:droppingMatchedIndications:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  +[SUCore sharedCore](SUCore, "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__SUCoreDiag_collectTrackedStatsClearingAfter_droppingMatchedIndications_completion___block_invoke_2;
  v7[3] = &unk_1E611C220;
  v5 = *(id *)(a1 + 40);
  v8 = v2;
  v9 = v5;
  v6 = v2;
  dispatch_async(v4, v7);

}

uint64_t __85__SUCoreDiag_collectTrackedStatsClearingAfter_droppingMatchedIndications_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)dumpTracked:(id)a3 dumpingTo:(int64_t)a4 usingFilename:(id)a5 clearingStatistics:(BOOL)a6 clearingHistory:(BOOL)a7
{
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  int64_t v21;
  BOOL v22;
  BOOL v23;

  v12 = a3;
  v13 = a5;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v14);

  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__SUCoreDiag_dumpTracked_dumpingTo_usingFilename_clearingStatistics_clearingHistory___block_invoke;
  block[3] = &unk_1E611D0E0;
  block[4] = self;
  v19 = v12;
  v20 = v13;
  v21 = a4;
  v22 = a6;
  v23 = a7;
  v16 = v13;
  v17 = v12;
  dispatch_sync(v15, block);

}

uint64_t __85__SUCoreDiag_dumpTracked_dumpingTo_usingFilename_clearingStatistics_clearingHistory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dumpTracked:dumpingTo:usingFilename:clearingStatistics:clearingHistory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65));
}

- (id)loadDump:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v29;

  v3 = a3;
  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[SUCore sharedCore](SUCore, "sharedCore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "commonFilesystemBaseDir");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v4, "initWithFormat:", CFSTR("%@%@/%@"), v6, CFSTR("/DiagDump"), CFSTR("SUDiagDump.plist"));

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsAtPath:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SUCoreDiag loadDump:].cold.1((uint64_t)v3, v19, v21, v22, v23, v24, v25, v26);
    v16 = 0;
    v17 = 0;
    goto LABEL_11;
  }
  v9 = (void *)MEMORY[0x1E0CB3710];
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v15, v8, &v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v29;

  if (!v16 || v17)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SUCoreDiag loadDump:].cold.2();
LABEL_11:

  }
  v27 = v16;

  return v27;
}

- (void)_appendToHistory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;

  v12 = a3;
  -[SUCoreDiag trackingHistory](self, "trackingHistory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[SUCoreDiag setTrackingHistory:](self, "setTrackingHistory:", v5);

  }
  -[SUCoreDiag trackingHistory](self, "trackingHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v12);

  -[SUCoreDiag trackingHistory](self, "trackingHistory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 >= 0x81)
  {
    do
    {
      -[SUCoreDiag trackingHistory](self, "trackingHistory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectAtIndex:", 0);

      -[SUCoreDiag trackingHistory](self, "trackingHistory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

    }
    while (v11 > 0x80);
  }

}

- (void)_logTrackedError:(id)a3 fromLocation:(id)a4 forReason:(id)a5 withResult:(int64_t)a6 withError:(id)a7
{
  id v11;
  id v12;
  int64_t v13;
  unint64_t v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int64_t v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (int64_t)a5;
  v14 = (unint64_t)a7;
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "oslog");
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
  if (v13 | v14)
  {
    if (v13)
    {
      if (!v14)
      {
        if (!v17)
          goto LABEL_13;
        v25 = 138544130;
        v26 = v11;
        v27 = 2114;
        v28 = v12;
        v29 = 2114;
        v30 = v13;
        v31 = 2048;
        v32 = a6;
        v18 = "[DIAG_ERROR] %{public}@: %{public}@, reason=%{public}@ result=%ld";
        v19 = v16;
        v20 = 42;
        goto LABEL_4;
      }
      if (!v17)
        goto LABEL_13;
      objc_msgSend((id)v14, "checkedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138544386;
      v26 = v11;
      v27 = 2114;
      v28 = v12;
      v29 = 2114;
      v30 = v13;
      v31 = 2048;
      v32 = a6;
      v33 = 2114;
      v34 = v21;
      v22 = "[DIAG_ERROR] %{public}@: %{public}@, reason=%{public}@ result=%ld error:%{public}@";
      v23 = v16;
      v24 = 52;
    }
    else
    {
      if (!v17)
        goto LABEL_13;
      objc_msgSend((id)v14, "checkedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138544130;
      v26 = v11;
      v27 = 2114;
      v28 = v12;
      v29 = 2048;
      v30 = a6;
      v31 = 2114;
      v32 = (int64_t)v21;
      v22 = "[DIAG_ERROR] %{public}@: %{public}@, result=%ld error:%{public}@";
      v23 = v16;
      v24 = 42;
    }
    _os_log_error_impl(&dword_1B05B8000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v25, v24);

    goto LABEL_13;
  }
  if (v17)
  {
    v25 = 138543874;
    v26 = v11;
    v27 = 2114;
    v28 = v12;
    v29 = 2048;
    v30 = a6;
    v18 = "[DIAG_ERROR] %{public}@: %{public}@, result=%ld";
    v19 = v16;
    v20 = 32;
LABEL_4:
    _os_log_error_impl(&dword_1B05B8000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v25, v20);
  }
LABEL_13:

}

- (id)_dumpMaskToString:(int64_t)a3
{
  char v3;
  __CFString *v4;

  v3 = a3;
  if ((a3 & 1) != 0)
  {
    v4 = CFSTR("LOG_ARCHIVE");
    if ((a3 & 2) != 0)
    {
      objc_msgSend(CFSTR("LOG_ARCHIVE"), "stringByAppendingString:", CFSTR("|STDOUT"));

      if ((v3 & 4) != 0)
        goto LABEL_13;
    }
    else if ((a3 & 4) != 0)
    {
      goto LABEL_13;
    }
    goto LABEL_7;
  }
  if ((a3 & 2) != 0)
  {
    v4 = CFSTR("STDOUT");
    if ((a3 & 4) != 0)
    {
LABEL_13:
      -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("|FILE"));

      if ((v3 & 8) == 0)
        return v4;
      goto LABEL_8;
    }
LABEL_7:
    if ((v3 & 8) == 0)
      return v4;
LABEL_8:
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("|EVENT_REPORTER"));

    return v4;
  }
  if ((a3 & 4) != 0)
  {
    v4 = CFSTR("FILE");
    if ((a3 & 8) == 0)
      return v4;
    goto LABEL_8;
  }
  return (id)((unint64_t)CFSTR("EVENT_REPORTER") & (a3 << 60 >> 63));
}

- (void)_dumpTracked:(id)a3 dumpingTo:(int64_t)a4 usingFilename:(id)a5 clearingStatistics:(BOOL)a6 clearingHistory:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  void *v56;
  unint64_t v57;
  SUCoreDiagStats *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  _BOOL4 v64;
  _BOOL4 v65;
  void *v66;
  uint8_t buf[4];
  unint64_t v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  const __CFString *v74;
  __int16 v75;
  const __CFString *v76;
  uint64_t v77;

  v7 = a7;
  v8 = a6;
  v77 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[SUCoreDiag _dumpMaskToString:](self, "_dumpMaskToString:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "oslog");
  v17 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    *(_DWORD *)buf = 138544386;
    if (v7)
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    v68 = (unint64_t)v12;
    v69 = 2114;
    v70 = v15;
    v71 = 2114;
    v72 = v13;
    v73 = 2114;
    v74 = v18;
    v75 = 2114;
    v76 = v19;
    _os_log_impl(&dword_1B05B8000, v17, OS_LOG_TYPE_DEFAULT, "[DIAG] dump tracked with reason=%{public}@ dumpToMask=%{public}@ filename=%{public}@ clearStatistics=%{public}@ clearHistory=%{public}@", buf, 0x34u);
  }

  if ((a4 & 2) != 0)
  {
    if (v8)
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    if (v7)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    NSLog((NSString *)CFSTR("[DIAG] dump tracked with reason=%@ dumpToMask=%@ filename=%@ clearStatistics=%@ clearHistory=%@"), v12, v15, v13, v20, v21);
  }
  if ((a4 & 4) != 0)
  {
    v22 = (void *)objc_opt_new();
    if ((a4 & 8) != 0)
      goto LABEL_19;
LABEL_21:
    v23 = 0;
    if (!a4)
      goto LABEL_57;
    goto LABEL_22;
  }
  v22 = 0;
  if ((a4 & 8) == 0)
    goto LABEL_21;
LABEL_19:
  v23 = (void *)objc_opt_new();
LABEL_22:
  if (v12)
  {
    objc_msgSend(v22, "setSafeObject:forKey:", v12, CFSTR("reportReason"));
    objc_msgSend(v23, "setSafeObject:forKey:", v12, CFSTR("reportReason"));
  }
  v65 = v7;
  v66 = v23;
  -[SUCoreDiag lastReportedUUID](self, "lastReportedUUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SUCoreDiag lastReportedUUID](self, "lastReportedUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSafeObject:forKey:", v25, CFSTR("UUID"));

    -[SUCoreDiag lastReportedUUID](self, "lastReportedUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSafeObject:forKey:", v26, CFSTR("UUID"));

    if ((a4 & 1) != 0)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "oslog");
      v28 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreDiag lastReportedUUID](self, "lastReportedUUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = (unint64_t)v29;
        _os_log_impl(&dword_1B05B8000, v28, OS_LOG_TYPE_DEFAULT, "[DIAG] DUMP_UUID: %{public}@", buf, 0xCu);

      }
    }
    if ((a4 & 2) != 0)
    {
      -[SUCoreDiag lastReportedUUID](self, "lastReportedUUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog((NSString *)CFSTR("[DIAG] DUMP_UUID: %@"), v30);

    }
  }
  -[SUCoreDiag trackStats](self, "trackStats");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[SUCoreDiag trackStats](self, "trackStats");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v22;
    objc_msgSend(v22, "setSafeObject:forKey:", v32, CFSTR("reportStats"));

    -[SUCoreDiag trackStats](self, "trackStats");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "summary");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setSafeObject:forKey:", v35, CFSTR("reportStats"));

    if ((a4 & 1) != 0)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "oslog");
      v37 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreDiag trackStats](self, "trackStats");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = (unint64_t)v38;
        _os_log_impl(&dword_1B05B8000, v37, OS_LOG_TYPE_DEFAULT, "[DIAG] DUMP_STATS:\n%{public}@", buf, 0xCu);

      }
    }
    v22 = v33;
    if ((a4 & 2) != 0)
    {
      -[SUCoreDiag trackStats](self, "trackStats");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog((NSString *)CFSTR("[DIAG] DUMP_STATS:\n%@"), v39);

    }
  }
  v64 = v8;
  -[SUCoreDiag trackingHistory](self, "trackingHistory");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count");

  v7 = v65;
  if (v41)
  {
    -[SUCoreDiag trackingHistory](self, "trackingHistory");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSafeObject:forKey:", v42);

    -[SUCoreDiag trackingHistory](self, "trackingHistory");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "count");

    if (v44)
    {
      v60 = v22;
      v61 = v15;
      v62 = v13;
      v63 = v12;
      v45 = 0;
      v46 = 0;
      do
      {
        -[SUCoreDiag trackingHistory](self, "trackingHistory");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectAtIndexedSubscript:", v45);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v48, "summary");
        v50 = objc_claimAutoreleasedReturnValue();
        v51 = (void *)v50;
        if (v46)
        {
          v52 = objc_msgSend(v49, "initWithFormat:", CFSTR(",[%04lu:%@]"), v45, v50);

          objc_msgSend(v46, "stringByAppendingString:", v52);
          v53 = objc_claimAutoreleasedReturnValue();

          v51 = (void *)v52;
          v46 = (void *)v53;
        }
        else
        {
          v46 = (void *)objc_msgSend(v49, "initWithFormat:", CFSTR("[%04lu:%@]"), v45, v50);
        }

        if ((a4 & 1) != 0)
        {
          +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "oslog");
          v55 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v68 = v45;
            v69 = 2114;
            v70 = v48;
            _os_log_impl(&dword_1B05B8000, v55, OS_LOG_TYPE_DEFAULT, "[DIAG] DUMP_HISTORY[%04lu]: %{public}@", buf, 0x16u);
          }

        }
        if ((a4 & 2) != 0)
          NSLog((NSString *)CFSTR("[DIAG] DUMP_HISTORY[%04lu]: %@"), v45, v48);

        ++v45;
        -[SUCoreDiag trackingHistory](self, "trackingHistory");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "count");

      }
      while (v45 < v57);
      v13 = v62;
      v12 = v63;
      v7 = v65;
      v22 = v60;
      v15 = v61;
      if (v46)
      {
        objc_msgSend(v66, "setSafeObject:forKey:", v46, CFSTR("reportHistory"));

      }
    }
  }
  if ((a4 & 4) != 0)
    -[SUCoreDiag _dumpToFile:dumpingDict:forReason:](self, "_dumpToFile:dumpingDict:forReason:", v13, v22, v12);
  v8 = v64;
  v23 = v66;
  if ((a4 & 8) != 0)
    -[SUCoreDiag _dumpEvent:](self, "_dumpEvent:", v66);
LABEL_57:
  if (v8)
  {
    v58 = objc_alloc_init(SUCoreDiagStats);
    -[SUCoreDiag setTrackStats:](self, "setTrackStats:", v58);

  }
  if (v7)
  {
    -[SUCoreDiag trackingHistory](self, "trackingHistory");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "removeAllObjects");

  }
}

- (void)_dumpToFile:(id)a3 dumpingDict:(id)a4 forReason:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  char v34;
  void *v35;
  NSObject *v36;
  void *v37;
  char v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  NSObject *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v43 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v43);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v43;
  v14 = v13;
  if (!v12 || v13)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "oslog");
    v21 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SUCoreDiag _dumpToFile:dumpingDict:forReason:].cold.3((uint64_t)v14, v21, v22, v23, v24, v25, v26, v27);
  }
  else
  {
    if (!v8)
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      +[SUCore sharedCore](SUCore, "sharedCore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "commonFilesystemBaseDir");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiag appendingDumpFilename](self, "appendingDumpFilename");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[SUCoreDiag appendingDumpFilename](self, "appendingDumpFilename");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (id)objc_msgSend(v15, "initWithFormat:", CFSTR("%@%@/%@"), v17, CFSTR("/DiagDump"), v19);

      }
      else
      {
        v8 = (id)objc_msgSend(v15, "initWithFormat:", CFSTR("%@%@/%@"), v17, CFSTR("/DiagDump"), CFSTR("SUDiagDump.plist"));
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "fileExistsAtPath:", v8))
    {
      v42 = 0;
      v29 = objc_msgSend(v28, "removeItemAtPath:error:", v8, &v42);
      v30 = v42;
      if ((v29 & 1) == 0)
      {
        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "oslog");
        v32 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v47 = v9;
          v48 = 2114;
          v49 = v8;
          v50 = 2114;
          v51 = v30;
          _os_log_error_impl(&dword_1B05B8000, v32, OS_LOG_TYPE_ERROR, "[DIAG_ERROR] ANOMALY: [%@] could not remove pre-existing dump file: %{public}@, error: %{public}@", buf, 0x20u);
        }

      }
    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v8, "stringByDeletingLastPathComponent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v41 = v30;
      v34 = objc_msgSend(v28, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v33, 1, 0, &v41);
      v21 = v41;

      if ((v34 & 1) == 0 && (!v21 || -[NSObject code](v21, "code") != 17))
      {
        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "oslog");
        v36 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          -[SUCoreDiag _dumpToFile:dumpingDict:forReason:].cold.2();

      }
    }
    else
    {
      v21 = v30;
    }
    v44 = *MEMORY[0x1E0CB2AD8];
    v45 = *MEMORY[0x1E0CB2AE0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v28, "createFileAtPath:contents:attributes:", v8, v12, v37);

    if ((v38 & 1) == 0)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "oslog");
      v40 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[SUCoreDiag _dumpToFile:dumpingDict:forReason:].cold.1();

    }
  }

}

- (void)_dumpEvent:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setSafeObject:forKey:", CFSTR("coreDiagReport"), CFSTR("event"));
    +[SUCoreEventReporter sharedReporter](SUCoreEventReporter, "sharedReporter");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject sendEvent:](v5, "sendEvent:", v4);
  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SUCoreDiag _dumpEvent:].cold.1(v5);
  }

}

- (id)_copyTrackedStatsClearingAfter:(BOOL)a3 droppingMatchedIndications:(int64_t)a4
{
  _BOOL4 v5;
  NSObject *v7;
  void *v8;
  SUCoreDiagStats *v9;
  SUCoreDiagStats *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  SUCoreDiagStats *v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  __CFString *v63;
  uint64_t v64;

  v5 = a3;
  v64 = *MEMORY[0x1E0C80C00];
  -[SUCoreDiag trackingQueue](self, "trackingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreDiag trackStats](self, "trackStats");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (SUCoreDiagStats *)objc_msgSend(v8, "copy");

  if (v5)
  {
    v10 = objc_alloc_init(SUCoreDiagStats);
    -[SUCoreDiag setTrackStats:](self, "setTrackStats:", v10);

  }
  if (a4)
  {
    v55 = -[SUCoreDiagStats endFailCount](v9, "endFailCount");
    v52 = -[SUCoreDiagStats endFailIndicationsCount](v9, "endFailIndicationsCount");
    v51 = -[SUCoreDiagStats endFailAllIndications](v9, "endFailAllIndications");
    v54 = -[SUCoreDiagStats errorCount](v9, "errorCount");
    v50 = -[SUCoreDiagStats errorIndicationsCount](v9, "errorIndicationsCount");
    v49 = -[SUCoreDiagStats errorAllIndications](v9, "errorAllIndications");
    v53 = -[SUCoreDiagStats anomalyCount](v9, "anomalyCount");
    v48 = -[SUCoreDiagStats anomalyIndicationsCount](v9, "anomalyIndicationsCount");
    v47 = -[SUCoreDiagStats anomalyAllIndications](v9, "anomalyAllIndications");
    v11 = -[SUCoreDiagStats failureCount](v9, "failureCount");
    v46 = -[SUCoreDiagStats failureIndicationsCount](v9, "failureIndicationsCount");
    v45 = -[SUCoreDiagStats failureAllIndications](v9, "failureAllIndications");
    v12 = -[SUCoreDiagStats faultCount](v9, "faultCount");
    v13 = -[SUCoreDiagStats faultIndicationsCount](v9, "faultIndicationsCount");
    v14 = -[SUCoreDiagStats faultAllIndications](v9, "faultAllIndications");
    +[SUCoreErrorInformation summaryOfIndications:](SUCoreErrorInformation, "summaryOfIndications:", a4);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = -[SUCoreDiagStats endFailAllIndications](v9, "endFailAllIndications");
    v17 = v16 == a4;
    if (v16 == a4)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "oslog");
      v19 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = -[SUCoreDiagStats endFailIndicationsCount](v9, "endFailIndicationsCount");
        v21 = -[SUCoreDiagStats endFailIndicationsCount](v9, "endFailIndicationsCount");
        v22 = CFSTR("endFails");
        *(_DWORD *)buf = 134218498;
        v57 = v20;
        v58 = 2114;
        if (v21 == 1)
          v22 = CFSTR("endFail");
        v59 = v22;
        v60 = 2114;
        v61 = v15;
        _os_log_impl(&dword_1B05B8000, v19, OS_LOG_TYPE_DEFAULT, "[DIAG_STATS] DROPPED: dropping tracked statistics [%lld %{public}@ matched %{public}@]", buf, 0x20u);
      }

      v51 = 0;
      v52 = 0;
      v55 -= -[SUCoreDiagStats endFailIndicationsCount](v9, "endFailIndicationsCount");
    }
    if (-[SUCoreDiagStats errorAllIndications](v9, "errorAllIndications") == a4)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "oslog");
      v24 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = -[SUCoreDiagStats errorIndicationsCount](v9, "errorIndicationsCount");
        v26 = -[SUCoreDiagStats errorIndicationsCount](v9, "errorIndicationsCount");
        v27 = CFSTR("errors");
        *(_DWORD *)buf = 134218754;
        v57 = v25;
        v58 = 2114;
        if (v26 == 1)
          v27 = CFSTR("error");
        v59 = v15;
        v60 = 2114;
        v61 = v27;
        v62 = 2114;
        v63 = v15;
        _os_log_impl(&dword_1B05B8000, v24, OS_LOG_TYPE_DEFAULT, "[DIAG_STATS] DROPPED: dropping tracked statistics [%lld %{public}@ %{public}@ matched %{public}@]", buf, 0x2Au);
      }

      v49 = 0;
      v50 = 0;
      v54 -= -[SUCoreDiagStats errorIndicationsCount](v9, "errorIndicationsCount");
      v17 = 1;
    }
    if (-[SUCoreDiagStats anomalyAllIndications](v9, "anomalyAllIndications") == a4)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "oslog");
      v29 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = -[SUCoreDiagStats anomalyIndicationsCount](v9, "anomalyIndicationsCount");
        v31 = -[SUCoreDiagStats anomalyIndicationsCount](v9, "anomalyIndicationsCount");
        v32 = CFSTR("anomalies");
        *(_DWORD *)buf = 134218754;
        v57 = v30;
        v58 = 2114;
        if (v31 == 1)
          v32 = CFSTR("anomaly");
        v59 = v15;
        v60 = 2114;
        v61 = v32;
        v62 = 2114;
        v63 = v15;
        _os_log_impl(&dword_1B05B8000, v29, OS_LOG_TYPE_DEFAULT, "[DIAG_STATS] DROPPED: dropping tracked statistics [%lld %{public}@ %{public}@ matched %{public}@]", buf, 0x2Au);
      }

      v47 = 0;
      v48 = 0;
      v53 -= -[SUCoreDiagStats anomalyIndicationsCount](v9, "anomalyIndicationsCount");
      v17 = 1;
    }
    if (-[SUCoreDiagStats failureAllIndications](v9, "failureAllIndications") == a4)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "oslog");
      v34 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = -[SUCoreDiagStats failureIndicationsCount](v9, "failureIndicationsCount");
        v36 = -[SUCoreDiagStats failureIndicationsCount](v9, "failureIndicationsCount");
        v37 = CFSTR("failures");
        *(_DWORD *)buf = 134218754;
        v57 = v35;
        v58 = 2114;
        if (v36 == 1)
          v37 = CFSTR("failure");
        v59 = v15;
        v60 = 2114;
        v61 = v37;
        v62 = 2114;
        v63 = v15;
        _os_log_impl(&dword_1B05B8000, v34, OS_LOG_TYPE_DEFAULT, "[DIAG_STATS] DROPPED: dropping tracked statistics [%lld %{public}@ %{public}@ matched %{public}@]", buf, 0x2Au);
      }

      v11 -= -[SUCoreDiagStats failureIndicationsCount](v9, "failureIndicationsCount");
      v45 = 0;
      v46 = 0;
      if (-[SUCoreDiagStats faultAllIndications](v9, "faultAllIndications") != a4)
        goto LABEL_35;
    }
    else if (-[SUCoreDiagStats faultAllIndications](v9, "faultAllIndications") != a4)
    {
      if (!v17)
        goto LABEL_36;
      goto LABEL_35;
    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "oslog");
    v39 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = -[SUCoreDiagStats faultIndicationsCount](v9, "faultIndicationsCount");
      v41 = -[SUCoreDiagStats faultIndicationsCount](v9, "faultIndicationsCount");
      v42 = CFSTR("faults");
      *(_DWORD *)buf = 134218754;
      v57 = v40;
      v58 = 2114;
      if (v41 == 1)
        v42 = CFSTR("fault");
      v59 = v15;
      v60 = 2114;
      v61 = v42;
      v62 = 2114;
      v63 = v15;
      _os_log_impl(&dword_1B05B8000, v39, OS_LOG_TYPE_DEFAULT, "[DIAG_STATS] DROPPED: dropping tracked statistics [%lld %{public}@ %{public}@ matched %{public}@]", buf, 0x2Au);
    }

    v14 = 0;
    v13 = 0;
    v12 -= -[SUCoreDiagStats faultIndicationsCount](v9, "faultIndicationsCount");
LABEL_35:
    v43 = -[SUCoreDiagStats initWithBeginCount:withEndSuccessCount:withEndFailCount:withEndFailIndicationsCount:withEndFailAllIndications:withErrorCount:withErrorIndicationsCount:withErrorAllIndications:withAnomalyCount:withAnomalyIndicationsCount:withAnomalyAllIndications:withFailureCount:withFailureIndicationsCount:withFailureAllIndications:withFaultCount:withFaultIndicationsCount:withFaultAllIndications:withStateEventCount:]([SUCoreDiagStats alloc], "initWithBeginCount:withEndSuccessCount:withEndFailCount:withEndFailIndicationsCount:withEndFailAllIndications:withErrorCount:withErrorIndicationsCount:withErrorAllIndications:withAnomalyCount:withAnomalyIndicationsCount:withAnomalyAllIndications:withFailureCount:withFailureIndicationsCount:withFailureAllIndications:withFaultCount:withFaultIndicationsCount:withFaultAllIndications:withStateEventCount:", -[SUCoreDiagStats beginCount](v9, "beginCount"), -[SUCoreDiagStats endSuccessCount](v9, "endSuccessCount"), v55, v52, v51, v54, v50, v49, v53, v48, v47, v11, v46, v45,
            v12,
            v13,
            v14,
            -[SUCoreDiagStats stateEventCount](v9, "stateEventCount"));

    v9 = v43;
LABEL_36:

  }
  return v9;
}

- (NSMutableArray)trackingHistory
{
  return self->_trackingHistory;
}

- (void)setTrackingHistory:(id)a3
{
  objc_storeStrong((id *)&self->_trackingHistory, a3);
}

- (BOOL)isSharedDiag
{
  return self->_isSharedDiag;
}

- (void)setIsSharedDiag:(BOOL)a3
{
  self->_isSharedDiag = a3;
}

- (OS_dispatch_queue)trackingQueue
{
  return self->_trackingQueue;
}

- (SUCoreDiagStats)trackStats
{
  return self->_trackStats;
}

- (void)setTrackStats:(id)a3
{
  objc_storeStrong((id *)&self->_trackStats, a3);
}

- (NSString)uniqueInstanceName
{
  return self->_uniqueInstanceName;
}

- (void)setUniqueInstanceName:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueInstanceName, a3);
}

- (NSString)appendingDumpFilename
{
  return self->_appendingDumpFilename;
}

- (void)setAppendingDumpFilename:(id)a3
{
  objc_storeStrong((id *)&self->_appendingDumpFilename, a3);
}

- (NSString)lastReportedUUID
{
  return self->_lastReportedUUID;
}

- (void)setLastReportedUUID:(id)a3
{
  objc_storeStrong((id *)&self->_lastReportedUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReportedUUID, 0);
  objc_storeStrong((id *)&self->_appendingDumpFilename, 0);
  objc_storeStrong((id *)&self->_uniqueInstanceName, 0);
  objc_storeStrong((id *)&self->_trackStats, 0);
  objc_storeStrong((id *)&self->_trackingQueue, 0);
  objc_storeStrong((id *)&self->_trackingHistory, 0);
}

- (void)initWithAppendedDomain:(uint64_t)a3 appendingDumpFilename:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1B05B8000, a2, a3, "[DIAG_ERROR] ERROR: unable to create dispatch queue domain(%{public}@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

void __56__SUCoreDiag_trackFault_forReason_withResult_withError___block_invoke_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = 138543618;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  _os_log_fault_impl(&dword_1B05B8000, log, OS_LOG_TYPE_FAULT, "[DIAG_FAULT] FAULT:%{public}@, result=%ld", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_7();
}

- (void)loadDump:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1B05B8000, a2, a3, "[DIAG_ERROR] ERROR: unable to load encoded data from dump file: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)loadDump:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1B05B8000, v0, v1, "[DIAG_ERROR] ERROR: failed to unarchive encoded data from dump file: %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)_dumpToFile:dumpingDict:forReason:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1B05B8000, v0, v1, "[DIAG_ERROR] ANOMALY: [%{public}@] could not create dump file: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)_dumpToFile:dumpingDict:forReason:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1B05B8000, v0, v1, "[DIAG_ERROR] ANOMALY: failed to create directory: %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)_dumpToFile:(uint64_t)a3 dumpingDict:(uint64_t)a4 forReason:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1B05B8000, a2, a3, "[DIAG_ERROR] DUMP_LOSS: unable to encode data for dump to file, error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_dumpEvent:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B05B8000, log, OS_LOG_TYPE_ERROR, "[DIAG_ERROR] DUMP_LOSS: unable to create event to report", v1, 2u);
}

@end
