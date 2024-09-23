@implementation JSSocialProfileEditorViewController

- (_TtC16MusicApplication35JSSocialProfileEditorViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_B148BC();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication35JSSocialProfileEditorViewController *v2;

  v2 = self;
  sub_B0E260();

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 2;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _TtC16MusicApplication35JSSocialProfileEditorViewController *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  objc_opt_self(UICollectionViewTableCell);
  v13 = swift_dynamicCastObjCClass(a4);
  if (!v13)
  {
    v21 = a5;
    goto LABEL_5;
  }
  v14 = (void *)v13;
  v15 = a4;
  v16 = a3;
  v17 = a5;
  v18 = self;
  v19 = objc_msgSend(v14, "tableViewCell");
  if (v19)
  {
    v20 = v19;
    objc_msgSend(v19, "setSeparatorStyle:", 0);

LABEL_5:
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

    return;
  }
  __break(1u);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication35JSSocialProfileEditorViewController *v13;
  _BYTE *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = sub_B0F728((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _TtC16MusicApplication35JSSocialProfileEditorViewController *v19;
  void *v20;
  uint64_t v22;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = self;
  v20 = (void *)sub_B0FED8(v16, v13, v15, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRelease();

  return v20;
}

- (double)collectionView:(id)a3 heightForHeaderViewInTableLayout:(id)a4
{
  double v4;
  double result;

  objc_msgSend(a3, "bounds");
  result = v4 + 32.0;
  if (v4 > 128.0)
    return 160.0;
  return result;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  _TtC16MusicApplication35JSSocialProfileEditorViewController *v16;
  id v17;
  double v18;
  double v19;
  uint64_t v21;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  type metadata accessor for SocialProfileEditorCell();
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  v17 = -[JSSocialProfileEditorViewController traitCollection](v16, "traitCollection");
  sub_14A640(v17, 0.0);
  v19 = v18;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v19;
}

- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 editingStyleForRowAtIndexPath:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v6 = type metadata accessor for IndexPath(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return 0;
}

- (BOOL)collectionView:(id)a3 tableLayout:(id)a4 shouldIndentWhileEditingRowAtIndexPath:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v6 = type metadata accessor for IndexPath(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return 0;
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC16MusicApplication35JSSocialProfileEditorViewController *v13;

  type metadata accessor for InfoKey(0);
  v8 = v7;
  v9 = sub_317F48((unint64_t *)&unk_14E8690, 255, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_105EEEC);
  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v8, (char *)&type metadata for Any + 8, v9);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_B10C20(v11, v10);

  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4;
  _TtC16MusicApplication35JSSocialProfileEditorViewController *v5;

  v4 = a3;
  v5 = self;
  sub_B11124(v4);

}

- (_TtC16MusicApplication35JSSocialProfileEditorViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC16MusicApplication35JSSocialProfileEditorViewController *result;

  v3 = a3;
  result = (_TtC16MusicApplication35JSSocialProfileEditorViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSSocialProfileEditorViewController", 52, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC16MusicApplication35JSSocialProfileEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication35JSSocialProfileEditorViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication35JSSocialProfileEditorViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSSocialProfileEditorViewController", 52, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_64880((uint64_t)self + OBJC_IVAR____TtC16MusicApplication35JSSocialProfileEditorViewController_validationDelegate);
  sub_64880((uint64_t)self + OBJC_IVAR____TtC16MusicApplication35JSSocialProfileEditorViewController_textInputDelegate);
  sub_64880((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication35JSSocialProfileEditorViewController_propertyChangedObservingDelegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35JSSocialProfileEditorViewController_greenTeaLogger));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35JSSocialProfileEditorViewController_profileEditor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35JSSocialProfileEditorViewController_profilePerson));
  sub_15C188(*(id *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC16MusicApplication35JSSocialProfileEditorViewController_userPhotoUpdate));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
