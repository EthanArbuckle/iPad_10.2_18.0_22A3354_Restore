@implementation TLTimelineSetupOperation

+ (unint64_t)relativePriority
{
  return 100;
}

- (TLTimelineSetupOperation)initWithIdentifiable:(id)a3
{
  return -[TLTimelineSetupOperation initWithIdentifiable:timeout:entryLimit:](self, "initWithIdentifiable:timeout:entryLimit:", a3, 20, 60.0);
}

- (TLTimelineSetupOperation)initWithIdentifiable:(id)a3 timeout:(double)a4 entryLimit:(unint64_t)a5
{
  TLTimelineSetupOperation *result;
  unint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TLTimelineSetupOperation;
  result = -[TLTimelineOperation initWithIdentifiable:](&v9, sel_initWithIdentifiable_, a3);
  if (result)
  {
    v8 = a5 - 1;
    if (!a5)
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    result->_entryLimit = v8;
    result->_timeout = a4;
  }
  return result;
}

- (void)main
{
  double v3;
  dispatch_time_t v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  TLTimelineSetupOperation *v10;
  void *v11;
  void *v12;
  TLTimelineSetupOperation *v13;
  TLTimeline *v14;
  TLTimeline *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _QWORD v32[5];
  NSObject *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;

  -[TLTimelineSetupOperation timeout](self, "timeout");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  v5 = -[TLTimelineSetupOperation entryLimit](self, "entryLimit");
  v6 = dispatch_group_create();
  -[TLOperation dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLTimelineOperation identifiable](self, "identifiable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  v41 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_group_enter(v6);
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __32__TLTimelineSetupOperation_main__block_invoke;
    v32[3] = &unk_24CE30E98;
    v32[4] = self;
    v34 = &v36;
    v35 = &v42;
    v9 = v6;
    v33 = v9;
    objc_msgSend(v7, "tl_getCurrentTimelineEntryForIdentifiable:withHandler:", v8, v32);

    dispatch_group_wait(v9, v4);
    v10 = self;
    objc_sync_enter(v10);
    if (*((_BYTE *)v43 + 24))
    {
      objc_sync_exit(v10);

      v28 = 0;
      v29 = &v28;
      v30 = 0x2020000000;
      v31 = 0;
      v22 = 0;
      v23 = &v22;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__0;
      v26 = __Block_byref_object_dispose__0;
      v27 = 0;
      objc_msgSend((id)v37[5], "tl_entryDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 && v5 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        dispatch_group_enter(v9);
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __32__TLTimelineSetupOperation_main__block_invoke_2;
        v18[3] = &unk_24CE30E70;
        v18[4] = v10;
        v20 = &v28;
        v21 = &v22;
        v19 = v9;
        objc_msgSend(v7, "tl_getTimelineEntriesForIdentifiable:afterDate:limit:withHandler:", v8, v11, v5, v18);

      }
      else
      {
        *((_BYTE *)v29 + 24) = 1;
      }
      dispatch_group_wait(v9, v4);
      v13 = v10;
      objc_sync_enter(v13);
      if (*((_BYTE *)v29 + 24))
      {
        objc_sync_exit(v13);

        v14 = [TLTimeline alloc];
        v15 = -[TLTimeline initWithEntry:](v14, "initWithEntry:", v37[5]);
        -[TLTimeline extendTimelineFromDate:withEntries:](v15, "extendTimelineFromDate:withEntries:", v11, v23[5]);
        -[TLTimelineSetupOperation setTimeline:](v13, "setTimeline:", v15);
        -[TLTimelineSetupOperation setSetupError:](v13, "setSetupError:", 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TLTimelineOperationDomain"), 803, &unk_24CE338E0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLTimelineSetupOperation setSetupError:](v13, "setSetupError:", v17);

        objc_sync_exit(v13);
        v15 = (TLTimeline *)v13;
      }

      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v28, 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TLTimelineOperationDomain"), 802, &unk_24CE338B8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLTimelineSetupOperation setSetupError:](v10, "setSetupError:", v16);

      objc_sync_exit(v10);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TLTimelineOperationDomain"), 500, &unk_24CE33890);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLTimelineSetupOperation setSetupError:](self, "setSetupError:", v12);

  }
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
}

void __32__TLTimelineSetupOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __32__TLTimelineSetupOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  objc_sync_exit(v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (double)timeout
{
  return self->_timeout;
}

- (unint64_t)entryLimit
{
  return self->_entryLimit;
}

- (TLTimeline)timeline
{
  return (TLTimeline *)objc_getProperty(self, a2, 296, 1);
}

- (void)setTimeline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSError)setupError
{
  return (NSError *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSetupError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupError, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
}

@end
