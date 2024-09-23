@implementation SURollbackController

- (SURollbackController)initWithCore:(id)a3
{
  id v4;
  SURollbackController *v5;
  SURollbackController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SURollbackController;
  v5 = -[SURollbackController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_core, v4);
    v6->_rollingBack = 0;
  }

  return v6;
}

- (void)rollbackUpdateWithOptions:(id)a3 completion:(id)a4
{
  SURollbackOptions *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41[5];
  id v42;
  SURollbackOptions *v43;
  id v44;

  v6 = (SURollbackOptions *)a3;
  v7 = a4;
  -[SURollbackController core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "disableRollback");

  if (!(_DWORD)v9)
  {
    -[SURollbackController core](self, "core");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "eligibleRollbackWithOptions:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      if (!v6)
        v6 = objc_alloc_init(SURollbackOptions);
      -[SURollbackController core](self, "core");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_opt_respondsToSelector();

      if ((v29 & 1) != 0)
      {
        -[SURollbackController core](self, "core");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "externWorkQueue");
        v38 = objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x24BDAC760];
        v41[1] = 3221225472;
        v41[2] = (uint64_t)__61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke;
        v41[3] = (uint64_t)&unk_24CE3C2A8;
        v41[4] = (uint64_t)self;
        v42 = v18;
        v6 = v6;
        v43 = v6;
        v44 = v7;
        dispatch_async(v38, v41);

        goto LABEL_13;
      }
      SULogInfo(CFSTR("Unable to rollback update because delegate callback not implemented"), v30, v31, v32, v33, v34, v35, v36, v41[0]);
      v39 = 91;
    }
    else
    {
      SULogInfo(CFSTR("Unable to rollback update. No eligible rollback found"), v20, v21, v22, v23, v24, v25, v26, v41[0]);
      if (!v7)
        goto LABEL_13;
      v39 = 89;
    }
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v40);

    goto LABEL_13;
  }
  SULogInfo(CFSTR("Preventing rollback due to preferences"), v11, v12, v13, v14, v15, v16, v17, v41[0]);
  if (v7)
  {
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 88);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v18);
LABEL_13:

  }
}

void __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  objc_msgSend(a1[4], "core");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_2;
  v6[3] = &unk_24CE3E5E8;
  v4 = a1[5];
  v6[4] = a1[4];
  v5 = a1[6];
  v9 = a1[7];
  v7 = a1[5];
  v8 = a1[6];
  objc_msgSend(v3, "rollbackReadyToStart:options:completion:", v4, v5, v6);

}

void __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  char v23;

  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "core");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_3;
  block[3] = &unk_24CE3E5C0;
  v11 = *(id *)(a1 + 56);
  v23 = a2;
  v17 = v7;
  v18 = v8;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v22 = v11;
  v19 = v12;
  v20 = v13;
  v21 = *(id *)(a1 + 48);
  v14 = v8;
  v15 = v7;
  dispatch_async(v10, block);

}

void __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;

  v2 = *(_QWORD *)(a1 + 72);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 80))
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "fakeSplatInstalled");

    if (v4)
    {
      SULogInfo(CFSTR("%s: To rollback the fake splat..."), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SURollbackController rollbackUpdateWithOptions:completion:]_block_invoke_3");
      objc_msgSend(*(id *)(a1 + 48), "core");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "workQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_4;
      block[3] = &unk_24CE3B610;
      v14 = *(void **)(a1 + 56);
      block[4] = *(_QWORD *)(a1 + 48);
      v20 = v14;
      dispatch_async(v13, block);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "core");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "engine");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "createBrainLoadLockAssertion:", &__block_literal_global_23);

      objc_msgSend(*(id *)(a1 + 48), "core");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "engine");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rollbackUpdateWithOptions:", *(_QWORD *)(a1 + 64));

    }
  }
}

void __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "rollbackStarted:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_5;
  v5[3] = &unk_24CE3B610;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(v3, v5);

}

uint64_t __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rollbackCompleted:withError:", *(_QWORD *)(a1 + 40), 0);
}

void __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
    SULogInfo(CFSTR("%s: Failed to create brain load lock assertion: %@"), a2, a3, a4, a5, a6, a7, a8, (uint64_t)"-[SURollbackController rollbackUpdateWithOptions:completion:]_block_invoke_6");
}

- (BOOL)isRollingBack
{
  void *v3;
  NSObject *v4;

  -[SURollbackController core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_rollingBack;
}

- (void)setRollingBack:(BOOL)a3
{
  void *v5;
  NSObject *v6;

  -[SURollbackController core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  self->_rollingBack = a3;
}

- (void)rollbackStarted:(id)a3
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
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;

  v4 = a3;
  -[SURollbackController core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  SULogInfo(CFSTR("Rollback Started: %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v4);
  self->_rollingBack = 1;
  -[SURollbackController core](self, "core");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[SURollbackController core](self, "core");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "externWorkQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__SURollbackController_rollbackStarted___block_invoke;
    block[3] = &unk_24CE3B610;
    block[4] = self;
    v20 = v4;
    dispatch_async(v18, block);

  }
}

void __40__SURollbackController_rollbackStarted___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rollbackDidStart:", *(_QWORD *)(a1 + 40));

}

- (void)rollbackCompleted:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  id *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  NSObject *v42;
  uint64_t v43;
  _QWORD v44[5];
  id v45;
  _QWORD block[5];
  id v47;
  id v48;

  v6 = a3;
  v7 = a4;
  -[SURollbackController core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  self->_rollingBack = 0;
  objc_msgSend(MEMORY[0x24BEAEA48], "sharedDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "hasSemiSplatActive");

  if ((_DWORD)v9)
  {
    SULogInfo(CFSTR("Rollback already applied, just proceed to reboot"), v11, v12, v13, v14, v15, v16, v17, v43);
LABEL_6:
    SULogInfo(CFSTR("Rollback succeeded: %@. Informing clients"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v6);
    if (v6
      || (-[SURollbackController core](self, "core"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v25, "eligibleRollbackWithOptions:", 0),
          v6 = (id)objc_claimAutoreleasedReturnValue(),
          v25,
          v6))
    {
      objc_msgSend(v6, "productBuildVersion");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("Adding %@ to rolledBackDescritor list"), v27, v28, v29, v30, v31, v32, v33, (uint64_t)v26);

      -[SURollbackController core](self, "core");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "state");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "productBuildVersion");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addRolledBackBuildVersion:", v36);

      -[SURollbackController core](self, "core");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "state");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "save");

    }
    -[SURollbackController core](self, "core");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "delegate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_opt_respondsToSelector();

    if ((v41 & 1) != 0)
    {
      -[SURollbackController core](self, "core");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "externWorkQueue");
      v42 = objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __52__SURollbackController_rollbackCompleted_withError___block_invoke_2;
      v44[3] = &unk_24CE3B610;
      v44[4] = self;
      v23 = &v45;
      v6 = v6;
      v45 = v6;
      dispatch_async(v42, v44);

      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (!v7)
    goto LABEL_6;
  SULogInfo(CFSTR("Rollback failed with error: %@"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  -[SURollbackController core](self, "core");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    -[SURollbackController core](self, "core");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "externWorkQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__SURollbackController_rollbackCompleted_withError___block_invoke;
    block[3] = &unk_24CE3BB38;
    block[4] = self;
    v23 = &v47;
    v6 = v6;
    v47 = v6;
    v48 = v7;
    dispatch_async(v22, block);

    v24 = v48;
LABEL_11:

  }
LABEL_12:

}

void __52__SURollbackController_rollbackCompleted_withError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rollbackDidFail:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __52__SURollbackController_rollbackCompleted_withError___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rollbackSucceeded:", *(_QWORD *)(a1 + 40));

}

- (void)rollbackReadyForReboot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SURollbackController core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SURollbackController core](self, "core");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "externWorkQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __47__SURollbackController_rollbackReadyForReboot___block_invoke;
    v10[3] = &unk_24CE3B610;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v9, v10);

  }
}

void __47__SURollbackController_rollbackReadyForReboot___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rollbackReadyForReboot:", *(_QWORD *)(a1 + 40));

}

- (id)availableRollback
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SURollbackController core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SURollbackController core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availableRollback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)previousRollback
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SURollbackController core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SURollbackController core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previousRollback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SUManagerCore)core
{
  return (SUManagerCore *)objc_loadWeakRetained((id *)&self->_core);
}

- (void)setCore:(id)a3
{
  objc_storeWeak((id *)&self->_core, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_core);
}

@end
