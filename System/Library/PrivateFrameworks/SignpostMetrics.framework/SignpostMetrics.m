void *_MXSignpostMetricsSnapshot(void)
{
  if (_MXSignpostMetricsSnapshot_onceToken != -1)
    dispatch_once(&_MXSignpostMetricsSnapshot_onceToken, &__block_literal_global_3);
  return (void *)_MXSignpostMetricsSnapshot_snapshotter;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

uint64_t pc_session_create()
{
  return MEMORY[0x24BEDD5E0]();
}

uint64_t pc_session_create_snapshot_buf()
{
  return MEMORY[0x24BEDD5E8]();
}

uint64_t pc_session_set_procpid()
{
  return MEMORY[0x24BEDD618]();
}

