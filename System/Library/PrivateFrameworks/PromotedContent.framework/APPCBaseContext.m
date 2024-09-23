@implementation APPCBaseContext

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___APPCBaseContext_identifier;
  v4 = sub_1B1289674();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSUUID)identifier
{
  return (NSUUID *)(id)sub_1B1289644();
}

- (APPCPromotableContentDepiction)current
{
  return (APPCPromotableContentDepiction *)(id)swift_unknownObjectRetain();
}

- (CGSize)maxSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR___APPCBaseContext_maxSize);
  v3 = *(double *)&self->adjacentInternal[OBJC_IVAR___APPCBaseContext_maxSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSArray)next
{
  return (NSArray *)sub_1B124544C();
}

- (NSArray)adjacent
{
  return (NSArray *)sub_1B124544C();
}

- (NSString)requestedAd
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___APPCBaseContext_requestedAd;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1B1289878();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setRequestedAd:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_1B1289884();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___APPCBaseContext_requestedAd);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (APPCBaseContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 next:(id)a6
{
  return (APPCBaseContext *)sub_1B123D944(a3.width, a3.height, (uint64_t)self, (uint64_t)a2, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, double, double))BaseContext.init(maxSize:requestedAd:current:next:));
}

- (APPCBaseContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 adjacent:(id)a6
{
  return (APPCBaseContext *)sub_1B123D944(a3.width, a3.height, (uint64_t)self, (uint64_t)a2, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, double, double))BaseContext.init(maxSize:requestedAd:current:adjacent:));
}

- (APPCBaseContext)init
{
  APPCBaseContext *result;

  result = (APPCBaseContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
