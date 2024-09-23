@implementation VUIScopedBackgroundTask

- (void)dealloc
{
  objc_super v3;

  -[VUIScopedBackgroundTask _endTask](self, "_endTask");
  v3.receiver = self;
  v3.super_class = (Class)VUIScopedBackgroundTask;
  -[VUIScopedBackgroundTask dealloc](&v3, sel_dealloc);
}

- (VUIScopedBackgroundTask)initWithIdentifier:(id)a3 expirationHandler:(id)a4
{
  id v6;
  id v7;
  VUIScopedBackgroundTask *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id location;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)VUIScopedBackgroundTask;
  v8 = -[VUIScopedBackgroundTask init](&v22, sel_init);
  if (v8)
  {
    objc_initWeak(&location, v8);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __64__VUIScopedBackgroundTask_initWithIdentifier_expirationHandler___block_invoke;
    v17 = &unk_1E9F99600;
    objc_copyWeak(&v20, &location);
    v9 = v6;
    v18 = v9;
    v19 = v7;
    v10 = _Block_copy(&v14);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "beginBackgroundTaskWithName:expirationHandler:", v9, v10);

    -[VUIScopedBackgroundTask setTaskIdentifier:](v8, "setTaskIdentifier:", v12);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  self->_taskIdentifier = a3;
}

- (void)_endTask
{
  unint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = -[VUIScopedBackgroundTask taskIdentifier](self, "taskIdentifier");
  v4 = *MEMORY[0x1E0DC4878];
  if (v3 != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endBackgroundTask:", -[VUIScopedBackgroundTask taskIdentifier](self, "taskIdentifier"));

    -[VUIScopedBackgroundTask setTaskIdentifier:](self, "setTaskIdentifier:", v4);
  }
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (VUIScopedBackgroundTask)init
{
  return -[VUIScopedBackgroundTask initWithIdentifier:expirationHandler:](self, "initWithIdentifier:expirationHandler:", 0, 0);
}

void __64__VUIScopedBackgroundTask_initWithIdentifier_expirationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v4;
      v8 = 2048;
      v9 = objc_msgSend(WeakRetained, "taskIdentifier");
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIScopedBackgroundTask with identifier %@ (%lu) expired. Ending background task", (uint8_t *)&v6, 0x16u);
    }

    objc_msgSend(WeakRetained, "_endTask");
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }

}

@end
