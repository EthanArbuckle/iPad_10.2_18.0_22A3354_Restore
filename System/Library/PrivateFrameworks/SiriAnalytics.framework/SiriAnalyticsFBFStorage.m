@implementation SiriAnalyticsFBFStorage

- (SiriAnalyticsFBFStorage)initWithApplicationIdentifier:(id)a3 telemetry:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = sub_1A03077B4();
  v7 = v6;
  v8 = a4;
  return (SiriAnalyticsFBFStorage *)FBFStorageShim.init(applicationIdentifier:telemetry:)(v5, v7, (uint64_t)a4);
}

- (void)store:(id)a3 topic:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  SiriAnalyticsFBFStorage *v12;

  v7 = _Block_copy(a5);
  v8 = sub_1A03077B4();
  v10 = v9;
  _Block_copy(v7);
  v11 = a3;
  v12 = self;
  sub_1A02E9DEC((uint64_t)v11, v8, v10, (uint64_t)v12, (void (**)(_QWORD, _QWORD))v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (SiriAnalyticsFBFStorage)init
{
  FBFStorageShim.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SiriAnalyticsFBFStorage_underlying);
}

@end
