@implementation PKAsyncCacheRetrievalInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryBlocks, 0);
  objc_storeStrong(&self->_item, 0);
}

- (id)synchronouslyRetrieve:(id)a3 outDeliveryBlocks:(id *)a4
{
  void (**v6)(id, _QWORD *);
  void *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  id *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = (void (**)(id, _QWORD *))a3;
  v12 = 0;
  v13 = (id *)&v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  os_unfair_lock_lock(&self->_lock);
  if (self->_itemFetched)
  {
    objc_storeStrong(v13 + 5, self->_item);
    if (!a4)
      goto LABEL_10;
    goto LABEL_7;
  }
  if (v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__PKAsyncCacheRetrievalInfo_synchronouslyRetrieve_outDeliveryBlocks___block_invoke;
    v11[3] = &unk_1E2AC3BA8;
    v11[4] = &v12;
    v6[2](v6, v11);
  }
  objc_storeStrong(&self->_item, v13[5]);
  self->_itemFetched = 1;
  if (a4)
  {
LABEL_7:
    v7 = (void *)-[NSMutableArray count](self->_deliveryBlocks, "count");
    if (v7)
      v7 = (void *)-[NSMutableArray copy](self->_deliveryBlocks, "copy");
    v8 = *a4;
    *a4 = v7;

    -[NSMutableArray removeAllObjects](self->_deliveryBlocks, "removeAllObjects");
  }
LABEL_10:
  os_unfair_lock_unlock(&self->_lock);
  v9 = v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (PKAsyncCacheRetrievalInfo)init
{
  PKAsyncCacheRetrievalInfo *v2;
  PKAsyncCacheRetrievalInfo *v3;
  NSMutableArray *v4;
  NSMutableArray *deliveryBlocks;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKAsyncCacheRetrievalInfo;
  v2 = -[PKAsyncCacheRetrievalInfo init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deliveryBlocks = v3->_deliveryBlocks;
    v3->_deliveryBlocks = v4;

  }
  return v3;
}

void __69__PKAsyncCacheRetrievalInfo_synchronouslyRetrieve_outDeliveryBlocks___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)addDeliveryBlock:(id)a3
{
  void (**v4)(id, id);
  os_unfair_lock_s *p_lock;
  id v6;
  NSMutableArray *deliveryBlocks;
  void *v8;
  void *v9;
  void (**v10)(id, id);

  v4 = (void (**)(id, id))a3;
  if (v4)
  {
    v10 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_itemFetched)
    {
      v6 = self->_item;
      os_unfair_lock_unlock(p_lock);
      v10[2](v10, v6);

    }
    else
    {
      deliveryBlocks = self->_deliveryBlocks;
      v8 = (void *)objc_msgSend(v10, "copy");
      v9 = _Block_copy(v8);
      -[NSMutableArray addObject:](deliveryBlocks, "addObject:", v9);

      os_unfair_lock_unlock(p_lock);
    }
    v4 = v10;
  }

}

- (void)deliverItem:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong(&self->_item, a3);
  self->_itemFetched = 1;
  if (-[NSMutableArray count](self->_deliveryBlocks, "count"))
    v6 = (void *)-[NSMutableArray copy](self->_deliveryBlocks, "copy");
  else
    v6 = 0;
  -[NSMutableArray removeAllObjects](self->_deliveryBlocks, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

@end
