@implementation BSUIWindow

- (void)didAddSubview:(id)a3
{
  id v4;
  BSUIWindow *v5;

  v4 = a3;
  v5 = self;
  sub_1EF05C((uint64_t)v4);

}

- (void)willRemoveSubview:(id)a3
{
  id v4;
  BSUIWindow *v5;

  v4 = a3;
  v5 = self;
  sub_1EF280((uint64_t)v4);

}

- (BSUIWindow)initWithWindowScene:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___BSUIWindow_swiftUIContextMenuWorkaroundEnabled) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for Window();
  return -[BSUIWindow initWithWindowScene:](&v5, "initWithWindowScene:", a3);
}

- (BSUIWindow)initWithFrame:(CGRect)a3
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
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___BSUIWindow_swiftUIContextMenuWorkaroundEnabled) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for Window();
  return -[BSUIWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (BSUIWindow)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___BSUIWindow_swiftUIContextMenuWorkaroundEnabled) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for Window();
  return -[BSUIWindow initWithCoder:](&v5, "initWithCoder:", a3);
}

- (BSUIWindow)initWithContentRect:(CGRect)a3
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
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___BSUIWindow_swiftUIContextMenuWorkaroundEnabled) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for Window();
  return -[BSUIWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end
