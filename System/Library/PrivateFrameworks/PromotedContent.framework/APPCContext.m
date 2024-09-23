@implementation APPCContext

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B11E40EC(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___APPCContext_denylistEvaluator));
  sub_1B11DF5D8((uint64_t)self + OBJC_IVAR___APPCContext_prefetchTimestamp, (uint64_t *)&unk_1ED391840);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (int64_t)hash
{
  APPCContext *v2;
  int64_t v3;

  v2 = self;
  v3 = Context.hash.getter();

  return v3;
}

- (void)dealloc
{
  APPCContext *v2;

  v2 = self;
  Context.__deallocating_deinit();
}

- (void)registerDenylistEvaluator:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();
  uint64_t v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___APPCContext_denylistEvaluator);
  v7 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___APPCContext_denylistEvaluator);
  *v6 = sub_1B1221FA4;
  v6[1] = (uint64_t (*)())v5;
  sub_1B11E40EC(v7);
}

- (NSString)debugDescription
{
  APPCContext *v2;
  void *v3;

  v2 = self;
  sub_1B123B80C();

  v3 = (void *)sub_1B1289878();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSDate)prefetchTimestamp
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = sub_1B11FFBAC((uint64_t *)&unk_1ED391840);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___APPCContext_prefetchTimestamp;
  swift_beginAccess();
  sub_1B11F4CF4((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_1ED391840);
  v7 = sub_1B1289620();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1B12895E4();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (void)setPrefetchTimestamp:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  APPCContext *v11;
  uint64_t v12;

  v5 = sub_1B11FFBAC((uint64_t *)&unk_1ED391840);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1B12895FC();
    v8 = sub_1B1289620();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1B1289620();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR___APPCContext_prefetchTimestamp;
  swift_beginAccess();
  v11 = self;
  sub_1B1201A60((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();

}

- (APPCContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 next:(id)a6 newsContext:(id)a7
{
  return (APPCContext *)sub_1B123C4E8(a3.width, a3.height, (uint64_t)self, (uint64_t)a2, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void *, double, double))Context.init(maxSize:requestedAd:current:next:newsContext:));
}

- (APPCContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 next:(id)a6
{
  return (APPCContext *)sub_1B123D944(a3.width, a3.height, (uint64_t)self, (uint64_t)a2, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, double, double))Context.init(maxSize:requestedAd:current:next:));
}

- (APPCContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 adjacent:(id)a6 newsContext:(id)a7
{
  return (APPCContext *)sub_1B123C4E8(a3.width, a3.height, (uint64_t)self, (uint64_t)a2, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void *, double, double))Context.init(maxSize:requestedAd:current:adjacent:newsContext:));
}

- (APPCContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 adjacent:(id)a6
{
  return (APPCContext *)sub_1B123D944(a3.width, a3.height, (uint64_t)self, (uint64_t)a2, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, double, double))Context.init(maxSize:requestedAd:current:adjacent:));
}

- (void)prefetchPromotedContentWithRequests:(id)a3
{
  unint64_t v4;
  APPCContext *v5;

  type metadata accessor for DesiredPlacement();
  v4 = sub_1B1289944();
  v5 = self;
  sub_1B123E520(v4);

  swift_bridgeObjectRelease();
}

- (id)promotedContentVideoWithSize:(CGSize)a3 placeholderReplacement:(id)a4
{
  double height;
  double width;
  void *v7;
  uint64_t v8;
  APPCContext *v9;
  void *v10;

  height = a3.height;
  width = a3.width;
  v7 = _Block_copy(a4);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = self;
  v10 = sub_1B1241258(3, (uint64_t)sub_1B1240F50, v8, width, height);

  swift_release();
  return v10;
}

- (id)promotedContentWithType:(int64_t)a3 size:(CGSize)a4 placeholderReplacement:(id)a5
{
  double height;
  double width;
  void *v9;
  uint64_t v10;
  APPCContext *v11;
  void *v12;

  height = a4.height;
  width = a4.width;
  v9 = _Block_copy(a5);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = self;
  v12 = sub_1B1241258(a3, (uint64_t)sub_1B1221FA4, v10, width, height);

  swift_release();
  return v12;
}

- (id)promotedContentWithoutFetchWithType:(int64_t)a3 size:(CGSize)a4
{
  double height;
  double width;
  APPCContext *v7;
  void *v8;

  height = a4.height;
  width = a4.width;
  v7 = self;
  v8 = (void *)sub_1B123E9C8(a3, width, height);

  return v8;
}

- (id)promotedContentInterstitialWithSize:(CGSize)a3 ready:(id)a4
{
  double height;
  double width;
  void *v7;
  uint64_t v8;
  APPCContext *v9;
  id v10;

  height = a3.height;
  width = a3.width;
  v7 = _Block_copy(a4);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = self;
  v10 = Context.promotedContentInterstitial(size:ready:)((uint64_t)sub_1B1240F50, v8, width, height);

  swift_release();
  return v10;
}

- (void)nativePromotedContentWithSize:(CGSize)a3 contentFetched:(id)a4
{
  double height;
  double width;
  void *v7;
  uint64_t v8;
  void *v9;
  APPCContext *v10;
  _QWORD v11[6];

  height = a3.height;
  width = a3.width;
  v7 = _Block_copy(a4);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v11[4] = sub_1B1240F50;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1B123B2E4;
  v11[3] = &unk_1E62E4E90;
  v9 = _Block_copy(v11);
  v10 = self;
  swift_retain();
  swift_release();
  -[APPCContext promotedContentNativeWithSize:contentFetched:](v10, sel_promotedContentNativeWithSize_contentFetched_, v9, width, height);
  _Block_release(v9);

  swift_release();
}

- (void)promotedContentNativeWithSize:(CGSize)a3 contentFetched:(id)a4
{
  double height;
  double width;
  void *v7;
  APPCContext *v8;

  height = a3.height;
  width = a3.width;
  v7 = _Block_copy(a4);
  _Block_copy(v7);
  v8 = self;
  sub_1B1240C30(v8, (void (**)(_QWORD, _QWORD))v7, width, height);
  _Block_release(v7);
  _Block_release(v7);

}

- (void)registerHandlerForAllMetricsWithClosure:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  APPCContext *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = qword_1ED390650;
  v7 = self;
  if (v6 != -1)
    swift_once();
  sub_1B12104EC((uint64_t)&qword_1ED3919F8, (uint64_t)v12);
  sub_1B11FCC70(v12, v12[3]);
  v8 = sub_1B1289638();
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_1B1235728;
  *(_QWORD *)(v11 + 24) = v5;
  swift_retain();
  sub_1B125AAF4(v8, v10, (uint64_t)sub_1B1246490, v11);
  swift_bridgeObjectRelease();
  swift_release();
  sub_1B11E2C70((uint64_t)v12);

  swift_release();
}

- (void)removeHandler
{
  uint64_t v2;
  APPCContext *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  v2 = qword_1ED390650;
  v3 = self;
  if (v2 != -1)
    swift_once();
  sub_1B12104EC((uint64_t)&qword_1ED3919F8, (uint64_t)v6);
  sub_1B11FCC70(v6, v6[3]);
  v4 = sub_1B1289638();
  sub_1B125AC9C(v4, v5);
  swift_bridgeObjectRelease();
  sub_1B11E2C70((uint64_t)v6);

}

@end
