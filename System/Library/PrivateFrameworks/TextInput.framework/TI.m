@implementation TI

void __TI_USER_DIRECTORY_block_invoke()
{
  void (*v0)(void);
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (void (*)(void))getCPSharedResourcesDirectorySymbolLoc_ptr;
  v8 = getCPSharedResourcesDirectorySymbolLoc_ptr;
  if (!getCPSharedResourcesDirectorySymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getCPSharedResourcesDirectorySymbolLoc_block_invoke;
    v4[3] = &unk_1E243AE68;
    v4[4] = &v5;
    __getCPSharedResourcesDirectorySymbolLoc_block_invoke((uint64_t)v4);
    v0 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v0();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("/Library"));
    v2 = objc_claimAutoreleasedReturnValue();

    TI_USER_DIRECTORY_default_user_directory = v2;
  }
  else
  {
    dlerror();
    v3 = abort_report_np();
    __getCPSharedResourcesDirectorySymbolLoc_block_invoke(v3);
  }
}

@end
