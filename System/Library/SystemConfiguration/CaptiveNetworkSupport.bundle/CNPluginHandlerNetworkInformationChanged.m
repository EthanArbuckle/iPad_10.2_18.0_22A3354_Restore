@implementation CNPluginHandlerNetworkInformationChanged

void __CNPluginHandlerNetworkInformationChanged_block_invoke()
{
  NSObject *logger;
  os_log_type_t v1;
  uint8_t v2[16];

  logger = mysyslog_get_logger();
  v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_219EF1000, logger, v1, "checking for new Wi-Fi interfaces", v2, 2u);
  }
  NetIFCheckForNewInterfaces();
}

@end
