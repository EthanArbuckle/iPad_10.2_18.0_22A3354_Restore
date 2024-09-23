@implementation UIImageDummyImageContentRendering

void ___UIImageDummyImageContentRendering_block_invoke()
{
  void *v0;
  id v1;

  _UIKitPreferencesOnce();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("UIDummyImageContentRendering"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_67 = objc_msgSend(v0, "BOOLValue");

}

@end
