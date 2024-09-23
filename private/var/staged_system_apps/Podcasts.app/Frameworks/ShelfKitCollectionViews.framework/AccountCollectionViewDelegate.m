@implementation AccountCollectionViewDelegate

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate *v12;
  char v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = AccountPresenter.shouldSelectItem(at:)(v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13 & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate *v12;
  Class isa;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  AccountPresenter.didSelectItem(at:)(v10);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v11, "deselectItemAtIndexPath:animated:", isa, 1);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate *v20;
  __n128 v21;
  uint64_t v22;

  v11 = type metadata accessor for IndexPath(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v17 = v16;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v18 = a3;
  v19 = a4;
  v20 = self;
  sub_20170C(v19, v15, v17, (uint64_t)v14);

  v21 = swift_bridgeObjectRelease(v17);
  (*(void (**)(char *, uint64_t, __n128))(v12 + 8))(v14, v11, v21);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1FF578(v13, v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (_TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate)init
{
  _TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate *result;

  result = (_TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.AccountCollectionViewDelegate", 53, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate_presenter));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate_pageTraits));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate_activeTextField);
}

- (double)collectionView:(id)a3 heightForHeaderViewInTableLayout:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  _TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate *v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  char v14;

  v6 = qword_3CF9A0;
  v7 = a3;
  v8 = a4;
  v9 = self;
  if (v6 != -1)
    swift_once(&qword_3CF9A0, sub_1BE5F0);
  v10 = *(double *)&xmmword_3FCD78;
  if (byte_3FCD88 == 1)
  {
    v11 = *((double *)&xmmword_3FCD78 + 1);
    v12 = *(double *)&xmmword_3FCD78;
    v13 = sub_1FEB8();
    v14 = static UITraitCollection.interfaceIdiomIsMac.getter(v13);

    if ((v14 & 1) != 0)
      return v12;
    else
      return v11;
  }
  else
  {

    return v10;
  }
}

- (double)collectionView:(id)a3 heightForFooterViewInTableLayout:(id)a4
{
  id v6;
  id v7;
  _TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate *v8;
  double v9;
  double v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_202148(v6);
  v10 = v9;

  return v10;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  _TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate *v10;
  double v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = sub_20223C(v8, a5);

  return v11;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForFooterInSection:(int64_t)a5
{
  id v8;
  id v9;
  _TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate *v10;
  double v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = sub_201D94(v8, a5);

  return v11;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate *v15;
  double v16;
  double v17;
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_202464(v13, (uint64_t)v12);
  v17 = v16;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v17;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate_activeTextField, a3);
}

- (void)textFieldDidEndEditing:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate_activeTextField, 0);
}

@end
