@implementation FMProductActionHeaderView

- (_TtC6FindMy25FMProductActionHeaderView)init
{
  return (_TtC6FindMy25FMProductActionHeaderView *)sub_1003C1C0C();
}

- (_TtC6FindMy25FMProductActionHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003C28BC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMProductActionHeaderView(0);
  v4 = a3;
  v5 = v6.receiver;
  -[FMProductActionHeaderView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_1003C253C();

}

- (_TtC6FindMy25FMProductActionHeaderView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy25FMProductActionHeaderView *result;

  result = (_TtC6FindMy25FMProductActionHeaderView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMProductActionHeaderView", 32, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10009ADFC((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMProductActionHeaderView_productImageAdjustmentsURL);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMProductActionHeaderView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMProductActionHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMProductActionHeaderView_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMProductActionHeaderView_secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMProductActionHeaderView_productImageView));
}

@end
