@implementation PXTapToRadarConcreteDiagnosticContainer

- (PXTapToRadarConcreteDiagnosticContainer)init
{
  return -[PXTapToRadarConcreteDiagnosticContainer initWithName:](self, "initWithName:", CFSTR("Untitled"));
}

- (PXTapToRadarConcreteDiagnosticContainer)initWithName:(id)a3
{
  id v4;
  PXTapToRadarConcreteDiagnosticContainer *v5;
  uint64_t v6;
  NSString *name;
  NSMutableDictionary *v8;
  NSMutableDictionary *dictionary;
  NSMutableArray *v10;
  NSMutableArray *attachments;
  NSMutableArray *v12;
  NSMutableArray *subproviders;
  NSMutableArray *v14;
  NSMutableArray *collectionOperations;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXTapToRadarConcreteDiagnosticContainer;
  v5 = -[PXTapToRadarConcreteDiagnosticContainer init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dictionary = v5->_dictionary;
    v5->_dictionary = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    attachments = v5->_attachments;
    v5->_attachments = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    subproviders = v5->_subproviders;
    v5->_subproviders = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    collectionOperations = v5->_collectionOperations;
    v5->_collectionOperations = v14;

  }
  return v5;
}

- (NSDictionary)dictionary
{
  PXTapToRadarConcreteDiagnosticContainer *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableDictionary copy](v2->_dictionary, "copy");
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  PXTapToRadarConcreteDiagnosticContainer *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_dictionary, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (NSArray)attachments
{
  PXTapToRadarConcreteDiagnosticContainer *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_attachments, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)subproviders
{
  PXTapToRadarConcreteDiagnosticContainer *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_subproviders, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  PXTapToRadarConcreteDiagnosticContainer *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_dictionary, "setObject:forKeyedSubscript:", v8, v6);
    objc_sync_exit(v7);

  }
}

- (void)addAttachment:(id)a3
{
  id v4;
  PXTapToRadarConcreteDiagnosticContainer *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableArray addObject:](v5->_attachments, "addObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)addAttachmentWithDictionary:(id)a3 name:(id)a4
{
  void *v5;
  void *v6;

  PXFeedbackTapToRadarUtilitiesWriteDictionaryToPlistFile(a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[PXTapToRadarConcreteDiagnosticContainer addAttachment:](self, "addAttachment:", v5);
    v5 = v6;
  }

}

- (void)addAttachmentWithText:(id)a3 name:(id)a4
{
  -[PXTapToRadarConcreteDiagnosticContainer addAttachmentWithText:name:extension:](self, "addAttachmentWithText:name:extension:", a3, a4, CFSTR("txt"));
}

- (void)addAttachmentWithText:(id)a3 name:(id)a4 extension:(id)a5
{
  void *v6;
  void *v7;

  PXFeedbackTapToRadarUtilitiesWriteStringToFileWithExtension(a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    -[PXTapToRadarConcreteDiagnosticContainer addAttachment:](self, "addAttachment:", v6);
    v6 = v7;
  }

}

- (void)addAttachmentWithObjectiveCCode:(id)a3 name:(id)a4
{
  -[PXTapToRadarConcreteDiagnosticContainer addAttachmentWithText:name:extension:](self, "addAttachmentWithText:name:extension:", a3, a4, CFSTR("m"));
}

- (void)addAttachmentWithSwiftCode:(id)a3 name:(id)a4
{
  -[PXTapToRadarConcreteDiagnosticContainer addAttachmentWithText:name:extension:](self, "addAttachmentWithText:name:extension:", a3, a4, CFSTR("swift"));
}

- (void)addAttachmentWithData:(id)a3 name:(id)a4
{
  void *v5;
  void *v6;

  PXFeedbackTapToRadarUtilitiesWriteDataToFile(a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[PXTapToRadarConcreteDiagnosticContainer addAttachment:](self, "addAttachment:", v5);
    v5 = v6;
  }

}

- (void)addSubprovider:(id)a3
{
  id v4;
  PXTapToRadarConcreteDiagnosticContainer *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableArray addObject:](v5->_subproviders, "addObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)addSubproviders:(id)a3
{
  id v4;
  PXTapToRadarConcreteDiagnosticContainer *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableArray addObjectsFromArray:](v5->_subproviders, "addObjectsFromArray:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (id)beginCollectionOperationWithName:(id)a3 timeout:(double)a4
{
  id v6;
  _PXTapToRadarDiagnosticCollectionOperation *v7;
  PXTapToRadarConcreteDiagnosticContainer *v8;

  v6 = a3;
  v7 = -[_PXTapToRadarDiagnosticCollectionOperation initWithName:timeout:]([_PXTapToRadarDiagnosticCollectionOperation alloc], "initWithName:timeout:", v6, a4);
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableArray addObject:](v8->_collectionOperations, "addObject:", v7);
  objc_sync_exit(v8);

  return v7;
}

- (void)finalizeWithCompletionHandler:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = v3;
  v4 = v3;
  v5 = v6;
  PXIterateAsynchronously();

}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_collectionOperations, 0);
  objc_storeStrong((id *)&self->_subproviders, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

void __73__PXTapToRadarConcreteDiagnosticContainer_finalizeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id obj;
  _QWORD block[5];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  objc_sync_exit(v3);

  v5 = dispatch_group_create();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        dispatch_group_enter(v5);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __73__PXTapToRadarConcreteDiagnosticContainer_finalizeWithCompletionHandler___block_invoke_2;
        v17[3] = &unk_1E5146AF0;
        v18 = *(id *)(a1 + 40);
        v19 = v10;
        v20 = v5;
        v11 = v10;
        objc_msgSend(v9, "installCompletionHandler:", v17);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PXTapToRadarConcreteDiagnosticContainer_finalizeWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E5148D08;
  block[4] = *(_QWORD *)(a1 + 32);
  v16 = v13;
  v12 = v13;
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], block);

}

void __73__PXTapToRadarConcreteDiagnosticContainer_finalizeWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count") == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = (void *)MEMORY[0x1E0CB35C8];
      v4 = *(_QWORD *)off_1E50B8070;
      v5 = *(_QWORD *)(a1 + 32);
      v7 = *MEMORY[0x1E0CB2F70];
      v8[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -1, v6);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v2 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __73__PXTapToRadarConcreteDiagnosticContainer_finalizeWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("unknown error for %@"), *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __73__PXTapToRadarConcreteDiagnosticContainer_finalizeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  objc_sync_exit(v2);

  v4 = *(void **)(a1 + 40);
  if (v3)
    return objc_msgSend(v4, "next");
  else
    return objc_msgSend(v4, "stop");
}

@end
