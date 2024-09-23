@implementation SiriAnalyticsUnifiedMessageStreamHelper

+ (id)identifier
{
  void *v2;

  static UnifiedMessageStreamHelper.identifier()();
  v2 = (void *)sub_1A03077A8();
  swift_bridgeObjectRelease();
  return v2;
}

+ (void)ensureDirectoryExistsAt:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_1A030725C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A030722C();
  static UnifiedMessageStreamHelper.ensureDirectoryExists(at:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

+ (id)fileURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_1A030725C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UnifiedMessageStreamHelper.fileURL()((uint64_t)v5);
  v6 = (void *)sub_1A03071FC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

- (SiriAnalyticsUnifiedMessageStreamHelper)init
{
  return (SiriAnalyticsUnifiedMessageStreamHelper *)UnifiedMessageStreamHelper.init()();
}

@end
