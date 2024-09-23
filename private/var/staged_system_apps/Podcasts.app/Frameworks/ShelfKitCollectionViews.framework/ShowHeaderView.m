@implementation ShowHeaderView

- (_TtC23ShelfKitCollectionViews14ShowHeaderView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews14ShowHeaderView *result;

  _s23ShelfKitCollectionViews14ShowHeaderViewC5frameACSo6CGRectV_tcfc_0();
  return result;
}

- (_TtC23ShelfKitCollectionViews14ShowHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s23ShelfKitCollectionViews14ShowHeaderViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)preferredContentSizeChanged:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC23ShelfKitCollectionViews14ShowHeaderView *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1D056C();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews14ShowHeaderView *v6;
  _TtC23ShelfKitCollectionViews14ShowHeaderView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  ShowHeaderView.traitCollectionDidChange(_:)(v8);

}

- (void)secondaryButtonSubtitleLabelTapped
{
  _TtC23ShelfKitCollectionViews14ShowHeaderView *v2;

  v2 = self;
  sub_1D0A1C();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->hasPlayedShow[OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_currentEpisodeUUID]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_currentModel));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_primaryButtonController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_primaryButtonHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_secondaryButtonHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_providerButtonView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_centralStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_upsellBanner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_descriptionLabelContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_secondaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView____lazy_storage___secondaryButtonSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_ratingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_metadataView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_titleLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView____lazy_storage___entitlementBadgeConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_entitlementBadge));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_spacer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView____lazy_storage___stackViewBottomGuideConstraint));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_primaryButtonAction));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_secondaryButtonAction));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews14ShowHeaderView_objectGraph));
}

@end
