@implementation PCSSyncingSetupInterface

Class ___PCSSyncingSetupInterface_block_invoke()
{
  void (*v0)(void);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t i;
  Class result;
  uint64_t v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (initCloudKit_onceToken != -1)
    dispatch_once(&initCloudKit_onceToken, &__block_literal_global_103);
  v0 = (void (*)(void))dlsym((void *)cloudKit, "CKAcceptableValueClasses");
  if (!v0)
    PCSAbort("symbol %s is missing", v1, v2, v3, v4, v5, v6, v7, (char)"CKAcceptableValueClasses");
  v8 = v0;
  v9 = (void *)MEMORY[0x1E0C99E60];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)_PCSSyncingSetupInterface_keyClasses;
  _PCSSyncingSetupInterface_keyClasses = v11;

  v13 = (void *)MEMORY[0x1E0C99E20];
  v8();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithSet:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)_PCSSyncingSetupInterface_errClasses;
  _PCSSyncingSetupInterface_errClasses = v15;

  v17 = (void *)MEMORY[0x1E0C99E60];
  v23 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)_PCSSyncingSetupInterface_statsClasses;
  _PCSSyncingSetupInterface_statsClasses = v19;

  for (i = 0; i != 5; ++i)
  {
    result = objc_getClass(off_1E553EB98[i]);
    if (result)
      result = (Class)objc_msgSend((id)_PCSSyncingSetupInterface_errClasses, "addObject:", result);
  }
  return result;
}

@end
