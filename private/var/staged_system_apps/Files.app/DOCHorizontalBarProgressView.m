@implementation DOCHorizontalBarProgressView

- (_TtC5Files28DOCHorizontalBarProgressView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC5Files28DOCHorizontalBarProgressView_changeAnimationDuration;
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCHorizontalBarProgressView();
  return -[DOCHorizontalBarProgressView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC5Files28DOCHorizontalBarProgressView)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC5Files28DOCHorizontalBarProgressView_changeAnimationDuration;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCHorizontalBarProgressView();
  return -[DOCHorizontalBarProgressView initWithCoder:](&v6, "initWithCoder:", a3);
}

@end
