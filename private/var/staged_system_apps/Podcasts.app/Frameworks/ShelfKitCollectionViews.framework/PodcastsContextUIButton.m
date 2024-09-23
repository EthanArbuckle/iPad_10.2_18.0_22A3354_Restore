@implementation PodcastsContextUIButton

- (NSArray)accessibilityCustomActions
{
  _TtC23ShelfKitCollectionViews23PodcastsContextUIButton *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_149F10();

  if (v3)
  {
    sub_E710(0, &qword_3D8348, UIAccessibilityCustomAction_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityCustomActions:(id)a3
{
  void *isa;
  uint64_t v5;
  uint64_t v6;
  _TtC23ShelfKitCollectionViews23PodcastsContextUIButton *v7;
  _TtC23ShelfKitCollectionViews23PodcastsContextUIButton *v8;
  objc_super v9;

  isa = a3;
  if (a3)
  {
    v5 = sub_E710(0, &qword_3D8348, UIAccessibilityCustomAction_ptr);
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, v5);
    v7 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v8 = self;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PodcastsContextUIButton();
  -[PodcastsContextUIButton setAccessibilityCustomActions:](&v9, "setAccessibilityCustomActions:", isa);

}

- (_TtC23ShelfKitCollectionViews23PodcastsContextUIButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PodcastsContextUIButton();
  return -[PodcastsContextUIButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews23PodcastsContextUIButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PodcastsContextUIButton();
  return -[PodcastsContextUIButton initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
