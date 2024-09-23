@implementation SSKMirroredDisplayControllerProvider

- (id)displayControllerForDisplay:(id)a3 configuration:(id)a4
{
  id v5;
  NSObject *v6;
  SSKMirroredDisplayController *v7;

  v5 = a3;
  if (objc_msgSend(v5, "isMainDisplay"))
  {
    SSKLogDisplayControlling();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SSKMirroredDisplayControllerProvider displayControllerForDisplay:configuration:].cold.1((uint64_t)self, (uint64_t)v5, v6);

    v7 = 0;
  }
  else
  {
    v7 = objc_alloc_init(SSKMirroredDisplayController);
  }

  return v7;
}

- (void)displayControllerForDisplay:(os_log_t)log configuration:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_245FEA000, log, OS_LOG_TYPE_ERROR, "[%@] ignoring request for mirrored display controller on main display [%@]", (uint8_t *)&v3, 0x16u);
}

@end
