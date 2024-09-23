@implementation CRLMiniShapePickerHelper

+ (void)showMiniShapePickerToAddShapeToConnectionLineWithUnscaledPopoverAnchorPoint:(CGPoint)a3 forEditor:(id)a4
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  sub_100801ED8(v6, x, y);

}

+ (void)dismissMiniShapePickerForEditor:(id)a3
{
  id v4;

  v4 = a3;
  sub_1009F9E14(a3);

}

- (_TtC8Freeform24CRLMiniShapePickerHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLMiniShapePickerHelper();
  return -[CRLMiniShapePickerHelper init](&v3, "init");
}

@end
