@implementation MultiUserCelebrationView

- (_TtC9SeymourUI24MultiUserCelebrationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B7C8674();
}

- (_TtC9SeymourUI24MultiUserCelebrationView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI24MultiUserCelebrationView *result;

  result = (_TtC9SeymourUI24MultiUserCelebrationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MultiUserCelebrationView_platter));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MultiUserCelebrationView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MultiUserCelebrationView_monogramLabel));
  sub_22B315B3C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI24MultiUserCelebrationView_stringBuilder);
  swift_release();
}

- (void)presentWithDuration:(double)a3
{
  _TtC9SeymourUI24MultiUserCelebrationView *v4;

  v4 = self;
  sub_22B7C80D4(a3);

}

@end
