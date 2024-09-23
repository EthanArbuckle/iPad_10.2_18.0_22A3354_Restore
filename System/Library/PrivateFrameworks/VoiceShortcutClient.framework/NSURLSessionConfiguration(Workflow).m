@implementation NSURLSessionConfiguration(Workflow)

+ (id)wf_defaultSessionConfiguration
{
  void *v1;

  objc_msgSend(a1, "defaultSessionConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "set_sourceApplicationBundleIdentifier:", CFSTR("com.apple.shortcuts"));
  return v1;
}

@end
