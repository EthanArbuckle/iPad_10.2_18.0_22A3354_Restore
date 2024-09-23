@implementation ATXPOICategoryVisitDataProvider

- (ATXPOICategoryVisitDataProvider)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXPOICategoryVisitDataProvider *v7;

  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PointOfInterest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXPOICategoryVisitDataProvider initWithStream:](self, "initWithStream:", v6);

  return v7;
}

- (ATXPOICategoryVisitDataProvider)initWithStream:(id)a3
{
  id v5;
  ATXPOICategoryVisitDataProvider *v6;
  ATXPOICategoryVisitDataProvider *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  ATXPOICategoryEventAggregator *streamAggregator;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXPOICategoryVisitDataProvider;
  v6 = -[ATXPOICategoryVisitDataProvider init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stream, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.proactive.ATXPOICategoryVisitDataProvider.subscribe", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new();
    streamAggregator = v7->_streamAggregator;
    v7->_streamAggregator = (ATXPOICategoryEventAggregator *)v11;

  }
  return v7;
}

- (id)getCurrentVisit
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  -[BMStream atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:](self->_stream, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1E943D338, &unk_1E943D338, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4 + -86400.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[ATXPOICategoryEventAggregator groupVisitsFromPublisher:startTimestamp:endTimestamp:](self->_streamAggregator, "groupVisitsFromPublisher:startTimestamp:endTimestamp:", v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finalPOIWithoutExit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getCurrentVisitAtDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXPOICategoryEventAggregator *streamAggregator;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "dateByAddingTimeInterval:", -86400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStream atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:](self->_stream, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v5, v4, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  streamAggregator = self->_streamAggregator;
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v9 = v8;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v11 = v10;

  -[ATXPOICategoryEventAggregator groupVisitsFromPublisher:startTimestamp:endTimestamp:](streamAggregator, "groupVisitsFromPublisher:startTimestamp:endTimestamp:", v6, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "finalPOIWithoutExit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)subscribeToPOIChangesForCategories:(id)a3 observer:(id)a4 enterSelector:(SEL)a5 exitSelector:(SEL)a6 sinkCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BMBiomeScheduler *v19;
  BMBiomeScheduler *scheduler;
  void *v21;
  void *v22;
  id v23;
  id v24;
  BPSSink *v25;
  BPSSink *sink;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD *v30;
  SEL v31;
  SEL v32;
  _QWORD v33[3];
  char v34;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  -[ATXPOICategoryVisitDataProvider unsubscribeToPOIChanges](self, "unsubscribeToPOIChanges");
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "processName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lowercaseString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("ATXPOICategoryVisitDataProvider.subscribe."), "stringByAppendingString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (BMBiomeScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", v18, self->_queue);
  scheduler = self->_scheduler;
  self->_scheduler = v19;

  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  -[BMStream atx_DSLPublisher](self->_stream, "atx_DSLPublisher");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "subscribeOn:", self->_scheduler);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __121__ATXPOICategoryVisitDataProvider_subscribeToPOIChangesForCategories_observer_enterSelector_exitSelector_sinkCompletion___block_invoke;
  v27[3] = &unk_1E942E138;
  v30 = v33;
  v31 = a6;
  v27[4] = self;
  v23 = v12;
  v28 = v23;
  v32 = a5;
  v24 = v13;
  v29 = v24;
  objc_msgSend(v22, "sinkWithCompletion:receiveInput:", v14, v27);
  v25 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  sink = self->_sink;
  self->_sink = v25;

  _Block_object_dispose(v33, 8);
}

void __121__ATXPOICategoryVisitDataProvider_subscribeToPOIChangesForCategories_observer_enterSelector_exitSelector_sinkCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t *)(a1 + 64);
  if (*(_QWORD *)(a1 + 64)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && objc_msgSend(*(id *)(a1 + 32), "hasExitedAllCategories:", *(_QWORD *)(a1 + 40)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      goto LABEL_11;
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v3, "poiCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

    if (!(_DWORD)v5)
      goto LABEL_11;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(a1 + 64) != 0;
    v4 = (uint64_t *)(a1 + 72);
  }
  v7 = *v4;
  v8 = (void *)MEMORY[0x1D82448B0]();
  v9 = *(void **)(a1 + 48);
  if (v9)
    ((void (*)(_QWORD, uint64_t))objc_msgSend(v9, "methodForSelector:", v7))(*(_QWORD *)(a1 + 48), v7);
  objc_autoreleasePoolPop(v8);
LABEL_11:

}

- (BOOL)hasExitedAllCategories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  -[ATXPOICategoryVisitDataProvider getCurrentVisit](self, "getCurrentVisit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "hasExited") & 1) == 0)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    objc_msgSend(v6, "possibleCategoryNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__ATXPOICategoryVisitDataProvider_hasExitedAllCategories___block_invoke;
    v10[3] = &unk_1E942E160;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

    v7 = *((_BYTE *)v14 + 24) == 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

void __58__ATXPOICategoryVisitDataProvider_hasExitedAllCategories___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  int v8;
  id v9;

  v7 = a2;
  if (a3 == 3)
    goto LABEL_4;
  v9 = v7;
  v8 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7);
  v7 = v9;
  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_4:
    *a4 = 1;
  }

}

- (void)unsubscribeToPOIChanges
{
  BPSSink *sink;
  BMBiomeScheduler *scheduler;

  -[BPSSink cancel](self->_sink, "cancel");
  sink = self->_sink;
  self->_sink = 0;

  scheduler = self->_scheduler;
  self->_scheduler = 0;

}

- (ATXPOICategoryEventAggregator)streamAggregator
{
  return self->_streamAggregator;
}

- (void)setStreamAggregator:(id)a3
{
  objc_storeStrong((id *)&self->_streamAggregator, a3);
}

- (BMStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_storeStrong((id *)&self->_stream, a3);
}

- (BMBiomeScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (BPSSink)sink
{
  return self->_sink;
}

- (void)setSink:(id)a3
{
  objc_storeStrong((id *)&self->_sink, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_streamAggregator, 0);
}

@end
