@implementation PCSRestoreCKBackup

void __PCSRestoreCKBackup_block_invoke(uint64_t a1, int a2, int a3, int a4, void *a5)
{
  id v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109890;
    v10[1] = a2;
    v11 = 1024;
    v12 = a3;
    v13 = 1024;
    v14 = a4;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSRestoreCKBackupWithCompletion returned recoverIssue %u missing %u present %u error: %@", (uint8_t *)v10, 0x1Eu);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
