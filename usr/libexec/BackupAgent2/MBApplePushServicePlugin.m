@implementation MBApplePushServicePlugin

- (BOOL)shouldRestoreContentWithPolicy:(id)a3 atPath:(id)a4
{
  return !objc_msgSend(a4, "isEqualToString:", CFSTR("/var/mobile/Library/Preferences/com.apple.apsd.plist"))|| (objc_msgSend(a3, "isRestoringToSameDevice") & 1) != 0|| (objc_msgSend(objc_msgSend(a3, "osBuildVersionOfBackup"), "hasPrefix:", CFSTR("8A")) & 1) == 0;
}

@end
