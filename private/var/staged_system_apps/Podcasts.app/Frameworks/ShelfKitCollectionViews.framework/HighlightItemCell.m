@implementation HighlightItemCell

- (_TtC23ShelfKitCollectionViews17HighlightItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews17HighlightItemCell *)sub_1AD128(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews17HighlightItemCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AE8D0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17HighlightItemCell_artworkViewWithPlayback));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17HighlightItemCell____lazy_storage___infoStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17HighlightItemCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17HighlightItemCell____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17HighlightItemCell_highlightView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews17HighlightItemCell_highlightItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17HighlightItemCell____lazy_storage___artworkContainer));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews17HighlightItemCell_objectGraph));
}

@end
