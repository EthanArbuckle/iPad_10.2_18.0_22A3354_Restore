@implementation ContainerDetailHeaderReusableView

- (_TtC16MusicApplication33ContainerDetailHeaderReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication33ContainerDetailHeaderReusableView *)sub_318AD8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication33ContainerDetailHeaderReusableView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_319368();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication33ContainerDetailHeaderReusableView *v2;

  v2 = self;
  sub_318DCC();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplication33ContainerDetailHeaderReusableView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_319060(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33ContainerDetailHeaderReusableView_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33ContainerDetailHeaderReusableView_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33ContainerDetailHeaderReusableView_highlightView));
}

@end
