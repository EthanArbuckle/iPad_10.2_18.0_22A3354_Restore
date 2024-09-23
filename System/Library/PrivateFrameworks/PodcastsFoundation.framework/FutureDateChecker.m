@implementation FutureDateChecker

+ (_TtC18PodcastsFoundation17FutureDateChecker)sharedInstance
{
  return (_TtC18PodcastsFoundation17FutureDateChecker *)sub_1A92F6C8C((uint64_t)a1, (uint64_t)a2, &qword_1EEAB6F48, (id *)&qword_1ED2A1CB8);
}

+ (_TtC18PodcastsFoundation17FutureDateChecker)lenientSharedInstance
{
  return (_TtC18PodcastsFoundation17FutureDateChecker *)sub_1A92F6C8C((uint64_t)a1, (uint64_t)a2, &qword_1ED2A24C0, (id *)&qword_1ED2A24B8);
}

+ (BOOL)sharedInstanceShouldAssertTestsOnly
{
  if (qword_1EEAB6F48 != -1)
    swift_once();
  return *(_BYTE *)(qword_1ED2A1CB8 + OBJC_IVAR____TtC18PodcastsFoundation17FutureDateChecker_assertOnFutures);
}

+ (void)setSharedInstanceShouldAssertTestsOnly:(BOOL)a3
{
  if (qword_1EEAB6F48 != -1)
    swift_once();
  *(_BYTE *)(qword_1ED2A1CB8 + OBJC_IVAR____TtC18PodcastsFoundation17FutureDateChecker_assertOnFutures) = a3;
}

- (BOOL)isFutureWithTimestamp:(double)a3 boundBy:(double)a4
{
  return sub_1A92F7630(a3, a4);
}

- (BOOL)isFutureWithTimestamp:(double)a3
{
  _TtC18PodcastsFoundation17FutureDateChecker *v4;
  double v5;
  BOOL v6;

  v4 = self;
  sub_1A93F72E4();
  v6 = sub_1A92F7630(a3, v5);

  return v6;
}

- (BOOL)isFutureWithDate:(id)a3 boundBy:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _TtC18PodcastsFoundation17FutureDateChecker *v20;
  _TtC18PodcastsFoundation17FutureDateChecker *v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  void (*v26)(char *, uint64_t);
  uint64_t v28;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD360);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v28 - v10;
  v12 = sub_1A93F738C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v28 - v17;
  sub_1A93F7368();
  if (a4)
  {
    sub_1A93F7368();
    v19 = 0;
  }
  else
  {
    v19 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, v19, 1, v12);
  sub_1A90A1CA8((uint64_t)v11, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v12) == 1)
  {
    v20 = self;
    sub_1A93F7380();
    sub_1A90AC3A4((uint64_t)v8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v8, v12);
    v21 = self;
  }
  sub_1A93F72D8();
  v23 = v22;
  sub_1A93F72D8();
  v25 = sub_1A92F7630(v23, v24);
  v26 = *(void (**)(char *, uint64_t))(v13 + 8);
  v26(v15, v12);

  sub_1A90AC3A4((uint64_t)v11);
  v26(v18, v12);
  return v25;
}

- (double)timestamp:(double)a3 boundBy:(double)a4
{
  if (sub_1A92F7630(a3, a4))
    return a4;
  else
    return a3;
}

- (double)timestampForDate:(id)a3 boundBy:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtC18PodcastsFoundation17FutureDateChecker *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  void (*v18)(char *, uint64_t);
  uint64_t v20;

  v5 = sub_1A93F738C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - v10;
  sub_1A93F7368();
  sub_1A93F7368();
  v12 = self;
  sub_1A93F72D8();
  v14 = v13;
  sub_1A93F72D8();
  v16 = v15;
  v17 = sub_1A92F7630(v14, v15);

  if (v17)
    v14 = v16;
  v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  v18(v8, v5);
  v18(v11, v5);
  return v14;
}

- (double)timestampBoundByNow:(double)a3
{
  _TtC18PodcastsFoundation17FutureDateChecker *v4;
  double v5;
  double v6;
  BOOL v7;

  v4 = self;
  sub_1A93F72E4();
  v6 = v5;
  v7 = sub_1A92F7630(a3, v5);

  if (v7)
    return v6;
  else
    return a3;
}

- (double)timestampBoundByNowForDate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18PodcastsFoundation17FutureDateChecker *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v14;

  v4 = sub_1A93F738C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93F7368();
  v8 = self;
  sub_1A93F72D8();
  v10 = v9;
  sub_1A93F72E4();
  v12 = v11;
  LOBYTE(self) = sub_1A92F7630(v10, v11);

  if ((self & 1) != 0)
    v10 = v12;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

- (_TtC18PodcastsFoundation17FutureDateChecker)init
{
  _TtC18PodcastsFoundation17FutureDateChecker *result;

  result = (_TtC18PodcastsFoundation17FutureDateChecker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
