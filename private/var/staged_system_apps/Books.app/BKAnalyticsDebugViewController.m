@implementation BKAnalyticsDebugViewController

- (BKAnalyticsDebugViewController)init
{
  uint64_t v3;
  BKAnalyticsDebugViewController *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKAnalyticsDebugViewController_analyticsDatas) = (Class)_swiftEmptyArrayStorage;
  v3 = OBJC_IVAR___BKAnalyticsDebugViewController_analyticsJitterEnabled;
  v4 = self;
  *((_BYTE *)&self->super.super.super.super.isa + v3) = static Defaults.analyticsJitterSettingsEnabled.getter(v4) & 1;

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AnalyticsDebugViewController();
  return -[BKAnalyticsDebugViewController initWithStyle:](&v6, "initWithStyle:", 2);
}

- (BKAnalyticsDebugViewController)initWithCoder:(id)a3
{
  uint64_t v4;
  BKAnalyticsDebugViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKAnalyticsDebugViewController_analyticsDatas) = (Class)&_swiftEmptyArrayStorage;
  v4 = OBJC_IVAR___BKAnalyticsDebugViewController_analyticsJitterEnabled;
  *((_BYTE *)&self->super.super.super.super.isa + v4) = static Defaults.analyticsJitterSettingsEnabled.getter(a3) & 1;

  result = (BKAnalyticsDebugViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/AnalyticsDebugViewController.swift", 40, 2, 48, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  BKAnalyticsDebugViewController *v2;

  v2 = self;
  sub_100362F80();

}

- (void)jitterLowBoundTextFieldChangeWithTextField:(id)a3
{
  id v4;
  BKAnalyticsDebugViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100363C08(v4, (void (*)(uint64_t, __n128))&static Defaults.analyticsJitterLowBoundValue.setter);

}

- (void)jitterUpperBoundTextFieldChangeWithTextField:(id)a3
{
  id v4;
  BKAnalyticsDebugViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100363C08(v4, (void (*)(uint64_t, __n128))&static Defaults.analyticsJitterUpperBoundValue.setter);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAnalyticsDebugViewController_analyticsDatas))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  BKAnalyticsDebugViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_100363434(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return String._bridgeToObjectiveC()();
}

- (BKAnalyticsDebugViewController)initWithStyle:(int64_t)a3
{
  BKAnalyticsDebugViewController *result;

  result = (BKAnalyticsDebugViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.AnalyticsDebugViewController", 34, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (BKAnalyticsDebugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  BKAnalyticsDebugViewController *result;

  v4 = a4;
  result = (BKAnalyticsDebugViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.AnalyticsDebugViewController", 34, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR___BKAnalyticsDebugViewController_analyticsDatas));
}

@end
