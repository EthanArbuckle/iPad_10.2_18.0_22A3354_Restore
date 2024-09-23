@implementation NSURLSession

void __42__NSURLSession_Workflow__wf_sharedSession__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "sharedSession");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "copy");

  objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", CFSTR("com.apple.shortcuts"));
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v5);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)wf_sharedSession_sharedSession;
  wf_sharedSession_sharedSession = v3;

}

@end
