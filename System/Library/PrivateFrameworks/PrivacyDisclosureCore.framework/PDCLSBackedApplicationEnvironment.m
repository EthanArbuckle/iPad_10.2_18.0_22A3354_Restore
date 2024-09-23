@implementation PDCLSBackedApplicationEnvironment

- (PDCLSBackedApplicationEnvironment)init
{
  PDCLSBackedApplicationEnvironment *v2;
  uint64_t v3;
  LSApplicationWorkspace *workspace;
  PDCLSBackedApplicationEnvironment *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDCLSBackedApplicationEnvironment;
  v2 = -[PDCLSBackedApplicationEnvironment init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v3 = objc_claimAutoreleasedReturnValue();
    workspace = v2->_workspace;
    v2->_workspace = (LSApplicationWorkspace *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)applicationRecordForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v9;

  v3 = a3;
  v9 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v9);
  v5 = v9;
  if (v5)
  {
    v6 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PDCLSBackedApplicationEnvironment applicationRecordForBundleIdentifier:].cold.1((uint64_t)v3, (uint64_t)v5, v6);
    v7 = 0;
  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (id)applicationIdentityForIdentityString:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDC1530];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithIdentityString:", v4);

  return v5;
}

- (id)monitorAppEventsWithDelegate:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  PDCApplicationEnvironmentMonitoringHandle *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PDCApplicationEnvironmentMonitoringHandle initWithWorkspace:delegate:queue:]([PDCApplicationEnvironmentMonitoringHandle alloc], "initWithWorkspace:delegate:queue:", self->_workspace, v7, v6);

  -[LSApplicationWorkspace addObserver:](self->_workspace, "addObserver:", v8);
  return v8;
}

- (NSEnumerator)allApplications
{
  return (NSEnumerator *)objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspace, 0);
}

- (void)applicationRecordForBundleIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2449FF000, log, OS_LOG_TYPE_ERROR, "Failed to look up record for app %@, error %@", (uint8_t *)&v3, 0x16u);
}

@end
