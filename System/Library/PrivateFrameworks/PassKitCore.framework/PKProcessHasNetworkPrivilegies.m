@implementation PKProcessHasNetworkPrivilegies

void __PKProcessHasNetworkPrivilegies_block_invoke()
{
  __CFString *v0;
  __CFString *v1;
  __CFString *v2;
  BOOL v3;
  char v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v0 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v1 = CFSTR("com.apple.Passbook.QuicklookPreviewExtension");
  v2 = v1;
  if (v0 == v1)
  {
    v4 = 0;
  }
  else
  {
    if (v0)
      v3 = v1 == 0;
    else
      v3 = 1;
    if (v3)
      v4 = 1;
    else
      v4 = -[__CFString isEqualToString:](v0, "isEqualToString:", v1) ^ 1;
  }

  byte_1ECF21C89 = v4;
}

@end
