@implementation UIViewController(PrototypeTools_PhotosUI)

- (uint64_t)pu_debugIsTransient
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("com.apple.photosui.debugTransient"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)pu_debugSetTransient:()PrototypeTools_PhotosUI
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("com.apple.photosui.debugTransient"), v2, (void *)1);

}

@end
