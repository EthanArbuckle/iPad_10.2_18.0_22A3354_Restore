@implementation JSRestrictions

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC11MusicJSCore14JSRestrictions_allowsExplicitContentObserver));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC11MusicJSCore14JSRestrictions_allowsMusicVideosObserver));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC11MusicJSCore14JSRestrictions_allowsMusicSubscriptionObserver));
}

@end
