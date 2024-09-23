@implementation CloseButton

- (_TtC10PodcastsUIP33_7356E91B5F9CFCB46676D7EB93CF2B4411CloseButton)initWithCoder:(id)a3
{
  _TtC10PodcastsUIP33_7356E91B5F9CFCB46676D7EB93CF2B4411CloseButton *result;

  result = (_TtC10PodcastsUIP33_7356E91B5F9CFCB46676D7EB93CF2B4411CloseButton *)sub_1DA670570();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC10PodcastsUIP33_7356E91B5F9CFCB46676D7EB93CF2B4411CloseButton *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  CGPoint v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  -[CloseButton bounds](v8, sel_bounds);
  v16.origin.x = UIEdgeInsetsInsetRect(v9, v10, v11, v12, *(double *)((char *)&v8->super.super.super.super.super.isa+ OBJC_IVAR____TtC10PodcastsUIP33_7356E91B5F9CFCB46676D7EB93CF2B4411CloseButton_touchInsets), *(double *)((char *)&v8->super.super.super.super._responderFlags+ OBJC_IVAR____TtC10PodcastsUIP33_7356E91B5F9CFCB46676D7EB93CF2B4411CloseButton_touchInsets));
  v15.x = x;
  v15.y = y;
  v13 = CGRectContainsPoint(v16, v15);

  return v13;
}

- (_TtC10PodcastsUIP33_7356E91B5F9CFCB46676D7EB93CF2B4411CloseButton)initWithFrame:(CGRect)a3
{
  sub_1DA531D04();
}

@end
