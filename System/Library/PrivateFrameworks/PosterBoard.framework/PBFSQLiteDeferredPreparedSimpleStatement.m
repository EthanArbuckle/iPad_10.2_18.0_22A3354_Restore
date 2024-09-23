@implementation PBFSQLiteDeferredPreparedSimpleStatement

void __88___PBFSQLiteDeferredPreparedSimpleStatement_executeWithBindings_resultRowHandler_error___block_invoke(_QWORD *a1, sqlite3 *a2)
{
  void *v3;
  const char *v5;
  int v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  char *pzTail;
  sqlite3_stmt *ppStmt;

  v3 = *(void **)(a1[4] + 32);
  if (v3)
  {
    v5 = (const char *)objc_msgSend(v3, "UTF8String");
    pzTail = 0;
    ppStmt = 0;
    v6 = strlen(v5);
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = sqlite3_prepare_v2(a2, v5, v6, &ppStmt, (const char **)&pzTail);
    if (!*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      if (pzTail)
      {
        if (*pzTail)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], *(_QWORD *)(a1[4] + 32), pzTail);

        }
      }
      *(_QWORD *)(a1[4] + 24) = ppStmt;
      v7 = a1[4];
      v8 = *(void **)(v7 + 32);
      *(_QWORD *)(v7 + 32) = 0;

      WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
      objc_msgSend(WeakRetained, "addObserver:", a1[4]);

    }
  }
}

@end
