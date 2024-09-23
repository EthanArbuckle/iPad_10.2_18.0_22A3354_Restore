@implementation JSSocialProfileVerticalStack

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore28JSSocialProfileVerticalStack_profile));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore28JSSocialProfileVerticalStack_artistPageLink));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore28JSSocialProfileVerticalStack_artistPageLinkTitle]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore28JSSocialProfileVerticalStack_followRequestsLink));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC11MusicJSCore28JSSocialProfileVerticalStack_profileDidUpdateNotificationObserver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore28JSSocialProfileVerticalStack_pendingFollowButtonSelectionPerformedContexts));
}

@end
