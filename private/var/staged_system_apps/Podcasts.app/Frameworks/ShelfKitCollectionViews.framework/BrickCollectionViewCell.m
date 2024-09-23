@implementation BrickCollectionViewCell

- (_TtC23ShelfKitCollectionViews23BrickCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews23BrickCollectionViewCell *)sub_1ABAD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews23BrickCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AC5B0();
}

- (void)prepareForReuse
{
  _TtC23ShelfKitCollectionViews23BrickCollectionViewCell *v2;

  v2 = self;
  sub_1ABD88();

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
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)swift_getObjectType();
  v2 = (char *)v17.receiver;
  -[BrickCollectionViewCell layoutSubviews](&v17, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews23BrickCollectionViewCell_artworkContainer];
  v4 = objc_msgSend(v2, "contentView", v17.receiver, v17.super_class);
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "layoutMargins");
  v14 = v13;
  v16 = v15;

  objc_msgSend(v3, "setFrame:", UIEdgeInsetsInsetRect(v6, v8, v10, v12, v14, v16));
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews23BrickCollectionViewCell_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23BrickCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23BrickCollectionViewCell_artworkContainer));
}

@end
