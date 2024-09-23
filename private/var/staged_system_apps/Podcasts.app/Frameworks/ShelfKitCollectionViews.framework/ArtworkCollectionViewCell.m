@implementation ArtworkCollectionViewCell

- (_TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell *)sub_26541C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell)initWithCoder:(id)a3
{
  _TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell *result;

  result = (_TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/ArtworkCollectionViewCell.swift", 55, 2, 26, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell *v2;

  v2 = self;
  sub_26559C();

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ArtworkCollectionViewCell();
  v2 = (char *)v9.receiver;
  -[ArtworkCollectionViewCell layoutSubviews](&v9, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell_artworkView];
  v4 = objc_msgSend(v2, "contentView", v9.receiver, v9.super_class);
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;

  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v6, v8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25ArtworkCollectionViewCell_artworkView));
}

@end
