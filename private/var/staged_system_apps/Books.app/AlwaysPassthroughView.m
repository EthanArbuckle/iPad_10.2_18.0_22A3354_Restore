@implementation AlwaysPassthroughView

- (_TtC5Books21AlwaysPassthroughView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC5Books21AlwaysPassthroughView *v7;
  void *v8;
  _TtC5Books21AlwaysPassthroughView *v9;
  id v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for AlwaysPassthroughView();
  v7 = -[AlwaysPassthroughView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  v8 = (void *)objc_opt_self(UIColor);
  v9 = v7;
  v10 = objc_msgSend(v8, "clearColor");
  -[AlwaysPassthroughView setBackgroundColor:](v9, "setBackgroundColor:", v10);

  return v9;
}

- (_TtC5Books21AlwaysPassthroughView)initWithCoder:(id)a3
{
  _TtC5Books21AlwaysPassthroughView *result;

  result = (_TtC5Books21AlwaysPassthroughView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/AlwaysPassthroughView.swift", 33, 2, 18, 0);
  __break(1u);
  return result;
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AlwaysPassthroughView();
  -[AlwaysPassthroughView setUserInteractionEnabled:](&v4, "setUserInteractionEnabled:", v3);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

@end
