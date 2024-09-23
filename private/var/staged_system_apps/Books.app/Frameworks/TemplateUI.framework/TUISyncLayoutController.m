@implementation TUISyncLayoutController

- (TUISyncLayoutController)init
{
  TUISyncLayoutController *v2;
  uint64_t v3;
  NSHashTable *assertions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUISyncLayoutController;
  v2 = -[TUISyncLayoutController init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    assertions = v2->_assertions;
    v2->_assertions = (NSHashTable *)v3;

  }
  return v2;
}

- (TUISyncLayoutController)initWithDelegate:(id)a3
{
  id v4;
  TUISyncLayoutController *v5;
  TUISyncLayoutController *v6;
  uint64_t v7;
  NSHashTable *assertions;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUISyncLayoutController;
  v5 = -[TUISyncLayoutController init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    assertions = v6->_assertions;
    v6->_assertions = (NSHashTable *)v7;

  }
  return v6;
}

- (BOOL)flush
{
  char flags;
  TUISyncLayoutController *v3;
  double Current;
  void *v5;
  os_signpost_id_t v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  double v19;
  void *v20;
  uint64_t v21;
  double v22;
  id v23;
  unsigned __int8 v24;
  void *v25;
  id v26;
  id v27;
  double v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  double v33;
  void *v34;
  uint64_t v35;
  double v36;
  id v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  const __CFString *v41;
  double v42;
  id v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  const __CFString *v52;
  id v53;
  NSObject *v54;
  double v55;
  id v56;
  id v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  char v62;
  id *p_isa;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76;
  char v77[15];
  uint8_t v78[128];
  uint8_t buf[4];
  double v80;
  __int16 v81;
  const __CFString *v82;
  _BYTE v83[128];
  _BYTE v84[128];

  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    v3 = self;
    *(_BYTE *)&self->_flags = flags & 0xFA | 1;
    Current = CFAbsoluteTimeGetCurrent();
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](v3->_assertions, "allObjects"));
    if (objc_msgSend(v5, "count"))
    {
      v62 = flags;
      v6 = 0;
      v7 = 0;
      p_isa = (id *)&v3->super.isa;
      do
      {
        if ((v7 & 1) == 0)
        {
          v8 = TUITransactionLog();
          v9 = objc_claimAutoreleasedReturnValue(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            sub_17D81C(&v76, v77, v9);

          v10 = TUITransactionLog();
          v11 = objc_claimAutoreleasedReturnValue(v10);
          v6 = os_signpost_id_generate(v11);

          v12 = TUITransactionLog();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          v14 = v13;
          if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_0, v14, OS_SIGNPOST_INTERVAL_BEGIN, v6, "WaitForSyncTransaction", (const char *)&unk_23007A, buf, 2u);
          }

        }
        *(_BYTE *)&v3->_flags &= ~2u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v15 = v5;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v73;
          v19 = 0.0;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v73 != v18)
                objc_enumerationMutation(v15);
              v21 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)v20);
              if (v21)
                v22 = *(double *)(v21 + 16);
              else
                v22 = 0.0;
              if (v19 < v22)
                v19 = v22;
              v20 = (char *)v20 + 1;
            }
            while (v17 != v20);
            v23 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
            v17 = v23;
          }
          while (v23);
        }
        else
        {
          v19 = 0.0;
        }

        v3 = (TUISyncLayoutController *)p_isa;
        v24 = objc_msgSend(p_isa, "_processUntilDirtyOrEndtime:", Current + v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[2], "allObjects"));
        v5 = v25;
        if ((v24 & 1) != 0)
          break;
        v26 = objc_msgSend(v25, "count");
        v7 = 1;
      }
      while (v26);
      v27 = objc_msgSend(v5, "count");
      v28 = CFAbsoluteTimeGetCurrent();
      if (v27)
      {
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v29 = v5;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v69;
          v33 = 0.0;
          do
          {
            v34 = 0;
            do
            {
              if (*(_QWORD *)v69 != v32)
                objc_enumerationMutation(v29);
              v35 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)v34);
              if (v35)
                v36 = *(double *)(v35 + 16);
              else
                v36 = 0.0;
              if (v33 < v36)
                v33 = v36;
              v34 = (char *)v34 + 1;
            }
            while (v31 != v34);
            v37 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
            v31 = v37;
          }
          while (v37);
        }
        else
        {
          v33 = 0.0;
        }

      }
      else
      {
        v33 = 0.0;
      }
      v38 = TUITransactionLog();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      v40 = v39;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        v41 = CFSTR("YES");
        if (!v27)
          v41 = CFSTR("NO");
        *(_DWORD *)buf = 134218242;
        v80 = v33;
        v81 = 2114;
        v82 = v41;
        _os_signpost_emit_with_name_impl(&dword_0, v40, OS_SIGNPOST_INTERVAL_END, v6, "WaitForSyncTransaction", "Time limit: %fs Timed out: %{public}@ enableTelemetry=YES ", buf, 0x16u);
      }

      v42 = v28 - Current;
      if (v42 > 0.1)
      {
        v43 = TUITransactionLog();
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v80 = v42;
          _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "time spent waiting for sync layout flush: %.2fs", buf, 0xCu);
        }

      }
      if (v27)
      {
        v45 = TUITransactionLog();
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          sub_17D77C(v5, v46, v42);

        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v47 = v5;
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v65;
          do
          {
            v51 = 0;
            do
            {
              if (*(_QWORD *)v65 != v50)
                objc_enumerationMutation(v47);
              v52 = *(const __CFString **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v51);
              v53 = TUITransactionLog();
              v54 = objc_claimAutoreleasedReturnValue(v53);
              if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
              {
                if (v52)
                  v55 = *(double *)&v52[1].isa;
                else
                  v55 = 0.0;
                *(_DWORD *)buf = 134218242;
                v80 = v55;
                v81 = 2114;
                v82 = v52;
                _os_log_impl(&dword_0, v54, OS_LOG_TYPE_INFO, "- [fid:%lu] %{public}@", buf, 0x16u);
              }

              v51 = (char *)v51 + 1;
            }
            while (v49 != v51);
            v56 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
            v49 = v56;
          }
          while (v56);
        }

        v3 = (TUISyncLayoutController *)p_isa;
      }
      v57 = TUITransactionLog();
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        sub_17D744(v58, v59, v60);

      flags = v62;
    }
    *(_BYTE *)&v3->_flags &= ~1u;

  }
  return (flags & 1) == 0;
}

- (BOOL)_processUntilDirtyOrEndtime:(double)a3
{
  unsigned int v5;
  BOOL result;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return 0;
  while (a3 - CFAbsoluteTimeGetCurrent() > 0.0)
  {
    v5 = TUIDispatchDrainWithTimeout();
    result = v5 == 3;
    if ((*(_BYTE *)&self->_flags & 2) != 0 || v5 == 3)
      return result;
  }
  return 1;
}

- (id)syncAssertionWithTimeout:(double)a3 transaction:(id)a4 feedId:(id)a5
{
  id v8;
  _TUISyncLayoutAssertion *v9;
  id v10;
  NSObject *v11;
  id WeakRetained;
  int v14;
  id v15;

  v8 = a4;
  v9 = -[_TUISyncLayoutAssertion initWithController:timeout:transaction:feedId:]([_TUISyncLayoutAssertion alloc], "initWithController:timeout:transaction:feedId:", self, v8, a5.var0, a3);
  -[NSHashTable addObject:](self->_assertions, "addObject:", v9);
  *(_BYTE *)&self->_flags |= 2u;
  v10 = TUITransactionLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14 = 138543362;
    v15 = v8;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "scheduled sync-assertion for tx=%{public}@", (uint8_t *)&v14, 0xCu);
  }

  if ((*(_BYTE *)&self->_flags & 5) == 0)
  {
    *(_BYTE *)&self->_flags |= 4u;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "syncLayoutControllerNeedsFlushing:", self);

  }
  return v9;
}

- (void)removeAssertion:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[TUISyncLayoutController _removeAssertion:](self, "_removeAssertion:", v4);
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_7C78C;
    v5[3] = &unk_23D7D0;
    v5[4] = self;
    v6 = v4;
    TUIDispatchAsyncViaRunLoop((uint64_t)v5);

  }
}

- (void)_removeAssertion:(id)a3
{
  _QWORD *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v4 = a3;
  v5 = TUITransactionLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (v4)
      v7 = v4[3];
    else
      v7 = 0;
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "removed sync-assertion for tx=%{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (v4)
    -[NSHashTable removeObject:](self->_assertions, "removeObject:", v4);
  *(_BYTE *)&self->_flags |= 2u;

}

- (TUISyncLayoutControllerDelegate)delegate
{
  return (TUISyncLayoutControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end
