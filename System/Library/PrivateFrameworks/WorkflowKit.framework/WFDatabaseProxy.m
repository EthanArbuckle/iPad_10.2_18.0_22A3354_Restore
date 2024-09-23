@implementation WFDatabaseProxy

- (WFDatabaseProxy)init
{
  WFDatabaseProxy *v2;
  WFDatabaseProxy *v3;
  WFDatabaseProxy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFDatabaseProxy;
  v2 = -[WFDatabaseProxy init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)database
{
  return +[WFDatabase defaultDatabase](WFDatabase, "defaultDatabase");
}

- (id)databaseProxyHostConnection
{
  void *v3;
  NSXPCConnection *v4;
  os_unfair_lock_s *p_lock;
  NSXPCConnection **p_lock_databaseProxyHostConnection;
  NSXPCConnection *lock_databaseProxyHostConnection;
  id v8;
  void *v9;

  -[WFDatabaseProxy database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    lock_databaseProxyHostConnection = self->_lock_databaseProxyHostConnection;
    p_lock_databaseProxyHostConnection = &self->_lock_databaseProxyHostConnection;
    v4 = lock_databaseProxyHostConnection;
    if (!v4)
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3B38]);
      v4 = (NSXPCConnection *)objc_msgSend(v8, "initWithMachServiceName:options:", *MEMORY[0x1E0DC8050], 0);
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF79F180);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      WFDatabaseProxyConfigureXPCInterface(v9);
      -[NSXPCConnection setRemoteObjectInterface:](v4, "setRemoteObjectInterface:", v9);
      -[NSXPCConnection resume](v4, "resume");
      objc_storeStrong((id *)p_lock_databaseProxyHostConnection, v4);

    }
    os_unfair_lock_unlock(p_lock);
  }
  return v4;
}

- (id)referenceForWorkflowID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__48558;
    v15 = __Block_byref_object_dispose__48559;
    v16 = 0;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_237);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__WFDatabaseProxy_referenceForWorkflowID___block_invoke_2;
    v10[3] = &unk_1E7AF5230;
    v10[4] = &v11;
    objc_msgSend(v6, "getReferenceForWorkflowID:completion:", v4, v10);

    v7 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "referenceForWorkflowID:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)uniqueVisibleReferenceForWorkflowName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__48558;
    v15 = __Block_byref_object_dispose__48559;
    v16 = 0;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_239);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__WFDatabaseProxy_uniqueVisibleReferenceForWorkflowName___block_invoke_2;
    v10[3] = &unk_1E7AF5230;
    v10[4] = &v11;
    objc_msgSend(v6, "getUniqueVisibleReferenceForWorkflowName:completion:", v4, v10);

    v7 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueVisibleReferenceForWorkflowName:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)workflowRecordForDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__48558;
    v28 = __Block_byref_object_dispose__48559;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__48558;
    v22 = __Block_byref_object_dispose__48559;
    v8 = MEMORY[0x1E0C809B0];
    v23 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__WFDatabaseProxy_workflowRecordForDescriptor_error___block_invoke;
    v17[3] = &unk_1E7AF5278;
    v17[4] = &v18;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __53__WFDatabaseProxy_workflowRecordForDescriptor_error___block_invoke_2;
    v13[3] = &unk_1E7AF52A0;
    v14 = v6;
    v15 = &v24;
    v16 = &v18;
    objc_msgSend(v9, "getWorkflowRecordDataForDescriptor:completion:", v14, v13);

    if (a4)
      *a4 = objc_retainAutorelease((id)v19[5]);
    v10 = (id)v25[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);

  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordWithDescriptor:error:", v6, a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)sortedVisibleWorkflowsByNameWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__48558;
    v24 = __Block_byref_object_dispose__48559;
    v25 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__48558;
    v18 = __Block_byref_object_dispose__48559;
    v6 = MEMORY[0x1E0C809B0];
    v19 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__WFDatabaseProxy_sortedVisibleWorkflowsByNameWithError___block_invoke;
    v13[3] = &unk_1E7AF5278;
    v13[4] = &v14;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __57__WFDatabaseProxy_sortedVisibleWorkflowsByNameWithError___block_invoke_2;
    v12[3] = &unk_1E7AF52C8;
    v12[4] = &v20;
    v12[5] = &v14;
    objc_msgSend(v7, "getSortedVisibleWorkflowsByNameWithCompletion:", v12);

    if (a3)
      *a3 = objc_retainAutorelease((id)v15[5]);
    v8 = (id)v21[5];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedVisibleWorkflowsByName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      objc_msgSend(v10, "fetchError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "descriptors");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)sortedVisibleWorkflowsInCollection:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__48558;
    v26 = __Block_byref_object_dispose__48559;
    v27 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__48558;
    v20 = __Block_byref_object_dispose__48559;
    v8 = MEMORY[0x1E0C809B0];
    v21 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__WFDatabaseProxy_sortedVisibleWorkflowsInCollection_error___block_invoke;
    v15[3] = &unk_1E7AF5278;
    v15[4] = &v16;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __60__WFDatabaseProxy_sortedVisibleWorkflowsInCollection_error___block_invoke_2;
    v14[3] = &unk_1E7AF52C8;
    v14[4] = &v22;
    v14[5] = &v16;
    objc_msgSend(v9, "getSortedVisibleWorkflowsInCollection:completion:", v6, v14);

    if (a4)
      *a4 = objc_retainAutorelease((id)v17[5]);
    v10 = (id)v23[5];
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedVisibleWorkflowsInCollection:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      objc_msgSend(v12, "fetchError");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "descriptors");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)sortedWorkflowsWithQuery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__48558;
    v26 = __Block_byref_object_dispose__48559;
    v27 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__48558;
    v20 = __Block_byref_object_dispose__48559;
    v8 = MEMORY[0x1E0C809B0];
    v21 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__WFDatabaseProxy_sortedWorkflowsWithQuery_error___block_invoke;
    v15[3] = &unk_1E7AF5278;
    v15[4] = &v16;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __50__WFDatabaseProxy_sortedWorkflowsWithQuery_error___block_invoke_2;
    v14[3] = &unk_1E7AF52C8;
    v14[4] = &v22;
    v14[5] = &v16;
    objc_msgSend(v9, "getSortedWorkflowsWithQuery:completion:", v6, v14);

    if (a4)
      *a4 = objc_retainAutorelease((id)v17[5]);
    v10 = (id)v23[5];
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedWorkflowsWithQuery:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      objc_msgSend(v12, "fetchError");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "descriptors");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)sortedVisibleFoldersWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__48558;
    v24 = __Block_byref_object_dispose__48559;
    v25 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__48558;
    v18 = __Block_byref_object_dispose__48559;
    v6 = MEMORY[0x1E0C809B0];
    v19 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__WFDatabaseProxy_sortedVisibleFoldersWithError___block_invoke;
    v13[3] = &unk_1E7AF5278;
    v13[4] = &v14;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __49__WFDatabaseProxy_sortedVisibleFoldersWithError___block_invoke_2;
    v12[3] = &unk_1E7AF52C8;
    v12[4] = &v20;
    v12[5] = &v14;
    objc_msgSend(v7, "getSortedVisibleFoldersWithCompletion:", v12);

    if (a3)
      *a3 = objc_retainAutorelease((id)v15[5]);
    v8 = (id)v21[5];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedVisibleFolders");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      objc_msgSend(v10, "fetchError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "descriptors");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)collectionWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__48558;
    v25 = __Block_byref_object_dispose__48559;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__48558;
    v19 = __Block_byref_object_dispose__48559;
    v8 = MEMORY[0x1E0C809B0];
    v20 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__WFDatabaseProxy_collectionWithIdentifier_error___block_invoke;
    v14[3] = &unk_1E7AF5278;
    v14[4] = &v15;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __50__WFDatabaseProxy_collectionWithIdentifier_error___block_invoke_2;
    v13[3] = &unk_1E7AF52F0;
    v13[4] = &v21;
    v13[5] = &v15;
    objc_msgSend(v9, "getCollectionWithIdentifier:completion:", v6, v13);

    if (a4)
      *a4 = objc_retainAutorelease((id)v16[5]);
    v10 = (id)v22[5];
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionWithIdentifier:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)folderForWorkflowReference:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__48558;
    v25 = __Block_byref_object_dispose__48559;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__48558;
    v19 = __Block_byref_object_dispose__48559;
    v8 = MEMORY[0x1E0C809B0];
    v20 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__WFDatabaseProxy_folderForWorkflowReference_error___block_invoke;
    v14[3] = &unk_1E7AF5278;
    v14[4] = &v15;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __52__WFDatabaseProxy_folderForWorkflowReference_error___block_invoke_2;
    v13[3] = &unk_1E7AF52F0;
    v13[4] = &v21;
    v13[5] = &v15;
    objc_msgSend(v9, "getFolderForWorkflowReference:completion:", v6, v13);

    if (a4)
      *a4 = objc_retainAutorelease((id)v16[5]);
    v10 = (id)v22[5];
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "folderForWorkflowReference:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)configuredTriggersForWorkflowID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__48558;
    v26 = __Block_byref_object_dispose__48559;
    v27 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__48558;
    v20 = __Block_byref_object_dispose__48559;
    v8 = MEMORY[0x1E0C809B0];
    v21 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__WFDatabaseProxy_configuredTriggersForWorkflowID_error___block_invoke;
    v15[3] = &unk_1E7AF5278;
    v15[4] = &v16;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __57__WFDatabaseProxy_configuredTriggersForWorkflowID_error___block_invoke_2;
    v14[3] = &unk_1E7AF52C8;
    v14[4] = &v22;
    v14[5] = &v16;
    objc_msgSend(v9, "getConfiguredTriggersForWorkflowID:completion:", v6, v14);

    if (a4)
      *a4 = objc_retainAutorelease((id)v17[5]);
    v10 = (id)v23[5];
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuredTriggersForWorkflowID:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "descriptors");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)createWorkflowWithWorkflowRecord:(id)a3 nameCollisionBehavior:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  WFWorkflowCreationOptions *v17;
  void *v18;
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  id obj;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__48558;
    v33 = __Block_byref_object_dispose__48559;
    v34 = 0;
    objc_msgSend(v8, "fileRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id *)(v30 + 5);
    obj = (id)v30[5];
    objc_msgSend(v10, "fileDataWithError:", &obj);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v11, obj);

    if (v12)
    {
      v22 = 0;
      v23 = &v22;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__48558;
      v26 = __Block_byref_object_dispose__48559;
      v27 = 0;
      v13 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __80__WFDatabaseProxy_createWorkflowWithWorkflowRecord_nameCollisionBehavior_error___block_invoke;
      v21[3] = &unk_1E7AF5278;
      v21[4] = &v29;
      -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = __80__WFDatabaseProxy_createWorkflowWithWorkflowRecord_nameCollisionBehavior_error___block_invoke_2;
      v20[3] = &unk_1E7AF5318;
      v20[4] = &v22;
      v20[5] = &v29;
      objc_msgSend(v14, "createWorkflowWithWorkflowData:name:nameCollisionBehavior:completion:", v12, v15, a4, v20);

      if (a5)
        *a5 = objc_retainAutorelease((id)v30[5]);
      v16 = (id)v23[5];
      _Block_object_dispose(&v22, 8);

    }
    else
    {
      v16 = 0;
    }

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v17 = -[WFWorkflowCreationOptions initWithRecord:]([WFWorkflowCreationOptions alloc], "initWithRecord:", v8);
    -[WFDatabaseProxy database](self, "database");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "createWorkflowWithOptions:nameCollisionBehavior:error:", v17, a4, a5);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (BOOL)isReference:(id)a3 allowedToRunOnDomain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__48558;
    v18 = __Block_byref_object_dispose__48559;
    v19 = 0;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_246_48568);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__WFDatabaseProxy_isReference_allowedToRunOnDomain___block_invoke_2;
    v13[3] = &unk_1E7AF5360;
    v13[4] = &v14;
    objc_msgSend(v9, "getIsReference:allowedToRunOnDomain:completion:", v6, v7, v13);

    v10 = objc_msgSend((id)v15[5], "BOOLValue");
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "isReference:allowedToRunOnDomain:", v6, v7);

  }
  return v10;
}

- (void)setTrustedToRunScripts:(BOOL)a3 forReference:(id)a4 onDomain:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_248);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTrustedToRunScripts:forReference:onDomain:completion:", v6, v9, v8, &__block_literal_global_249);
  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTrustedToRunScripts:forReference:onDomain:", v6, v9, v8);
  }

}

- (void)updateAppDescriptor:(id)a3 atKey:(id)a4 actionUUID:(id)a5 actionIndex:(id)a6 actionIdentifier:(id)a7 workflowID:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  id v26;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__48558;
    v25[4] = __Block_byref_object_dispose__48559;
    v26 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __102__WFDatabaseProxy_updateAppDescriptor_atKey_actionUUID_actionIndex_actionIdentifier_workflowID_error___block_invoke;
    v24[3] = &unk_1E7AF5278;
    v24[4] = v25;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateAppDescriptor:atKey:actionUUID:actionIndex:actionIdentifier:workflowID:", v15, v16, v17, v18, v19, v20);

    _Block_object_dispose(v25, 8);
  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateAppDescriptor:atKey:actionUUID:actionIndex:actionIdentifier:workflowID:", v15, v16, v17, v18, v19, v20);

  }
}

- (void)quarantineWorkflowWithReference:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_250_48566);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "quarantineWorkflowWithReference:", v9);
  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    objc_msgSend(v6, "recordWithDescriptor:properties:error:", v9, v7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "setRemoteQuarantineStatus:", 1);
      -[WFDatabaseProxy database](self, "database");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "saveRecord:withDescriptor:error:", v5, v9, 0);

    }
  }

}

- (void)storeQuarantineHashForWorkflowWithReference:(id)a3 quarantineHash:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_251);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storeQuarantineHashForWorkflowWithReference:quarantineHash:", v12, v6);
  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    objc_msgSend(v9, "recordWithDescriptor:properties:error:", v12, v10, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "setRemoteQuarantineHash:", v6);
      -[WFDatabaseProxy database](self, "database");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "saveRecord:withDescriptor:error:", v8, v12, 0);

    }
  }

}

- (id)logRunOfWorkflow:(id)a3 withSource:(id)a4 triggerID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__48558;
    v21 = __Block_byref_object_dispose__48559;
    v22 = 0;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_252);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__WFDatabaseProxy_logRunOfWorkflow_withSource_triggerID___block_invoke_2;
    v16[3] = &unk_1E7AF5428;
    v16[4] = &v17;
    objc_msgSend(v12, "logRunOfWorkflow:withSource:triggerID:completion:", v8, v9, v10, v16);

    v13 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logRunOfWorkflow:withSource:triggerID:", v8, v9, v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (void)setOutcome:(int64_t)a3 forRunEvent:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, &__block_literal_global_254);
  else
    -[WFDatabaseProxy database](self, "database");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOutcome:forRunEvent:", a3, v6);

}

- (id)serializedParametersForAppEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__48558;
    v25 = __Block_byref_object_dispose__48559;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__48558;
    v19 = __Block_byref_object_dispose__48559;
    v8 = MEMORY[0x1E0C809B0];
    v20 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__WFDatabaseProxy_serializedParametersForAppEntityIdentifier_error___block_invoke;
    v14[3] = &unk_1E7AF5278;
    v14[4] = &v21;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __68__WFDatabaseProxy_serializedParametersForAppEntityIdentifier_error___block_invoke_2;
    v13[3] = &unk_1E7AF5470;
    v13[4] = &v21;
    v13[5] = &v15;
    objc_msgSend(v9, "serializedParametersForAppEntityIdentifier:completion:", v6, v13);

    if (a4)
      *a4 = objc_retainAutorelease((id)v22[5]);
    v10 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serializedParametersForIdentifier:error:", v6, a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)approvalResultForContentAttributionSet:(id)a3 contentDestination:(id)a4 actionUUID:(id)a5 actionIdentifier:(id)a6 actionIndex:(unint64_t)a7 reference:(id)a8 allowedOnceStates:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v29[6];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__48558;
    v41 = __Block_byref_object_dispose__48559;
    v42 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__48558;
    v35 = __Block_byref_object_dispose__48559;
    v23 = MEMORY[0x1E0C809B0];
    v36 = 0;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __151__WFDatabaseProxy_approvalResultForContentAttributionSet_contentDestination_actionUUID_actionIdentifier_actionIndex_reference_allowedOnceStates_error___block_invoke;
    v30[3] = &unk_1E7AF5278;
    v30[4] = &v31;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __151__WFDatabaseProxy_approvalResultForContentAttributionSet_contentDestination_actionUUID_actionIdentifier_actionIndex_reference_allowedOnceStates_error___block_invoke_2;
    v29[3] = &unk_1E7AF5498;
    v29[4] = &v37;
    v29[5] = &v31;
    objc_msgSend(v24, "approvalResultForContentAttributionSet:contentDestination:actionUUID:actionIdentifier:actionIndex:reference:allowedOnceStates:completion:", v16, v17, v18, v19, a7, v20, v21, v29);

    v25 = (void *)v32[5];
    if (v25)
      *a10 = objc_retainAutorelease(v25);
    v26 = (id)v38[5];
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "approvalResultForContentAttributionSet:contentDestination:actionUUID:actionIdentifier:actionIndex:reference:allowedOnceStates:", v16, v17, v18, v19, a7, v20, v21);
    v26 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v26;
}

- (id)currentDeletionAuthorizationStatusWithContentItemClassName:(id)a3 actionUUID:(id)a4 actionIdentifier:(id)a5 actionIndex:(unint64_t)a6 count:(unint64_t)a7 reference:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__48558;
    v38 = __Block_byref_object_dispose__48559;
    v39 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__48558;
    v32 = __Block_byref_object_dispose__48559;
    v20 = MEMORY[0x1E0C809B0];
    v33 = 0;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __140__WFDatabaseProxy_currentDeletionAuthorizationStatusWithContentItemClassName_actionUUID_actionIdentifier_actionIndex_count_reference_error___block_invoke;
    v27[3] = &unk_1E7AF5278;
    v27[4] = &v28;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v20;
    v26[1] = 3221225472;
    v26[2] = __140__WFDatabaseProxy_currentDeletionAuthorizationStatusWithContentItemClassName_actionUUID_actionIdentifier_actionIndex_count_reference_error___block_invoke_2;
    v26[3] = &unk_1E7AF54C0;
    v26[4] = &v34;
    v26[5] = &v28;
    objc_msgSend(v21, "currentDeletionAuthorizationStatusWithContentItemClassName:actionUUID:actionIdentifier:actionIndex:count:reference:completion:", v15, v16, v17, a6, a7, v18, v26);

    v22 = (void *)v29[5];
    if (v22)
      *a9 = objc_retainAutorelease(v22);
    v23 = (id)v35[5];
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "currentDeletionAuthorizationStatusWithContentItemClassName:actionUUID:actionIdentifier:actionIndex:count:reference:", v15, v16, v17, a6, a7, v18);
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v23;
}

- (BOOL)saveSmartPromptStateData:(id)a3 actionUUID:(id)a4 reference:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__48558;
    v26 = __Block_byref_object_dispose__48559;
    v14 = MEMORY[0x1E0C809B0];
    v27 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__WFDatabaseProxy_saveSmartPromptStateData_actionUUID_reference_error___block_invoke;
    v21[3] = &unk_1E7AF5278;
    v21[4] = &v22;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __71__WFDatabaseProxy_saveSmartPromptStateData_actionUUID_reference_error___block_invoke_2;
    v20[3] = &unk_1E7AF54E8;
    v20[4] = &v28;
    v20[5] = &v22;
    objc_msgSend(v15, "saveSmartPromptStateData:actionUUID:reference:completion:", v10, v11, v12, v20);

    v16 = (void *)v23[5];
    if (v16)
      *a6 = objc_retainAutorelease(v16);
    v17 = *((_BYTE *)v29 + 24) != 0;
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v18, "saveSmartPromptStateData:actionUUID:reference:error:", v10, v11, v12, a6);

  }
  return v17;
}

- (void)saveOutputActionSmartPromtDataForWorkflowReference:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  -[WFDatabaseProxy databaseProxyHostConnection](self, "databaseProxyHostConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__48558;
    v18 = __Block_byref_object_dispose__48559;
    v8 = MEMORY[0x1E0C809B0];
    v19 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__WFDatabaseProxy_saveOutputActionSmartPromtDataForWorkflowReference_error___block_invoke;
    v13[3] = &unk_1E7AF5278;
    v13[4] = &v14;
    -[WFDatabaseProxy hostProxyWithErrorHandler:](self, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __76__WFDatabaseProxy_saveOutputActionSmartPromtDataForWorkflowReference_error___block_invoke_2;
    v12[3] = &unk_1E7AF5278;
    v12[4] = &v14;
    objc_msgSend(v9, "saveOutputActionSmartPromtDataForWorkflowReference:completion:", v6, v12);

    v10 = (void *)v15[5];
    if (v10)
      *a4 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    -[WFDatabaseProxy database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "saveOutputActionSmartPromtDataForWorkflowReference:error:", v6, a4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_databaseProxyHostConnection, 0);
}

void __76__WFDatabaseProxy_saveOutputActionSmartPromtDataForWorkflowReference_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)hostProxyWithErrorHandler:(id)a1
{
  id v2;
  id v3;
  void *v4;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v2, "databaseProxyHostConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

void __76__WFDatabaseProxy_saveOutputActionSmartPromtDataForWorkflowReference_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __71__WFDatabaseProxy_saveSmartPromptStateData_actionUUID_reference_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __71__WFDatabaseProxy_saveSmartPromptStateData_actionUUID_reference_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __140__WFDatabaseProxy_currentDeletionAuthorizationStatusWithContentItemClassName_actionUUID_actionIdentifier_actionIndex_count_reference_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __140__WFDatabaseProxy_currentDeletionAuthorizationStatusWithContentItemClassName_actionUUID_actionIdentifier_actionIndex_count_reference_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __151__WFDatabaseProxy_approvalResultForContentAttributionSet_contentDestination_actionUUID_actionIdentifier_actionIndex_reference_allowedOnceStates_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __151__WFDatabaseProxy_approvalResultForContentAttributionSet_contentDestination_actionUUID_actionIdentifier_actionIndex_reference_allowedOnceStates_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __68__WFDatabaseProxy_serializedParametersForAppEntityIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __68__WFDatabaseProxy_serializedParametersForAppEntityIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __57__WFDatabaseProxy_logRunOfWorkflow_withSource_triggerID___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __102__WFDatabaseProxy_updateAppDescriptor_atKey_actionUUID_actionIndex_actionIdentifier_workflowID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __64__WFDatabaseProxy_setTrustedToRunScripts_forReference_onDomain___block_invoke_2()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  getWFDatabaseLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = 136315138;
    v2 = "-[WFDatabaseProxy setTrustedToRunScripts:forReference:onDomain:]_block_invoke_2";
    _os_log_impl(&dword_1C15B3000, v0, OS_LOG_TYPE_ERROR, "%s Cannot set trust value for workflow reference due to insufficient database access", (uint8_t *)&v1, 0xCu);
  }

}

void __52__WFDatabaseProxy_isReference_allowedToRunOnDomain___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __80__WFDatabaseProxy_createWorkflowWithWorkflowRecord_nameCollisionBehavior_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __80__WFDatabaseProxy_createWorkflowWithWorkflowRecord_nameCollisionBehavior_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __57__WFDatabaseProxy_configuredTriggersForWorkflowID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __57__WFDatabaseProxy_configuredTriggersForWorkflowID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __52__WFDatabaseProxy_folderForWorkflowReference_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52__WFDatabaseProxy_folderForWorkflowReference_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __50__WFDatabaseProxy_collectionWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__WFDatabaseProxy_collectionWithIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __49__WFDatabaseProxy_sortedVisibleFoldersWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __49__WFDatabaseProxy_sortedVisibleFoldersWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __50__WFDatabaseProxy_sortedWorkflowsWithQuery_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__WFDatabaseProxy_sortedWorkflowsWithQuery_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __60__WFDatabaseProxy_sortedVisibleWorkflowsInCollection_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__WFDatabaseProxy_sortedVisibleWorkflowsInCollection_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __57__WFDatabaseProxy_sortedVisibleWorkflowsByNameWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __57__WFDatabaseProxy_sortedVisibleWorkflowsByNameWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __53__WFDatabaseProxy_workflowRecordForDescriptor_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __53__WFDatabaseProxy_workflowRecordForDescriptor_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  WFWorkflowFile *v7;
  void *v8;
  WFWorkflowFile *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = [WFWorkflowFile alloc];
    objc_msgSend(*(id *)(a1 + 32), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v9 = -[WFWorkflowFile initWithFileData:name:error:](v7, "initWithFileData:name:error:", v5, v8, &v23);
    v10 = v23;

    if (v9)
    {
      v22 = v10;
      -[WFWorkflowFile recordRepresentationWithError:](v9, "recordRepresentationWithError:", &v22);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v22;

      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v11;

      v10 = v12;
    }
    v15 = *(id *)(a1 + 32);
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setHiddenFromLibraryAndSync:", objc_msgSend(v15, "hiddenFromLibraryAndSync"));
        objc_msgSend(v15, "actionsDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setActionsDescription:", v16);

        objc_msgSend(v15, "subtitle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setWorkflowSubtitle:", v17);

        objc_msgSend(v15, "associatedAppBundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAssociatedAppBundleIdentifier:", v18);
      }
      else
      {
        v18 = v15;
        v15 = 0;
      }
    }
    else
    {
      v18 = 0;
    }

    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v10;
    v21 = v10;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }

}

void __57__WFDatabaseProxy_uniqueVisibleReferenceForWorkflowName___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __42__WFDatabaseProxy_referenceForWorkflowID___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (WFDatabaseProxy)defaultDatabase
{
  if (defaultDatabase_onceToken != -1)
    dispatch_once(&defaultDatabase_onceToken, &__block_literal_global_48660);
  return (WFDatabaseProxy *)(id)defaultDatabase_proxy;
}

void __34__WFDatabaseProxy_defaultDatabase__block_invoke()
{
  WFDatabaseProxy *v0;
  void *v1;

  v0 = objc_alloc_init(WFDatabaseProxy);
  v1 = (void *)defaultDatabase_proxy;
  defaultDatabase_proxy = (uint64_t)v0;

}

@end
