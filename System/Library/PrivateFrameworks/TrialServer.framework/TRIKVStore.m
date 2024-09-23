@implementation TRIKVStore

- (TRIKVStore)initWithDatabase:(id)a3
{
  id v6;
  TRIKVStore *v7;
  TRIKVStore *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIKVStore.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TRIKVStore;
  v7 = -[TRIKVStore init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_db, a3);

  return v8;
}

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase readTransactionWithFailableBlock:](self->_db, "readTransactionWithFailableBlock:", a3);
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase writeTransactionWithFailableBlock:](self->_db, "writeTransactionWithFailableBlock:", a3);
}

- (void)setBlob:(id)a3 forKey:(id)a4 usingTransaction:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIKVStore.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("blob"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIKVStore.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

LABEL_3:
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __46__TRIKVStore_setBlob_forKey_usingTransaction___block_invoke;
  v18[3] = &unk_1E9334E78;
  v19 = v10;
  v20 = v9;
  v12 = v9;
  v13 = v10;
  v14 = MEMORY[0x1D8232C48](v18);
  v15 = (void *)v14;
  if (v11)
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v11);
  else
    -[TRIKVStore writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v14);

}

uint64_t __46__TRIKVStore_setBlob_forKey_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__TRIKVStore_setBlob_forKey_usingTransaction___block_invoke_2;
  v6[3] = &unk_1E932FCA8;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT OR REPLACE INTO kvstore(    key, bytes) VALUES(    :key, :bytes);"),
    v6,
    0,
    0);

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  return *v4;
}

void __46__TRIKVStore_setBlob_forKey_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":key", v3);
  objc_msgSend(v4, "bindNamedParam:toNSData:", ":bytes", *(_QWORD *)(a1 + 40));

}

- (id)blobForKey:(id)a3 usingTransaction:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  TRIKVStore *v17;
  uint64_t *v18;
  SEL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIKVStore.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__37;
  v24 = __Block_byref_object_dispose__37;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__TRIKVStore_blobForKey_usingTransaction___block_invoke;
  v15[3] = &unk_1E9334EC8;
  v9 = v7;
  v18 = &v20;
  v19 = a2;
  v16 = v9;
  v17 = self;
  v10 = MEMORY[0x1D8232C48](v15);
  v11 = (void *)v10;
  if (v8)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);
  else
    -[TRIKVStore readTransactionWithFailableBlock:](self, "readTransactionWithFailableBlock:", v10);
  v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v12;
}

uint64_t __42__TRIKVStore_blobForKey_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  unsigned __int8 *v5;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__TRIKVStore_blobForKey_usingTransaction___block_invoke_2;
  v10[3] = &unk_1E932F1F0;
  v11 = *(id *)(a1 + 32);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __42__TRIKVStore_blobForKey_usingTransaction___block_invoke_3;
  v7[3] = &unk_1E9334EA0;
  v9 = *(_QWORD *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT bytes FROM     kvstore WHERE     key = :key;"),
    v10,
    v7,
    0);

  v5 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  return *v5;
}

uint64_t __42__TRIKVStore_blobForKey_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":key", *(_QWORD *)(a1 + 32));
}

uint64_t __42__TRIKVStore_blobForKey_usingTransaction___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v7;

  objc_msgSend(a2, "getNSDataForColumnName:table:", "bytes", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIKVStore.m"), 87, CFSTR("NULL bytes read for NOT NULL column"));

  }
  return *MEMORY[0x1E0D81788];
}

- (void)removeBlobForKey:(id)a3 usingTransaction:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIKVStore.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__TRIKVStore_removeBlobForKey_usingTransaction___block_invoke;
  v13[3] = &unk_1E9334EF0;
  v14 = v7;
  v9 = v7;
  v10 = MEMORY[0x1D8232C48](v13);
  v11 = (void *)v10;
  if (v8)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);
  else
    -[TRIKVStore writeTransactionWithFailableBlock:](self, "writeTransactionWithFailableBlock:", v10);

}

uint64_t __48__TRIKVStore_removeBlobForKey_usingTransaction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__TRIKVStore_removeBlobForKey_usingTransaction___block_invoke_2;
  v6[3] = &unk_1E932F1F0;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" DELETE FROM     kvstore WHERE     key = :key;"),
    v6,
    0,
    0);

  v4 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  return *v4;
}

uint64_t __48__TRIKVStore_removeBlobForKey_usingTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":key", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
