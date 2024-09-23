@implementation SAUIPluginSnippet(SiriVOX)

- (BOOL)svx_isResponseViewIdPresent
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "responseViewId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

@end
