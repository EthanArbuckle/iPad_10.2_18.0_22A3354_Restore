@implementation UIImageCIImageRenderer

CGColorSpaceRef __51___UIImageCIImageRenderer__targetColorSpaceForHDR___block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9C8]);
  qword_1ECD79558 = (uint64_t)result;
  return result;
}

CGColorSpaceRef __51___UIImageCIImageRenderer__targetColorSpaceForHDR___block_invoke_2()
{
  void *v0;
  int v1;
  CFStringRef *v2;
  CGColorSpaceRef result;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_supportsDeepColor");

  v2 = (CFStringRef *)MEMORY[0x1E0C9D960];
  if (!v1)
    v2 = (CFStringRef *)MEMORY[0x1E0C9DA10];
  result = CGColorSpaceCreateWithName(*v2);
  qword_1ECD79568 = (uint64_t)result;
  return result;
}

@end
