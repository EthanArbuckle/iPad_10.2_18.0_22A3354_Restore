@implementation FMMultilineButton

- (_TtC6FindMy17FMMultilineButton)initWithCoder:(id)a3
{
  id v4;
  _TtC6FindMy17FMMultilineButton *v5;
  _TtC6FindMy17FMMultilineButton *v6;
  _TtC6FindMy17FMMultilineButton *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMMultilineButton();
  v4 = a3;
  v5 = -[FMMultilineButton initWithCoder:](&v9, "initWithCoder:", v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_1001F340C();

  }
  return v6;
}

- (_TtC6FindMy17FMMultilineButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC6FindMy17FMMultilineButton *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMMultilineButton();
  v7 = -[FMMultilineButton initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  sub_1001F340C();

  return v7;
}

- (CGSize)intrinsicContentSize
{
  _TtC6FindMy17FMMultilineButton *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1001F3534();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
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
  v9.super_class = (Class)type metadata accessor for FMMultilineButton();
  v2 = v9.receiver;
  -[FMMultilineButton layoutSubviews](&v9, "layoutSubviews");
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

@end
