@implementation PASUIProxiedTermsHandler

- (_TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler)init
{
  _TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler *result;

  result = (_TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_proxiedDevice));
  sub_220D5CDB4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptAction));
  sub_220D5CDB4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_declineAction));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  if (v4)
    sub_220D68A60();
  else
    sub_220D68FFC();

}

- (void)genericTermsRemoteUI:(id)a3 acceptedTermsInfo:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler *v8;

  if (a4)
  {
    v6 = sub_220D99304();
    v7 = a3;
    v8 = self;
    sub_220D68908(v6);

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

@end
