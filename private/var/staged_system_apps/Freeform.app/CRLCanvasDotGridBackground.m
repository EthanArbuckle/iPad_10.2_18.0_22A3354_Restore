@implementation CRLCanvasDotGridBackground

- (Class)layerClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLCanvasDotGridLayer();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)viewClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLCanvasDotGridBackgroundView();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (CGPoint)originPointForAligningRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC8Freeform26CRLCanvasDotGridBackground *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat MaxX;
  CGFloat MinY;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_10095122C(x);
  v9 = v8;
  sub_10095122C(y);
  v11 = v10;
  if (sub_1003A91F4())
  {
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    MaxX = CGRectGetMaxX(v22);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    MinY = CGRectGetMinY(v23);
    sub_10095122C(MaxX);
    v15 = MaxX + v14;
    sub_10095122C(MinY);
    v17 = v16;

    v18 = sub_1000603B8(v15, MinY + v17, MaxX);
    v19 = sub_1000603D0(x, y, v18);
  }
  else
  {

    v20 = y + v11;
    v19 = x + v9;
  }
  result.y = v20;
  result.x = v19;
  return result;
}

- (CGPoint)originPointForAlignedInsertingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC8Freeform26CRLCanvasDotGridBackground *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat MaxX;
  CGFloat MinY;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_10095122C(x);
  v9 = v8;
  sub_10095122C(y);
  v11 = v10;
  if (sub_1003A91F4())
  {
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    MaxX = CGRectGetMaxX(v22);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    MinY = CGRectGetMinY(v23);
    sub_10095122C(MaxX);
    v15 = MaxX + v14;
    sub_10095122C(MinY);
    v17 = v16;

    v18 = sub_1000603B8(v15, MinY + v17, MaxX);
    v19 = sub_1000603D0(x, y, v18);
  }
  else
  {

    v20 = y + v11;
    v19 = x + v9;
  }
  result.y = v20;
  result.x = v19;
  return result;
}

- (CGPoint)alignmentPointForPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _TtC8Freeform26CRLCanvasDotGridBackground *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_10095122C(x);
  v7 = x + v6;
  sub_10095122C(y);
  v9 = v8;

  v10 = y + v9;
  v11 = v7;
  result.y = v10;
  result.x = v11;
  return result;
}

- (_TtC8Freeform26CRLCanvasDotGridBackground)initWithICC:(id)a3
{
  uint64_t v5;
  objc_super v7;

  v5 = swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Freeform19CRLCanvasBackground_icc);
  swift_unknownObjectWeakAssign(v5, a3);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLCanvasBackground();
  return -[CRLCanvasBackground init](&v7, "init");
}

- (void)snapDistanceForViewScale:(double)a1
{
  if (a1 <= 0.0)
  {
    sub_100757E04(&_mh_execute_header, (uint64_t)"snapDistance(forViewScale:)", 27, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasDotGridBackground.swift", 96, 2, 39, "viewScale must be greater than 0", 32, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"snapDistance(forViewScale:)", 27, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasDotGridBackground.swift", 96, 2u, 39, (uint64_t)"viewScale must be greater than 0", 32, 2u);
  }
}

@end
