@implementation OSAnalyticsHelperServiceConnection

void __OSAnalyticsHelperServiceConnection_block_invoke()
{
  xpc_connection_t mach_service;
  void *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  mach_service = xpc_connection_create_mach_service("com.apple.osanalytics.osanalyticshelper", 0, 2uLL);
  v1 = (void *)OSAnalyticsHelperServiceConnection_connection;
  OSAnalyticsHelperServiceConnection_connection = (uint64_t)mach_service;

  if (OSAnalyticsHelperServiceConnection_connection)
  {
    xpc_connection_set_event_handler((xpc_connection_t)OSAnalyticsHelperServiceConnection_connection, &__block_literal_global_3);
    xpc_connection_resume((xpc_connection_t)OSAnalyticsHelperServiceConnection_connection);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136446210;
    v3 = "com.apple.osanalytics.osanalyticshelper";
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Couldn't get XPC connection to %{public}s", (uint8_t *)&v2, 0xCu);
  }
}

void __OSAnalyticsHelperServiceConnection_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const char *string;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = v2;
  if (v2 != (id)MEMORY[0x1E0C81258]
    && MEMORY[0x1A85A8658](v2) == MEMORY[0x1E0C81310]
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81270]);
    v5 = 136446466;
    v6 = "com.apple.osanalytics.osanalyticshelper";
    v7 = 2082;
    v8 = string;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Got xpc error message from %{public}s: %{public}s\n", (uint8_t *)&v5, 0x16u);
  }

}

@end
