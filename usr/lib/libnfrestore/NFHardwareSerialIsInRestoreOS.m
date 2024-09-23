@implementation NFHardwareSerialIsInRestoreOS

void __NFHardwareSerialIsInRestoreOS_block_invoke()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    NFHardwareSerialIsInRestoreOS_inRestoreOS = CFBooleanGetValue(v0) != 0;
    CFRelease(v1);
  }
}

@end
