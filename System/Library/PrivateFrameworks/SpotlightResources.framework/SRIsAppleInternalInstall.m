@implementation SRIsAppleInternalInstall

void __SRIsAppleInternalInstall_block_invoke()
{
  char v0;
  id v1;

  v1 = (id)MGCopyAnswer();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v0 = objc_msgSend(v1, "isEqualToString:", CFSTR("Internal"));
  else
    v0 = 0;
  SRIsAppleInternalInstall_isInternalInstall = v0;

}

@end
