@implementation DebugOverlayView

- (_TtC17PromotedContentUI16DebugOverlayView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)swift_getObjectType();
  return -[DebugOverlayView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC17PromotedContentUI16DebugOverlayView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[DebugOverlayView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
