@implementation InitIORegistryPropertyProxy

void __InitIORegistryPropertyProxy_block_invoke()
{
  uint64_t v0;
  void *v1;
  const char *v2;
  uint8_t buf[4];
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Init IOKRegistryEntry get property proxy", buf, 2u);
  }
  +[TSXDaemonServiceClient sharedDaemonServiceClient](TSXDaemonServiceClient, "sharedDaemonServiceClient");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gProxyDaemonServiceClient;
  gProxyDaemonServiceClient = v0;

  gIORegistryProxyEnabled = os_parse_boot_arg_int() ^ 1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    if (gIORegistryProxyEnabled)
      v2 = "enabled";
    else
      v2 = "not enabled";
    *(_DWORD *)buf = 136315138;
    v4 = v2;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "timesync_disable_ioregistry_proxy is %s\n", buf, 0xCu);
  }
}

@end
