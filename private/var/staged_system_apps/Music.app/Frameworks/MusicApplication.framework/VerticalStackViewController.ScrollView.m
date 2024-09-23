@implementation VerticalStackViewController.ScrollView

- (void)layoutSubviews
{
  _TtCC16MusicApplication27VerticalStackViewController10ScrollView *v2;

  v2 = self;
  sub_AF8D44();

}

- (CGPoint)contentOffset
{
  double v2;
  double v3;
  objc_super v4;
  CGPoint result;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VerticalStackViewController.ScrollView();
  -[VerticalStackViewController.ScrollView contentOffset](&v4, "contentOffset");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  id v5;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for VerticalStackViewController.ScrollView();
  v5 = v6.receiver;
  -[VerticalStackViewController.ScrollView setContentOffset:](&v6, "setContentOffset:", x, y);
  sub_AF9044();

}

- (_TtCC16MusicApplication27VerticalStackViewController10ScrollView)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController10ScrollView_backgroundView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController10ScrollView_foregroundView) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for VerticalStackViewController.ScrollView();
  return -[VerticalStackViewController.ScrollView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC16MusicApplication27VerticalStackViewController10ScrollView)initWithCoder:(id)a3
{
  id v4;
  _TtCC16MusicApplication27VerticalStackViewController10ScrollView *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController10ScrollView_backgroundView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController10ScrollView_foregroundView) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for VerticalStackViewController.ScrollView();
  v4 = a3;
  v5 = -[VerticalStackViewController.ScrollView initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController10ScrollView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController10ScrollView_foregroundView));
}

@end
