@implementation PRUISSnapshotService

- (PRUISSnapshotService)init
{
  PRUISSnapshotService *v2;
  uint64_t v3;
  SBSnapshotServiceXPCConnection *underlyingConnection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRUISSnapshotService;
  v2 = -[PRUISSnapshotService init](&v6, sel_init);
  if (v2)
  {
    +[SBSnapshotServiceXPCConnection defaultConnection](SBSnapshotServiceXPCConnection, "defaultConnection");
    v3 = objc_claimAutoreleasedReturnValue();
    underlyingConnection = v2->_underlyingConnection;
    v2->_underlyingConnection = (SBSnapshotServiceXPCConnection *)v3;

  }
  return v2;
}

- (void)executeSnapshotRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CFAbsoluteTime Current;
  SBSnapshotServiceXPCConnection *underlyingConnection;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  PRUISSnapshotServiceRequest *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  CFAbsoluteTime v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  underlyingConnection = self->_underlyingConnection;
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __58__PRUISSnapshotService_executeSnapshotRequest_completion___block_invoke;
  v19[3] = &unk_251534D78;
  v11 = v7;
  v21 = v11;
  v12 = v6;
  v20 = v12;
  -[SBSnapshotServiceXPCConnection remoteObjectProxyWithErrorHandler:](underlyingConnection, "remoteObjectProxyWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = -[PRUISSnapshotServiceRequest initWithSnapshotRequest:]([PRUISSnapshotServiceRequest alloc], "initWithSnapshotRequest:", v12);
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __58__PRUISSnapshotService_executeSnapshotRequest_completion___block_invoke_2;
    v15[3] = &unk_251534DA0;
    v17 = v11;
    v16 = v12;
    v18 = Current;
    objc_msgSend(v13, "executeSnapshotRequest:reply:", v14, v15);

  }
}

void __58__PRUISSnapshotService_executeSnapshotRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(v2 + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v2 + 16))(v2, v3, 0, v4);

  }
}

void __58__PRUISSnapshotService_executeSnapshotRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if (!v16 || v5)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD, id))(v7 + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, _QWORD, void *))(v7 + 16))(v7, v8, 0, v12);

    }
  }
  else
  {
    objc_msgSend(v16, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      objc_msgSend(v16, "snapshotBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v16, "sandboxExtensionToken");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74EF8]), "initWithRequest:snapshotBundle:executeTime:", *(_QWORD *)(a1 + 32), v9, CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48));
        objc_setAssociatedObject(v9, "sandboxExtensionToken", v10, (void *)1);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
      else
      {
        v15 = a1 + 32;
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(_QWORD *)(v15 + 8);
        objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, uint64_t, _QWORD, void *))(v14 + 16))(v14, v13, 0, v10);
      }

    }
  }

}

- (id)cachedSnapshotForRequest:(id)a3 error:(id *)a4
{
  id v6;
  double Current;
  uint64_t v8;
  SBSnapshotServiceXPCConnection *underlyingConnection;
  void *v10;
  void *v11;
  PRUISSnapshotServiceRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v6 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  v43 = 0;
  Current = CFAbsoluteTimeGetCurrent();
  v8 = MEMORY[0x24BDAC760];
  underlyingConnection = self->_underlyingConnection;
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __55__PRUISSnapshotService_cachedSnapshotForRequest_error___block_invoke;
  v37[3] = &unk_251534DC8;
  v37[4] = &v38;
  -[SBSnapshotServiceXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](underlyingConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v37);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)v39[5];
  if (!v11 && v10)
  {
    v12 = -[PRUISSnapshotServiceRequest initWithSnapshotRequest:]([PRUISSnapshotServiceRequest alloc], "initWithSnapshotRequest:", v6);
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v30 = 0;
    v24[0] = v8;
    v24[1] = 3221225472;
    v24[2] = __55__PRUISSnapshotService_cachedSnapshotForRequest_error___block_invoke_2;
    v24[3] = &unk_251534DF0;
    v24[4] = &v25;
    v24[5] = &v31;
    objc_msgSend(v10, "cachedSnapshotForRequest:reply:", v12, v24);
    if (!v32[5])
    {
      v15 = (void *)v26[5];
      if (v15)
      {
        objc_msgSend(v15, "error");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend((id)v26[5], "snapshotBundle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74EF8]), "initWithRequest:snapshotBundle:executeTime:", v6, v17, CFAbsoluteTimeGetCurrent() - Current);
          objc_msgSend((id)v26[5], "sandboxExtensionToken");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setAssociatedObject(v14, "sandboxExtensionToken", v17, (void *)1);

          goto LABEL_20;
        }
      }
    }
    if (a4)
    {
      v13 = (void *)v32[5];
      if (v13)
      {
        v14 = 0;
        *a4 = objc_retainAutorelease(v13);
LABEL_20:
        _Block_object_dispose(&v25, 8);

        _Block_object_dispose(&v31, 8);
        goto LABEL_21;
      }
      objc_msgSend((id)v26[5], "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        *a4 = objc_retainAutorelease(v20);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 0);
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a4 = v22;

      }
    }
    v14 = 0;
    goto LABEL_20;
  }
  if (!a4)
    goto LABEL_14;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 0);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v19;

LABEL_14:
    v14 = 0;
    goto LABEL_21;
  }
  v14 = 0;
  *a4 = objc_retainAutorelease(v11);
LABEL_21:

  _Block_object_dispose(&v38, 8);
  return v14;
}

void __55__PRUISSnapshotService_cachedSnapshotForRequest_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __55__PRUISSnapshotService_cachedSnapshotForRequest_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingConnection, 0);
}

@end
