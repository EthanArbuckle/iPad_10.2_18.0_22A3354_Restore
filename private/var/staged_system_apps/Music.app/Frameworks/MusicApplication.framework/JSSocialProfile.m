@implementation JSSocialProfile

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore15JSSocialProfile_editProfileLink));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore15JSSocialProfile_rawFolloweeStates));
}

@end
