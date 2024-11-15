@implementation WRWorkflowProviderAllWorkflows

- (WRWorkflowProviderAllWorkflows)initWithQueue:(id)a3 callback:(id)a4
{
  id v6;
  WRWorkflowProviderAllWorkflows *v7;
  uint64_t v8;
  id callback;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WRWorkflowProviderAllWorkflows;
  v7 = -[WRWorkflowProvider initWithQueue:](&v11, sel_initWithQueue_, a3);
  if (v7)
  {
    v8 = MEMORY[0x24BD14614](v6);
    callback = v7->_callback;
    v7->_callback = (id)v8;

  }
  return v7;
}

- (void)handleSettingsChanged:(BOOL)a3
{
  const char *v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  id i;
  const char *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  SEL v18;
  NSObject *Property;
  _QWORD v20[5];
  id v21;

  +[WRWorkflow allWorkflows](WRWorkflow, "allWorkflows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3
    || (!self ? (v7 = 0) : (v7 = objc_getProperty(self, v5, 24, 1)),
        v8 = objc_msgSend(v7, "count"),
        v8 != objc_msgSend(v6, "count")))
  {
LABEL_21:
    if (self)
    {
      objc_setProperty_atomic(self, v5, v6, 24);
      Property = objc_getProperty(self, v18, 16, 1);
    }
    else
    {
      Property = 0;
    }
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __56__WRWorkflowProviderAllWorkflows_handleSettingsChanged___block_invoke;
    v20[3] = &unk_251BE4C48;
    v20[4] = self;
    v21 = v6;
    dispatch_async(Property, v20);

  }
  else
  {
    v9 = 0;
    if (!self)
      goto LABEL_15;
LABEL_6:
    for (i = objc_getProperty(self, v5, 24, 1); v9 < objc_msgSend(i, "count"); i = 0)
    {
      if (self)
        v12 = objc_getProperty(self, v11, 24, 1);
      else
        v12 = 0;
      objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v13
        && v14
        && (!objc_msgSend(v13, "isEqual:", v14)
         || (objc_msgSend(v13, "hasChangesRelativeTo:", v15) & 1) != 0))
      {

        goto LABEL_21;
      }

      ++v9;
      if (self)
        goto LABEL_6;
LABEL_15:
      ;
    }
    v16 = *__error();
    _wrlog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[WRWorkflowProviderAllWorkflows handleSettingsChanged:].cold.1();

    *__error() = v16;
  }

}

- (id)workflows
{
  if (result)
    return objc_getProperty(result, a2, 24, 1);
  return result;
}

- (void)setWorkflows:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 24);
}

uint64_t __56__WRWorkflowProviderAllWorkflows_handleSettingsChanged___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t (**Property)(id, _QWORD);

  Property = (uint64_t (**)(id, _QWORD))objc_getProperty(*(id *)(a1 + 32), a2, 32, 1);
  return Property[2](Property, *(_QWORD *)(a1 + 40));
}

- (id)callback
{
  if (result)
    return objc_getProperty(result, a2, 32, 1);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_workflows, 0);
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
  OUTLINED_FUNCTION_5_0(&dword_24A5B4000, v0, v1, "No changes in any workflow after tasking notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9_0();
}

@end
