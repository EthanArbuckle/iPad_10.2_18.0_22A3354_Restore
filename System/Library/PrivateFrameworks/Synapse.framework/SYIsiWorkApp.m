@implementation SYIsiWorkApp

void __SYIsiWorkApp_block_invoke()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.iWork.Pages")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.iWork.Numbers")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.iWork.Keynote")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Pages")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Numbers")) & 1) != 0)
  {
    v1 = 1;
  }
  else
  {
    v1 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Keynote"));
  }
  SYIsiWorkApp___result = v1;

}

@end
