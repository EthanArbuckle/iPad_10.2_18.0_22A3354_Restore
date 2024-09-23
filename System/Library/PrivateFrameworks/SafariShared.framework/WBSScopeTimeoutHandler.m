@implementation WBSScopeTimeoutHandler

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

- (WBSScopeTimeoutHandler)initWithTimeout:(double)a3 autoBugCaptureDomain:(id)a4 detectedProcess:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  WBSScopeTimeoutHandler *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__WBSScopeTimeoutHandler_initWithTimeout_autoBugCaptureDomain_detectedProcess_context___block_invoke;
  v18[3] = &unk_1E4B2A5F8;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = -[WBSScopeTimeoutHandler initWithTimeout:handler:](self, "initWithTimeout:handler:", v18, a3);

  return v16;
}

- (WBSScopeTimeoutHandler)initWithTimeout:(double)a3 handler:(id)a4
{
  id v6;
  WBSScopeTimeoutHandler *v7;
  dispatch_block_t v8;
  id handler;
  dispatch_time_t v10;
  NSObject *v11;
  WBSScopeTimeoutHandler *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WBSScopeTimeoutHandler;
  v7 = -[WBSScopeTimeoutHandler init](&v14, sel_init);
  if (v7)
  {
    v8 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v6);
    handler = v7->_handler;
    v7->_handler = v8;

    v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_get_global_queue(9, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v10, v11, v7->_handler);

    v12 = v7;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_block_cancel(self->_handler);
  v3.receiver = self;
  v3.super_class = (Class)WBSScopeTimeoutHandler;
  -[WBSScopeTimeoutHandler dealloc](&v3, sel_dealloc);
}

- (WBSScopeTimeoutHandler)init
{

  return 0;
}

void __87__WBSScopeTimeoutHandler_initWithTimeout_autoBugCaptureDomain_detectedProcess_context___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;

  v2 = WBS_LOG_CHANNEL_PREFIXAutoBugCapture();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __87__WBSScopeTimeoutHandler_initWithTimeout_autoBugCaptureDomain_detectedProcess_context___block_invoke_cold_1(a1, v2);
  +[WBSAutomaticBugCaptureManager sharedManager](WBSAutomaticBugCaptureManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capturePerformanceTimeoutWithDomain:detectedProcess:context:", a1[4], a1[5], a1[6]);

}

void __87__WBSScopeTimeoutHandler_initWithTimeout_autoBugCaptureDomain_detectedProcess_context___block_invoke_cold_1(_QWORD *a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = 138543874;
  v6 = v2;
  v7 = 2114;
  v8 = v3;
  v9 = 2114;
  v10 = v4;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Timeout in domain %{public}@, process %{public}@, context %{public}@", (uint8_t *)&v5, 0x20u);
}

@end
