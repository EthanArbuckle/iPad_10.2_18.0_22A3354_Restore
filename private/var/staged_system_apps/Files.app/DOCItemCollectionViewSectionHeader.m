@implementation DOCItemCollectionViewSectionHeader

- (_TtC5Files34DOCItemCollectionViewSectionHeader)initWithFrame:(CGRect)a3
{
  return (_TtC5Files34DOCItemCollectionViewSectionHeader *)sub_1004242B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Files34DOCItemCollectionViewSectionHeader)initWithCoder:(id)a3
{
  sub_100427A14((uint64_t)a3);
}

- (void)didMoveToWindow
{
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCItemCollectionViewSectionHeader();
  v2 = v5.receiver;
  -[DOCItemCollectionViewSectionHeader didMoveToWindow](&v5, "didMoveToWindow");
  v3 = objc_msgSend(v2, "window", v5.receiver, v5.super_class);

  if (v3)
  {
    v4 = objc_msgSend(v2, "traitCollection");
    sub_100426A04();

    v2 = v4;
  }

}

- (void)prepareForReuse
{
  _TtC5Files34DOCItemCollectionViewSectionHeader *v2;

  v2 = self;
  sub_100425E14();

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC5Files34DOCItemCollectionViewSectionHeader *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100426D24((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (id)accessibilityTitleLabel
{
  _TtC5Files34DOCItemCollectionViewSectionHeader *v2;
  id v3;

  v2 = self;
  v3 = sub_10042719C();

  return v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->seeLessString[OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_seeLessString]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader____lazy_storage___sectionTitleControl));
  swift_bridgeObjectRelease(*(_QWORD *)&self->seeLessString[OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_expandToggleButtonTitle]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader____lazy_storage___expandToggleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader____lazy_storage___expandToggleButtonVisibleConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader____lazy_storage___topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader____lazy_storage___bottomSeparator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_regularConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_largeTextConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_traitsSpecificSeparatorConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_itemTags));
  swift_bridgeObjectRelease(*(_QWORD *)&self->seeLessString[OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_title]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_layoutTraits));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_sortButtonsStackView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_sortButtons));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_sortButtonsConstraints));
  sub_100144F34(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_sortingDescriptor), *(_QWORD *)&self->seeLessString[OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_sortingDescriptor], *(_QWORD *)&self->seeLessString[OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_sortingDescriptor + 8]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_groupByMenu));
  sub_1001D09CC(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_representedCollectionSection), *(_QWORD *)&self->seeLessString[OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_representedCollectionSection], *(_QWORD *)&self->seeLessString[OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_representedCollectionSection+ 8], *(_QWORD *)&self->$__lazy_storage_$_sectionTitleControl[OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_representedCollectionSection], *(_QWORD *)&self->$__lazy_storage_$_sectionTitleControl[OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_representedCollectionSection+ 8]);
  sub_100087534(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_toggleExpandedHandler), *(_QWORD *)&self->seeLessString[OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_toggleExpandedHandler]);
  sub_100087534(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_sortButtonTapHandler), *(_QWORD *)&self->seeLessString[OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_sortButtonTapHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_customBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader__labelForAX));
}

@end
