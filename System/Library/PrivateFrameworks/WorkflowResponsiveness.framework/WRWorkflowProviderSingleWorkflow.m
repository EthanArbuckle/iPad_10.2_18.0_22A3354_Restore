@implementation WRWorkflowProviderSingleWorkflow

- (WRWorkflowProviderSingleWorkflow)initWithWorkflowName:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  WRWorkflowProviderSingleWorkflow *v10;
  uint64_t v11;
  NSString *workflowName;
  uint64_t v13;
  id callback;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WRWorkflowProviderSingleWorkflow;
  v10 = -[WRWorkflowProvider initWithQueue:](&v16, sel_initWithQueue_, a4);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    workflowName = v10->_workflowName;
    v10->_workflowName = (NSString *)v11;

    v13 = MEMORY[0x24BD14614](v9);
    callback = v10->_callback;
    v10->_callback = (id)v13;

  }
  return v10;
}

- (void)handleSettingsChanged:(BOOL)a3
{
  id Property;
  const char *v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  const char *v10;
  id v11;
  unint64_t v12;
  id v13;
  const char *v14;
  void *v15;
  char v16;
  int v17;
  char *v18;
  SEL v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (self)
    Property = objc_getProperty(self, a2, 24, 1);
  else
    Property = 0;
  +[WRWorkflow workflowWithName:](WRWorkflow, "workflowWithName:", Property);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (self)
      objc_getProperty(self, v6, 24, 1);
    v8 = *__error();
    _wrlog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (self)
        v11 = objc_getProperty(self, v10, 24, 1);
      else
        v11 = 0;
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl(&dword_24A5B4000, v9, OS_LOG_TYPE_INFO, "%{public}@: No workflow with name", buf, 0xCu);
    }

    *__error() = v8;
  }
  if (a3)
  {
LABEL_26:
    if (!self)
    {
      v20 = 0;
      goto LABEL_28;
    }
LABEL_27:
    objc_setProperty_atomic(self, v6, (id)v7, 32);
    v20 = objc_getProperty(self, v19, 16, 1);
LABEL_28:
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __58__WRWorkflowProviderSingleWorkflow_handleSettingsChanged___block_invoke;
    v21[3] = &unk_251BE4C48;
    v21[4] = self;
    v22 = (id)v7;
    dispatch_async(v20, v21);

    goto LABEL_29;
  }
  if (self)
    v12 = (unint64_t)objc_getProperty(self, v6, 32, 1);
  else
    v12 = 0;
  if (!(v7 | v12))
    goto LABEL_29;
  if (!self)
  {
    v15 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v13 = objc_getProperty(self, v6, 32, 1);
  v15 = v13;
  if (!v7 || !v13)
    goto LABEL_25;
  v16 = objc_msgSend(objc_getProperty(self, v14, 32, 1), "hasChangesRelativeTo:", v7);

  if ((v16 & 1) != 0)
    goto LABEL_27;
  objc_getProperty(self, v6, 24, 1);
  v17 = *__error();
  _wrlog();
  v18 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEBUG))
    -[WRWorkflowProviderSingleWorkflow handleSettingsChanged:].cold.1(self, v18);

  *__error() = v17;
LABEL_29:

}

- (id)workflowName
{
  if (result)
    return objc_getProperty(result, a2, 24, 1);
  return result;
}

- (id)workflow
{
  if (result)
    return objc_getProperty(result, a2, 32, 1);
  return result;
}

- (void)setWorkflow:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 32);
}

uint64_t __58__WRWorkflowProviderSingleWorkflow_handleSettingsChanged___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t (**Property)(id, _QWORD);

  Property = (uint64_t (**)(id, _QWORD))objc_getProperty(*(id *)(a1 + 32), a2, 40, 1);
  return Property[2](Property, *(_QWORD *)(a1 + 40));
}

- (id)callback
{
  if (result)
    return objc_getProperty(result, a2, 40, 1);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_workflowName, 0);
}

- (void)handleSettingsChanged:(void *)a1 .cold.1(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_getProperty(a1, a2, 24, 1);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_34(&dword_24A5B4000, a2, v3, "%{public}@: No changes after tasking notification", v4);
}

@end
