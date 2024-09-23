@implementation SAAudioAppPredictor

- (SAAudioAppPredictor)init
{
  SAAudioAppPredictor *result;

  result = (SAAudioAppPredictor *)sub_2297DD55C();
  __break(1u);
  return result;
}

- (SAAudioAppPredictor)initWithCaller:(int64_t)a3
{
  return (SAAudioAppPredictor *)SiriAudioAppPredictor.init(caller:)(a3);
}

- (void)warmWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  SAAudioAppPredictor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_229689470((uint64_t)sub_22968E9F8, v5);

  swift_release();
}

- (void)disambiguationSelectedWithBundleIdentifier:(id)a3 requestId:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  SAAudioAppPredictor *v11;

  v5 = sub_2297DCE60();
  v7 = v6;
  v8 = sub_2297DCE60();
  v10 = v9;
  v11 = self;
  sub_22968E534(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)predictWithSearch:(id)a3 options:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  SAAudioAppPredictor *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_22968AC0C(v10, v11, (uint64_t)sub_22968E9E8, v9);

  swift_release();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SAAudioAppPredictor_selector);
}

@end
