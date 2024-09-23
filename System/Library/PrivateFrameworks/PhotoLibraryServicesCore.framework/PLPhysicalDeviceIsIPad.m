@implementation PLPhysicalDeviceIsIPad

void __PLPhysicalDeviceIsIPad_block_invoke()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  PLPhysicalDeviceIsIPad___isIPad = CFEqual(v0, CFSTR("iPad")) != 0;
  if (v0)
    CFRelease(v0);
}

@end
