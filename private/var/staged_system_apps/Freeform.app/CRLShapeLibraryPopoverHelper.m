@implementation CRLShapeLibraryPopoverHelper

+ (void)changeShapeForEditor:(id)a3 shapePathSource:(id)a4 interactiveCanvasController:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  sub_1008EEBEC(v7, (uint64_t)v8, v9);

}

+ (void)showShapeLibraryForEditor:(id)a3
{
  id v3;

  v3 = a3;
  sub_1008EF6AC(v3);

}

+ (void)showShapeLibraryPopoverToAddShapeToConnectionLineWithUnscaledPopoverAnchorPoint:(CGPoint)a3 forEditor:(id)a4
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  sub_1008EFC18(v6, x, y);

}

+ (void)dismissShapeLibraryForEditor:(id)a3
{
  id v4;

  v4 = a3;
  sub_1008F0088(a3);

}

- (_TtC8Freeform28CRLShapeLibraryPopoverHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLShapeLibraryPopoverHelper();
  return -[CRLShapeLibraryPopoverHelper init](&v3, "init");
}

@end
