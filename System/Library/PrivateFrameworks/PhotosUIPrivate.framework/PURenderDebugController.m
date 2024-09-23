@implementation PURenderDebugController

+ (void)setCoreImageDebugMode:(BOOL)a3 dumpInputs:(BOOL)a4 dumpOutputs:(BOOL)a5 dumpIntermediates:(BOOL)a6 dumpTiming:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;

  if (!a3)
    return;
  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v12, "appendString:", CFSTR("4 pdf"));
  if (!v10)
  {
    if (!v9)
      goto LABEL_4;
LABEL_10:
    objc_msgSend(v12, "appendString:", CFSTR(" dump-outputs"));
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v12, "appendString:", CFSTR(" dump-inputs"));
  if (v9)
    goto LABEL_10;
LABEL_4:
  if (v7)
LABEL_5:
    objc_msgSend(v12, "appendString:", CFSTR(" dump-timing"));
LABEL_6:
  if (v8)
  {
    setenv("CI_DISABLE_MERGING", "1", 1);
    objc_msgSend(v12, "appendString:", CFSTR(" dump-intermediates"));
  }
  else
  {
    unsetenv("CI_DISABLE_MERGING");
  }
  v14 = objc_retainAutorelease(v12);
  setenv("CI_PRINT_TREE", (const char *)objc_msgSend(v14, "cStringUsingEncoding:", 1), 1);
  objc_msgSend(a1, "debugFilesDirectory");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  setenv("CI_TEMP_DIR", (const char *)objc_msgSend(v13, "UTF8String"), 1);

}

+ (id)debugFilesDirectory
{
  void *v2;
  void *v3;
  void *v4;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("NURenderDebug/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

  return v3;
}

+ (id)getDebugFiles
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  objc_msgSend(a1, "debugFilesDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__PURenderDebugController_getDebugFiles__block_invoke;
  v11[3] = &unk_1E589BEB8;
  v12 = v2;
  v6 = v5;
  v13 = v6;
  v7 = v2;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

+ (void)deleteDebugDirectory
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "debugFilesDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PURenderDebugController_deleteDebugDirectory__block_invoke;
  v6[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v6[4] = a1;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

+ (id)listDebugFilesViewController
{
  return objc_alloc_init(PUDebugImageTableViewController);
}

+ (id)shareSheetViewController
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D96D28]);
  objc_msgSend(a1, "getDebugFiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithActivityItems:applicationActivities:", v4, 0);

  return v5;
}

void __47__PURenderDebugController_deleteDebugDirectory__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "debugFilesDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);

}

void __40__PURenderDebugController_getDebugFiles__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "containsString:", CFSTR("pdf")) & 1) != 0
    || objc_msgSend(v6, "containsString:", CFSTR("txt")))
  {
    objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

@end
