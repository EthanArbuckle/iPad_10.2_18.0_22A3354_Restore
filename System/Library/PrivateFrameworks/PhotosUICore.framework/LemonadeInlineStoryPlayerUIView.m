@implementation LemonadeInlineStoryPlayerUIView

- (_TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  uint64_t v7;
  char v8;
  _TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView____lazy_storage___player) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView____lazy_storage___contentPlayerView) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView_placeholderKenBurnsEffect;
  type metadata accessor for LemonadeInlineStoryPlayer();
  v6 = a3;
  *(double *)v5 = sub_1A6BDBD5C();
  *((_QWORD *)v5 + 1) = v7;
  v5[16] = v8 & 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView____lazy_storage___placeholderView) = (Class)1;

  result = (_TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView *v2;

  v2 = self;
  sub_1A6CE9B8C();

}

- (_TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView)initWithFrame:(CGRect)a3
{
  sub_1A6891054();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView____lazy_storage___contentPlayerView));
  swift_unknownObjectRelease();
  sub_1A6A430C8(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC12PhotosUICore31LemonadeInlineStoryPlayerUIView____lazy_storage___placeholderView));
}

@end
