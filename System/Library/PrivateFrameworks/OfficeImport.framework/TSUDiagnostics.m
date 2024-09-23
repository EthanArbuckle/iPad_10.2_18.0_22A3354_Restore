@implementation TSUDiagnostics

+ (id)diagnosticDataDirectory
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 5, 1, 0, 1, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v3)
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("DiagnosticData"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4;
    v6 = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v9);
    v7 = v9;

    if ((v6 & 1) == 0 && TSUDefaultCat_init_token != -1)
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_32);
  }
  else
  {
    if (TSUDefaultCat_init_token != -1)
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_3);
    v5 = 0;
    v7 = v4;
  }

  return v5;
}

void __41__TSUDiagnostics_diagnosticDataDirectory__block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __41__TSUDiagnostics_diagnosticDataDirectory__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

@end
