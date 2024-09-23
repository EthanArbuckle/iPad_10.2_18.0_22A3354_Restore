@implementation CardStackViewController

- (void)viewDidLoad
{
  _TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController *v2;

  v2 = self;
  sub_22B5D4();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_22BA94();

  return v3;
}

- (void)popWithCard:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22BB7C(v4);

}

- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController *)sub_22CAE4(v5, v7, a4);
}

- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController_cardStackView) = 0;
  v6 = (char *)self
     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController_delegate;
  *((_QWORD *)v6 + 1) = 0;
  swift_unknownObjectWeakInit(v6, 0);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController_maximumNumberOfCards) = (Class)(&dword_0 + 3);
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[CardStackViewController initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController_cardStackView));
  sub_10DBC8((uint64_t)self+ OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController_delegate);
}

@end
