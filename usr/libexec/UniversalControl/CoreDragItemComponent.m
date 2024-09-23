@implementation CoreDragItemComponent

- (NSString)key
{
  NSString v2;

  sub_10018CE24();
  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGImage)image
{
  return (CGImage *)sub_10018CE7C();
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_10018CEAC();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (_TtC13EnsembleAgent21CoreDragItemComponent)initWithKey:(id)a3 image:(CGImage *)a4 frame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v10;
  uint64_t v11;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_TtC13EnsembleAgent21CoreDragItemComponent *)sub_10018CEC4(v10, v11, (uint64_t)a4, x, y, width, height);
}

- (_TtC13EnsembleAgent21CoreDragItemComponent)init
{
  sub_10018CFA0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->key[OBJC_IVAR____TtC13EnsembleAgent21CoreDragItemComponent_key]);

}

@end
