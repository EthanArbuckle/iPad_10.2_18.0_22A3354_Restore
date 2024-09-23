@implementation CatalogTipSummaryView

- (_TtC9SeymourUI21CatalogTipSummaryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B60961C();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI21CatalogTipSummaryView *v2;

  v2 = self;
  sub_22B607CB4();

}

- (void)learnMoreButtonTapped
{
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  _TtC9SeymourUI21CatalogTipSummaryView *v5;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21CatalogTipSummaryView_presenter);
  v5 = self;
  sub_22B81F200(0xD000000000000015, 0x800000022BAE1D00);
  v3 = *(void (**)(uint64_t))(v2 + 32);
  if (v3)
  {
    v4 = swift_retain();
    v3(v4);
    sub_22B0FAA68((uint64_t)v3);
  }

}

- (void)seeMoreButtonTapped
{
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  _TtC9SeymourUI21CatalogTipSummaryView *v5;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21CatalogTipSummaryView_presenter);
  v5 = self;
  sub_22B81F200(0x5465726F4D656553, 0xEB00000000737069);
  v3 = *(void (**)(uint64_t))(v2 + 48);
  if (v3)
  {
    v4 = swift_retain();
    v3(v4);
    sub_22B0FAA68((uint64_t)v3);
  }

}

- (_TtC9SeymourUI21CatalogTipSummaryView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI21CatalogTipSummaryView *result;

  result = (_TtC9SeymourUI21CatalogTipSummaryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21CatalogTipSummaryView_buttonLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21CatalogTipSummaryView_contentLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21CatalogTipSummaryView_summaryCardView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21CatalogTipSummaryView_learnMoreButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21CatalogTipSummaryView_seeMoreButton));
  swift_release();
}

@end
