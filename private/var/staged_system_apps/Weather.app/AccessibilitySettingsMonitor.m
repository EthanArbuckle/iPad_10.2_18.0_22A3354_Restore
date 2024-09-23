@implementation AccessibilitySettingsMonitor

- (void)postReduceMotionIfChanged
{
  sub_100127B64((uint64_t)self, (uint64_t)a2, (void (*)(__n128))sub_100952E48);
}

- (void)postSwitchControlIfChanged
{
  sub_100127B64((uint64_t)self, (uint64_t)a2, (void (*)(__n128))sub_100952FF4);
}

- (void)postVoiceOverIfChanged
{
  sub_100127B64((uint64_t)self, (uint64_t)a2, (void (*)(__n128))sub_1009531A0);
}

@end
