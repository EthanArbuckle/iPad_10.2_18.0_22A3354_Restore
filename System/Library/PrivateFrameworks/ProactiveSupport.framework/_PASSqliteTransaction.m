@implementation _PASSqliteTransaction

+ (void)readTransactionWithHandle:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASSqliteTransaction.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handle"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASSqliteTransaction.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57___PASSqliteTransaction_readTransactionWithHandle_block___block_invoke;
  v14[3] = &unk_1E4430468;
  v15 = v7;
  v16 = v9;
  v10 = v7;
  v13 = v9;
  objc_msgSend(v10, "readTransaction:", v14);

}

+ (void)writeTransactionWithHandle:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASSqliteTransaction.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handle"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASSqliteTransaction.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58___PASSqliteTransaction_writeTransactionWithHandle_block___block_invoke;
  v14[3] = &unk_1E4430468;
  v15 = v7;
  v16 = v9;
  v10 = v7;
  v13 = v9;
  objc_msgSend(v10, "writeTransaction:", v14);

}

+ (_PASDBTransactionCompletion_)readTransactionWithHandle:(id)a3 failableBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _PASDBTransactionCompletion_ v12;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASSqliteTransaction.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handle"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASSqliteTransaction.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65___PASSqliteTransaction_readTransactionWithHandle_failableBlock___block_invoke;
  v16[3] = &unk_1E4430148;
  v17 = v7;
  v18 = v9;
  v10 = v7;
  v11 = v9;
  v12.var0 = objc_msgSend(v10, "readTransactionWithFailableBlock:", v16);

  return v12;
}

+ (_PASDBTransactionCompletion_)writeTransactionWithHandle:(id)a3 failableBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _PASDBTransactionCompletion_ v12;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASSqliteTransaction.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handle"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASSqliteTransaction.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66___PASSqliteTransaction_writeTransactionWithHandle_failableBlock___block_invoke;
  v16[3] = &unk_1E4430148;
  v17 = v7;
  v18 = v9;
  v10 = v7;
  v11 = v9;
  v12.var0 = objc_msgSend(v10, "writeTransactionWithFailableBlock:", v16);

  return v12;
}

@end
