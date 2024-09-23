@implementation ActivityViewController

- (id)_titleForActivity:(id)a3
{
  _TtC23ShelfKitCollectionViews22ActivityViewController *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v4 = self;
  v5 = a3;
  sub_1F6258((uint64_t)v5);
  v7 = v6;

  if (v7)
  {
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (_TtC23ShelfKitCollectionViews22ActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  _TtC23ShelfKitCollectionViews22ActivityViewController *result;

  result = (_TtC23ShelfKitCollectionViews22ActivityViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.ActivityViewController", 46, "init(activityItems:applicationActivities:)", 42, 0);
  __break(1u);
  return result;
}

@end
