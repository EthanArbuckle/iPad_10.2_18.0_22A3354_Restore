@implementation RCLockScreenCoordinator

- (BOOL)lockscreenWillDismissAfterRecording
{
  return (*((_BYTE *)&self->super.isa + OBJC_IVAR___RCLockScreenCoordinator_willPauseForRecording) & 1) == 0;
}

- (RCLockScreenCoordinator)init
{
  return (RCLockScreenCoordinator *)sub_1000B3C28();
}

- (void)lockScreenRecordingViewControllerWantsUnlockFromControl:(BOOL)a3
{
  sub_1000B405C(a3);
}

- (void)lockScreenRecordingViewWillPauseRecording
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___RCLockScreenCoordinator_willPauseForRecording) = 1;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___RCLockScreenCoordinator_cancellable));
}

@end
