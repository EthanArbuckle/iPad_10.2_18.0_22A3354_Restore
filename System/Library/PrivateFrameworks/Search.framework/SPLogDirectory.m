@implementation SPLogDirectory

void __SPLogDirectory_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(CFSTR("~/Library/Logs/CrashReporter/DiagnosticLogs/Search"), "stringByExpandingTildeInPath");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SPLogDirectory_sSPLogDirectory;
  SPLogDirectory_sSPLogDirectory = v0;

}

@end
