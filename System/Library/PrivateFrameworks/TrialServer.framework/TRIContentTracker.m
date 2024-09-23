@implementation TRIContentTracker

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase readTransactionWithFailableBlock:](self->_db, "readTransactionWithFailableBlock:", a3);
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)-[TRIDatabase writeTransactionWithFailableBlock:](self->_db, "writeTransactionWithFailableBlock:", a3);
}

- (TRIContentTracker)initWithDatabase:(id)a3
{
  id v6;
  TRIContentTracker *v7;
  TRIContentTracker *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIContentTracker.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TRIContentTracker;
  v7 = -[TRIContentTracker init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_db, a3);

  return v8;
}

- (BOOL)_addOrDropRefWithContentIdentifier:(id)a3 changeType:(unint64_t)a4
{
  id v7;
  TRIDatabase *db;
  id v9;
  char v10;
  void *v12;
  _QWORD v13[4];
  id v14;
  TRIContentTracker *v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIContentTracker.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentIdentifier"));

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  db = self->_db;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke;
  v13[3] = &unk_1E932F3A8;
  v9 = v7;
  v14 = v9;
  v15 = self;
  v16 = &v18;
  v17 = a4;
  -[TRIDatabase writeTransactionWithFailableBlock:](db, "writeTransactionWithFailableBlock:", v13);
  v10 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v10;
}

uint64_t __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_2;
  v27[3] = &unk_1E932F1F0;
  v28 = *(id *)(a1 + 32);
  v26[0] = v5;
  v26[1] = 3221225472;
  v26[2] = __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_3;
  v26[3] = &unk_1E9332A70;
  v26[4] = &v29;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT refCount FROM     contentReferences WHERE     contentId = :content_id;"),
         v27,
         v26,
         v6);

  v8 = *MEMORY[0x1E0D81680];
  if ((v7 & 1) == 0)
    goto LABEL_19;
  v9 = *(_QWORD *)(a1 + 56);
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9 == 1)
  {
    v12 = v30[3];
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v12 - 1;
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  if (v9)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_13;
  }
  v11 = v30[3];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 1;
LABEL_11:
    objc_msgSend(v3, "db");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_4;
    v23[3] = &unk_1E932F218;
    v24 = *(id *)(a1 + 32);
    v25 = v10;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v5, 3221225472, __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_4, &unk_1E932F218);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT OR REPLACE INTO contentReferences(    contentId, refCount) VALUES(    :content_id, :ref_count);"),
            v23,
            0,
            v15);

    if ((v16 & 1) == 0)
      goto LABEL_19;
    v13 = 1;
    goto LABEL_13;
  }
  v10 = (v11 & ~(v11 >> 63)) + 1;
  if ((v11 & ~(v11 >> 63)) != 0x7FFFFFFFFFFFFFFELL)
    goto LABEL_11;
  v13 = 0;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
  TRILogCategory_Server();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_QWORD *)(a1 + 56))
      v18 = "-";
    else
      v18 = "+";
    objc_msgSend(*(id *)(a1 + 32), "str");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_5(v30[3]);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_5(v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v34 = v18;
    v35 = 2112;
    v36 = v19;
    v37 = 2114;
    v38 = v20;
    v39 = 2114;
    v40 = v21;
    _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "refCount%s %@: %{public}@ --> %{public}@", buf, 0x2Au);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v13;
  v8 = *MEMORY[0x1E0D81678];
LABEL_19:
  _Block_object_dispose(&v29, 8);

  return v8;
}

void __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "str");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":content_id", v4);

}

uint64_t __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumnName:table:", "refCount", 0);
  return *MEMORY[0x1E0D81788];
}

void __67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "str");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":content_id", v4);

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":ref_count", *(_QWORD *)(a1 + 40));
}

__CFString *__67__TRIContentTracker__addOrDropRefWithContentIdentifier_changeType___block_invoke_5(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 0x7FFFFFFFFFFFFFFFLL)
    v1 = CFSTR("(none)");
  else
    v1 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", a1);
  return v1;
}

- (BOOL)addRefWithContentIdentifier:(id)a3
{
  return -[TRIContentTracker _addOrDropRefWithContentIdentifier:changeType:](self, "_addOrDropRefWithContentIdentifier:changeType:", a3, 0);
}

- (BOOL)dropRefWithContentIdentifier:(id)a3
{
  return -[TRIContentTracker _addOrDropRefWithContentIdentifier:changeType:](self, "_addOrDropRefWithContentIdentifier:changeType:", a3, 1);
}

- (BOOL)refCountForContentIdentifier:(id)a3 refCount:(int64_t *)a4
{
  id v7;
  TRIDatabase *db;
  id v9;
  char v10;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  TRIContentTracker *v16;
  uint64_t *v17;
  int64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIContentTracker.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentIdentifier"));

    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIContentTracker.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("refCount"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  db = self->_db;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__TRIContentTracker_refCountForContentIdentifier_refCount___block_invoke;
  v14[3] = &unk_1E9335900;
  v17 = &v19;
  v18 = a4;
  v9 = v7;
  v15 = v9;
  v16 = self;
  -[TRIDatabase readTransactionWithFailableBlock:](db, "readTransactionWithFailableBlock:", v14);
  v10 = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __59__TRIContentTracker_refCountForContentIdentifier_refCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v2 = a1;
  **(_QWORD **)(a1 + 56) = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__TRIContentTracker_refCountForContentIdentifier_refCount___block_invoke_2;
  v11[3] = &unk_1E932F1F0;
  v12 = *(id *)(v2 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(v2 + 40) + 8), "generalErrorHandlerWithOutError:", 0, v4, 3221225472, __59__TRIContentTracker_refCountForContentIdentifier_refCount___block_invoke_3, &__block_descriptor_40_e49___PASDBIterAction__B_16__0___PASSqliteStatement_8l, *(_QWORD *)(v2 + 56), v11[0], 3221225472, __59__TRIContentTracker_refCountForContentIdentifier_refCount___block_invoke_2, &unk_1E932F1F0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT refCount FROM     contentReferences WHERE     contentId = :content_id;"),
                                                                 v11,
                                                                 &v10,
                                                                 v5);

  LODWORD(v2) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24);
  v6 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81678];

  if ((_DWORD)v2)
    v8 = v7;
  else
    v8 = v6;
  return *v8;
}

void __59__TRIContentTracker_refCountForContentIdentifier_refCount___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "str");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":content_id", v4);

}

uint64_t __59__TRIContentTracker_refCountForContentIdentifier_refCount___block_invoke_3(uint64_t a1, void *a2)
{
  **(_QWORD **)(a1 + 32) = objc_msgSend(a2, "getInt64ForColumnName:table:", "refCount", 0);
  return *MEMORY[0x1E0D81788];
}

- (BOOL)clearRefsWithContentIdentifier:(id)a3
{
  id v5;
  TRIDatabase *db;
  id v7;
  char v8;
  void *v10;
  _QWORD v11[4];
  id v12;
  TRIContentTracker *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIContentTracker.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentIdentifier"));

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__TRIContentTracker_clearRefsWithContentIdentifier___block_invoke;
  v11[3] = &unk_1E932F510;
  v14 = &v15;
  v7 = v5;
  v12 = v7;
  v13 = self;
  -[TRIDatabase writeTransactionWithFailableBlock:](db, "writeTransactionWithFailableBlock:", v11);
  v8 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __52__TRIContentTracker_clearRefsWithContentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__TRIContentTracker_clearRefsWithContentIdentifier___block_invoke_2;
  v9[3] = &unk_1E932F1F0;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" DELETE FROM      contentReferences WHERE     contentId = :content_id;"),
                                                                 v9,
                                                                 0,
                                                                 v4);

  LODWORD(a1) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  v6 = (unsigned __int8 *)MEMORY[0x1E0D81678];

  if ((_DWORD)a1)
    v7 = v6;
  else
    v7 = v5;
  return *v7;
}

void __52__TRIContentTracker_clearRefsWithContentIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "str");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":content_id", v4);

}

- (BOOL)enumerateTrackedItemsWithBlock:(id)a3
{
  id v5;
  TRIDatabase *db;
  id v7;
  char v8;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  SEL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIContentTracker.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__TRIContentTracker_enumerateTrackedItemsWithBlock___block_invoke;
  v11[3] = &unk_1E9335928;
  v13 = &v15;
  v14 = a2;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  -[TRIDatabase readTransactionWithFailableBlock:](db, "readTransactionWithFailableBlock:", v11);
  v8 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __52__TRIContentTracker_enumerateTrackedItemsWithBlock___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __52__TRIContentTracker_enumerateTrackedItemsWithBlock___block_invoke_2;
  v11[3] = &unk_1E93305E8;
  v4 = a1[4];
  v5 = (void *)a1[5];
  v13 = a1[7];
  v11[4] = v4;
  v11[1] = 3221225472;
  v12 = v5;
  objc_msgSend(*(id *)(a1[4] + 8), "generalErrorHandlerWithOutError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT * FROM contentReferences;"),
                                                  0,
                                                  v11,
                                                  v6);

  LODWORD(a1) = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81678];

  if ((_DWORD)a1)
    v9 = v8;
  else
    v9 = v7;
  return *v9;
}

uint64_t __52__TRIContentTracker_enumerateTrackedItemsWithBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  TRIContentTrackingId *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  void *v12;
  unsigned __int8 v13;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnName:table:", "contentId", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "getInt64ForColumnName:table:", "refCount", 0);

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIContentTracker.m"), 204, CFSTR("read NULL contentId from NOT NULL column"));

  }
  v13 = 0;
  v6 = a1[5];
  v7 = -[TRIContentTrackingId initWithStr:]([TRIContentTrackingId alloc], "initWithStr:", v4);
  (*(void (**)(uint64_t, TRIContentTrackingId *, uint64_t, unsigned __int8 *))(v6 + 16))(v6, v7, v5, &v13);

  LODWORD(v6) = v13;
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  v9 = (unsigned __int8 *)MEMORY[0x1E0D81788];

  if ((_DWORD)v6)
    v10 = v9;
  else
    v10 = v8;
  return *v10;
}

+ (id)contentIdentifierForExperimentArtifactWithDeployment:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  TRIContentTrackingId *v13;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  v20[0] = CFSTR("exp-artifact");
  v19[0] = CFSTR("0_type");
  v19[1] = CFSTR("1_id");
  objc_msgSend(v5, "experimentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  v19[2] = CFSTR("2_dep");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "deploymentId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 2, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shortDesc");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIContentTracker.m"), 231, CFSTR("Failed to create content identifier for %@: %@"), v16, v11);

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 4);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIContentTracker.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("jsonStr"));

  }
  v13 = -[TRIContentTrackingId initWithStr:]([TRIContentTrackingId alloc], "initWithStr:", v12);

  objc_autoreleasePoolPop(v6);
  return v13;
}

+ (id)contentIdentifierForTreatmentArtifactWithTreatmentId:(id)a3 container:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  TRIContentTrackingId *v16;
  void *v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D8232A5C]();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("trt-artifact"), CFSTR("0_type"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("1_id"));
  if (v8)
  {
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("3_cntId"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("4_cntType"));

  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("3_cntId"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("4_cntType"));
  }
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v10, 2, &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIContentTracker.m"), 251, CFSTR("Failed to create content identifier for %@: %@"), v7, v14);

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v13, 4);
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIContentTracker.m"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("jsonStr"));

  }
  v16 = -[TRIContentTrackingId initWithStr:]([TRIContentTrackingId alloc], "initWithStr:", v15);

  objc_autoreleasePoolPop(v9);
  return v16;
}

+ (id)contentIdentifierForRolloutArtifactWithDeployment:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  TRIContentTrackingId *v13;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  v20[0] = CFSTR("rlo-artifact");
  v19[0] = CFSTR("0_type");
  v19[1] = CFSTR("1_id");
  objc_msgSend(v5, "rolloutId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  v19[2] = CFSTR("2_dep");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "deploymentId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 2, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shortDesc");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIContentTracker.m"), 270, CFSTR("Failed to create content identifier for %@: %@"), v16, v11);

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 4);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIContentTracker.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("jsonStr"));

  }
  v13 = -[TRIContentTrackingId initWithStr:]([TRIContentTrackingId alloc], "initWithStr:", v12);

  objc_autoreleasePoolPop(v6);
  return v13;
}

+ (id)contentIdentifierForBMLTArtifactWithDeployment:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  TRIContentTrackingId *v13;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  v20[0] = CFSTR("bmlt-artifact");
  v19[0] = CFSTR("0_type");
  v19[1] = CFSTR("1_id");
  objc_msgSend(v5, "backgroundMLTaskId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  v19[2] = CFSTR("2_dep");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "deploymentId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 2, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shortDesc");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIContentTracker.m"), 289, CFSTR("Failed to create content identifier for %@: %@"), v16, v11);

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 4);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIContentTracker.m"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("jsonStr"));

  }
  v13 = -[TRIContentTrackingId initWithStr:]([TRIContentTrackingId alloc], "initWithStr:", v12);

  objc_autoreleasePoolPop(v6);
  return v13;
}

+ (id)contentIdentifierForFactorPackSetWithId:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  TRIContentTrackingId *v11;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  v16[0] = CFSTR("0_type");
  v16[1] = CFSTR("1_id");
  v17[0] = CFSTR("fp-set");
  v17[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 2, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIContentTracker.m"), 307, CFSTR("Failed to create content identifier for %@: %@"), v5, v9);

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIContentTracker.m"), 309, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("jsonStr"));

  }
  v11 = -[TRIContentTrackingId initWithStr:]([TRIContentTrackingId alloc], "initWithStr:", v10);

  objc_autoreleasePoolPop(v6);
  return v11;
}

+ (id)decodeContentIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  TRIContentDescriptorUnion *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  TRIContentDescriptorUnion *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  TRITreatmentContentDescriptor *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  NSObject *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  int v40;
  void *v41;
  NSObject *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v5, "str");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIContentTracker.m"), 317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("json"));

  }
  v48 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, &v48);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v48;
  if (!v9)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v10;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Unable to decode JSON for content identifier: %{public}@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("0_type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(CFSTR("exp-artifact"), "isEqual:", v11);

  if (v12)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("1_id"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("2_dep"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 && v14)
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A30]), "initWithExperimentId:deploymentId:", v13, objc_msgSend(v14, "intValue"));
      v17 = [TRIContentDescriptorUnion alloc];
      v18 = 0;
      v19 = v16;
      v20 = 0;
LABEL_24:
      v33 = 0;
LABEL_25:
      v21 = -[TRIContentDescriptorUnion initWithType:experiment:treatment:rollout:factorPackSet:bmlt:](v17, "initWithType:experiment:treatment:rollout:factorPackSet:bmlt:", v18, v19, 0, v20, 0, v33);
LABEL_46:

      goto LABEL_47;
    }
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
      *(_DWORD *)buf = 138543362;
      v50 = v29;
      _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Invalid JSON for experiment content identifier: %{public}@", buf, 0xCu);

    }
    goto LABEL_45;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("0_type"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(CFSTR("trt-artifact"), "isEqual:", v22);

  if (v23)
  {
    v47 = v6;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("1_id"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("3_cntId"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("4_cntType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v13 && (v24 != 0) != (v25 == 0))
    {
      v27 = 0;
      if (v24 && v25)
        v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0990]), "initWithIdentifier:type:", v24, objc_msgSend(v25, "integerValue"));
      v28 = -[TRITreatmentContentDescriptor initWithTreatmentId:container:]([TRITreatmentContentDescriptor alloc], "initWithTreatmentId:container:", v13, v27);
      v21 = -[TRIContentDescriptorUnion initWithType:experiment:treatment:rollout:factorPackSet:bmlt:]([TRIContentDescriptorUnion alloc], "initWithType:experiment:treatment:rollout:factorPackSet:bmlt:", 1, 0, v28, 0, 0, 0);

    }
    else
    {
      TRILogCategory_Server();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
        *(_DWORD *)buf = 138412290;
        v50 = v44;
        _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Invalid JSON for treatment content identifier: %@", buf, 0xCu);

      }
      v21 = 0;
    }

    v6 = v47;
    goto LABEL_47;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("0_type"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(CFSTR("rlo-artifact"), "isEqual:", v30);

  if (v31)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("1_id"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("2_dep"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v32;
    if (v13 && v32)
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B60]), "initWithRolloutId:deploymentId:", v13, objc_msgSend(v32, "intValue"));
      v17 = [TRIContentDescriptorUnion alloc];
      v18 = 2;
      v19 = 0;
      v20 = v16;
      goto LABEL_24;
    }
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_45:
      v21 = 0;
      goto LABEL_46;
    }
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
    *(_DWORD *)buf = 138543362;
    v50 = v37;
    v38 = "Invalid JSON for rollout content identifier: %{public}@";
LABEL_35:
    _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, v38, buf, 0xCu);

    goto LABEL_45;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("0_type"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(CFSTR("fp-set"), "isEqual:", v34);

  if (v35)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("1_id"));
    v36 = objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v13 = v36;
      v21 = -[TRIContentDescriptorUnion initWithType:experiment:treatment:rollout:factorPackSet:bmlt:]([TRIContentDescriptorUnion alloc], "initWithType:experiment:treatment:rollout:factorPackSet:bmlt:", 3, 0, 0, 0, v36, 0);
      goto LABEL_47;
    }
    TRILogCategory_Server();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
      *(_DWORD *)buf = 138543362;
      v50 = v45;
      _os_log_error_impl(&dword_1D207F000, v42, OS_LOG_TYPE_ERROR, "Invalid JSON for factor pack set identifier: %{public}@", buf, 0xCu);

    }
    v13 = 0;
LABEL_10:
    v21 = 0;
LABEL_47:

    goto LABEL_48;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("0_type"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(CFSTR("bmlt-artifact"), "isEqual:", v39);

  if (v40)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("1_id"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("2_dep"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v41;
    if (v13 && v41)
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC09A8]), "initWithBackgroundMLTaskId:deploymentId:", v13, objc_msgSend(v41, "intValue"));
      v17 = [TRIContentDescriptorUnion alloc];
      v18 = 4;
      v19 = 0;
      v20 = 0;
      v33 = v16;
      goto LABEL_25;
    }
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
    *(_DWORD *)buf = 138543362;
    v50 = v37;
    v38 = "Invalid JSON for BMLT content identifier: %{public}@";
    goto LABEL_35;
  }
  v21 = 0;
LABEL_48:

  objc_autoreleasePoolPop(v6);
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
