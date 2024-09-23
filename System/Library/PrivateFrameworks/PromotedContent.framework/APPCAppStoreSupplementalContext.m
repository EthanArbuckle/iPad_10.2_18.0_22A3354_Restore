@implementation APPCAppStoreSupplementalContext

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B11DF5D8((uint64_t)self + OBJC_IVAR___APPCAppStoreSupplementalContext_requestTime, (uint64_t *)&unk_1ED391840);
}

- (NSString)storeFront
{
  return (NSString *)sub_1B11EFEE0();
}

- (NSString)storeFrontLocale
{
  return (NSString *)sub_1B11EFEE0();
}

- (NSDictionary)impressionCap
{
  return (NSDictionary *)sub_1B125409C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCAppStoreSupplementalContext_impressionCap);
}

- (void)setImpressionCap:(id)a3
{
  sub_1B1254140((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCAppStoreSupplementalContext_impressionCap);
}

- (NSDictionary)clickCap
{
  return (NSDictionary *)sub_1B125409C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCAppStoreSupplementalContext_clickCap);
}

- (void)setClickCap:(id)a3
{
  sub_1B1254140((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCAppStoreSupplementalContext_clickCap);
}

- (NSDictionary)additionalImpressionCaps
{
  return (NSDictionary *)sub_1B12541FC();
}

- (void)setAdditionalImpressionCaps:(id)a3
{
  sub_1B1254294((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCAppStoreSupplementalContext_additionalImpressionCaps);
}

- (NSDictionary)additionalClickCaps
{
  return (NSDictionary *)sub_1B12541FC();
}

- (void)setAdditionalClickCaps:(id)a3
{
  sub_1B1254294((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCAppStoreSupplementalContext_additionalClickCaps);
}

- (NSString)adamId
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___APPCAppStoreSupplementalContext_adamId;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1B1289878();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setAdamId:(id)a3
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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___APPCAppStoreSupplementalContext_adamId);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSDictionary)appMetadataFields
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___APPCAppStoreSupplementalContext_appMetadataFields);
  swift_beginAccess();
  if (!*v2)
    return (NSDictionary *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1B1289800();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (void)setAppMetadataFields:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  if (a3)
    v4 = sub_1B128980C();
  else
    v4 = 0;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___APPCAppStoreSupplementalContext_appMetadataFields);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSDate)requestTime
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
  v6 = (char *)self + OBJC_IVAR___APPCAppStoreSupplementalContext_requestTime;
  swift_beginAccess();
  sub_1B11F16B4((uint64_t)v6, (uint64_t)v5);
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

- (void)setRequestTime:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  APPCAppStoreSupplementalContext *v11;
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
  v10 = (char *)self + OBJC_IVAR___APPCAppStoreSupplementalContext_requestTime;
  swift_beginAccess();
  v11 = self;
  sub_1B1201A60((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();

}

- (NSDictionary)dictionaryRepresentation
{
  APPCAppStoreSupplementalContext *v2;
  void *v3;

  v2 = self;
  sub_1B11EDD88();

  sub_1B11FFBAC(&qword_1ED391370);
  v3 = (void *)sub_1B1289800();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (id)copyWithZone:(void *)a3
{
  APPCAppStoreSupplementalContext *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_1B1254984(v6);

  sub_1B11FCC70(v6, v6[3]);
  v4 = (void *)sub_1B1289F38();
  sub_1B11E2C70((uint64_t)v6);
  return v4;
}

- (APPCAppStoreSupplementalContext)init
{
  APPCAppStoreSupplementalContext *result;

  result = (APPCAppStoreSupplementalContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
