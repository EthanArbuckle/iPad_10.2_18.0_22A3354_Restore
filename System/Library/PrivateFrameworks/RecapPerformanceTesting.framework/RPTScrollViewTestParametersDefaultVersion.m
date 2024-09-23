@implementation RPTScrollViewTestParametersDefaultVersion

void ___RPTScrollViewTestParametersDefaultVersion_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForKey:", CFSTR("RPTScrollViewTestParametersForceVersion"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v2;
  if (v2)
  {
    _RPTScrollViewTestParametersDefaultVersion_version = objc_msgSend(v2, "integerValue");
    v1 = v2;
  }

}

@end
