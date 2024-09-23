@implementation ArchiveRegisteredClients

void ___ArchiveRegisteredClients_block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)qword_1ECF22390;
  qword_1ECF22390 = (uint64_t)v0;

}

intptr_t ___ArchiveRegisteredClients_block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v10[16];

  v0 = (void *)MEMORY[0x19400CFE8]();
  _ArchiveFilePath();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _RegisteredClients();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v1)
  {
    if (v2)
    {
      PKLogFacilityTypeGetObject(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Archiving Scheduled Activities", v10, 2u);
      }

      v5 = (void *)MEMORY[0x1E0CB36F8];
      _RegisteredClients();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        objc_msgSend(v7, "writeToFile:atomically:", v1, 1);
      PKExcludePathFromBackup((uint64_t)v1);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _ArchiveFilePath();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeItemAtPath:error:", v8, 0);

    }
  }

  objc_autoreleasePoolPop(v0);
  return dispatch_semaphore_signal((dispatch_semaphore_t)qword_1ECF22390);
}

@end
