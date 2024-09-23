@implementation USUsageReporter

- (USUsageReporter)init
{
  USUsageReporter *v2;
  NSXPCConnection *v3;
  NSXPCConnection *xpcConnection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)USUsageReporter;
  v2 = -[USUsageReporter init](&v6, sel_init);
  v3 = +[USTrackingAgentPrivateConnection newConnection](USTrackingAgentPrivateConnection, "newConnection");
  xpcConnection = v2->_xpcConnection;
  v2->_xpcConnection = v3;

  -[NSXPCConnection resume](v2->_xpcConnection, "resume");
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)USUsageReporter;
  -[USUsageReporter dealloc](&v3, sel_dealloc);
}

+ (id)getLocalDeviceIdentifierAndReturnError:(id *)a3
{
  return +[USUsageQuerying getLocalDeviceIdentifierAndReturnError:](USUsageQuerying, "getLocalDeviceIdentifierAndReturnError:", a3);
}

- (id)getLocalDeviceIdentifierAndReturnError:(id *)a3
{
  return +[USUsageQuerying getLocalDeviceIdentifierAndReturnError:](USUsageQuerying, "getLocalDeviceIdentifierAndReturnError:", a3);
}

+ (void)synchronizeUsageWithCompletionHandler:(id)a3
{
  +[USUsageQuerying synchronizeUsageWithCompletionHandler:](USUsageQuerying, "synchronizeUsageWithCompletionHandler:", a3);
}

- (void)fetchReportsDuringInterval:(id)a3 partitionInterval:(double)a4 forceImmediateSync:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;

  v7 = a5;
  v11 = a3;
  v10 = a6;
  if (v7)
    objc_msgSend((id)objc_opt_class(), "synchronizeUsageWithCompletionHandler:", &__block_literal_global_1);
  -[USUsageReporter fetchReportsDuringInterval:partitionInterval:completionHandler:](self, "fetchReportsDuringInterval:partitionInterval:completionHandler:", v11, v10, a4);

}

void __101__USUsageReporter_fetchReportsDuringInterval_partitionInterval_forceImmediateSync_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __101__USUsageReporter_fetchReportsDuringInterval_partitionInterval_forceImmediateSync_completionHandler___block_invoke_cold_1((uint64_t)v2);

}

- (void)fetchReportsDuringInterval:(id)a3 partitionInterval:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  USUsageReporter *v15;
  id v16;
  double v17;

  v8 = a3;
  v9 = a5;
  -[USUsageReporter xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__USUsageReporter_fetchReportsDuringInterval_partitionInterval_completionHandler___block_invoke;
  v13[3] = &unk_24C7DB6E0;
  v17 = a4;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  +[USXPCRemoteObjectProxy proxyFromConnection:withRetryCount:proxyHandler:](USXPCRemoteObjectProxy, "proxyFromConnection:withRetryCount:proxyHandler:", v10, 1, v13);

}

void __82__USUsageReporter_fetchReportsDuringInterval_partitionInterval_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  if (a2)
  {
    v3 = *(double *)(a1 + 56);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __82__USUsageReporter_fetchReportsDuringInterval_partitionInterval_completionHandler___block_invoke_2;
    v5[3] = &unk_24C7DB6B8;
    v4 = *(_QWORD *)(a1 + 32);
    v5[4] = *(_QWORD *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    objc_msgSend(a2, "fetchReportsDuringInterval:partitionInterval:replyHandler:", v4, v5, v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __82__USUsageReporter_fetchReportsDuringInterval_partitionInterval_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)fetchUsageForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 interval:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2;
  v41 = __Block_byref_object_dispose__2;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  v36 = 0;
  -[USUsageReporter xpcConnection](self, "xpcConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __82__USUsageReporter_fetchUsageForApplications_webDomains_categories_interval_error___block_invoke;
  v24[3] = &unk_24C7DB730;
  v17 = v12;
  v25 = v17;
  v18 = v13;
  v26 = v18;
  v19 = v14;
  v27 = v19;
  v20 = v15;
  v28 = v20;
  v29 = &v37;
  v30 = &v31;
  +[USXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](USXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v16, 1, v24);

  if (a7)
  {
    v21 = (void *)v32[5];
    if (v21)
      *a7 = objc_retainAutorelease(v21);
  }
  v22 = (id)v38[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v22;
}

void __82__USUsageReporter_fetchUsageForApplications_webDomains_categories_interval_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  __int128 v12;

  v6 = a3;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __82__USUsageReporter_fetchUsageForApplications_webDomains_categories_interval_error___block_invoke_2;
    v11[3] = &unk_24C7DB708;
    v12 = *(_OWORD *)(a1 + 64);
    objc_msgSend(a2, "fetchUsageForApplications:webDomains:categories:interval:replyHandler:", v7, v8, v9, v10, v11);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
  }

}

void __82__USUsageReporter_fetchUsageForApplications_webDomains_categories_interval_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void **v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = v10;
  }
  else
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v5;
  }
  v8 = v7;
  v9 = *v6;
  *v6 = v8;

}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __101__USUsageReporter_fetchReportsDuringInterval_partitionInterval_forceImmediateSync_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error synchronizing with high urgency: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end
