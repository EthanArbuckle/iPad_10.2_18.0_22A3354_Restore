@implementation JSApplicationMessage

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore20JSApplicationMessage_identifier]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore20JSApplicationMessage_contentPages));
}

@end
