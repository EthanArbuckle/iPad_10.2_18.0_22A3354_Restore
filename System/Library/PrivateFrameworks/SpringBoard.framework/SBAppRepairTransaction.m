@implementation SBAppRepairTransaction

- (SBAppRepairTransaction)initWithApplicationInfos:(id)a3
{
  id v4;
  SBAppRepairTransaction *v5;
  uint64_t v6;
  NSSet *appInfos;
  NSMutableSet *v8;
  NSMutableSet *repairRequests;
  id v10;
  void *v11;
  uint64_t v12;
  STTelephonyStatusDomain *telephonyDomain;

  v4 = a3;
  v5 = -[SBTransaction init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    appInfos = v5->_appInfos;
    v5->_appInfos = (NSSet *)v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    repairRequests = v5->_repairRequests;
    v5->_repairRequests = v8;

    v10 = objc_alloc(MEMORY[0x1E0DB0A80]);
    objc_msgSend((id)SBApp, "systemStatusServer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithServerHandle:", v11);
    telephonyDomain = v5->_telephonyDomain;
    v5->_telephonyDomain = (STTelephonyStatusDomain *)v12;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[STTelephonyStatusDomain invalidate](self->_telephonyDomain, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBAppRepairTransaction;
  -[SBAppRepairTransaction dealloc](&v3, sel_dealloc);
}

- (void)_begin
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  objc_msgSend((id)SBApp, "noteKeybagRefetchTransactionIsActive:", 1);
  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STTelephonyStatusDomain data](self->_telephonyDomain, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primarySIMInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dataNetworkType");

  if (v6 || (objc_msgSend(v3, "hasNonCellularNetworkConnection") & 1) != 0)
    -[SBAppRepairTransaction _startAppRepairs](self, "_startAppRepairs");
  else
    -[SBAppRepairTransaction _failWithReason:description:](self, "_failWithReason:description:", CFSTR("appRepairRequiresNetwork"), CFSTR("no data connection"));
  v7.receiver = self;
  v7.super_class = (Class)SBAppRepairTransaction;
  -[SBAppRepairTransaction _begin](&v7, sel__begin);

}

- (void)_didComplete
{
  objc_super v3;

  -[NSMutableSet removeAllObjects](self->_repairRequests, "removeAllObjects");
  objc_msgSend((id)SBApp, "noteKeybagRefetchTransactionIsActive:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBAppRepairTransaction;
  -[SBAppRepairTransaction _didComplete](&v3, sel__didComplete);
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_evaluateCompletion
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__SBAppRepairTransaction__evaluateCompletion__block_invoke;
  v2[3] = &unk_1E8EA3E78;
  v2[4] = self;
  -[SBAppRepairTransaction evaluateMilestone:withEvaluator:](self, "evaluateMilestone:withEvaluator:", CFSTR("appRepair"), v2);
}

BOOL __45__SBAppRepairTransaction__evaluateCompletion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "count") == 0;
}

- (void)_completeRequest:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8;

  v8 = a3;
  if (!a4)
    -[SBAppRepairTransaction _failWithReason:description:precipitatingError:](self, "_failWithReason:description:precipitatingError:", CFSTR("appRepairFailed"), CFSTR("refetch request failed"), a5);
  -[NSMutableSet removeObject:](self->_repairRequests, "removeObject:", v8);
  -[SBAppRepairTransaction _evaluateCompletion](self, "_evaluateCompletion");

}

- (void)_startAppRepairs
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, char, uint64_t, void *);
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void (*v26)(uint64_t, char, uint64_t, void *);
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSMutableSet *obj;
  _QWORD v33[6];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v3 = self->_appInfos;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v39 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v8, "purchaserDSID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = objc_alloc(MEMORY[0x1E0CF9DA0]);
          objc_msgSend(v8, "bundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v10, "initWithBundleID:accountIdentifier:claimStyle:", v11, v9, objc_msgSend(v8, "type") == 2);

          objc_msgSend(v12, "setExitReason:", 16);
          if (v12)
            -[NSMutableSet addObject:](self->_repairRequests, "addObject:", v12);

        }
      }
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v5);
  }

  -[SBAppRepairTransaction addMilestone:](self, "addMilestone:", CFSTR("appRepair"));
  if (!-[NSMutableSet count](self->_repairRequests, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9DA0]), "initWithBundleID:accountIdentifier:claimStyle:", 0, 0, 1);
    if (v13)
      -[NSMutableSet addObject:](self->_repairRequests, "addObject:", v13);

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->_repairRequests;
  v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    v17 = 0x1E0CF9000uLL;
    v18 = MEMORY[0x1E0C809B0];
    v19 = __42__SBAppRepairTransaction__startAppRepairs__block_invoke;
    v20 = &unk_1E8E9F2F8;
    do
    {
      v21 = 0;
      v31 = v15;
      do
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v21);
        if (-[SBAppRepairTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
        {
          objc_msgSend(v22, "bundleID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "accountDSID");
          v24 = v16;
          v25 = v20;
          v26 = v19;
          v27 = v18;
          v28 = v17;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBAppRepairTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Running app repair request %p for %@ (%@)."), v22, v23, v29);

          v17 = v28;
          v18 = v27;
          v19 = v26;
          v20 = v25;
          v16 = v24;
          v15 = v31;

        }
        objc_msgSend(*(id *)(v17 + 3496), "defaultService");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v18;
        v33[1] = 3221225472;
        v33[2] = v19;
        v33[3] = v20;
        v33[4] = self;
        v33[5] = v22;
        objc_msgSend(v30, "repairAppWithOptions:replyHandler:", v22, v33);

        ++v21;
      }
      while (v15 != v21);
      v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v15);
  }

  -[SBAppRepairTransaction _evaluateCompletion](self, "_evaluateCompletion");
}

void __42__SBAppRepairTransaction__startAppRepairs__block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  __int128 v10;
  id v11;
  char v12;

  v6 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__SBAppRepairTransaction__startAppRepairs__block_invoke_2;
  v9[3] = &unk_1E8E9F2A8;
  v10 = *(_OWORD *)(a1 + 32);
  v12 = a2;
  v11 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

uint64_t __42__SBAppRepairTransaction__startAppRepairs__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isAuditHistoryEnabled"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    NSStringFromBOOL();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_addAuditHistoryItem:", CFSTR("Got response for request %p with success: %@."), v3, v4);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequest:success:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (NSSet)appInfos
{
  return self->_appInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyDomain, 0);
  objc_storeStrong((id *)&self->_repairRequests, 0);
  objc_storeStrong((id *)&self->_appInfos, 0);
}

@end
