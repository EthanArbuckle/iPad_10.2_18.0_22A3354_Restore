@implementation DOCGoToSuggestionsViewController

- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _TtC5Files32DOCGoToSuggestionsViewController *v10;
  id v11;
  char *v12;
  _TtC5Files32DOCGoToSuggestionsViewController **v13;
  uint64_t v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = self;
  v11 = sub_1004548D8();
  v12 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DOCGoToSuggestionsCollectionView()), "initWithFrame:collectionViewLayout:", v11, x, y, width, height);

  v13 = (_TtC5Files32DOCGoToSuggestionsViewController **)&v12[OBJC_IVAR____TtC5FilesP33_D3104C987618D68A12FF2C3DB05A577232DOCGoToSuggestionsCollectionView_focusableCollectionViewDelegate];
  v14 = *(_QWORD *)&v12[OBJC_IVAR____TtC5FilesP33_D3104C987618D68A12FF2C3DB05A577232DOCGoToSuggestionsCollectionView_focusableCollectionViewDelegate];
  *v13 = v10;
  v13[1] = (_TtC5Files32DOCGoToSuggestionsViewController *)&off_1005ED7E8;

  swift_unknownObjectRelease(v14);
  return v12;
}

- (void)viewDidLoad
{
  _TtC5Files32DOCGoToSuggestionsViewController *v2;

  v2 = self;
  sub_100455274();

}

- (void)viewLayoutMarginsDidChange
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCGoToSuggestionsViewController();
  v2 = v6.receiver;
  -[DOCGoToSuggestionsViewController viewLayoutMarginsDidChange](&v6, "viewLayoutMarginsDidChange");
  v3 = objc_msgSend(v2, "collectionView", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "collectionViewLayout");

    objc_msgSend(v5, "invalidateLayout");
  }
  else
  {
    __break(1u);
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if ((*((_BYTE *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC5Files32DOCGoToSuggestionsViewController_isFiltering) & 1) != 0)
    return 1;
  else
    return (*(_QWORD **)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC5Files32DOCGoToSuggestionsViewController_sections))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return sub_10045790C(a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Files32DOCGoToSuggestionsViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_100455C6C(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC5Files32DOCGoToSuggestionsViewController *v16;
  void *v17;
  __n128 v18;
  uint64_t v20;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = v13;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = a3;
  v16 = self;
  v17 = (void *)sub_100456138(v15);

  v18 = swift_bridgeObjectRelease(v14);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v18);
  return v17;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Files32DOCGoToSuggestionsViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100457968((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC5Files32DOCGoToSuggestionsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC5Files32DOCGoToSuggestionsViewController *result;

  v3 = a3;
  result = (_TtC5Files32DOCGoToSuggestionsViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCGoToSuggestionsViewController", 38, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;

  v3 = *(void **)&self->metrics[OBJC_IVAR____TtC5Files32DOCGoToSuggestionsViewController_metrics + 88];

  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files32DOCGoToSuggestionsViewController_suggestionsTableViewDelegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files32DOCGoToSuggestionsViewController_suggestions));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files32DOCGoToSuggestionsViewController_sections));
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSArray)keyCommands
{
  _TtC5Files32DOCGoToSuggestionsViewController *v2;
  _QWORD *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1004570FC();

  if (v3)
  {
    sub_10004F2F0(0, &qword_1006445C0, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)performKeyCommand:(id)a3
{
  id v4;
  _TtC5Files32DOCGoToSuggestionsViewController *v5;
  id v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = self;
  v6 = -[DOCGoToSuggestionsViewController collectionView](v5, "collectionView");
  if (v6)
  {
    v10 = v6;
    ObjectType = swift_getObjectType(v6, v7);
    v9 = swift_conformsToProtocol2(ObjectType, &protocol descriptor for DOCFocusableCollectionView);
    if (v9)
    {
      (*(void (**)(id, uint64_t, uint64_t))(v9 + 104))(v4, ObjectType, v9);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

@end
