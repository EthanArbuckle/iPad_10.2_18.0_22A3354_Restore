@implementation JSPushNotificationObserver

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC11MusicJSCore26JSPushNotificationObserver_pushNotificationObserver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore26JSPushNotificationObserver_scriptingDrivenPushObservers));
}

@end
