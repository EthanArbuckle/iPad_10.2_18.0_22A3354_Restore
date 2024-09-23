@implementation MeditationPlayButtonView

- (_TtC9SeymourUI24MeditationPlayButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI24MeditationPlayButtonView *)sub_22B8762D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI24MeditationPlayButtonView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B876E0C();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI24MeditationPlayButtonView *v2;

  v2 = self;
  sub_22B876B34();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MeditationPlayButtonView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MeditationPlayButtonView_tintView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MeditationPlayButtonView_playButton));
}

@end
