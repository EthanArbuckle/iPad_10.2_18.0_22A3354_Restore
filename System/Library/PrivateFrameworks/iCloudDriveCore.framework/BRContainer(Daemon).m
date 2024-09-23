@implementation BRContainer(Daemon)

- (uint64_t)currentStatus
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  brc_bread_crumbs();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    -[BRContainer(Daemon) currentStatus].cold.1((uint64_t)v0, v1, v2, v3, v4, v5, v6, v7);

  return 1;
}

- (uint64_t)lastServerUpdate
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  brc_bread_crumbs();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    -[BRContainer(Daemon) lastServerUpdate].cold.1((uint64_t)v0, v1, v2, v3, v4, v5, v6, v7);

  return 0;
}

- (void)currentStatus
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] UNREACHABLE: -[BRContainer currentStatus] shouldn't be called by the daemon.%@", a5, a6, a7, a8, 2u);
}

- (void)lastServerUpdate
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] UNREACHABLE: -[BRContainer lastServerUpdate] shouldn't be called by the daemon.%@", a5, a6, a7, a8, 2u);
}

@end
