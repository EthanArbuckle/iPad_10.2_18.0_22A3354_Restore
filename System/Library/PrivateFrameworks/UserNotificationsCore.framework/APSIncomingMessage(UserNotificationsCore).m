@implementation APSIncomingMessage(UserNotificationsCore)

- (const)unc_pushTypeDescription
{
  uint64_t v1;
  const __CFString *result;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  v1 = objc_msgSend(a1, "pushType");
  result = CFSTR("Unknown");
  if (v1 <= 15)
  {
    switch(v1)
    {
      case 0:
        result = CFSTR("None");
        break;
      case 1:
        result = CFSTR("Complication");
        break;
      case 2:
        result = CFSTR("VoIP");
        break;
      case 4:
        result = CFSTR("Background");
        break;
      case 8:
        result = CFSTR("Alert");
        break;
      default:
        return result;
    }
  }
  else
  {
    v3 = CFSTR("Location");
    v4 = CFSTR("Wallet");
    v5 = CFSTR("LiveActivity");
    if (v1 != 1024)
      v5 = CFSTR("Unknown");
    if (v1 != 512)
      v4 = v5;
    if (v1 != 128)
      v3 = v4;
    v6 = CFSTR("FileProvider");
    v7 = CFSTR("MDM");
    v8 = CFSTR("Widget");
    if (v1 != 64)
      v8 = CFSTR("Unknown");
    if (v1 != 32)
      v7 = v8;
    if (v1 != 16)
      v6 = v7;
    if (v1 <= 127)
      return v6;
    else
      return v3;
  }
  return result;
}

@end
