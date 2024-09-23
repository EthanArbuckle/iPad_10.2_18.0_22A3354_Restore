@implementation PoofAnimationView

- (_TtC10StickersUI17PoofAnimationView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC10StickersUI17PoofAnimationView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickersUI17PoofAnimationView_puffs) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickersUI17PoofAnimationView_count) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickersUI17PoofAnimationView_completionHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC10StickersUI17PoofAnimationView *)sub_247A81250();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC10StickersUI17PoofAnimationView *v2;

  v2 = self;
  sub_247A77B80();

}

- (_TtC10StickersUI17PoofAnimationView)initWithFrame:(CGRect)a3
{
  sub_247A7A138();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_247A35000(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10StickersUI17PoofAnimationView_completionHandler));
}

@end
