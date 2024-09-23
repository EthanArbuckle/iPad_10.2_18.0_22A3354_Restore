@implementation PLSocialGroupPayloadAdapter

- (PLSocialGroupPayloadAdapter)initWithManagedObject:(id)a3
{
  id v4;
  PLSocialGroupPayloadAdapter *v5;
  id v6;
  uint64_t v7;
  PLGraphNodeContainer *v8;
  PLGraphNodeContainer *nodeContainer;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLSocialGroupPayloadAdapter;
  v5 = -[PLJournalEntryPayloadUpdateAdapter initWithManagedObject:](&v11, sel_initWithManagedObject_, v4);
  if (v5)
  {
    v6 = v4;
    v7 = objc_msgSend(v6, "nodeContainerClass");
    if (v7)
    {
      v8 = +[PLGraphNodeContainer newNodeContainerWithNode:containerClass:](PLGraphNodeContainer, "newNodeContainerWithNode:containerClass:", v6, v7);
      nodeContainer = v5->_nodeContainer;
      v5->_nodeContainer = v8;

    }
  }

  return v5;
}

- (id)sourceObject
{
  return self->_nodeContainer;
}

- (BOOL)isValidForJournalPersistence
{
  void *v3;
  int v4;

  -[PLJournalEntryPayloadUpdateAdapter managedObject](self, "managedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "primaryLabelCode");

  return v4 == 1000
      && ((-[PLGraphNodeContainer socialGroupVerifiedType](self->_nodeContainer, "socialGroupVerifiedType")+ 1) & 0xFFFFFFFD) == 0;
}

- (id)payloadID
{
  void *v2;
  void *v3;
  void *v4;

  -[PLSocialGroupPayloadAdapter nodeContainer](self, "nodeContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  PLSocialGroupJournalEntryPayload *v9;
  id v10;
  PLSocialGroupJournalEntryPayload *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v4 = a3;
  if (-[PLSocialGroupPayloadAdapter isValidForJournalPersistence](self, "isValidForJournalPersistence"))
  {
    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      +[PLGraphNodeContainer nodeContainerKeysByChangeFlagKey](PLSocialGroup, "nodeContainerKeysByChangeFlagKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __53__PLSocialGroupPayloadAdapter_payloadForChangedKeys___block_invoke;
      v16 = &unk_1E3669798;
      v17 = v6;
      v18 = v5;
      v7 = v5;
      v8 = v6;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v13);
      v9 = [PLSocialGroupJournalEntryPayload alloc];
      if (objc_msgSend(v7, "count", v13, v14, v15, v16))
        v10 = v7;
      else
        v10 = 0;
      v11 = -[PLManagedObjectJournalEntryPayload initWithInsertAdapter:changedKeys:](v9, "initWithInsertAdapter:changedKeys:", self, v10);

    }
    else
    {
      v11 = -[PLManagedObjectJournalEntryPayload initWithInsertAdapter:changedKeys:]([PLSocialGroupJournalEntryPayload alloc], "initWithInsertAdapter:changedKeys:", self, 0);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)payloadIDForTombstone:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  return objc_msgSend(a3, "containsObject:", CFSTR("changeFlag0"));
}

- (PLGraphNodeContainer)nodeContainer
{
  return self->_nodeContainer;
}

- (void)setNodeContainer:(id)a3
{
  objc_storeStrong((id *)&self->_nodeContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeContainer, 0);
}

void __53__PLSocialGroupPayloadAdapter_payloadForChangedKeys___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  +[PLSocialGroupJournalEntryPayload modelProperties](PLSocialGroupJournalEntryPayload, "modelProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(a1 + 40), "unionSet:", v6);

    v5 = v7;
  }

}

@end
