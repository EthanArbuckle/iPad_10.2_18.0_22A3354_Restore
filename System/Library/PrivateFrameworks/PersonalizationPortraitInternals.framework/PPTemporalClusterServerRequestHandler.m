@implementation PPTemporalClusterServerRequestHandler

- (PPTemporalClusterServerRequestHandler)init
{
  PPTemporalClusterServerRequestHandler *v2;
  PPXPCServerPipelinedBatchQueryManager *v3;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPTemporalClusterServerRequestHandler;
  v2 = -[PPTemporalClusterServerRequestHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = -[PPXPCServerPipelinedBatchQueryManager initWithPipelineDepth:pipelinedCallTimeoutNsec:maxConcurrentRequestsPerConnection:]([PPXPCServerPipelinedBatchQueryManager alloc], "initWithPipelineDepth:pipelinedCallTimeoutNsec:maxConcurrentRequestsPerConnection:", 2, 10000000000, 4);
    queryManager = v2->_queryManager;
    v2->_queryManager = v3;

  }
  return v2;
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (void)unblockPendingQueries
{
  -[PPXPCServerPipelinedBatchQueryManager unblockPendingQueries](self->_queryManager, "unblockPendingQueries");
}

- (void)rankedTemporalClustersForStartDate:(id)a3 endDate:(id)a4 queryId:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  PPXPCServerPipelinedBatchQueryManager *queryManager;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  PPTemporalClusterServerRequestHandler *v17;
  unint64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  pp_xpc_server_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2048;
    v24 = a5;
    _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPTemporalClusterServer: rankedTemporalClustersForStartDate: %@ endDate: %@ queryId: %llu", buf, 0x20u);
  }

  queryManager = self->_queryManager;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke;
  v14[3] = &unk_1E7E1E8F0;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = a5;
  v12 = v9;
  v13 = v8;
  -[PPXPCServerPipelinedBatchQueryManager runConcurrentlyWithRequestThrottle:](queryManager, "runConcurrentlyWithRequestThrottle:", v14);

}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)setClientProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_queryManager, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

void __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];
  _QWORD v18[4];
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint8_t *v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  pp_temporal_clusters_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_temporal_clusters_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPTemporalClusterServer.rankedTemporalClustersForStartDate", ", buf, 2u);
  }

  +[PPLocalTemporalClusterStore defaultStore](PPLocalTemporalClusterStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  v8 = a1[5];
  v28 = 0;
  objc_msgSend(v6, "rankedTemporalClusterForStartDate:endDate:error:", v7, v8, &v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v28;

  pp_temporal_clusters_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v12, OS_SIGNPOST_INTERVAL_END, v3, "PPTemporalClusterServer.rankedTemporalClustersForStartDate", ", buf, 2u);
  }

  if (v10)
  {
    objc_msgSend(*(id *)(a1[6] + 8), "rankedTemporalClusterBatch:isLast:error:queryId:completion:", 0, 1, v10, a1[7], &__block_literal_global_12663);
  }
  else
  {
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x2020000000;
    v27 = 0;
    v13 = a1[7];
    v14 = *(void **)(a1[6] + 16);
    v15 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke_2;
    v21[3] = &unk_1E7E1D4F0;
    v22 = v9;
    v23 = buf;
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke_3;
    v18[3] = &unk_1E7E1D538;
    v16 = a1[7];
    v19 = a1[6];
    v20 = v16;
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke_5;
    v17[3] = &unk_1E7E1D560;
    v17[4] = v19;
    v17[5] = v16;
    objc_msgSend(v14, "sendBatchedResultForQueryWithName:queryId:batchGenerator:sendError:sendBatch:", CFSTR("rankedTemporalClustersForStartDate"), v13, v21, v18, v17);

    _Block_object_dispose(buf, 8);
  }

}

uint64_t __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke_2(uint64_t a1, BOOL *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = v4 - v5;
  if ((unint64_t)(v4 - v5) >= 5)
    v7 = 5;
  else
    v7 = v4 - v5;
  result = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:");
  *a2 = v6 < 6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v7;
  return result;
}

uint64_t __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rankedTemporalClusterBatch:isLast:error:queryId:completion:", 0, 1, a2, *(_QWORD *)(a1 + 40), &__block_literal_global_43);
}

uint64_t __92__PPTemporalClusterServerRequestHandler_rankedTemporalClustersForStartDate_endDate_queryId___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rankedTemporalClusterBatch:isLast:error:queryId:completion:", a2, a3, 0, *(_QWORD *)(a1 + 40), a4);
}

@end
