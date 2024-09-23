@implementation JSStore

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11MusicJSCore7JSStore_asyncInitializer));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore7JSStore_storeFrontIdentifier]);
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11MusicJSCore7JSStore_urlBagObserver));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC11MusicJSCore7JSStore_accountStoreDidChangeObserver));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC11MusicJSCore7JSStore_socialProfileChangedNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC11MusicJSCore7JSStore_accountDidUpdateNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC11MusicJSCore7JSStore_privacyAcknowledgementObserver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore7JSStore_pendingUpdateAccountContexts));
}

@end
