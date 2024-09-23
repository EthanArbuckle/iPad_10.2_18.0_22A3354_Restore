@implementation PCSMobileBackupStatus

void __PCSMobileBackupStatus_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("OFF");
    if (a2)
      v6 = CFSTR("ON");
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSMobileBackupStatus %@ error %@", (uint8_t *)&v7, 0x16u);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (v5 && *(_QWORD *)(a1 + 48))
    **(_QWORD **)(a1 + 48) = v5;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
