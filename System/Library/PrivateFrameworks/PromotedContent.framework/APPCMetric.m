@implementation APPCMetric

- (int64_t)purpose
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___APPCMetric_purpose);
  swift_beginAccess();
  return *v2;
}

- (void)setPurpose:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___APPCMetric_purpose);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)metric
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___APPCMetric_metric);
  swift_beginAccess();
  return *v2;
}

- (void)setMetric:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___APPCMetric_metric);
  swift_beginAccess();
  *v4 = a3;
}

- (NSDate)timestamp
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1B1289620();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___APPCMetric_timestamp;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_1B12895E4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v8;
}

- (void)setTimestamp:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void (*v9)(char *, char *, uint64_t);
  APPCMetric *v10;
  uint64_t v11;

  v4 = sub_1B1289620();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B12895FC();
  v8 = (char *)self + OBJC_IVAR___APPCMetric_timestamp;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();

}

- (NSString)contentId
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___APPCMetric_contentId;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1B1289878();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setContentId:(id)a3
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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___APPCMetric_contentId);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSDictionary)properties
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___APPCMetric_properties);
  swift_beginAccess();
  if (!*v2)
    return (NSDictionary *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1B1289800();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (void)setProperties:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  if (a3)
    v4 = sub_1B128980C();
  else
    v4 = 0;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___APPCMetric_properties);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (APPCMetric)init
{
  APPCMetric *result;

  result = (APPCMetric *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___APPCMetric_timestamp;
  v3 = sub_1B1289620();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
