@implementation SSBDatabaseUpdateSupport

- (SSBDatabaseUpdateSupport)init
{
  SSBDatabaseUpdateSupport *v2;
  SSBDatabaseUpdateSupport *v3;
  SSBDatabaseUpdateSupport *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSBDatabaseUpdateSupport;
  v2 = -[SSBDatabaseUpdateSupport init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_onHighCellularDataPlan = 0;
    -[SSBDatabaseUpdateSupport _fetchCellularDataPlan](v2, "_fetchCellularDataPlan");
    v4 = v3;
  }

  return v3;
}

- (void)_fetchCellularDataPlanWithCompletionHandler:(id)a3
{
  id v4;
  CTCarrierSpaceClient *carrierSpaceClient;
  CTCarrierSpaceClient *v6;
  CTCarrierSpaceClient *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  carrierSpaceClient = self->_carrierSpaceClient;
  if (!carrierSpaceClient)
  {
    v6 = (CTCarrierSpaceClient *)objc_msgSend(objc_alloc(MEMORY[0x1E0D099A8]), "initWithQueue:", 0);
    v7 = self->_carrierSpaceClient;
    self->_carrierSpaceClient = v6;

    carrierSpaceClient = self->_carrierSpaceClient;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__SSBDatabaseUpdateSupport__fetchCellularDataPlanWithCompletionHandler___block_invoke;
  v9[3] = &unk_1EA3EC1D8;
  v10 = v4;
  v8 = v4;
  -[CTCarrierSpaceClient fetchDataPlanMetrics:](carrierSpaceClient, "fetchDataPlanMetrics:", v9);

}

void __72__SSBDatabaseUpdateSupport__fetchCellularDataPlanWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a3;
  if (v5)
  {
    v6 = SSBOSLogDatabase();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __72__SSBDatabaseUpdateSupport__fetchCellularDataPlanWithCompletionHandler___block_invoke_cold_1(v6, v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "domestic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "capacityBytes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);

  }
}

- (void)_fetchCellularDataPlan
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__SSBDatabaseUpdateSupport__fetchCellularDataPlan__block_invoke;
  v2[3] = &unk_1EA3EC200;
  v2[4] = self;
  -[SSBDatabaseUpdateSupport _fetchCellularDataPlanWithCompletionHandler:](self, "_fetchCellularDataPlanWithCompletionHandler:", v2);
}

uint64_t __50__SSBDatabaseUpdateSupport__fetchCellularDataPlan__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "integerValue");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = (result & 0xFFFFFFFFC0000000) != 0;
  return result;
}

- (id)fetchCellularDataPlanSynchronously
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  id v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = dispatch_semaphore_create(0);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SSBDatabaseUpdateSupport_fetchCellularDataPlanSynchronously__block_invoke;
  v7[3] = &unk_1EA3EC228;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  -[SSBDatabaseUpdateSupport _fetchCellularDataPlanWithCompletionHandler:](self, "_fetchCellularDataPlanWithCompletionHandler:", v7);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

intptr_t __62__SSBDatabaseUpdateSupport_fetchCellularDataPlanSynchronously__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "stringValue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)onHighCellularDataPlan
{
  return self->_onHighCellularDataPlan;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierSpaceClient, 0);
}

void __72__SSBDatabaseUpdateSupport__fetchCellularDataPlanWithCompletionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "ssb_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1DBCBE000, v3, OS_LOG_TYPE_ERROR, "Failed to get data plan metrics: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
