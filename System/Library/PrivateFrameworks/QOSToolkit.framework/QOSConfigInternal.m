@implementation QOSConfigInternal

- (int64_t)appTarget
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___QOSConfigInternal_appTarget);
}

- (NSString)locale
{
  void *v2;

  if (*(_QWORD *)&self->appTarget[OBJC_IVAR___QOSConfigInternal_locale])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_244EA11B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (QOSConfigInternal)initWithAppTarget:(int64_t)a3 locale:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t *v13;
  objc_super v15;

  if (a4)
  {
    v6 = sub_244EA11C4();
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v8 = (Class *)((char *)&self->super.isa + OBJC_IVAR___QOSConfigInternal_issuesUrl);
  *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.isa + OBJC_IVAR___QOSConfigInternal_locationUrl);
  *v9 = 0;
  v9[1] = 0;
  v10 = (char *)self + OBJC_IVAR___QOSConfigInternal_issueRefreshFrequencyInSecs;
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = (char *)self + OBJC_IVAR___QOSConfigInternal_locationRefreshFrequencyInSecs;
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = (char *)self + OBJC_IVAR___QOSConfigInternal_syncStartDelayOffsetInSecs;
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___QOSConfigInternal_appTarget) = (Class)a3;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___QOSConfigInternal_locale);
  *v13 = v6;
  v13[1] = v7;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for QOSConfig();
  return -[QOSConfigInternal init](&v15, sel_init);
}

- (QOSConfigInternal)init
{
  QOSConfigInternal *result;

  result = (QOSConfigInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
