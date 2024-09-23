@implementation _UIKBRTObject

- (id)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *syncQueue;
  NSMutableArray *v7;
  NSMutableArray *owner;
  OS_dispatch_queue *v9;
  id v10;
  _QWORD block[5];

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    v5 = (OS_dispatch_queue *)dispatch_queue_create("_UIKBRTObjectQueue", 0);
    syncQueue = self->_syncQueue;
    self->_syncQueue = v5;

    v7 = (NSMutableArray *)v10;
    owner = self->_owner;
    self->_owner = v7;
LABEL_5:

    v4 = v10;
    goto LABEL_6;
  }
  if (self->_owner)
  {
    v10 = 0;
    v9 = self->_syncQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26___UIKBRTObject_setOwner___block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    owner = v9;
    dispatch_sync(&owner->super.super, block);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)previousEntry
{
  NSMutableArray *owner;
  NSObject *syncQueue;
  NSMutableArray *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__136;
  v11 = __Block_byref_object_dispose__136;
  v12 = 0;
  owner = self->_owner;
  if (owner)
  {
    syncQueue = self->_syncQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __30___UIKBRTObject_previousEntry__block_invoke;
    v6[3] = &unk_1E16BC3A0;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(syncQueue, v6);
    owner = (NSMutableArray *)v8[5];
  }
  v4 = owner;
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)nextEntry
{
  NSMutableArray *owner;
  NSObject *syncQueue;
  NSMutableArray *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__136;
  v11 = __Block_byref_object_dispose__136;
  v12 = 0;
  owner = self->_owner;
  if (owner)
  {
    syncQueue = self->_syncQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __26___UIKBRTObject_nextEntry__block_invoke;
    v6[3] = &unk_1E16BC3A0;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(syncQueue, v6);
    owner = (NSMutableArray *)v8[5];
  }
  v4 = owner;
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_owner, 0);
}

@end
