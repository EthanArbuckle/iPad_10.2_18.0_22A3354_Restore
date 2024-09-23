@implementation JSApplication

- (void)dealloc
{
  _TtC11MusicJSCore13JSApplication *v2;

  v2 = self;
  JSApplication.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_64880((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore13JSApplication_scriptingMessageDelegate);
  sub_64880((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore13JSApplication_globalMessagePresentationDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_56024((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore13JSApplication_sharedWithYouMetadata, &qword_1511E70);
  swift_release();
  sub_F04368(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingBecomingActiveContext), *(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingBecomingActiveContext], *(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingBecomingActiveContext+ 8], *(_QWORD *)&self->super.isNativeOnly[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingBecomingActiveContext], *(void **)&self->scriptingMessageDelegate[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingBecomingActiveContext]);
  sub_F04368(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingInitiateSubscriptionContext), *(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingInitiateSubscriptionContext], *(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingInitiateSubscriptionContext+ 8], *(_QWORD *)&self->super.isNativeOnly[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingInitiateSubscriptionContext], *(void **)&self->scriptingMessageDelegate[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingInitiateSubscriptionContext]);
  swift_bridgeObjectRelease();
  sub_F04368(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyOnboardingPresentationStatusChangedContext), *(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyOnboardingPresentationStatusChangedContext], *(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyOnboardingPresentationStatusChangedContext+ 8], *(_QWORD *)&self->super.isNativeOnly[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyOnboardingPresentationStatusChangedContext], *(void **)&self->scriptingMessageDelegate[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyOnboardingPresentationStatusChangedContext]);
  sub_F04368(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyTermsAcceptedContext), *(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyTermsAcceptedContext], *(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyTermsAcceptedContext+ 8], *(_QWORD *)&self->super.isNativeOnly[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyTermsAcceptedContext], *(void **)&self->scriptingMessageDelegate[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyTermsAcceptedContext]);
  sub_F04368(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingApplicationMessageSegueContext), *(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingApplicationMessageSegueContext], *(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingApplicationMessageSegueContext+ 8], *(_QWORD *)&self->super.isNativeOnly[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingApplicationMessageSegueContext], *(void **)&self->scriptingMessageDelegate[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingApplicationMessageSegueContext]);
}

@end
