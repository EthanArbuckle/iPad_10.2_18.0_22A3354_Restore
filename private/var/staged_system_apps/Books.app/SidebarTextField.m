@implementation SidebarTextField

- (CGRect)editingRectForBounds:(CGRect)a3
{
  return CGRectInset(a3, 4.0, 0.0);
}

- (UIFocusEffect)focusEffect
{
  return (UIFocusEffect *)objc_msgSend(objc_allocWithZone((Class)UIFocusHaloEffect), "init");
}

- (BOOL)canResignFirstResponder
{
  return -[SidebarTextField isUserInteractionEnabled](self, "isUserInteractionEnabled") ^ 1;
}

- (BOOL)endEditing:(BOOL)a3
{
  _BOOL8 v3;
  _TtC5Books16SidebarTextField *v4;
  objc_super v6;

  v3 = a3;
  v4 = self;
  -[SidebarTextField setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SidebarTextField();
  LOBYTE(v3) = -[SidebarTextField endEditing:](&v6, "endEditing:", v3);

  return v3;
}

- (_TtC5Books16SidebarTextField)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for SidebarTextField();
  return -[SidebarTextField initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5Books16SidebarTextField)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SidebarTextField();
  return -[SidebarTextField initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
