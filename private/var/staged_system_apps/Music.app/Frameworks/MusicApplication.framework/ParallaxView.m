@implementation ParallaxView

- (_TtC16MusicApplication12ParallaxView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12ParallaxView *)sub_B98DE0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12ParallaxView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_B99644();
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ParallaxView();
  v2 = v3.receiver;
  -[ParallaxView layoutSubviews](&v3, "layoutSubviews");
  sub_B990A0();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC16MusicApplication12ParallaxView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_B98F84((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12ParallaxView_contentView));
}

@end
