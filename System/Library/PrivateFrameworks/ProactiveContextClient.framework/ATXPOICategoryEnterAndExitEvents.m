@implementation ATXPOICategoryEnterAndExitEvents

- (ATXPOICategoryEnterAndExitEvents)initWithCategoryEvents:(id)a3 exitEvent:(id)a4
{
  id v7;
  id v8;
  ATXPOICategoryEnterAndExitEvents *v9;
  ATXPOICategoryEnterAndExitEvents *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXPOICategoryEnterAndExitEvents;
  v9 = -[ATXPOICategoryEnterAndExitEvents init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_categoryEnterEvents, a3);
    objc_storeStrong((id *)&v10->_exitEvent, a4);
  }

  return v10;
}

- (id)visitEvent
{
  return -[ATXPOICategoryEnterAndExitEvents visitEventAllowingMissingExit:](self, "visitEventAllowingMissingExit:", 0);
}

- (id)visitEventAllowingMissingExit:(BOOL)a3
{
  NSArray *categoryEnterEvents;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BMStoreEvent *exitEvent;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXPOICategoryVisitEvent *v14;
  void *v15;
  ATXPOICategoryVisitEvent *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (!a3 && !self->_exitEvent || (categoryEnterEvents = self->_categoryEnterEvents) == 0)
  {
LABEL_11:
    v16 = 0;
    return v16;
  }
  if (!-[NSArray count](categoryEnterEvents, "count"))
  {
    __atxlog_handle_anchor();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_2_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);

    goto LABEL_11;
  }
  -[NSArray objectAtIndexedSubscript:](self->_categoryEnterEvents, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  exitEvent = self->_exitEvent;
  v10 = v8;
  if (exitEvent)
  {
    -[BMStoreEvent eventBody](exitEvent, "eventBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NSArray sortedArrayUsingComparator:](self->_categoryEnterEvents, "sortedArrayUsingComparator:", &__block_literal_global_18_1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_20_1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [ATXPOICategoryVisitEvent alloc];
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v13);
  v16 = -[ATXPOICategoryVisitEvent initWithPossibleCategoryNames:startDate:endDate:hasExited:](v14, "initWithPossibleCategoryNames:startDate:endDate:hasExited:", v15, v8, v10, self->_exitEvent != 0);

  return v16;
}

uint64_t __66__ATXPOICategoryEnterAndExitEvents_visitEventAllowingMissingExit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rank");

  objc_msgSend(v4, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "rank");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  return v11;
}

id __66__ATXPOICategoryEnterAndExitEvents_visitEventAllowingMissingExit___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "poiCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)categoryEnterEvents
{
  return self->_categoryEnterEvents;
}

- (BMStoreEvent)exitEvent
{
  return self->_exitEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitEvent, 0);
  objc_storeStrong((id *)&self->_categoryEnterEvents, 0);
}

@end
