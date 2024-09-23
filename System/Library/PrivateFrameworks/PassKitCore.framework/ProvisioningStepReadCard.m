@implementation ProvisioningStepReadCard

- (_TtC11PassKitCore24ProvisioningStepReadCard)init
{
  _TtC11PassKitCore24ProvisioningStepReadCard *result;

  result = (_TtC11PassKitCore24ProvisioningStepReadCard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_18FCD6F28(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_credential), *(_QWORD *)&self->context[OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_credential], *(_QWORD *)&self->credential[OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_credential], self->credential[OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_credential + 8]);

  sub_18FD4A1C4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_commonCompletion));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_readFailureTimeoutTimer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_eventCooldownTimer));
  sub_18FD4A1C4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_onDidStartPolling));
  sub_18FD4A1C4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_onDidFindCard));
  sub_18FD4A1C4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11PassKitCore24ProvisioningStepReadCard_onFailedToReadCard));
}

- (void)tapToProvisionReader:(id)a3 didUpdateWithEvent:(int64_t)a4
{
  id v6;
  _TtC11PassKitCore24ProvisioningStepReadCard *v7;

  v6 = a3;
  v7 = self;
  sub_18FDF3924(a4);

}

@end
