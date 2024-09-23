@implementation WRWorkflowProvider

- (void)handleSettingsChanged:(BOOL)a3
{
  int v3;
  NSObject *v4;

  v3 = *__error();
  _wrlog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[WRWorkflowProvider handleSettingsChanged:].cold.1();

  *__error() = v3;
}

- (void)registerNotification
{
  OUTLINED_FUNCTION_14_0(&dword_24A5B4000, a2, a3, "Unable to register for tasking updated notifications: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9_0();
}

void __42__WRWorkflowProvider_registerNotification__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  id WeakRetained;

  v2 = *__error();
  _wrlog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __42__WRWorkflowProvider_registerNotification__block_invoke_cold_1();

  *__error() = v2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleSettingsChanged:", 0);

}

void __42__WRWorkflowProvider_registerNotification__block_invoke_180(uint64_t a1)
{
  int v2;
  NSObject *v3;
  id WeakRetained;

  v2 = *__error();
  _wrlog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __42__WRWorkflowProvider_registerNotification__block_invoke_180_cold_1();

  *__error() = v2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleSettingsChanged:", 0);

}

- (WRWorkflowProvider)initWithQueue:(id)a3
{
  id v5;
  WRWorkflowProvider *v6;
  WRWorkflowProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WRWorkflowProvider;
  v6 = -[WRWorkflowProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    *(_QWORD *)&v6->_taskingNotifyToken = -1;
    objc_storeStrong((id *)&v6->_callbackQueue, a3);
  }

  return v7;
}

- (void)dealloc
{
  int taskingNotifyToken;
  int wrSettingsChangedNotifyToken;
  objc_super v5;

  if (!self)
  {
    notify_cancel(0);
    wrSettingsChangedNotifyToken = 0;
LABEL_5:
    notify_cancel(wrSettingsChangedNotifyToken);
    goto LABEL_6;
  }
  taskingNotifyToken = self->_taskingNotifyToken;
  if (taskingNotifyToken != -1)
    notify_cancel(taskingNotifyToken);
  wrSettingsChangedNotifyToken = self->_wrSettingsChangedNotifyToken;
  if (wrSettingsChangedNotifyToken != -1)
    goto LABEL_5;
LABEL_6:
  v5.receiver = self;
  v5.super_class = (Class)WRWorkflowProvider;
  -[WRWorkflowProvider dealloc](&v5, sel_dealloc);
}

- (uint64_t)taskingNotifyToken
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

- (uint64_t)wrSettingsChangedNotifyToken
{
  if (result)
    return *(unsigned int *)(result + 12);
  return result;
}

+ (id)providerForAllWorkflowsWithQueue:(id)a3 callback:(id)a4
{
  id v5;
  id v6;
  WRWorkflowProviderAllWorkflows *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[WRWorkflowProviderAllWorkflows initWithQueue:callback:]([WRWorkflowProviderAllWorkflows alloc], "initWithQueue:callback:", v6, v5);

  -[WRWorkflowProvider registerNotification](v7);
  return v7;
}

+ (id)providerForWorkflowWithName:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v7;
  id v8;
  id v9;
  WRWorkflowProviderSingleWorkflow *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[WRWorkflowProviderSingleWorkflow initWithWorkflowName:queue:callback:]([WRWorkflowProviderSingleWorkflow alloc], "initWithWorkflowName:queue:callback:", v9, v8, v7);

  -[WRWorkflowProvider registerNotification](v10);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)handleSettingsChanged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_15_0(&dword_24A5B4000, v0, v1, "handleSettingsChanged must be overridden by subclass", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9_0();
}

void __42__WRWorkflowProvider_registerNotification__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_5_0(&dword_24A5B4000, v0, v1, "Received com.apple.da.tasking_changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9_0();
}

void __42__WRWorkflowProvider_registerNotification__block_invoke_180_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_5_0(&dword_24A5B4000, v0, v1, "Received com.apple.workflow_responsiveness.settings_changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9_0();
}

@end
