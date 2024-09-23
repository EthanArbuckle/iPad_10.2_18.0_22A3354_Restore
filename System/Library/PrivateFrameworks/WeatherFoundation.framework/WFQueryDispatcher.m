@implementation WFQueryDispatcher

- (WFQueryDispatcher)init
{
  WFQueryDispatcher *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableDictionary *queriesPendingResponse;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFQueryDispatcher;
  v2 = -[WFQueryDispatcher init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("LocationQueryDispatchQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_opt_new();
    queriesPendingResponse = v2->_queriesPendingResponse;
    v2->_queriesPendingResponse = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)dispatchQuery:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  NSObject *v16;
  WFQueryDispatcher *v17;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFQueryDispatcher queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __35__WFQueryDispatcher_dispatchQuery___block_invoke;
    v15[3] = &unk_24CCA17B0;
    v16 = v4;
    v17 = self;
    dispatch_async(v6, v15);

    v7 = v16;
  }
  else
  {
    WFLogForCategory(3uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WFQueryDispatcher dispatchQuery:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }

}

uint64_t __35__WFQueryDispatcher_dispatchQuery___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  WFLogForCategory(3uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __35__WFQueryDispatcher_dispatchQuery___block_invoke_cold_1(a1, v2);

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "queriesPendingResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (void)removePendingQueryWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  NSObject *v15;
  WFQueryDispatcher *v16;

  v4 = a3;
  if (v4)
  {
    -[WFQueryDispatcher queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __54__WFQueryDispatcher_removePendingQueryWithIdentifier___block_invoke;
    v14[3] = &unk_24CCA17B0;
    v15 = v4;
    v16 = self;
    dispatch_async(v5, v14);

    v6 = v15;
  }
  else
  {
    WFLogForCategory(3uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WFQueryDispatcher removePendingQueryWithIdentifier:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

void __54__WFQueryDispatcher_removePendingQueryWithIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  WFLogForCategory(3uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __54__WFQueryDispatcher_removePendingQueryWithIdentifier___block_invoke_cold_1(a1, v2, v3);

  objc_msgSend(*(id *)(a1 + 40), "queriesPendingResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

- (void)locationForCoordinate:(CLLocationCoordinate2D)a3 taskIdentifier:(id)a4 results:(id)a5
{
  double longitude;
  double latitude;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__WFQueryDispatcher_locationForCoordinate_taskIdentifier_results___block_invoke;
  v14[3] = &unk_24CCA2350;
  v15 = v9;
  v16 = v10;
  v14[4] = self;
  v11 = v9;
  v12 = v10;
  +[WFLocationQueryGeocode queryWithCoordinate:resultHandler:](WFLocationQueryGeocode, "queryWithCoordinate:resultHandler:", v14, latitude, longitude);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIdentifier:", v11);
  -[WFQueryDispatcher dispatchQuery:](self, "dispatchQuery:", v13);

}

uint64_t __66__WFQueryDispatcher_locationForCoordinate_taskIdentifier_results___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removePendingQueryWithIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)locationForString:(id)a3 taskIdentifier:(id)a4 results:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__WFQueryDispatcher_locationForString_taskIdentifier_results___block_invoke;
  v13[3] = &unk_24CCA2350;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v10 = v8;
  v11 = v9;
  +[WFLocationQueryGeocode queryWithSearchString:resultHandler:](WFLocationQueryGeocode, "queryWithSearchString:resultHandler:", a3, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIdentifier:", v10);
  -[WFQueryDispatcher dispatchQuery:](self, "dispatchQuery:", v12);

}

uint64_t __62__WFQueryDispatcher_locationForString_taskIdentifier_results___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removePendingQueryWithIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)locationForSearchCompletion:(id)a3 taskIdentifier:(id)a4 results:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__WFQueryDispatcher_locationForSearchCompletion_taskIdentifier_results___block_invoke;
  v13[3] = &unk_24CCA2350;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v10 = v8;
  v11 = v9;
  +[WFLocationQueryGeocode queryWithSearchCompletion:resultHandler:](WFLocationQueryGeocode, "queryWithSearchCompletion:resultHandler:", a3, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIdentifier:", v10);
  -[WFQueryDispatcher dispatchQuery:](self, "dispatchQuery:", v12);

}

uint64_t __72__WFQueryDispatcher_locationForSearchCompletion_taskIdentifier_results___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removePendingQueryWithIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)cancelTaskWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[WFQueryDispatcher queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WFQueryDispatcher_cancelTaskWithIdentifier___block_invoke;
  block[3] = &unk_24CCA17B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __46__WFQueryDispatcher_cancelTaskWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "queriesPendingResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "cancel");
}

- (void)invalidateCacheWithIdentifier:(id)a3
{
  NSObject *v3;

  -[WFQueryDispatcher queue](self, "queue", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v3, &__block_literal_global_20);

}

uint64_t __51__WFQueryDispatcher_invalidateCacheWithIdentifier___block_invoke()
{
  return +[WFLocationQueryGeocode invalidateCaches](WFLocationQueryGeocode, "invalidateCaches");
}

- (void)fetchFavoriteLocationsWithTaskIdentifier:(id)a3 results:(id)a4
{
  id v5;
  WFFavoriteLocationResponse *v6;
  void *v7;
  WFFavoriteLocationResponse *v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a4;
  v5 = a3;
  v6 = [WFFavoriteLocationResponse alloc];
  objc_msgSend(v5, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFFavoriteLocationResponse initWithIdentifier:favorites:](v6, "initWithIdentifier:favorites:", v7, 0);
  objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFResponse setError:](v8, "setError:", v9);

  if (v10)
    v10[2](v10, v8);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)queriesPendingResponse
{
  return self->_queriesPendingResponse;
}

- (void)setQueriesPendingResponse:(id)a3
{
  objc_storeStrong((id *)&self->_queriesPendingResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queriesPendingResponse, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)dispatchQuery:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_21189A000, a1, a3, "Cannot dispatch query without identifier", a5, a6, a7, a8, 0);
}

void __35__WFQueryDispatcher_dispatchQuery___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_21189A000, a2, v4, "Dispatching query %@", (uint8_t *)&v5);

}

- (void)removePendingQueryWithIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_21189A000, a1, a3, "Received query response without identifier!", a5, a6, a7, a8, 0);
}

void __54__WFQueryDispatcher_removePendingQueryWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_21189A000, a2, a3, "Finishing completed query %@", (uint8_t *)&v4);
}

@end
