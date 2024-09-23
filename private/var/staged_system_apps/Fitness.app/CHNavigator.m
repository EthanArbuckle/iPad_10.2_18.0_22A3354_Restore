@implementation CHNavigator

+ (CHNavigator)sharedNavigator
{
  if (qword_10081DDA8 != -1)
    swift_once(&qword_10081DDA8, sub_10044A45C);
  return (CHNavigator *)(id)qword_10086AA20;
}

+ (NSString)scheme
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (BOOL)registerURLHandlerWithSlug:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  CHWorkoutDetailHeartRateTableViewCell *v8;
  CHWorkoutDetailHeartRateTableViewCell *v9;
  uint64_t v10;
  CHNavigator *v11;
  SEL v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_10079FC50, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = self;
  LOBYTE(v7) = sub_10044A4F4(v7, (uint64_t)v9, (uint64_t)sub_10044BD40, v10);

  swift_bridgeObjectRelease(v9, v12, v13, v14, v15, v16, v17, v18);
  swift_release(v10);
  return v7 & 1;
}

- (void)unregister:(id)a3
{
  uint64_t v4;
  CHWorkoutDetailHeartRateTableViewCell *v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;
  CHNavigator *v7;
  SEL v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_10044AB18(v4, (uint64_t)v6);

  swift_bridgeObjectRelease(v6, v8, v9, v10, v11, v12, v13, v14);
}

- (BOOL)navigateToURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  CHNavigator *v9;
  char v10;
  uint64_t v12;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10044AD80((uint64_t)v8);
  LOBYTE(a3) = v10;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a3 & 1;
}

- (id)regexFormattedURL:(id)a3
{
  uint64_t v4;
  CHWorkoutDetailHeartRateTableViewCell *v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;
  CHNavigator *v7;
  CHWorkoutDetailHeartRateTableViewCell *v8;
  CHWorkoutDetailHeartRateTableViewCell *v9;
  SEL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSString v17;
  SEL v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_10044BABC(v4, (uint64_t)v6);
  v9 = v8;

  swift_bridgeObjectRelease(v6, v10, v11, v12, v13, v14, v15, v16);
  v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9, v18, v19, v20, v21, v22, v23, v24);
  return v17;
}

- (CHNavigator)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHNavigator_urlKeys) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHNavigator_urlHandlers) = (Class)&_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Navigator();
  return -[CHNavigator init](&v3, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHNavigator_urlKeys));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHNavigator_urlHandlers));
}

@end
