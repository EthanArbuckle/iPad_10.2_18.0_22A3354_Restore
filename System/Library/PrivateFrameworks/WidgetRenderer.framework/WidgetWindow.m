@implementation WidgetWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC14WidgetRenderer12WidgetWindow)initWithWindowScene:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WidgetWindow();
  return -[WidgetWindow initWithWindowScene:](&v5, sel_initWithWindowScene_, a3);
}

- (_TtC14WidgetRenderer12WidgetWindow)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for WidgetWindow();
  return -[WidgetWindow initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC14WidgetRenderer12WidgetWindow)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WidgetWindow();
  return -[WidgetWindow initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC14WidgetRenderer12WidgetWindow)initWithContentRect:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for WidgetWindow();
  return -[WidgetWindow initWithContentRect:](&v8, sel_initWithContentRect_, x, y, width, height);
}

@end
