@implementation FMCardContainerView

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC6FindMy19FMCardContainerView *v5;

  v4 = a3;
  v5 = self;
  sub_10000B060();

}

- (_TtC6FindMy19FMCardContainerView)init
{
  return (_TtC6FindMy19FMCardContainerView *)sub_1000139E4();
}

- (_TtC6FindMy19FMCardContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003A742C();
}

- (_TtC6FindMy19FMCardContainerView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy19FMCardContainerView *result;

  result = (_TtC6FindMy19FMCardContainerView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMCardContainerView", 26, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMCardContainerView_bluredBackground));

}

@end
