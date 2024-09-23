@implementation ProductTapToRateCollectionViewCell

- (_TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell *)sub_169060(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)ratingChangedWithSender:(id)a3
{
  _TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell *v5;
  __n128 v6;
  uint64_t v7;
  _TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell *v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9, v7, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v8 = self;
  }
  sub_1697F4();

  sub_D1D4((uint64_t)v9, &qword_3D1A70);
}

- (_TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_16A778();
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
  -[ProductTapToRateCollectionViewCell traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  v6 = objc_msgSend(v5, "traitCollection", v7.receiver, v7.super_class);
  sub_16974C(v6);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell_ratingControl));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell_rateAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews34ProductTapToRateCollectionViewCell_stackView));
}

@end
