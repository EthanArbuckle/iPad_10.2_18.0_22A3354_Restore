@implementation PRUISPosterSnapshotController

- (PRUISPosterSnapshotController)initWithCache:(id)a3 instanceIdentifier:(id)a4
{
  id v7;
  id v8;
  PRUISPosterSnapshotController *v9;
  PRUISPosterSnapshotController *v10;
  uint64_t v11;
  PRUISSnapshotService *snapshotService;
  id v13;
  void *v14;
  uint64_t v15;
  PUIPosterSnapshotController *snapshotController;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PRUISPosterSnapshotController;
  v9 = -[PRUISPosterSnapshotController init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cache, a3);
    if (PUIFeatureEnabled())
    {
      v11 = objc_opt_new();
      snapshotService = v10->_snapshotService;
      v10->_snapshotService = (PRUISSnapshotService *)v11;

    }
    v13 = objc_alloc(MEMORY[0x24BE74ED8]);
    objc_msgSend(v7, "underlyingCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithCache:instanceIdentifier:", v14, v8);
    snapshotController = v10->_snapshotController;
    v10->_snapshotController = (PUIPosterSnapshotController *)v15;

  }
  return v10;
}

- (PRUISPosterSnapshotController)initWithCacheURL:(id)a3
{
  id v4;
  PRUISPosterSnapshotFilesystemCache *v5;
  void *v6;
  PRUISPosterSnapshotController *v7;

  v4 = a3;
  v5 = -[PRUISPosterSnapshotFilesystemCache initWithURL:]([PRUISPosterSnapshotFilesystemCache alloc], "initWithURL:", v4);

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PRUISPosterSnapshotController initWithCache:instanceIdentifier:](self, "initWithCache:instanceIdentifier:", v5, v6);

  return v7;
}

- (void)executeSnapshotRequest:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void (**v26)(id, id, _QWORD, void *);
  _QWORD v27[4];
  id v28;
  id v29;
  PRUISPosterSnapshotController *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  void (**v34)(id, id, _QWORD, void *);
  _QWORD v35[10];
  id v36;
  id v37;
  id v38;
  NSObject *v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[4];
  _QWORD v49[5];
  id v50;
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v26 = (void (**)(id, id, _QWORD, void *))a4;
  objc_msgSend(v5, "attachmentConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = (void *)objc_opt_new();
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy_;
  v49[4] = __Block_byref_object_dispose_;
  v50 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = -10000;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy_;
  v46 = __Block_byref_object_dispose_;
  v47 = 0;
  v10 = dispatch_group_create();
  v11 = MEMORY[0x24BDAC760];
  if (v8)
  {
    objc_msgSend(v5, "attachmentConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attachmentHostWindowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)v43[5];
    v43[5] = (uint64_t)v13;

    v15 = v13;
    if (!v15)
    {
      v24 = (void *)MEMORY[0x24BDD1540];
      v51 = *MEMORY[0x24BDD0FD8];
      v52[0] = CFSTR("No attachment host window scene specified; abort");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE74F28], 1, v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2](v26, v5, 0, v23);
      goto LABEL_9;
    }
    dispatch_group_enter(v10);
    v35[6] = v11;
    v35[7] = 3221225472;
    v35[8] = __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke;
    v35[9] = &unk_251534C08;
    v40 = v49;
    v36 = v5;
    v37 = v15;
    v41 = v48;
    v38 = v9;
    v39 = v10;
    BSDispatchMain();

  }
  v16 = v8 == 0;
  v35[0] = v11;
  v35[1] = 3221225472;
  v35[2] = __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_3;
  v35[3] = &unk_251534C30;
  v35[4] = v49;
  v35[5] = &v42;
  v32[0] = v11;
  v32[1] = 3221225472;
  v32[2] = __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_5;
  v32[3] = &unk_251534C58;
  v17 = (id)MEMORY[0x249513F24](v35);
  v33 = v17;
  v34 = v26;
  v18 = (void *)MEMORY[0x249513F24](v32);
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_6;
  v27[3] = &unk_251534CA8;
  v28 = v5;
  v29 = v9;
  v19 = v18;
  v30 = self;
  v31 = v19;
  v20 = MEMORY[0x249513F24](v27);
  v21 = (void *)v20;
  if (v16)
  {
    (*(void (**)(uint64_t))(v20 + 16))(v20);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE74D38], "snapshotWorkloop");
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v10, v22, v21);

  }
  v23 = v33;
LABEL_9:

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v49, 8);

}

void __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)*MEMORY[0x24BDF74F8];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_2;
  v5[3] = &unk_251534C08;
  v10 = *(_QWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 72);
  v7 = v3;
  v11 = v4;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_performBlockAfterCATransactionCommits:", v5);

}

void __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MaxX;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  _PRUISSecureSnapshotWindow *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = objc_opt_new();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v39.origin.x = v7;
  v39.origin.y = v9;
  v39.size.width = v11;
  v39.size.height = v13;
  MaxX = CGRectGetMaxX(v39);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "attachmentConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attachments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortedArrayUsingSelector:", sel_compare_);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v17;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = v7 + MaxX * 10.0;
    v32 = *(_QWORD *)v34;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v34 != v32)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v21);
        v23 = -[_PRUISSecureSnapshotWindow initWithWindowScene:]([_PRUISSecureSnapshotWindow alloc], "initWithWindowScene:", *(_QWORD *)(a1 + 40));
        -[_PRUISSecureSnapshotWindow setFrame:](v23, "setFrame:", v20, v9, v11, v13);
        v24 = (void *)objc_opt_new();
        -[_PRUISSecureSnapshotWindow setRootViewController:](v23, "setRootViewController:", v24);

        -[_PRUISSecureSnapshotWindow setWindowLevel:](v23, "setWindowLevel:", (double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
        -[_PRUISSecureSnapshotWindow setHidden:](v23, "setHidden:", 0);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v23);
        objc_msgSend(v22, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PRUISSecureSnapshotWindow addSubview:](v23, "addSubview:", v25);

        v26 = objc_alloc(MEMORY[0x24BE74EC0]);
        v27 = -[_PRUISSecureSnapshotWindow _contextId](v23, "_contextId");
        objc_msgSend(v22, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v26, "initWithContextId:renderId:level:", v27, CALayerGetRenderId(), objc_msgSend(v22, "level"));

        objc_msgSend(*(id *)(a1 + 48), "addObject:", v30);
        --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v19);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_3()
{
  return BSDispatchMain();
}

void __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6++), "setHidden:", 1, (_QWORD)v11);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

void __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);

}

void __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  if (!PUIFeatureEnabled())
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "poster");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "role");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE74E90]))
  {

LABEL_4:
    v4 = 0;
    v5 = 1;
    goto LABEL_8;
  }
  v6 = objc_msgSend(*(id *)(a1 + 40), "count");

  v7 = v6 == 0;
  v4 = v6 == 0;
  if (v7)
    v5 = 2;
  else
    v5 = 1;
LABEL_8:
  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(v8, "priority");
  v10 = *(_QWORD *)(a1 + 40);
  v23 = 0;
  objc_msgSend(v8, "buildPosterKitSnapshotRequestForOutput:priority:sceneAttachments:error:", v5, v9, v10, &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v23;
  if (v12)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      v14 = *(void **)(v13 + 16);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_7;
      v20[3] = &unk_251534C80;
      v22 = *(id *)(a1 + 56);
      v21 = *(id *)(a1 + 32);
      objc_msgSend(v14, "executeSnapshotRequest:completion:", v11, v20);

      v15 = v22;
    }
    else
    {
      v16 = *(void **)(v13 + 8);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_8;
      v17[3] = &unk_251534C80;
      v19 = *(id *)(a1 + 56);
      v18 = *(id *)(a1 + 32);
      objc_msgSend(v16, "executeSnapshotRequest:completion:", v11, v17);

      v15 = v19;
    }

  }
}

void __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PRUISPosterSnapshotResult *v9;
  id v10;

  v10 = a3;
  v8 = a1 + 32;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v8 + 8);
  if (a4)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, v7, 0, a4);
  }
  else
  {
    v9 = -[PRUISPosterSnapshotResult initWithPUIPosterSnapshotResult:]([PRUISPosterSnapshotResult alloc], "initWithPUIPosterSnapshotResult:", v10);
    (*(void (**)(uint64_t, uint64_t, PRUISPosterSnapshotResult *, _QWORD))(v6 + 16))(v6, v7, v9, 0);

  }
}

void __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  PRUISPosterSnapshotResult *v9;

  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = a4;
  v8 = a3;
  v9 = -[PRUISPosterSnapshotResult initWithPUIPosterSnapshotResult:]([PRUISPosterSnapshotResult alloc], "initWithPUIPosterSnapshotResult:", v8);

  (*(void (**)(uint64_t, uint64_t, PRUISPosterSnapshotResult *, id))(v5 + 16))(v5, v6, v9, v7);
}

- (void)invalidate
{
  -[PUIPosterSnapshotController invalidate](self->_snapshotController, "invalidate");
}

- (id)latestSnapshotBundleForRequest:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[PRUISPosterSnapshotController currentSnapshotBundleForRequest:error:](self, "currentSnapshotBundleForRequest:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prPosterSnapshotBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentSnapshotBundleForRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v6 = a3;
  if (PUIFeatureEnabled()
    && (objc_msgSend(v6, "poster"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "role"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE74E90]),
        v8,
        v7,
        (v9 & 1) == 0))
  {
    v17 = 0;
    objc_msgSend(v6, "buildPosterKitSnapshotRequestForOutput:priority:sceneAttachments:error:", 2, objc_msgSend(v6, "priority"), 0, &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17;
    v13 = v12;
    if (v12)
    {
      v10 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      -[PRUISSnapshotService cachedSnapshotForRequest:error:](self->_snapshotService, "cachedSnapshotForRequest:error:", v11, a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "snapshotBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PRUISPosterSnapshotBundle snapshotBundleWithPUIPosterSnapshotBundle:](PRUISPosterSnapshotBundle, "snapshotBundleWithPUIPosterSnapshotBundle:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[PRUISPosterSnapshotFilesystemCache latestSnapshotBundleForRequest:error:](self->_cache, "latestSnapshotBundleForRequest:error:", v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)acquireKeepActiveAssertionForReason:(id)a3
{
  id v3;
  PRUISPosterSnapshotControllerActiveAssertion *v4;

  v3 = a3;
  v4 = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:]([PRUISPosterSnapshotControllerActiveAssertion alloc], "initWithIdentifier:forReason:invalidationBlock:", CFSTR("Keep Active Assertion"), v3, &__block_literal_global);

  return v4;
}

- (PRUISPosterSnapshotCache)cache
{
  return (PRUISPosterSnapshotCache *)self->_cache;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_completionBlockQueue, 0);
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_keepActiveAssertionReasons, 0);
  objc_storeStrong((id *)&self->_activeAssertions, 0);
  objc_storeStrong((id *)&self->_snapshotService, 0);
  objc_storeStrong((id *)&self->_snapshotController, 0);
}

+ (id)sharedIncomingCallSnapshotController
{
  if (sharedIncomingCallSnapshotController___onceToken != -1)
    dispatch_once(&sharedIncomingCallSnapshotController___onceToken, &__block_literal_global_0);
  return (id)sharedIncomingCallSnapshotController___sharedSnapshotController;
}

void __92__PRUISPosterSnapshotController_IncomingCallAdditions__sharedIncomingCallSnapshotController__block_invoke()
{
  void *v0;
  PRUISPosterSnapshotController *v1;
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("DECAF000-0000-0000-0000-000000000002"));
  +[PRUISPosterSnapshotFilesystemCache incomingCallSnapshotCache](PRUISPosterSnapshotFilesystemCache, "incomingCallSnapshotCache");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = -[PRUISPosterSnapshotController initWithCache:instanceIdentifier:]([PRUISPosterSnapshotController alloc], "initWithCache:instanceIdentifier:", v0, v3);
  v2 = (void *)sharedIncomingCallSnapshotController___sharedSnapshotController;
  sharedIncomingCallSnapshotController___sharedSnapshotController = (uint64_t)v1;

}

@end
