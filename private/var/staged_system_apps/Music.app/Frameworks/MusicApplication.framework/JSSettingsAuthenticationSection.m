@implementation JSSettingsAuthenticationSection

- (NSString)description
{
  _TtC11MusicJSCore31JSSettingsAuthenticationSection *v2;
  NSString v3;

  v2 = self;
  JSSettingsAuthenticationSection.description.getter();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore31JSSettingsAuthenticationSection_identifierLabelText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore31JSSettingsAuthenticationSection_identifierFieldPlaceholder]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore31JSSettingsAuthenticationSection_passwordLabelText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore31JSSettingsAuthenticationSection_passwordFieldPlaceholder]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore31JSSettingsAuthenticationSection_submitButtonText]);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore31JSSettingsAuthenticationSection_forgotCredentialsLink));
}

@end
