@implementation NSStringFromLockScreenCapabilities

void *__NSStringFromLockScreenCapabilities_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *result;

  v2 = 0;
  if (a2 <= 15)
  {
    switch(a2)
    {
      case -1:
        v2 = CFSTR("All");
        break;
      case 0:
        v2 = CFSTR("None");
        break;
      case 2:
        v2 = CFSTR("Siri");
        break;
      case 4:
        v2 = CFSTR("Camera");
        break;
      case 8:
        v2 = CFSTR("Unlock");
        break;
      default:
        break;
    }
  }
  else
  {
    v3 = CFSTR("TodayCenter");
    v4 = CFSTR("ControlCenter");
    v5 = CFSTR("Screenshot");
    if (a2 != 512)
      v5 = 0;
    if (a2 != 256)
      v4 = v5;
    if (a2 != 128)
      v3 = v4;
    v6 = CFSTR("Logout");
    v7 = CFSTR("TouchID");
    v8 = CFSTR("MediaControls");
    if (a2 != 64)
      v8 = 0;
    if (a2 != 32)
      v7 = v8;
    if (a2 != 16)
      v6 = v7;
    if (a2 <= 127)
      v2 = v6;
    else
      v2 = v3;
  }
  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "addObject:", v2);
  return result;
}

@end
