@implementation RBMaxPendingProcessStates

void ___RBMaxPendingProcessStates_block_invoke()
{
  NSObject *v0;
  size_t v1;
  int v2;
  uint8_t buf[4];
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = 0;
  v1 = 4;
  if (!sysctlbyname("kern.maxproc", &v2, &v1, 0, 0) && v2 >= 0x4B0)
    _RBMaxPendingProcessStates_maxPendingProcessStates = (v2 >> 1) + 100;
  rbs_process_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v4 = _RBMaxPendingProcessStates_maxPendingProcessStates;
    _os_log_impl(&dword_21A8B4000, v0, OS_LOG_TYPE_DEFAULT, "RBMaxPendingProcessStates is %u", buf, 8u);
  }

}

@end
