@implementation UIDeduplicatorCompat

- (id)identifyElementsWithScreenshot:(id)a3 rectArray:(id)a4 error:(id *)a5
{
  uint64_t v7;
  id v8;
  UIDeduplicatorCompat *v9;
  void *v10;

  type metadata accessor for CGRect(0);
  v7 = sub_24972CCD8();
  v8 = a3;
  v9 = self;
  sub_2496EEA18((uint64_t)v8, v7);
  swift_bridgeObjectRelease();

  type metadata accessor for DedupeElement();
  v10 = (void *)sub_24972CCCC();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)addElementsForScreenWithTargetScreenshot:(id)a3 candidateElements:(id)a4 screenGroupID:(id)a5 error:(id *)a6
{
  unint64_t v9;
  char *v10;
  UIDeduplicatorCompat *v11;
  _DWORD *v12;

  type metadata accessor for DedupeElement();
  v9 = sub_24972CCD8();
  if (a5)
    sub_24972CBB8();
  v10 = (char *)a3;
  v11 = self;
  v12 = sub_2496F1BA4(v10, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v12;
}

- (UIDeduplicatorCompat)initWithShape:(int64_t)a3 error:(id *)a4
{
  return (UIDeduplicatorCompat *)sub_2496F041C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))UIDeduplicator.init(shape:));
}

- (UIDeduplicatorCompat)initWithPlatform:(int64_t)a3 error:(id *)a4
{
  return (UIDeduplicatorCompat *)sub_2496F041C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))UIDeduplicator.init(platform:));
}

- (void)setDebugTo:(BOOL)a3
{
  UIDeduplicatorCompat *v4;

  v4 = self;
  sub_2496F0494(a3);

}

- (id)identifyScreenshotWithId:(id)a3 image:(CGImage *)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGImage *v10;
  UIDeduplicatorCompat *v11;
  void *v12;

  v7 = sub_24972CBB8();
  v9 = v8;
  v10 = a4;
  v11 = self;
  v12 = (void *)sub_2496F073C(v7, v9, v10);
  swift_bridgeObjectRelease();

  return v12;
}

- (UIDeduplicatorCompat)init
{
  UIDeduplicatorCompat *result;

  result = (UIDeduplicatorCompat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___UIDeduplicatorCompat_log;
  v3 = sub_24972C9C0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_release();
}

@end
