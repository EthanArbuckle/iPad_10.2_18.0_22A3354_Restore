@implementation AccountSectionSupplementaryView

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AccountSectionSupplementaryView();
  return -[AccountSectionSupplementaryView backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AccountSectionSupplementaryView();
  v4 = v9.receiver;
  v5 = a3;
  -[AccountSectionSupplementaryView setBackgroundColor:](&v9, "setBackgroundColor:", v5);
  v6 = objc_msgSend(v4, "backgroundView", v9.receiver, v9.super_class);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v4, "backgroundColor");
    objc_msgSend(v7, "setBackgroundColor:", v8);

    v4 = v8;
    v5 = v7;
  }

}

- (_TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView *result;

  if (a3)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  sub_186110(v3, v4);
  return result;
}

- (_TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1871AC();
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView *v2;

  v2 = self;
  sub_18643C();

}

- (void)buttonTapped
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView *v5;

  v2 = *(void (**)(uint64_t))&self->UICollectionViewTableHeaderFooterView_opaque[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView_buttonAction];
  if (v2)
  {
    v3 = *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView_buttonAction];
    v5 = self;
    v4 = sub_2C690((uint64_t)v2, v3);
    v2(v4);
    sub_1D618((uint64_t)v2, v3);

  }
}

- (void)prepareForReuse
{
  _TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView *v2;

  v2 = self;
  sub_186AA4();

}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)&self->UICollectionViewTableHeaderFooterView_opaque[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView_titleLabel];
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView_text]);
  sub_1D618(*(_QWORD *)&self->UICollectionViewTableHeaderFooterView_opaque[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView_buttonAction], *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView_buttonAction]);

}

@end
