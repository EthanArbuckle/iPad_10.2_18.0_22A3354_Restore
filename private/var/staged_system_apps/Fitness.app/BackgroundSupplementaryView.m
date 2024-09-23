@implementation BackgroundSupplementaryView

- (_TtC10FitnessApp27BackgroundSupplementaryView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC10FitnessApp27BackgroundSupplementaryView *v7;
  id v8;
  id v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for BackgroundSupplementaryView();
  v7 = -[BackgroundSupplementaryView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  v8 = -[BackgroundSupplementaryView layer](v7, "layer");
  objc_msgSend(v8, "setCornerRadius:", 8.0);

  v9 = sub_100032490();
  -[BackgroundSupplementaryView setBackgroundColor:](v7, "setBackgroundColor:", v9);

  return v7;
}

- (_TtC10FitnessApp27BackgroundSupplementaryView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BackgroundSupplementaryView();
  return -[BackgroundSupplementaryView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
