@implementation TTRIBackgroundView

- (_TtC15RemindersUICore18TTRIBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore18TTRIBackgroundView *)TTRIBackgroundView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore18TTRIBackgroundView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore18TTRIBackgroundView *)sub_1B4453034(a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 1.0;
  v4 = 1.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  _TtC15RemindersUICore18TTRIBackgroundView *v2;

  v2 = self;
  TTRIBackgroundView.layoutSubviews()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore18TTRIBackgroundView_backgroundFillColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore18TTRIBackgroundView_borderColor));
}

@end
