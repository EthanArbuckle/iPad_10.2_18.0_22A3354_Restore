@implementation UberCollectionViewCell

- (_TtC23ShelfKitCollectionViews22UberCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews22UberCollectionViewCell *)sub_2255BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews22UberCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2261E0();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews22UberCollectionViewCell *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v5 = self;
  -[UberCollectionViewCell layoutIfNeeded](v5, "layoutIfNeeded");
  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for UberCollectionViewCell();
  v6 = -[UberCollectionViewCell preferredLayoutAttributesFittingAttributes:](&v8, "preferredLayoutAttributesFittingAttributes:", v4);

  return v6;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews22UberCollectionViewCell *v2;

  v2 = self;
  sub_225874();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22UberCollectionViewCell_uberBackgroundView));
  sub_27F60(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews22UberCollectionViewCell_background), self->yOffset[OBJC_IVAR____TtC23ShelfKitCollectionViews22UberCollectionViewCell_background]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22UberCollectionViewCell____lazy_storage___fadeOutView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews22UberCollectionViewCell_requestCancellable));
}

@end
