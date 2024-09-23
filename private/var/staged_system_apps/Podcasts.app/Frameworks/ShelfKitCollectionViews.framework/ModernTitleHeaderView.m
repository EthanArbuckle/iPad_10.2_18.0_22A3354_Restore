@implementation ModernTitleHeaderView

- (_TtC23ShelfKitCollectionViews21ModernTitleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews21ModernTitleHeaderView *)_s23ShelfKitCollectionViews21ModernTitleHeaderViewC5frameACSo6CGRectV_tcfc_0();
}

- (_TtC23ShelfKitCollectionViews21ModernTitleHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1CD110();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v7.receiver;
  -[ModernTitleHeaderView traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  v6 = objc_msgSend(v5, "traitCollection", v7.receiver, v7.super_class);
  sub_1C7D5C(v6);

  objc_msgSend(v5, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[ModernTitleHeaderView updateConstraints](&v4, "updateConstraints");
  v3 = objc_msgSend(v2, "traitCollection", v4.receiver, v4.super_class);
  sub_1C85F8((uint64_t)v3);

}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews21ModernTitleHeaderView *v2;

  v2 = self;
  ModernTitleHeaderView.layoutSubviews()();

}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_titleLabel);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_subtitleLabel);
}

- (NSArray)accessibilityHeaderButtons
{
  uint64_t v2;
  NSArray v3;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_buttons);
  if (v2)
  {
    type metadata accessor for DynamicTypeButton();
    swift_bridgeObjectRetain(v2);
    v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3.super.isa = 0;
  }
  return (NSArray *)v3.super.isa;
}

- (void).cxx_destruct
{
  sub_FA4C((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_style, type metadata accessor for ModernTitleHeaderView.Style);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_artworkCancellable));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView____lazy_storage___topConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_horizontalParentStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_horizontalSubStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_horizontalButtonStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_verticalSubStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_titleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_subtitleLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView_buttons));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21ModernTitleHeaderView____lazy_storage___bottomConstraint));
}

@end
