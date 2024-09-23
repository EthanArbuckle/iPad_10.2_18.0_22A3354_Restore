@implementation HackyUnfocusableUISearchTextField

- (BOOL)canBecomeFocused
{
  return 0;
}

- (_TtC6HealthP33_8C220FBA31735F6781A5A7EF138717A933HackyUnfocusableUISearchTextField)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for HackyUnfocusableUISearchTextField();
  return -[HackyUnfocusableUISearchTextField initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC6HealthP33_8C220FBA31735F6781A5A7EF138717A933HackyUnfocusableUISearchTextField)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HackyUnfocusableUISearchTextField();
  return -[HackyUnfocusableUISearchTextField initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
