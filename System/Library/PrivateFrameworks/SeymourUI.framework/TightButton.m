@implementation TightButton

- (float)contentHuggingPriorityForAxis:(int64_t)a3
{
  float v4;

  type metadata accessor for UILayoutPriority(0);
  sub_22B1771E0();
  sub_22BA7FE0C();
  return v4;
}

- (CGSize)intrinsicContentSize
{
  _TtC9SeymourUI11TightButton *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v2 = self;
  v3 = -[TightButton titleLabel](v2, sel_titleLabel);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_intrinsicContentSize);

    sub_22BA80EF8();
  }
  else
  {
    v11.receiver = v2;
    v11.super_class = (Class)type metadata accessor for TightButton();
    -[TightButton intrinsicContentSize](&v11, sel_intrinsicContentSize);
  }
  v7 = v5;
  v8 = v6;

  v9 = v7;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setContentHuggingPriority:(float)a3 forAxis:(int64_t)a4
{
  sub_22BA815D0();
  __break(1u);
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  sub_22BA815D0();
  __break(1u);
}

- (_TtC9SeymourUI11TightButton)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for TightButton();
  return -[TightButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI11TightButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TightButton();
  return -[TightButton initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
