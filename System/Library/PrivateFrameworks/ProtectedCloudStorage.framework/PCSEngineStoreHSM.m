@implementation PCSEngineStoreHSM

intptr_t __PCSEngineStoreHSM_block_invoke(uint64_t a1, const void *a2)
{
  _QWORD *v4;

  if (a2)
  {
    PCSMigrationLog(objc_msgSend(*(id *)(a1 + 32), "log"), CFSTR("_PCSSecureBackupEnableWithInfo: %@"), a2);
    v4 = *(_QWORD **)(a1 + 56);
    if (v4)
    {
      *v4 = a2;
      CFRetain(a2);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __PCSEngineStoreHSM_block_invoke_2(uint64_t a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  const char *v6;

  v4 = objc_msgSend(*(id *)(a1 + 32), "log");
  v5 = objc_msgSend(*(id *)(a1 + 32), "newHSMContent");
  v6 = "Enable";
  if (!v5)
    v6 = "UpdateMetadata";
  PCSMigrationLog(v4, CFSTR("_PCSSecureBackup%sWithInfo: %@"), v6, a2);
  if (a2)
  {
    if (*(_QWORD *)(a1 + 56))
      **(_QWORD **)(a1 + 56) = CFRetain(a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end
