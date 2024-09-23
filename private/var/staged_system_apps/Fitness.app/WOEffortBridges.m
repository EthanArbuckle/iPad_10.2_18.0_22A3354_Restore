@implementation WOEffortBridges

+ (id)makeHostingControllerWithStartingEffort:(id)a3 cancel:(id)a4 completion:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;

  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_10078B2C8, 24, 7);
  *(_QWORD *)(v9 + 16) = v7;
  v10 = swift_allocObject(&unk_10078B2F0, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  type metadata accessor for EffortUIController(0);
  v11 = a3;
  v12 = (void *)static EffortUIController.makeHostingController(shouldEmbedInNavStack:startingEffort:cancel:completion:)(1, a3, sub_100106890, v9, sub_10019B2A8, v10);

  swift_release(v9);
  swift_release(v10);
  return v12;
}

+ (void)saveWithQuantity:(id)a3 effortSampleCollection:(id)a4 workout:(id)a5 workoutActivity:(id)a6 healthStore:(id)a7 canSendAnalytics:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  sub_10019B1B4((uint64_t)a3, a4, (uint64_t)v16, (uint64_t)a6, (uint64_t)v18, a8);

}

+ (void)fetchExertionForWorkout:(id)a3 workoutActivity:(id)a4 healthStore:(id)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  __n128 v16;

  v9 = _Block_copy(a6);
  v10 = swift_allocObject(&unk_10078B278, 24, 7);
  *(_QWORD *)(v10 + 16) = v9;
  type metadata accessor for EffortUtilities(0, v11);
  v12 = swift_allocObject(&unk_10078B2A0, 32, 7);
  *(_QWORD *)(v12 + 16) = sub_10019B180;
  *(_QWORD *)(v12 + 24) = v10;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = swift_retain(v10);
  static EffortUtilities.fetchExertionCollection(forWorkout:activity:healthStore:completion:)(v13, a4, v15, sub_10019B1AC, v12, v16);

  swift_release(v10);
  swift_release(v12);
}

+ (id)demoExertionForWorkout:(id)a3
{
  id v4;
  void *v5;

  type metadata accessor for EffortUtilities(0, a2);
  v4 = a3;
  v5 = (void *)static EffortUtilities.fetchDemoExertion(forWorkout:)();

  return v5;
}

+ (void)sendDidViewTrainingLoadAnalyticsFromURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  type metadata accessor for EffortUtilities(0, v8);
  static EffortUtilities.sendDidViewTrainingLoadAnalytics(from:)(v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

+ (NSString)didUpdateDemoOverrideEffortValues
{
  if (qword_10081D648 != -1)
    swift_once(&qword_10081D648, sub_10019ABAC);
  return (NSString *)(id)qword_100869F88;
}

- (WOEffortBridges)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EffortBridges();
  return -[WOEffortBridges init](&v3, "init");
}

@end
