@implementation TPSBiomeDataProvider

- (void)registerWakingForEventWithEvent:(id)a3 registrationID:(id)a4 clientIdentifier:(id)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  TPSBiomeDataProvider *v15;

  v9 = _Block_copy(a6);
  v10 = sub_19A990D58();
  v12 = v11;
  if (a5)
    sub_19A990D58();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v9;
  v14 = a3;
  v15 = self;
  sub_19A98EA94(v14, v10, v12, sub_19A98EA54, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)deregisterWakingForAllRegistrations
{
  TPSBiomeDataProvider *v2;

  v2 = self;
  sub_19A98CEA0();

}

- (void)deregisterWakingForRegistrationID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  TPSBiomeDataProvider *v7;

  v4 = sub_19A990D58();
  v6 = v5;
  v7 = self;
  sub_19A98D4BC(v4, v6);

  swift_bridgeObjectRelease();
}

- (TPSBiomeDataProvider)init
{
  return (TPSBiomeDataProvider *)TipsBiomeDataProvider.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
