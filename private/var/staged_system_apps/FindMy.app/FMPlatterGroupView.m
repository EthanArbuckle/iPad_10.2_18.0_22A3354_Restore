@implementation FMPlatterGroupView

- (_TtC6FindMy18FMPlatterGroupView)init
{
  uint64_t v3;
  id v4;
  _TtC6FindMy18FMPlatterGroupView *v5;
  _TtC6FindMy18FMPlatterGroupView *v6;
  void (*v7)(void);
  _TtC6FindMy18FMPlatterGroupView *v8;
  objc_super v10;

  v3 = OBJC_IVAR____TtC6FindMy18FMPlatterGroupView_contentStackView;
  v4 = objc_allocWithZone((Class)UIStackView);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)objc_msgSend(v4, "init");

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for FMPlatterGroupView();
  v6 = -[FMPlatterGroupView initWithFrame:](&v10, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v7 = *(void (**)(void))((swift_isaMask & (uint64_t)v6->super.super.super.isa) + 0x58);
  v8 = v6;
  v7();
  sub_1000EEEF0();
  (*(void (**)(void))((swift_isaMask & (uint64_t)v8->super.super.super.isa) + 0x68))();

  return v8;
}

- (_TtC6FindMy18FMPlatterGroupView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy18FMPlatterGroupView *result;

  v5 = OBJC_IVAR____TtC6FindMy18FMPlatterGroupView_contentStackView;
  v6 = objc_allocWithZone((Class)UIStackView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC6FindMy18FMPlatterGroupView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMPlatterGroupView.swift", 31, 2, 36, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy18FMPlatterGroupView *v6;

  v5 = a3;
  v6 = self;
  sub_1000EF178((uint64_t)a3);

}

- (_TtC6FindMy18FMPlatterGroupView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy18FMPlatterGroupView *result;

  result = (_TtC6FindMy18FMPlatterGroupView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMPlatterGroupView", 25, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy18FMPlatterGroupView_contentStackView));
}

@end
