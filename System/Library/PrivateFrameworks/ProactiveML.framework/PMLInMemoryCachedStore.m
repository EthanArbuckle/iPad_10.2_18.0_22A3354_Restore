@implementation PMLInMemoryCachedStore

- (PMLInMemoryCachedStore)initWithSessionBatch:(id)a3
{
  id v5;
  PMLInMemoryCachedStore *v6;
  PMLInMemoryCachedStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLInMemoryCachedStore;
  v6 = -[PMLTrainingStore initWithPath:](&v9, sel_initWithPath_, &stru_24D3DC000);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cachedSessions, a3);

  return v7;
}

- (void)loadSessionsForModel:(id)a3 excludeItemIdsUsedWithin:(double)a4 limit:(unint64_t)a5 onlyAppleInternal:(BOOL)a6 positiveLabel:(unint64_t)a7 skew:(double)a8 block:(id)a9
{
  char v9;

  v9 = 0;
  (*((void (**)(id, PMLTrainingStoredSessionBatch *, char *, unint64_t, BOOL, unint64_t, double, double))a9
   + 2))(a9, self->_cachedSessions, &v9, a5, a6, a7, a4, a8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSessions, 0);
}

+ (id)cachedStoreFromRealStore:(id)a3 sessionDescriptor:(id)a4 sessionsLimit:(unint64_t)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v9 = a3;
  v10 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __83__PMLInMemoryCachedStore_cachedStoreFromRealStore_sessionDescriptor_sessionsLimit___block_invoke;
  v15[3] = &unk_24D3DAD18;
  v15[4] = &v16;
  objc_msgSend(v9, "loadSessionsForModel:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:", v10, a5, 0, 1, v15, 0.0, 0.0);
  if (!objc_msgSend((id)v17[5], "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PMLPlanSimulator.m"), 44, CFSTR("Couldn't load sessions for %@"), v10);

  }
  v11 = objc_alloc((Class)a1);
  v12 = (void *)objc_msgSend(v11, "initWithSessionBatch:", v17[5]);
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __83__PMLInMemoryCachedStore_cachedStoreFromRealStore_sessionDescriptor_sessionsLimit___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

@end
