@implementation AXSSoundDetectionState

void ____AXSSoundDetectionState_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFNumber *v1;
  const __CFNumber *v2;
  BOOL v3;
  CFTypeID v4;
  int valuePtr;
  char v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("_AXNotification_AXSEnabledSoundDetectionState"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v6 = 1;
  v1 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSEnabledSoundDetectionStatePreference, 0, &v6);
  v2 = v1;
  if (v6)
    v3 = v1 == 0;
  else
    v3 = 1;
  if (!v3)
  {
    v4 = CFGetTypeID(v1);
    if (v4 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      CFNumberGetValue(v2, kCFNumberIntType, &valuePtr);
      _kAXSCacheSoundDetectionState = valuePtr;
    }
    goto LABEL_10;
  }
  if (v1)
LABEL_10:
    CFRelease(v2);
}

@end
