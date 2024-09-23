@implementation RPCompanionLinkClient(TVRemoteCore)

- (void)tvrc_setAllowedTVs
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[RPCompanionLinkClient(TVRemoteCore) tvrc_setAllowedTVs]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_21A51B000, a2, OS_LOG_TYPE_DEBUG, "%s setting allowedTVs to %@", (uint8_t *)&v2, 0x16u);
}

@end
