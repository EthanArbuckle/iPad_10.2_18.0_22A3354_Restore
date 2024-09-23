@implementation MarketingPaletteBannerPresenter

- (void)textSizeChanged:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9SeymourUI31MarketingPaletteBannerPresenter *v8;
  uint64_t v9;

  v4 = sub_22BA79344();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79320();
  v8 = self;
  sub_22B3B93B8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC9SeymourUI31MarketingPaletteBannerPresenter)init
{
  _TtC9SeymourUI31MarketingPaletteBannerPresenter *result;

  result = (_TtC9SeymourUI31MarketingPaletteBannerPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_contentAvailabilityClient);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_placementProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_subscriptionCache);
  swift_release();
  sub_22B3BA378(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_currentPlacementStatus), self->contentAvailabilityClient[OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_currentPlacementStatus]);
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_display);
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter__fakeUnifiedMessagingPlacements;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BA1020);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_22B11370C(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_state), self->contentAvailabilityClient[OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_state]);
}

@end
