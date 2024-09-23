@implementation NSError(SiriUI)

- (uint64_t)isSiriUISnippetPluginError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SiriUI.SnippetPlugin.ErrorDomain"));

  return v2;
}

@end
