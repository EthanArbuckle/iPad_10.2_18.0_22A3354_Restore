@implementation ShowAllButton

- (CGSize)intrinsicContentSize
{
  _TtC10FitnessApp13ShowAllButton *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self;
  v3 = -[ShowAllButton titleLabel](v2, "titleLabel");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "intrinsicContentSize");
    v6 = v5;
    v8 = v7;

  }
  else
  {

    v8 = 0.0;
    v6 = 0.0;
  }
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ShowAllButton();
  v2 = v9.receiver;
  -[ShowAllButton layoutSubviews](&v9, "layoutSubviews");
  v3 = objc_msgSend(v2, "titleLabel", v9.receiver, v9.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "titleLabel");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "frame");
      v8 = v7;

    }
    else
    {
      v8 = 0.0;
    }
    objc_msgSend(v4, "setPreferredMaxLayoutWidth:", v8);

  }
  else
  {
    v4 = v2;
  }

}

- (_TtC10FitnessApp13ShowAllButton)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for ShowAllButton();
  return -[ShowAllButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC10FitnessApp13ShowAllButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ShowAllButton();
  return -[ShowAllButton initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
