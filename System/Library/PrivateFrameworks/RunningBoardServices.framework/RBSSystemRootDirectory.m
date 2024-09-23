@implementation RBSSystemRootDirectory

void __RBSSystemRootDirectory_block_invoke()
{
  CFStringRef v0;
  void *v1;

  v0 = CFStringCreateWithFileSystemRepresentation(0, "/");
  v1 = (void *)RBSSystemRootDirectory___SystemRootDirectory;
  RBSSystemRootDirectory___SystemRootDirectory = (uint64_t)v0;

}

@end
