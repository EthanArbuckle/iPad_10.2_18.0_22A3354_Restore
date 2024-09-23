@implementation MetricPlaybackTracker

- (void)handleAppBackground
{
  swift_retain();
  if (sub_21A1A8ED8() != 2)
    *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12SeymourMedia21MetricPlaybackTracker_expectedWorkoutPlaybackPause) = 2;
  swift_release();
}

- (void)handlePlaybackInterrupted
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12SeymourMedia21MetricPlaybackTracker_expectedWorkoutPlaybackPause) = 4;
}

@end
