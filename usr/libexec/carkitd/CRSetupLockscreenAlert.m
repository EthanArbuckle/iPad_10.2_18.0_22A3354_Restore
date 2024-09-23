@implementation CRSetupLockscreenAlert

- (id)lockscreenMessage
{
  return (id)CRLocalizedStringForKey(CFSTR("CARPLAY_LOCKSCREEN_MESSAGE_IPHONE"), a2);
}

- (BOOL)dismissOnUnlock
{
  return 1;
}

@end
