@implementation JSSocialOnboardingWelcomeViewModel

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore34JSSocialOnboardingWelcomeViewModel_headlineText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore34JSSocialOnboardingWelcomeViewModel_titleText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore34JSSocialOnboardingWelcomeViewModel_subtitleText]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore34JSSocialOnboardingWelcomeViewModel_artwork));
}

@end
