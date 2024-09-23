@implementation ComposeReviewViewController

- (void)viewWillAppear:(BOOL)a3
{
  sub_E8850(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, (SEL *)&selRef_beginDelayingNotifications);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_E8850(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (SEL *)&selRef_endDelayingNotifications);
}

- (_TtC23ShelfKitCollectionViews27ComposeReviewViewController)initWithCompositionURL:(id)a3
{
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_3D2D70);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
    v8 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  return (_TtC23ShelfKitCollectionViews27ComposeReviewViewController *)sub_E88E0((uint64_t)v7);
}

- (_TtC23ShelfKitCollectionViews27ComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC23ShelfKitCollectionViews27ComposeReviewViewController *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
    v10 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[ComposeReviewViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (_TtC23ShelfKitCollectionViews27ComposeReviewViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[ComposeReviewViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
