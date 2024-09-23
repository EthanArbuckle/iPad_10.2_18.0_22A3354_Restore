@implementation ATXMicrolocationLocalization

- (ATXMicrolocationLocalization)init
{
  ATXMicrolocationLocalization *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  id v6;
  OS_dispatch_queue *v7;
  uint64_t v8;
  _PASSimpleCoalescingTimer *coalescingTimer;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ATXMicrolocationLocalization;
  v2 = -[ATXMicrolocationLocalization init](&v14, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.proactive.ProactiveContextClient.ATXMicrolocationLocalization.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc(MEMORY[0x1E0D81618]);
    v7 = v2->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __36__ATXMicrolocationLocalization_init__block_invoke;
    v11[3] = &unk_1E942DA58;
    objc_copyWeak(&v12, &location);
    v8 = objc_msgSend(v6, "initWithQueue:operation:", v7, v11);
    coalescingTimer = v2->_coalescingTimer;
    v2->_coalescingTimer = (_PASSimpleCoalescingTimer *)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __36__ATXMicrolocationLocalization_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_triggerMicroLocationLocalization");

}

- (void)initiateLocalization
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    v12 = 2048;
    v13 = 0x4082C00000000000;
    _os_log_impl(&dword_1D2C00000, v4, OS_LOG_TYPE_DEFAULT, "[%@][%@] Initiating localization scan in %f seconds", (uint8_t *)&v8, 0x20u);

  }
  -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_coalescingTimer, "runAfterDelaySeconds:coalescingBehavior:", 1, 600.0);
}

- (void)_triggerMicroLocationLocalization
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_modes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D2C00000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%@] Triggering localization scan now", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D4DE98], "requestCurrentMicroLocationWithAdditionalInformation:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
}

@end
