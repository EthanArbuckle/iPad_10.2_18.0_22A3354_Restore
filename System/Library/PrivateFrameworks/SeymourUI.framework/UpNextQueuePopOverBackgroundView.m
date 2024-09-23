@implementation UpNextQueuePopOverBackgroundView

- (unint64_t)arrowDirection
{
  return 1;
}

- (double)arrowOffset
{
  return 0.0;
}

+ (UIEdgeInsets)contentViewInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x24BEBE158];
  v3 = *(double *)(MEMORY[0x24BEBE158] + 8);
  v4 = *(double *)(MEMORY[0x24BEBE158] + 16);
  v5 = *(double *)(MEMORY[0x24BEBE158] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)arrowBase
{
  return 20.0;
}

+ (double)arrowHeight
{
  return 12.0;
}

- (_TtC9SeymourUI32UpNextQueuePopOverBackgroundView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC9SeymourUI32UpNextQueuePopOverBackgroundView *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for UpNextQueuePopOverBackgroundView();
  v7 = -[UIPopoverBackgroundView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  -[UpNextQueuePopOverBackgroundView setAlpha:](v7, sel_setAlpha_, 0.0);
  return v7;
}

- (_TtC9SeymourUI32UpNextQueuePopOverBackgroundView)initWithCoder:(id)a3
{
  _TtC9SeymourUI32UpNextQueuePopOverBackgroundView *result;

  result = (_TtC9SeymourUI32UpNextQueuePopOverBackgroundView *)sub_22BA815D0();
  __break(1u);
  return result;
}

@end
