@implementation TLTimelineExtendOperation

+ (unint64_t)relativePriority
{
  return 50;
}

- (TLTimelineExtendOperation)initWithIdentifiable:(id)a3 afterDate:(id)a4 timeout:(double)a5 entryLimit:(unint64_t)a6
{
  id v10;
  TLTimelineExtendOperation *v11;
  TLTimelineExtendOperation *v12;
  unint64_t v13;
  uint64_t v14;
  NSDate *afterDate;
  objc_super v17;

  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TLTimelineExtendOperation;
  v11 = -[TLTimelineOperation initWithIdentifiable:](&v17, sel_initWithIdentifiable_, a3);
  v12 = v11;
  if (v11)
  {
    v11->_timeout = a5;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (a6)
      v13 = a6;
    v11->_limit = v13;
    v14 = objc_msgSend(v10, "copy");
    afterDate = v12->_afterDate;
    v12->_afterDate = (NSDate *)v14;

  }
  return v12;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  double v7;
  dispatch_time_t v8;
  NSObject *v9;
  TLTimelineExtendOperation *v10;
  void *v11;
  _QWORD v12[5];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  -[TLTimelineExtendOperation afterDate](self, "afterDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TLTimelineOperation identifiable](self, "identifiable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLOperation dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TLTimelineExtendOperation limit](self, "limit");
    -[TLTimelineExtendOperation timeout](self, "timeout");
    v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    v9 = dispatch_group_create();
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    v21 = (id)MEMORY[0x24BDBD1A8];
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      dispatch_group_enter(v9);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __33__TLTimelineExtendOperation_main__block_invoke;
      v12[3] = &unk_24CE30E70;
      v12[4] = self;
      v14 = &v22;
      v15 = &v16;
      v13 = v9;
      objc_msgSend(v5, "tl_getTimelineEntriesForIdentifiable:afterDate:limit:withHandler:", v4, v3, v6, v12);

    }
    dispatch_group_wait(v9, v8);
    v10 = self;
    objc_sync_enter(v10);
    if (*((_BYTE *)v23 + 24))
    {
      objc_sync_exit(v10);

      -[TLTimelineExtendOperation setTimelineEntries:](v10, "setTimelineEntries:", v17[5]);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TLTimelineOperationDomain"), 803, &unk_24CE33868);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLTimelineExtendOperation setExtendError:](v10, "setExtendError:", v11);

      objc_sync_exit(v10);
    }
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TLTimelineOperationDomain"), 300, &unk_24CE33840);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLTimelineExtendOperation setExtendError:](self, "setExtendError:", v4);
  }

}

void __33__TLTimelineExtendOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *(id *)(a1 + 32);
  v7 = a2;
  objc_sync_enter(v4);
  v5 = (void *)MEMORY[0x24BDBD1A8];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (v7)
    v6 = v7;
  else
    v6 = v5;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v6);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (NSDate)afterDate
{
  return self->_afterDate;
}

- (double)timeout
{
  return self->_timeout;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (NSArray)timelineEntries
{
  return (NSArray *)objc_getProperty(self, a2, 304, 1);
}

- (void)setTimelineEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSError)extendError
{
  return (NSError *)objc_getProperty(self, a2, 312, 1);
}

- (void)setExtendError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendError, 0);
  objc_storeStrong((id *)&self->_timelineEntries, 0);
  objc_storeStrong((id *)&self->_afterDate, 0);
}

@end
