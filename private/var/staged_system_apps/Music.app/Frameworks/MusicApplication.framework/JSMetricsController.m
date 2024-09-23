@implementation JSMetricsController

- (void)sessionDidConnect:(id)a3
{
  if ((*((_BYTE *)&self->super.super.isa
        + OBJC_IVAR____TtC11MusicJSCore19JSMetricsController_carPlayMetricsRecordingState) & 1) == 0)
    *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC11MusicJSCore19JSMetricsController_carPlayMetricsRecordingState) = 1;
}

- (void)sessionDidDisconnect:(id)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC11MusicJSCore19JSMetricsController_carPlayMetricsRecordingState) = 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore19JSMetricsController_carSessionStatus));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC11MusicJSCore19JSMetricsController_playStartNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC11MusicJSCore19JSMetricsController_playEndNotificationObserver));
}

@end
