@implementation PLIsCamera

void __PLIsCamera_block_invoke()
{
  uint64_t v0;
  void *v1;
  char v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v0, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v0) = objc_msgSend(v1, "isEqualToString:", CFSTR("Camera"));
  if ((v0 & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = objc_msgSend(v4, "isEqualToString:", CFSTR("LockScreenCamera"));
  }
  PLIsCamera_isCamera = v2;
}

@end
