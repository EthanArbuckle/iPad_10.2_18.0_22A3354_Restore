@implementation SiriAnalyticsDataVault

- (void)migrate
{
  SiriAnalyticsDataVault *v2;

  v2 = self;
  sub_1A02AD564();

}

- (id)vendAccessFor:(int64_t)a3 withEntitlements:(id)a4 auditToken:(id *)a5 readonly:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v7;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  SiriAnalyticsDataVault *v15;
  void *v16;

  v7 = a6;
  v10 = *(_QWORD *)a5->var0;
  v11 = *(_QWORD *)&a5->var0[2];
  v12 = *(_QWORD *)&a5->var0[4];
  v13 = *(_QWORD *)&a5->var0[6];
  v14 = sub_1A03078BC();
  v15 = self;
  sub_1A02AD888(a3, v14, v10, v11, v12, v13, v7);
  swift_bridgeObjectRelease();

  v16 = (void *)sub_1A03077A8();
  swift_bridgeObjectRelease();
  return v16;
}

- (id)vendedResourceUrlFor:(int64_t)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  SiriAnalyticsDataVault *v10;
  void *v11;
  uint64_t v13;

  v6 = sub_1A030725C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = self;
  sub_1A02ADC04(a3);

  v11 = (void *)sub_1A03071FC();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (SiriAnalyticsDataVault)init
{
  DataVault.init()();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___SiriAnalyticsDataVault_containingDirectory;
  v3 = sub_1A030725C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
