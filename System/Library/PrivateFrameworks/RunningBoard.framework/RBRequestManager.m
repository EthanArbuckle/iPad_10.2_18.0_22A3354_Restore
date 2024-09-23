@implementation RBRequestManager

- (void)_executeLaunchRequestWithAssertion:(void *)a3 requestor:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(v7, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE80B20], "identifierWithClientPid:", objc_msgSend(v8, "rbs_pid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBRequestManager _createAcquisitionContext:requestor:assertionIdentifier:isAbstractTarget:]((_QWORD *)a1, v7, v8, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "processMonitor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "suppressUpdatesForIdentity:", v11);

    objc_msgSend(*(id *)(a1 + 8), "assertionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __76__RBRequestManager__executeLaunchRequestWithAssertion_requestor_completion___block_invoke;
    v18[3] = &unk_24DD47558;
    v18[4] = a1;
    v19 = v7;
    v20 = v8;
    v21 = v12;
    v22 = v11;
    v23 = v9;
    v16 = v11;
    v17 = v12;
    objc_msgSend(v15, "acquireAssertionWithContext:completion:", v13, v18);

  }
}

- (void)executeLaunchRequest:(id)a3 euid:(unsigned int)a4 requestor:(id)a5 entitlements:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v11, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BE80C98], "identityForLSApplicationIdentity:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    rbs_connection_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v16, "identityString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v19;
      v36 = 2114;
      v37 = v17;
      _os_log_impl(&dword_21A8B4000, v18, OS_LOG_TYPE_INFO, "Resolved identity for launch request for %{public}@ to %{public}@", buf, 0x16u);

    }
    if (v17)
    {
      objc_msgSend(v11, "context");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setIdentity:", v17);

    }
  }
  v33 = v11;
  v21 = -[RBRequestManager _checkAndAdjustLaunchRequest:requestor:entitlements:]((uint64_t)self, &v33, v12, v13);
  v22 = v33;

  if ((v21 & 1) != 0)
  {
    objc_msgSend(v22, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "attributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
    {
      -[RBRequestManager _executeLaunchRequestWithAssertion:requestor:completion:]((uint64_t)self, v22, v12, v14);
    }
    else
    {
      v26 = (void *)MEMORY[0x24BE80D68];
      +[RBConnectionClient sharedLaunchWorkloop]();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __80__RBRequestManager_executeLaunchRequest_euid_requestor_entitlements_completion___block_invoke;
      v28[3] = &unk_24DD475A8;
      v28[4] = self;
      v29 = v22;
      v30 = v23;
      v31 = v12;
      v32 = v14;
      objc_msgSend(v26, "handoffContextOnQueue:block:", v27, v28);

    }
  }
  else
  {
    rbs_connection_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[RBRequestManager executeLaunchRequest:euid:requestor:entitlements:completion:].cold.1((uint64_t)v12, v25);

    objc_msgSend(MEMORY[0x24BDD1540], "rbs_errorClientNotAuthorized");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v14 + 2))(v14, 0, 0, 0, v23);
  }

}

- (uint64_t)_checkAndAdjustLaunchRequest:(void *)a3 requestor:(void *)a4 entitlements:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString **v12;
  uint64_t v13;
  void *v15;
  void *v16;
  uint64_t v17;

  v7 = a3;
  v8 = a4;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_12;
  }
  if (!a2)
    -[RBRequestManager _checkAndAdjustLaunchRequest:requestor:entitlements:].cold.1();
  objc_msgSend(*a2, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isXPCService") & 1) != 0 || objc_msgSend(v9, "hostPid"))
  {

  }
  else
  {
    objc_msgSend(v9, "extensionOverlay");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(v9, "identity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isDext");

      if ((v17 & 1) == 0)
      {
        if ((objc_msgSend(v8, "hasEntitlementDomain:", 2) & 1) != 0)
          goto LABEL_7;
        v13 = -[RBRequestManager _checkLaunchByAnyAndAdjustRequest:](a1, a2);
LABEL_10:
        v11 = v13;
        goto LABEL_11;
      }
      v12 = RBLaunchDextsEntitlement;
LABEL_9:
      v13 = objc_msgSend(v8, "hasEntitlement:", *v12);
      goto LABEL_10;
    }
  }
  if ((-[RBRequestManager _checkExtensionLaunchFromRequstor:AndAdjustRequest:](a1, v7, a2) & 1) == 0)
  {
    v12 = RBLaunchExtensionsEntitlement;
    goto LABEL_9;
  }
LABEL_7:
  v11 = 1;
LABEL_11:

LABEL_12:
  return v11;
}

void __76__RBRequestManager__executeLaunchRequestWithAssertion_requestor_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BE80D68];
  +[RBConnectionClient sharedLaunchWorkloop]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__RBRequestManager__executeLaunchRequestWithAssertion_requestor_completion___block_invoke_2;
  v8[3] = &unk_24DD47530;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = v3;
  v14 = *(id *)(a1 + 72);
  v13 = *(id *)(a1 + 64);
  v7 = v3;
  objc_msgSend(v4, "handoffContextOnQueue:block:", v5, v8);

}

- (uint64_t)_checkExtensionLaunchFromRequstor:(id *)a3 AndAdjustRequest:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a1)
  {
    objc_msgSend(*a3, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isExtension"))
    {
      a1 = 0;
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v7, "hostIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      if (!v8 || !v9)
      {

LABEL_13:
        rbs_process_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v31 = v5;
          v32 = 2114;
          v33 = v7;
          _os_log_impl(&dword_21A8B4000, v14, OS_LOG_TYPE_INFO, "Not mutating extension launch from %{public}@ for %{public}@ since requestor is not the host", buf, 0x16u);
        }
        a1 = 0;
LABEL_20:

        goto LABEL_21;
      }
      v11 = objc_msgSend(v8, "isEqual:", v9);

      if ((v11 & 1) == 0)
        goto LABEL_13;
    }
    v12 = (void *)MEMORY[0x24BE80BE8];
    objc_msgSend(v6, "identity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contextWithIdentity:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "attributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setAttributes:](v14, "setAttributes:", v15);

    objc_msgSend(v6, "explanation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setExplanation:](v14, "setExplanation:", v16);

    objc_msgSend(v6, "oneShotUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setOneShotUUID:](v14, "setOneShotUUID:", v17);

    objc_msgSend(v5, "handle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setRequestorHandle:](v14, "setRequestorHandle:", v18);

    objc_msgSend(v5, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHostPid:](v14, "setHostPid:", objc_msgSend(v19, "rbs_pid"));

    objc_msgSend(v6, "managedEndpointLaunchIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setManagedEndpointLaunchIdentifiers:](v14, "setManagedEndpointLaunchIdentifiers:", v20);

    objc_msgSend(v6, "requiredExistingProcess");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setRequiredExistingProcess:](v14, "setRequiredExistingProcess:", v21);

    objc_msgSend(*(id *)(a1 + 8), "extensionDataProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    a1 = objc_msgSend(v22, "configureLaunchContext:error:", v14, &v29);
    v23 = v29;

    if ((_DWORD)a1)
    {
      objc_msgSend(v6, "attributes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setAttributes:](v14, "setAttributes:", v24);

      objc_msgSend(v6, "managedEndpointLaunchIdentifiers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setManagedEndpointLaunchIdentifiers:](v14, "setManagedEndpointLaunchIdentifiers:", v25);

      objc_msgSend(v6, "requiredExistingProcess");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setRequiredExistingProcess:](v14, "setRequiredExistingProcess:", v26);

      *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE80BF8]), "initWithContext:", v14);
    }
    else
    {
      rbs_process_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v31 = v5;
        v32 = 2114;
        v33 = v7;
        v34 = 2114;
        v35 = v23;
        _os_log_impl(&dword_21A8B4000, v27, OS_LOG_TYPE_DEFAULT, "Extension launch from %{public}@ for %{public}@ failed with error %{public}@", buf, 0x20u);
      }

    }
    goto LABEL_20;
  }
LABEL_22:

  return a1;
}

void __104__RBRequestManager__finishLaunchRequestAfterAssertionAcquisition_requestor_identifier_error_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (!a2)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateAssertionFromOriginator:withIdentifier:", v7, *(_QWORD *)(a1 + 32));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __80__RBRequestManager_executeLaunchRequest_euid_requestor_entitlements_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "processManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    rbs_ttl_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "context");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "explanation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v19 = v6;
      v20 = 2114;
      v21 = v7;
      v22 = 2114;
      v23 = v8;
      _os_log_impl(&dword_21A8B4000, v3, OS_LOG_TYPE_DEFAULT, "Executing launch request for %{public}@ (%{public}@) from requestor: %{public}@", buf, 0x20u);

    }
    v9 = *(_QWORD *)(a1 + 40);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __80__RBRequestManager_executeLaunchRequest_euid_requestor_entitlements_completion___block_invoke_21;
    v14[3] = &unk_24DD47580;
    v15 = *(id *)(a1 + 64);
    objc_msgSend(v2, "executeLaunchRequest:withCompletion:", v9, v14);
    v10 = v15;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BE80E48];
    v16 = *MEMORY[0x24BDD0FD8];
    v17 = CFSTR("Unable to execute launch request");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 5, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __76__RBRequestManager__executeLaunchRequestWithAssertion_requestor_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  -[RBRequestManager _finishLaunchRequestAfterAssertionAcquisition:requestor:identifier:error:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "processMonitor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unsuppressUpdatesForIdentity:", *(_QWORD *)(a1 + 72));

}

- (void)_finishLaunchRequestAfterAssertionAcquisition:(void *)a3 requestor:(void *)a4 identifier:(void *)a5 error:(void *)a6 completion:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a1)
  {
    if (v14)
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      v17 = *MEMORY[0x24BE80E48];
      v18 = *MEMORY[0x24BDD1398];
      v32[0] = *MEMORY[0x24BDD0FD8];
      v32[1] = v18;
      v33[0] = CFSTR("Unable to execute launch request");
      v33[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 5, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t))v15 + 2))(v15, 0, 0, 0, v20);
      v14 = (id)v20;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 8), "processManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 8), "assertionManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __104__RBRequestManager__finishLaunchRequestAfterAssertionAcquisition_requestor_identifier_error_completion___block_invoke;
        v27[3] = &unk_24DD47508;
        v31 = v15;
        v28 = v13;
        v29 = v22;
        v30 = v12;
        objc_msgSend(v21, "executeLaunchRequest:withCompletion:", v11, v27);

        v14 = 0;
      }
      else
      {
        v23 = (void *)MEMORY[0x24BDD1540];
        v24 = *MEMORY[0x24BE80E48];
        v34 = *MEMORY[0x24BDD0FD8];
        v35[0] = CFSTR("Unable to execute launch request");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 5, v25);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "invalidateAssertionFromOriginator:withIdentifier:", v26, v13);

        (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v15 + 2))(v15, 0, 0, 0, v14);
      }

    }
  }

}

- (RBRequestManager)initWithContext:(id)a3
{
  id v5;
  RBRequestManager *v6;
  RBRequestManager *v7;
  RBRequestManager *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBRequestManager;
  v6 = -[RBRequestManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemonContext, a3);
    v8 = v7;
  }

  return v7;
}

- (uint64_t)_checkLaunchByAnyAndAdjustRequest:(uint64_t)a1
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;

  if (!a1)
    return 0;
  objc_msgSend(*a2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "osServiceType") == 3)
    goto LABEL_3;
  if (!objc_msgSend(v4, "isApplication"))
    goto LABEL_7;
  objc_msgSend(v4, "embeddedApplicationIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_7;
  v14 = (void *)MEMORY[0x24BDC1538];
  objc_msgSend(v4, "embeddedApplicationIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applicationProxyForIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "entitlementValueForKey:ofClass:", CFSTR("com.apple.runningboard.trustedtarget"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if (v18)
  {
LABEL_3:
    v5 = (void *)MEMORY[0x24BE80BE8];
    objc_msgSend(v3, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextWithIdentity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributes:", v8);

    objc_msgSend(v3, "explanation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExplanation:", v9);

    objc_msgSend(v3, "managedEndpointLaunchIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setManagedEndpointLaunchIdentifiers:", v10);

    objc_msgSend(v3, "requiredExistingProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRequiredExistingProcess:", v11);

    *a2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE80BF8]), "initWithContext:", v7);
    v12 = 1;
  }
  else
  {
LABEL_7:
    v12 = 0;
  }

  return v12;
}

- (_QWORD)_createAcquisitionContext:(void *)a3 requestor:(void *)a4 assertionIdentifier:(int)a5 isAbstractTarget:
{
  _QWORD *v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;

  v5 = a1;
  if (a1)
  {
    v9 = a4;
    v10 = a3;
    objc_msgSend(a2, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80D38], "targetWithProcessIdentity:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "explanation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RBSLaunchRequest for %@"), v14);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;

    objc_msgSend(MEMORY[0x24BE80B18], "descriptorWithIdentifier:target:explanation:attributes:", v9, v14, v18, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:](RBAssertionAcquisitionContext, "contextForProcess:withDescriptor:daemonContext:", v10, v19, v5[1]);
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (a5)
      objc_msgSend(v5, "setAllowAbstractTarget:", 1);
    objc_msgSend(v5, "setAcquisitionPolicy:", 1);

  }
  return v5;
}

- (id)acquireDroppedLaunchAssertion:(id)a3 requestor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  RBRequestManager *v21;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE80B20], "identifierWithClientPid:", objc_msgSend(v6, "rbs_pid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBRequestManager _createAcquisitionContext:requestor:assertionIdentifier:isAbstractTarget:](self, v7, v6, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBDaemonContextProviding processMonitor](self->_daemonContext, "processMonitor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "suppressUpdatesForIdentity:", v9);

  -[RBDaemonContextProviding assertionManager](self->_daemonContext, "assertionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __60__RBRequestManager_acquireDroppedLaunchAssertion_requestor___block_invoke;
  v18[3] = &unk_24DD468A8;
  v19 = v9;
  v14 = v10;
  v20 = v14;
  v21 = self;
  v15 = v9;
  objc_msgSend(v13, "acquireAssertionWithContext:completion:", v11, v18);

  v16 = v14;
  return v16;
}

void __60__RBRequestManager_acquireDroppedLaunchAssertion_requestor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  if (v3)
  {
    rbs_assertion_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__RBRequestManager_acquireDroppedLaunchAssertion_requestor___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "processMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsuppressUpdatesForIdentity:", *(_QWORD *)(a1 + 32));

}

uint64_t __80__RBRequestManager_executeLaunchRequest_euid_requestor_entitlements_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonContext, 0);
}

- (void)_checkAndAdjustLaunchRequest:requestor:entitlements:.cold.1()
{
  __assert_rtn("-[RBRequestManager _checkAndAdjustLaunchRequest:requestor:entitlements:]", "RBRequestManager.m", 128, "request");
}

void __60__RBRequestManager_acquireDroppedLaunchAssertion_requestor___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_21A8B4000, log, OS_LOG_TYPE_ERROR, "Error acquiring launch assertion for target: %@: identifier %{public}@ error: <%{public}@>", (uint8_t *)&v5, 0x20u);
}

- (void)executeLaunchRequest:(uint64_t)a1 euid:(NSObject *)a2 requestor:entitlements:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "Rejecting launch request because %{public}@ is not entitled to launch processes", (uint8_t *)&v2, 0xCu);
}

@end
