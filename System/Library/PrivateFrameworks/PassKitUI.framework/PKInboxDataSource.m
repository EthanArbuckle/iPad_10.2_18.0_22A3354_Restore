@implementation PKInboxDataSource

- (BOOL)inboxVisible
{
  PKInboxDataSource *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_inboxVisible;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)badgeCount
{
  os_unfair_lock_s *p_lock;
  unint64_t badgeCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  badgeCount = self->_badgeCount;
  os_unfair_lock_unlock(p_lock);
  return badgeCount;
}

void __41__PKInboxDataSource__updateInboxMessages__block_invoke_3(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id WeakRetained;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 60));
  if (PKEqualObjects() && PKEqualObjects())
    v2 = PKEqualObjects() ^ 1;
  else
    v2 = 1;
  v3 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;

  v6 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v6;

  v9 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count")
     || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count")
     || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") != 0;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
    v13 = 1;
  else
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") != 0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v14 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v14);
        v17 += objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "shouldBadge");
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = v17;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = v13;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = v12;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  v20 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 60));
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    v22 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "inboxDataSourceDidUpdateInboxMessages:", *(_QWORD *)(a1 + 32));

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = v20;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(v23);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j) + 16))(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v25);
  }

}

void __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "pk_objectsPassingTest:", &__block_literal_global_219);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __41__PKInboxDataSource__updateInboxMessages__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__PKInboxDataSource__updateInboxMessages__block_invoke_2;
  v12[3] = &unk_1E3E78B10;
  v8 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v16 = v6;
  v17 = v7;
  v15 = v9;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v8, "_accountUserInvitationsCompletion:", v12);

}

- (PKInboxDataSource)initWithDelegate:(id)a3
{
  id v4;
  PKInboxDataSource *v5;
  PKInboxDataSource *v6;
  uint64_t v7;
  PKPaymentService *paymentService;
  NSMutableArray *v9;
  NSMutableArray *inboxUpdateCompletionBlocks;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKInboxDataSource;
  v5 = -[PKInboxDataSource init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", v6);
    paymentService = v6->_paymentService;
    v6->_paymentService = (PKPaymentService *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    inboxUpdateCompletionBlocks = v6->_inboxUpdateCompletionBlocks;
    v6->_inboxUpdateCompletionBlocks = v9;

    v6->_lock._os_unfair_lock_opaque = 0;
    -[PKInboxDataSource _updateInboxMessages](v6, "_updateInboxMessages");
  }

  return v6;
}

- (void)_updateInboxMessages
{
  os_unfair_lock_s *p_lock;
  _BOOL4 updatingInbox;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  updatingInbox = self->_updatingInbox;
  os_unfair_lock_unlock(p_lock);
  if (!updatingInbox)
  {
    os_unfair_lock_lock(p_lock);
    self->_updatingInbox = 1;
    os_unfair_lock_unlock(p_lock);
    v5 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __41__PKInboxDataSource__updateInboxMessages__block_invoke;
    v22[3] = &unk_1E3E66A08;
    v22[4] = self;
    v10 = v7;
    v23 = v10;
    v11 = v8;
    v24 = v11;
    v12 = v6;
    v25 = v12;
    objc_msgSend(v5, "addOperation:", v22);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __41__PKInboxDataSource__updateInboxMessages__block_invoke_3;
    v18[3] = &unk_1E3E75CC8;
    v18[4] = self;
    v19 = v12;
    v20 = v11;
    v21 = v10;
    v14 = v10;
    v15 = v11;
    v16 = v12;
    v17 = (id)objc_msgSend(v5, "evaluateWithInput:completion:", v13, v18);

  }
}

- (void)_accountUserInvitationsCompletion:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[6];
  _QWORD v15[5];
  id v16;
  _QWORD v17[6];
  _QWORD v18[5];
  id v19;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__58;
  v18[4] = __Block_byref_object_dispose__58;
  v19 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke;
  v17[3] = &unk_1E3E64F70;
  v17[4] = self;
  v17[5] = v18;
  objc_msgSend(v5, "addOperation:", v17);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__58;
  v15[4] = __Block_byref_object_dispose__58;
  v16 = 0;
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_4;
  v14[3] = &unk_1E3E64F70;
  v14[4] = self;
  v14[5] = v15;
  objc_msgSend(v5, "addOperation:", v14);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_6;
  v10[3] = &unk_1E3E78B80;
  v12 = v18;
  v13 = v15;
  v8 = v4;
  v11 = v8;
  v9 = (id)objc_msgSend(v5, "evaluateWithInput:completion:", v7, v10);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v18, 8);

}

void __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_5;
  v12[3] = &unk_1E3E63688;
  v14 = v7;
  v15 = v8;
  v13 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "familyMembersWithCompletion:", v12);

}

void __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_2;
  v12[3] = &unk_1E3E6FBE8;
  v14 = v7;
  v15 = v8;
  v13 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "featureApplicationsForAccountUserInvitationWithCompletion:", v12);

}

void __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_6(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_7;
  v5[3] = &unk_1E3E78B58;
  v2 = a1[6];
  v3 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v5[1] = 3221225472;
  v5[4] = v2;
  objc_msgSend(v3, "pk_arrayByApplyingBlock:", v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[4] + 16))();

}

void __41__PKInboxDataSource__updateInboxMessages__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  id *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "isHidden");
        v10 = (id *)(a1 + 32);
        if ((v9 & 1) == 0)
        {
          if (objc_msgSend(v8, "isExpired"))
            v10 = (id *)(a1 + 40);
          else
            v10 = (id *)(a1 + 48);
        }
        objc_msgSend(*v10, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "altDSID", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v12 = objc_msgSend(v4, "copy");
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)activeInboxMessages
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_activeInboxMessages, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)expiredInboxMessages
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_expiredInboxMessages, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)inboxMessageWithIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableArray *activeInboxMessages;
  uint64_t v7;
  id v8;
  void *v9;
  NSMutableArray *hiddenInboxMessages;
  id v11;
  NSMutableArray *expiredInboxMessages;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    activeInboxMessages = self->_activeInboxMessages;
    v7 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __48__PKInboxDataSource_inboxMessageWithIdentifier___block_invoke;
    v18[3] = &unk_1E3E78AE8;
    v8 = v4;
    v19 = v8;
    -[NSMutableArray pk_firstObjectPassingTest:](activeInboxMessages, "pk_firstObjectPassingTest:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      hiddenInboxMessages = self->_hiddenInboxMessages;
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __48__PKInboxDataSource_inboxMessageWithIdentifier___block_invoke_2;
      v16[3] = &unk_1E3E78AE8;
      v11 = v8;
      v17 = v11;
      -[NSMutableArray pk_firstObjectPassingTest:](hiddenInboxMessages, "pk_firstObjectPassingTest:", v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        expiredInboxMessages = self->_expiredInboxMessages;
        v14[0] = v7;
        v14[1] = 3221225472;
        v14[2] = __48__PKInboxDataSource_inboxMessageWithIdentifier___block_invoke_3;
        v14[3] = &unk_1E3E78AE8;
        v15 = v11;
        -[NSMutableArray pk_firstObjectPassingTest:](expiredInboxMessages, "pk_firstObjectPassingTest:", v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    os_unfair_lock_unlock(p_lock);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __48__PKInboxDataSource_inboxMessageWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

uint64_t __48__PKInboxDataSource_inboxMessageWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

uint64_t __48__PKInboxDataSource_inboxMessageWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (void)updateInboxWithCompletion:(id)a3
{
  NSMutableArray *inboxUpdateCompletionBlocks;
  void *v5;
  id aBlock;

  aBlock = a3;
  os_unfair_lock_lock(&self->_lock);
  if (aBlock)
  {
    inboxUpdateCompletionBlocks = self->_inboxUpdateCompletionBlocks;
    v5 = _Block_copy(aBlock);
    -[NSMutableArray addObject:](inboxUpdateCompletionBlocks, "addObject:", v5);

  }
  os_unfair_lock_unlock(&self->_lock);
  -[PKInboxDataSource _updateInboxMessages](self, "_updateInboxMessages");

}

- (BOOL)hasInboxMessages
{
  PKInboxDataSource *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_hasInboxMessages;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

uint64_t __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  int IsTerminal;
  _BOOL4 v7;

  v2 = a2;
  v3 = objc_msgSend(v2, "applicationState");
  v4 = objc_msgSend(v2, "applicationStateReason");

  IsTerminal = PKFeatureApplicationStateIsTerminal();
  v7 = v3 == 14 && v4 == 14;
  if (v3 == 12)
    v7 = 1;
  return !IsTerminal || v7;
}

id __55__PKInboxDataSource__accountUserInvitationsCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "invitationDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originatorAltDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  +[PKInboxMessage accountUserInvitationInboxMessageWithAccountUserInvitation:familyMember:](PKInboxMessage, "accountUserInvitationInboxMessageWithAccountUserInvitation:familyMember:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inboxUpdateCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_expiredInboxMessages, 0);
  objc_storeStrong((id *)&self->_hiddenInboxMessages, 0);
  objc_storeStrong((id *)&self->_activeInboxMessages, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
