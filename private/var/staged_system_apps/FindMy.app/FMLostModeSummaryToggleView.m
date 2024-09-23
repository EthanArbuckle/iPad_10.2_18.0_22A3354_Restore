@implementation FMLostModeSummaryToggleView

- (_TtC6FindMy27FMLostModeSummaryToggleView)init
{
  return (_TtC6FindMy27FMLostModeSummaryToggleView *)sub_1002FFE60();
}

- (_TtC6FindMy27FMLostModeSummaryToggleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100300934();
}

- (void)labelTapped:(id)a3
{
  id v4;
  _TtC6FindMy27FMLostModeSummaryToggleView *v5;

  v4 = a3;
  v5 = self;
  sub_100300A24();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMLostModeSummaryToggleView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMLostModeSummaryToggleView_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMLostModeSummaryToggleView_toggle));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy27FMLostModeSummaryToggleView_delegate);
}

@end
