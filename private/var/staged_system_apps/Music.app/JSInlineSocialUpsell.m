@implementation JSInlineSocialUpsell

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore20JSInlineSocialUpsell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore20JSInlineSocialUpsell_subtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore20JSInlineSocialUpsell_primaryButtonTitle]);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore20JSInlineSocialUpsell_pendingPrimaryButtonSelectionPerformedContexts));
}

@end
