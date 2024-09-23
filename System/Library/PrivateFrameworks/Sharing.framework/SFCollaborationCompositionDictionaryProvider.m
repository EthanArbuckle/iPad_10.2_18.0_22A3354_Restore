@implementation SFCollaborationCompositionDictionaryProvider

- (SFCollaborationCompositionDictionaryProvider)initWithItemProvider:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  SFCollaborationCompositionDictionaryProvider *v8;
  SFCollaborationItemsProvider *v9;
  void *v10;
  uint64_t v11;
  SFCollaborationItemsProvider *collaborationItemsProvider;
  DummySFCollaborationService *v13;
  DummySFCollaborationService *collaborationService;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SFCollaborationCompositionDictionaryProvider;
  v8 = -[SFCollaborationCompositionDictionaryProvider init](&v22, sel_init);
  if (v8)
  {
    v9 = [SFCollaborationItemsProvider alloc];
    v23[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SFCollaborationItemsProvider initWithActivityItems:delegate:](v9, "initWithActivityItems:delegate:", v10, v8);
    collaborationItemsProvider = v8->_collaborationItemsProvider;
    v8->_collaborationItemsProvider = (SFCollaborationItemsProvider *)v11;

    v13 = objc_alloc_init(DummySFCollaborationService);
    collaborationService = v8->_collaborationService;
    v8->_collaborationService = v13;

    objc_storeStrong((id *)&v8->_delegate, a4);
    -[SFCollaborationCompositionDictionaryProvider collaborationItemsProvider](v8, "collaborationItemsProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collaborationItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[SFCollaborationCompositionDictionaryProvider collaborationItemsProvider](v8, "collaborationItemsProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "collaborationItems");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "registerChangeObserver:", v8);

    }
  }

  return v8;
}

- (id)collaborationItemsProvider:(id)a3 resolveActivityItem:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = a4;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a4;
  objc_msgSend(v4, "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id location;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[2];

  v4 = a4;
  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((v4 & 4) != 0)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__14;
    v24 = __Block_byref_object_dispose__14;
    v25 = 0;
    +[SFCollaborationUtilities baseCollaborationDictionaryFromCollaborationItem:](SFCollaborationUtilities, "baseCollaborationDictionaryFromCollaborationItem:", v6);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "type") == 1)
    {
      location = 0;
      objc_initWeak(&location, self);
      objc_msgSend(v6, "itemProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __69__SFCollaborationCompositionDictionaryProvider_observable_didChange___block_invoke;
      v17[3] = &unk_1E48338A8;
      objc_copyWeak(&v18, &location);
      v17[4] = &v20;
      +[SFCollaborationUtilities loadCKShareItemProvider:completionHandler:](SFCollaborationUtilities, "loadCKShareItemProvider:completionHandler:", v7, v17);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else if (objc_msgSend(v6, "type") == 2)
    {
      objc_msgSend(v6, "pendingCollaboration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v21[5], "setObject:forKeyedSubscript:", v8, CFSTR("SFPendingCollaborationKey"));

      -[SFCollaborationCompositionDictionaryProvider delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dictionaryDidBecomeAvailable:forProvider:", v21[5], self);

    }
    else if (!objc_msgSend(v6, "type") && objc_msgSend(v6, "conformsToProtocol:", &unk_1EE6BAD90))
    {
      objc_msgSend(v6, "fileURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SFCollaborationUtilities fileShareDictionaryFromFileURLItems:](SFCollaborationUtilities, "fileShareDictionaryFromFileURLItems:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v21[5], "setObject:forKeyedSubscript:", v12, CFSTR("fileObjects"));

      objc_msgSend(v6, "fileURL");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v13, "fileSystemRepresentation");
      v14 = sandbox_extension_issue_file();

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v21[5], "setObject:forKeyedSubscript:", v15, CFSTR("token"));

      }
      -[SFCollaborationCompositionDictionaryProvider delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dictionaryDidBecomeAvailable:forProvider:", v21[5], self);

    }
    _Block_object_dispose(&v20, 8);

  }
}

void __69__SFCollaborationCompositionDictionaryProvider_observable_didChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  +[SFCollaborationUtilities ckShareDictionaryFromCKShare:setupInfo:](SFCollaborationUtilities, "ckShareDictionaryFromCKShare:setupInfo:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v8, CFSTR("CKShare"));
  objc_msgSend(WeakRetained, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryDidBecomeAvailable:forProvider:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), WeakRetained);

}

- (SFCollaborationItemsProvider)collaborationItemsProvider
{
  return self->_collaborationItemsProvider;
}

- (void)setCollaborationItemsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationItemsProvider, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (DummySFCollaborationService)collaborationService
{
  return self->_collaborationService;
}

- (void)setCollaborationService:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationService, a3);
}

- (SFCollaborationCompositionDictionaryProviderDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_collaborationService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_collaborationItemsProvider, 0);
}

@end
