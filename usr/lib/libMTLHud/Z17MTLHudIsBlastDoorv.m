@implementation Z17MTLHudIsBlastDoorv

__CFBundle *___Z17MTLHudIsBlastDoorv_block_invoke()
{
  __CFBundle *result;
  const __CFString *v1;
  BOOL v2;

  result = CFBundleGetMainBundle();
  if (result)
  {
    result = (__CFBundle *)CFBundleGetIdentifier(result);
    if (result)
    {
      v1 = (const __CFString *)result;
      result = (__CFBundle *)CFStringCompare((CFStringRef)result, CFSTR("com.apple.MessagesBlastDoorService"), 0);
      if (result && (result = (__CFBundle *)CFStringCompare(v1, CFSTR("com.apple.MessagesAirlockService"), 0)) != 0)
      {
        result = (__CFBundle *)CFStringCompare(v1, CFSTR("com.apple.gputoolsserviced"), 0);
        v2 = result == 0;
      }
      else
      {
        v2 = 1;
      }
      MTLHudIsBlastDoor(void)::isBlastDoor = v2;
    }
  }
  return result;
}

@end
