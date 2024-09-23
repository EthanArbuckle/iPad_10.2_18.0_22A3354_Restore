@implementation PRIsNonUIInstall

void __PRIsNonUIInstall_block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    PRIsNonUIInstall::isNonUIInstall = CFEqual(v0, CFSTR("NonUI")) != 0;
    CFRelease(v1);
  }
  else
  {
    PRIsNonUIInstall::isNonUIInstall = 0;
  }
}

@end
