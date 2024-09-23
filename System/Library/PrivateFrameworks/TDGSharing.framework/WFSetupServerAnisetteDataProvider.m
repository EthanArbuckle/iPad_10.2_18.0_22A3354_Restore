@implementation WFSetupServerAnisetteDataProvider

- (CUMessageSession)session
{
  return (CUMessageSession *)sub_247CD1E8C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
}

- (void)setSession:(id)a3
{
  sub_247CD1F28((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
}

- (AKDevice)companionAuthDevice
{
  return (AKDevice *)sub_247CD1E8C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice);
}

- (void)setCompanionAuthDevice:(id)a3
{
  sub_247CD1F28((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice);
}

- (ACAccount)transportableAuthKitAccount
{
  return (ACAccount *)sub_247CD1E8C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount);
}

- (void)setTransportableAuthKitAccount:(id)a3
{
  sub_247CD1F28((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount);
}

- (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider)init
{
  return (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider *)WFSetupServerAnisetteDataProvider.init()();
}

- (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider)initWithCoder:(id)a3
{
  id v3;
  _TtC10TDGSharing33WFSetupServerAnisetteDataProvider *v4;

  v3 = a3;
  v4 = (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider *)sub_247CEEAE0();

  return v4;
}

- (void)provisionAnisetteWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC10TDGSharing33WFSetupServerAnisetteDataProvider *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_247CD1118;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  WFSetupServerAnisetteDataProvider.provisionAnisette(completion:)((void (*)(_QWORD, void *))v7, v6);
  sub_247CBDE58((uint64_t)v7);

}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  void *v5;
  _TtC10TDGSharing33WFSetupServerAnisetteDataProvider *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t (*v11)();
  _TtC10TDGSharing33WFSetupServerAnisetteDataProvider *v12;

  v5 = _Block_copy(a4);
  if (!a3)
  {
    v12 = self;
    v9 = 0xF000000000000000;
    if (v5)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    v10 = 0;
    goto LABEL_6;
  }
  v6 = self;
  v7 = a3;
  a3 = (id)sub_247CEF4FC();
  v9 = v8;

  if (!v5)
    goto LABEL_5;
LABEL_3:
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v5;
  v11 = sub_247CD1118;
LABEL_6:
  WFSetupServerAnisetteDataProvider.syncAnisette(withSIMData:completion:)((uint64_t)a3, v9, (void (*)(_QWORD, void *))v11, v10);
  sub_247CBDE58((uint64_t)v11);
  sub_247CB64F0((uint64_t)a3, v9);

}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(char, uint64_t);
  _TtC10TDGSharing33WFSetupServerAnisetteDataProvider *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_247CD10F4;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  WFSetupServerAnisetteDataProvider.eraseAnisette(completion:)((void (*)(_QWORD, void *))v7, v6);
  sub_247CBDE58((uint64_t)v7);

}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  _TtC10TDGSharing33WFSetupServerAnisetteDataProvider *v8;

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_247CD1114;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  WFSetupServerAnisetteDataProvider.fetchAnisetteDataAndProvisionIfNecessary(_:withCompletion:)(a3, (void (*)(_QWORD, _QWORD))v6, v7);
  sub_247CBDE58((uint64_t)v6);

}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _TtC10TDGSharing33WFSetupServerAnisetteDataProvider *v11;

  v6 = (void (*)(uint64_t, uint64_t))_Block_copy(a4);
  v7 = v6;
  if (!a3)
  {
    v8 = 0;
    if (v6)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v8 = sub_247CEF658();
  a3 = v9;
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v7;
  v7 = sub_247CD10EC;
LABEL_6:
  v11 = self;
  WFSetupServerAnisetteDataProvider.legacyAnisetteData(forDSID:withCompletion:)(v8, (uint64_t)a3, (void (*)(_QWORD, void *))v7, v10);
  sub_247CBDE58((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC10TDGSharing33WFSetupServerAnisetteDataProvider *v5;

  v4 = a3;
  v5 = self;
  WFSetupServerAnisetteDataProvider.encode(with:)((NSCoder)v4);

}

@end
