@implementation PlaybackArtworkView

- (_TtC9SeymourUI19PlaybackArtworkView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19PlaybackArtworkView *)sub_22B9032C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19PlaybackArtworkView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B90416C();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI19PlaybackArtworkView *v2;

  v2 = self;
  sub_22B903808();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlaybackArtworkView();
  v4 = a3;
  v5 = v6.receiver;
  -[PlaybackArtworkView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  sub_22B903EF8();

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackArtworkView_springParameters));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackArtworkView_switchAnimator));
}

@end
