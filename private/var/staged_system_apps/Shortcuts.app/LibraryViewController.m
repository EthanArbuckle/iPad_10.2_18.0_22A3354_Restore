@implementation LibraryViewController

- (BOOL)canBecomeFirstResponder
{
  _TtC9Shortcuts21LibraryViewController *v2;
  char v3;
  char v4;

  v2 = self;
  sub_100004BA8();
  v4 = v3;

  return v4 & 1;
}

- (void)didMoveToParentViewController:(id)a3
{
  _TtC9Shortcuts21LibraryViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_100074FD0((uint64_t)a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9Shortcuts21LibraryViewController *v3;

  v3 = self;
  sub_1000750B8();

}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8;
  id v9;
  _TtC9Shortcuts21LibraryViewController *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = sub_1000123F8((uint64_t)v8, (uint64_t)v9, a5);
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)viewWillLayoutSubviews
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_10000B954((const char **)&selRef_viewWillLayoutSubviews);

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC9Shortcuts21LibraryViewController *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  CGSize result;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_10001925C(v13, v16, (uint64_t)v12);
  v18 = v17;
  v20 = v19;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v21 = v18;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v5;
  double v6;
  CGSize result;

  sub_10000EBD4(self, (uint64_t)a2, a3, a4, a5, (void (*)(id))sub_100018970);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double v5;
  double v6;
  CGSize result;

  sub_10000EBD4(self, (uint64_t)a2, a3, a4, a5, sub_1000190E4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)viewLayoutMarginsDidChange
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_10000B954((const char **)&selRef_viewLayoutMarginsDidChange);

}

- (void)viewDidLoad
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_10000ECBC();

}

- (void)startEditing
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_100044284();

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC9Shortcuts21LibraryViewController *v6;

  v6 = self;
  sub_1000442CC(a3, a4);

}

- (void)finishEditing
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_1000446D8();

}

- (void)moveSelected
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_1000448F4((uint64_t)v2);

}

- (void)removeSelected:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC9Shortcuts21LibraryViewController *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_10004499C(v4);

  swift_bridgeObjectRelease(v6);
}

- (void)deleteSelected:(id)a3
{
  id v4;
  _TtC9Shortcuts21LibraryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100044B3C(v4);

}

- (void)duplicateSelected
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_100045140();

}

- (void)selectAllCells
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_100045468();

}

- (void)deselectAllCells
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_100045BA8();

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC9Shortcuts21LibraryViewController *v11;
  void *v12;
  void *v13;

  v8 = type metadata accessor for IndexPath(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = self;
  sub_10005F620();
  v13 = v12;

  swift_bridgeObjectRelease(v9);
  return v13;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  return sub_10006164C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, sub_100068CD0);
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  return sub_10006164C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(void))sub_100061638);
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC9Shortcuts21LibraryViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_100061774((uint64_t)v10, v9, a5);

  swift_unknownObjectRelease(a5);
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC9Shortcuts21LibraryViewController *v14;
  uint64_t v15;
  _QWORD *v16;
  Class isa;
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  swift_unknownObjectRetain(a4);
  v14 = self;
  v16 = sub_10006FBA0((uint64_t)v14, v15, (uint64_t)v12);

  swift_unknownObjectRelease(a4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_100003B2C(0, &qword_1000D3678, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v16);
  return isa;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC9Shortcuts21LibraryViewController *v15;
  _QWORD *v16;
  Class isa;
  uint64_t v19;

  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v14 = a3;
  swift_unknownObjectRetain(a4);
  v15 = self;
  v16 = sub_10006FF50((uint64_t)v14, a4);

  swift_unknownObjectRelease(a4);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_100003B2C(0, &qword_1000D3678, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v16);
  return isa;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  return sub_10007031C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_10007028C);
}

- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4
{
  return sub_10007031C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_100071D64);
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v6;
  _TtC9Shortcuts21LibraryViewController *v7;
  unsigned __int8 v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_1000703D0((uint64_t)v7, a4);

  swift_unknownObjectRelease(a4);
  return v8 & 1;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC9Shortcuts21LibraryViewController *v15;
  id v16;
  uint64_t v18;

  v9 = sub_100012E2C(&qword_1000D10F0);
  __chkstk_darwin(v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v12 = type metadata accessor for IndexPath(0);
    v13 = 0;
  }
  else
  {
    v12 = type metadata accessor for IndexPath(0);
    v13 = 1;
  }
  sub_100015D74((uint64_t)v11, v13, 1, v12);
  v14 = a3;
  swift_unknownObjectRetain(a4);
  v15 = self;
  v16 = sub_1000704CC(v14, (unint64_t)a4, (uint64_t)v11);

  swift_unknownObjectRelease(a4);
  sub_100071CE8((uint64_t)v11, &qword_1000D10F0);
  return v16;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  _TtC9Shortcuts21LibraryViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_100070C40((uint64_t)v6, a4);

  swift_unknownObjectRelease(a4);
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v6;
  _TtC9Shortcuts21LibraryViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_100071B68((int)v7, a4);

  swift_unknownObjectRelease(a4);
}

- (UICollectionView)collectionView
{
  _TtC9Shortcuts21LibraryViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_10000C98C();
  v4 = v3;

  return (UICollectionView *)v4;
}

- (void)setCollectionView:(id)a3
{
  id v4;
  _TtC9Shortcuts21LibraryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100073144((uint64_t)v4);

}

- (void)dealloc
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_100074904();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100014CFC((uint64_t)self + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_groups));
  sub_100079EEC(OBJC_IVAR____TtC9Shortcuts21LibraryViewController_shortcutMoveService);
  v3 = (char *)self + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_configuration;
  v4 = sub_100047F14();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100079EEC(OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___dataSource);
  sub_100013B84(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics), *(_QWORD *)&self->database[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics], *(void **)&self->delegate[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics], *(void **)&self->delegate[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics + 8], *(_QWORD *)&self->groups[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics], *(_QWORD *)&self->shortcutMoveService[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics], *(_QWORD *)&self->hasLoadedInitialData[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics], *(_QWORD *)&self->$__lazy_storage_$_dataSource[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics+ 7], *(_QWORD *)&self->$__lazy_storage_$_layoutMetrics[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics+ 7], *(void **)&self->$__lazy_storage_$_layoutMetrics[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics+ 15], *(_QWORD *)&self->$__lazy_storage_$_layoutMetrics[OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutMetrics+ 23]);
  sub_100014BF8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___editingItems));
  sub_100026D28(OBJC_IVAR____TtC9Shortcuts21LibraryViewController_flowLayout);
  sub_100026D28(OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___collectionView);
  sub_100026D28(OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___tableView);
  sub_100026D28(OBJC_IVAR____TtC9Shortcuts21LibraryViewController_searchController);
  sub_100079E08(OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___toolbarViewController);
  sub_100026D28(OBJC_IVAR____TtC9Shortcuts21LibraryViewController_customPlusButton);
  sub_100079E08(OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___createButtonItem);
  sub_100026D28(OBJC_IVAR____TtC9Shortcuts21LibraryViewController_customEditButton);
  sub_100079E08(OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage____editButtonItem);
  sub_100026D28(OBJC_IVAR____TtC9Shortcuts21LibraryViewController_customLayoutButton);
  sub_100026D28(OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___layoutButtonItem);
  sub_100026D28(OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___overflowMenuButtonItem);
  swift_bridgeObjectRelease(*(_QWORD *)&self->database[OBJC_IVAR____TtC9Shortcuts21LibraryViewController_libraryAccessibilityIdentifier]);
  sub_100026D28(OBJC_IVAR____TtC9Shortcuts21LibraryViewController_customSyncUnavailableButtonItem);
  sub_100079E08(OBJC_IVAR____TtC9Shortcuts21LibraryViewController____lazy_storage___syncUnavailableButtonItem);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_cancellables));
  sub_100007AEC((uint64_t)self + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_tip, &qword_1000D3910);
  sub_100079EEC(OBJC_IVAR____TtC9Shortcuts21LibraryViewController_tipStatusObservation);
  sub_100079BBC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_lockedAppBundleIdCache));
}

- (_TtC9Shortcuts21LibraryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100074BC4();
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9Shortcuts21LibraryViewController *v3;

  v3 = self;
  sub_100075048();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9Shortcuts21LibraryViewController *v3;

  v3 = self;
  sub_100075118();

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC9Shortcuts21LibraryViewController *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _TtC9Shortcuts21LibraryViewController *v18;
  _OWORD v19[2];

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v10 = v9;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v19, 0, sizeof(v19));
    v17 = a5;
    v18 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4);
  v11 = a5;
  v12 = self;
  _bridgeAnyObjectToAny(_:)(v19, a4);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v14 = v13;
  sub_1000040A8(&qword_1000D38E0, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey);
  v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v14, (char *)&type metadata for Any + 8, v15);

LABEL_8:
  sub_100075190();

  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v10);
  sub_100007AEC((uint64_t)v19, (uint64_t *)&unk_1000D3650);
}

- (void)didBecomeActive:(id)a3
{
  id v4;
  _TtC9Shortcuts21LibraryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100075434();

}

- (void)keyboardWillChange:(id)a3
{
  id v4;
  _TtC9Shortcuts21LibraryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100075FEC(v4);

}

- (void)createWorkflow:(id)a3
{
  _TtC9Shortcuts21LibraryViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_10007619C();

}

- (void)presentAutoShortcutAppSettings
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_1000762BC();

}

- (void)syncUnavailableItemPressed:(id)a3
{
  id v4;
  _TtC9Shortcuts21LibraryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100076510();

}

- (NSArray)keyCommands
{
  _TtC9Shortcuts21LibraryViewController *v2;
  unint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_100076A10();

  if (v3)
  {
    sub_100003B2C(0, &qword_1000D1230, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)duplicateSelectedWorkflowsFromKeyboard
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_100076FF4((uint64_t)v2);

}

- (void)deleteSelectedWorkflowsFromKeyboard
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_100077088((uint64_t)v2);

}

- (void)openSelectedWorkflowFromKeyboard
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_1000770E4((uint64_t)v2);

}

- (void)handleEscapeKeyboardPress
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_100077194((uint64_t)v2);

}

- (void)runSelectedShortcutFromKeyboard
{
  _TtC9Shortcuts21LibraryViewController *v2;

  v2 = self;
  sub_100077204((uint64_t)v2);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  sub_100077530();
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  sub_100077530();
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return sub_100077FBC();
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9Shortcuts21LibraryViewController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_1000777F8();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9Shortcuts21LibraryViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1000778CC();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_100077FBC();
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return sub_100077FBC();
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9Shortcuts21LibraryViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100078030(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)axCreateButton
{
  _TtC9Shortcuts21LibraryViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100078678();

  return v3;
}

- (void)axDeleteWorkflowAction:(id)a3
{
  _TtC9Shortcuts21LibraryViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1000786AC(v5);

}

- (void)axDuplicateWorkflowAction:(id)a3
{
  _TtC9Shortcuts21LibraryViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_100078980(v5);

}

- (_TtC9Shortcuts21LibraryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_100078A6C();
}

- (BOOL)scrollForNavigationTap
{
  _TtC9Shortcuts21LibraryViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_100078C8C();

  return v3 & 1;
}

- (void)libraryCellDidRequestComposeUI:(id)a3
{
  id v4;
  _TtC9Shortcuts21LibraryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000898A0((uint64_t)v4);

}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  uint64_t v11;
  unint64_t v12;
  id v13;
  _TtC9Shortcuts21LibraryViewController *v14;

  v11 = sub_100003B2C(0, (unint64_t *)&qword_1000D13B8, WFDatabaseObjectDescriptor_ptr);
  v12 = sub_10007CECC();
  static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v11, v12);
  static Set._unconditionallyBridgeFromObjectiveC(_:)(a5, v11, v12);
  static Set._unconditionallyBridgeFromObjectiveC(_:)(a6, v11, v12);
  v13 = a3;
  v14 = self;
  sub_10008D320();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
