@implementation PPBaseScoreInputSet

- (PPBaseScoreInputSet)init
{
  PPBaseScoreInputSet *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *scalarMap;
  id v7;
  void *v8;
  uint64_t v9;
  _PASLock *arrayMap;
  id v11;
  void *v12;
  uint64_t v13;
  _PASLock *objectMap;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PPBaseScoreInputSet;
  v2 = -[PPBaseScoreInputSet init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    scalarMap = v2->_scalarMap;
    v2->_scalarMap = (_PASLock *)v5;

    v7 = objc_alloc(MEMORY[0x1E0D815F0]);
    v8 = (void *)objc_opt_new();
    v9 = objc_msgSend(v7, "initWithGuardedData:", v8);
    arrayMap = v2->_arrayMap;
    v2->_arrayMap = (_PASLock *)v9;

    v11 = objc_alloc(MEMORY[0x1E0D815F0]);
    v12 = (void *)objc_opt_new();
    v13 = objc_msgSend(v11, "initWithGuardedData:", v12);
    objectMap = v2->_objectMap;
    v2->_objectMap = (_PASLock *)v13;

  }
  return v2;
}

- (unint64_t)indexForScalarScoreName:(id)a3
{
  id v4;
  _PASLock *scalarMap;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8659;
  v18 = __Block_byref_object_dispose__8660;
  v19 = 0;
  scalarMap = self->_scalarMap;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__PPBaseScoreInputSet_indexForScalarScoreName___block_invoke;
  v11[3] = &unk_1E7E19938;
  v11[4] = self;
  v13 = &v14;
  v6 = v4;
  v12 = v6;
  -[_PASLock runWithLockAcquired:](scalarMap, "runWithLockAcquired:", v11);
  v7 = (void *)v15[5];
  if (v7)
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
  else
    v8 = -[PPBaseScoreInputSet undefinedScalarScoreIndex](self, "undefinedScalarScoreIndex");
  v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (unint64_t)indexForArrayScoreName:(id)a3
{
  id v4;
  _PASLock *arrayMap;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8659;
  v18 = __Block_byref_object_dispose__8660;
  v19 = 0;
  arrayMap = self->_arrayMap;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__PPBaseScoreInputSet_indexForArrayScoreName___block_invoke;
  v11[3] = &unk_1E7E19938;
  v11[4] = self;
  v13 = &v14;
  v6 = v4;
  v12 = v6;
  -[_PASLock runWithLockAcquired:](arrayMap, "runWithLockAcquired:", v11);
  v7 = (void *)v15[5];
  if (v7)
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
  else
    v8 = -[PPBaseScoreInputSet undefinedArrayScoreIndex](self, "undefinedArrayScoreIndex");
  v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (unint64_t)indexForObjectScoreName:(id)a3
{
  id v4;
  _PASLock *objectMap;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8659;
  v18 = __Block_byref_object_dispose__8660;
  v19 = 0;
  objectMap = self->_objectMap;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__PPBaseScoreInputSet_indexForObjectScoreName___block_invoke;
  v11[3] = &unk_1E7E19938;
  v11[4] = self;
  v13 = &v14;
  v6 = v4;
  v12 = v6;
  -[_PASLock runWithLockAcquired:](objectMap, "runWithLockAcquired:", v11);
  v7 = (void *)v15[5];
  if (v7)
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
  else
    v8 = -[PPBaseScoreInputSet undefinedObjectScoreIndex](self, "undefinedObjectScoreIndex");
  v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectMap, 0);
  objc_storeStrong((id *)&self->_arrayMap, 0);
  objc_storeStrong((id *)&self->_scalarMap, 0);
}

void __47__PPBaseScoreInputSet_indexForObjectScoreName___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  if (!objc_msgSend(v13, "count"))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "objectScoreIndexUpperBound");
    v4 = objc_msgSend(*(id *)(a1 + 32), "minObjectScoreIndex");
    v5 = objc_msgSend(*(id *)(a1 + 32), "undefinedObjectScoreIndex");
    if (v4 < v3)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "nameForObjectScoreIndex:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, v7);

        ++v4;
      }
      while (v3 != v4);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "nameForObjectScoreIndex:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, v9);

  }
  objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

void __46__PPBaseScoreInputSet_indexForArrayScoreName___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  if (!objc_msgSend(v13, "count"))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "arrayScoreIndexUpperBound");
    v4 = objc_msgSend(*(id *)(a1 + 32), "minArrayScoreIndex");
    v5 = objc_msgSend(*(id *)(a1 + 32), "undefinedArrayScoreIndex");
    if (v4 < v3)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "nameForArrayScoreIndex:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, v7);

        ++v4;
      }
      while (v3 != v4);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "nameForArrayScoreIndex:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, v9);

  }
  objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

void __47__PPBaseScoreInputSet_indexForScalarScoreName___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  if (!objc_msgSend(v13, "count"))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "scalarScoreIndexUpperBound");
    v4 = objc_msgSend(*(id *)(a1 + 32), "minScalarScoreIndex");
    v5 = objc_msgSend(*(id *)(a1 + 32), "undefinedScalarScoreIndex");
    if (v4 < v3)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "nameForScalarScoreIndex:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, v7);

        ++v4;
      }
      while (v3 != v4);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "nameForScalarScoreIndex:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, v9);

  }
  objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

@end
