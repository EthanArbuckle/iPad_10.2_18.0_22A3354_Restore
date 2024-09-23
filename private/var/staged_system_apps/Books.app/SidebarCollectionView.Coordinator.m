@implementation SidebarCollectionView.Coordinator

- (_TtCV5Books21SidebarCollectionView11Coordinator)init
{
  _TtCV5Books21SidebarCollectionView11Coordinator *result;

  result = (_TtCV5Books21SidebarCollectionView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("Books.Coordinator", 17, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtCV5Books21SidebarCollectionView11Coordinator_collectionViewController);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCV5Books21SidebarCollectionView11Coordinator_cellProvider));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCV5Books21SidebarCollectionView11Coordinator_eventPublisher));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCV5Books21SidebarCollectionView11Coordinator_cancellables));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCV5Books21SidebarCollectionView11Coordinator_viewModel));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtCV5Books21SidebarCollectionView11Coordinator *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10049BBD4(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtCV5Books21SidebarCollectionView11Coordinator *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  if (objc_msgSend(v11, "isEditing"))
    sub_10049C0B4((uint64_t)v10, 1);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtCV5Books21SidebarCollectionView11Coordinator *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_10049C5D4(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtCV5Books21SidebarCollectionView11Coordinator *v13;
  id v14;
  uint64_t v16;

  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  v14 = sub_10049EF50((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _TtCV5Books21SidebarCollectionView11Coordinator *v23;
  void (*v24)(char *, char *, uint64_t);
  unsigned __int8 v25;
  void (*v26)(char *, uint64_t);
  char *v27;
  Class isa;
  uint64_t v30;
  id v31;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v30 - v14;
  __chkstk_darwin(v16);
  v18 = (char *)&v30 - v17;
  __chkstk_darwin(v19);
  v21 = (char *)&v30 - v20;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v22 = sub_100008DB0(&qword_1009E6118, (uint64_t (*)(uint64_t))&type metadata accessor for IndexPath, (uint64_t)&protocol conformance descriptor for IndexPath);
  v31 = a3;
  v23 = self;
  LOBYTE(self) = Collection.isNotEmpty.getter(v9, v22);
  v24 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v24(v12, v15, v9);
  if ((self & 1) != 0)
  {
    v25 = sub_10049CE68((uint64_t)v12);
    v26 = *(void (**)(char *, uint64_t))(v10 + 8);
    v26(v12, v9);
    if ((v25 & 1) != 0)
      v27 = v15;
    else
      v27 = v18;
  }
  else
  {
    v26 = *(void (**)(char *, uint64_t))(v10 + 8);
    v26(v12, v9);
    v27 = v18;
  }
  v24(v21, v27, v9);

  v26(v15, v9);
  v26(v18, v9);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v26(v21, v9);
  return isa;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtCV5Books21SidebarCollectionView11Coordinator *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_10049F2B8((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtCV5Books21SidebarCollectionView11Coordinator *v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v9 = sub_10004CFD4((uint64_t *)&unk_1009DE3E0);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v12 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  swift_unknownObjectRetain(a4);
  v15 = self;
  sub_10049D45C(v14, a4, (uint64_t)v11);
  v17 = v16;

  swift_unknownObjectRelease(a4);
  sub_100010960((uint64_t)v11, (uint64_t *)&unk_1009DE3E0);
  return v17;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  _TtCV5Books21SidebarCollectionView11Coordinator *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_10049F45C(a4);

  swift_unknownObjectRelease(a4);
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  return 1;
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  _TtCV5Books21SidebarCollectionView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_10049DB08(v4);

}

- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtCV5Books21SidebarCollectionView11Coordinator *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL result;
  BOOL v21;

  length = a4.length;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v10 = v9;
  v11 = a3;
  v12 = self;
  v13 = objc_msgSend(v11, "text");
  if (v13)
  {
    v14 = v13;
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    v17 = v16;

    v18 = String.count.getter(v15, v17);
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(v17);
    return v18 < 500;
  }
  v19 = String.count.getter(v8, v10);

  result = swift_bridgeObjectRelease(v10);
  v21 = __OFSUB__(v19, length);
  v18 = v19 - length;
  if (!v21)
    return v18 < 500;
  __break(1u);
  return result;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtCV5Books21SidebarCollectionView11Coordinator *v11;
  _QWORD v12[5];
  __int16 v13;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCV5Books21SidebarCollectionView11Coordinator_eventPublisher);
  v12[0] = v6;
  v12[1] = v7;
  v12[3] = 0;
  v12[4] = 0;
  v12[2] = 1;
  v13 = 768;
  v10 = a3;
  v11 = self;
  swift_retain(v9);
  PassthroughSubject.send(_:)(v12);

  swift_bridgeObjectRelease(v8);
  swift_release(v9);
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;
  _TtCV5Books21SidebarCollectionView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_10049DE3C(v4, 2);

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  _TtCV5Books21SidebarCollectionView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_10049DE3C(v4, 3);

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;
  _TtCV5Books21SidebarCollectionView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_10049DE3C(v4, 4);

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return objc_msgSend(a3, "isUserInteractionEnabled");
}

- (void)textFieldDidBeginEditing:(id)a3
{
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, a3);
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  _TtCV5Books21SidebarCollectionView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_10049DF6C(v4);

}

- (void)hoveringChevron:(id)a3
{
  id v4;
  _TtCV5Books21SidebarCollectionView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_10049FB54(v4);

}

- (void)updateChevronVisibilityForAccessibilityOnCell:(id)a3
{
  id v5;
  double v6;
  _TtCV5Books21SidebarCollectionView11Coordinator *v7;

  v5 = a3;
  v7 = self;
  sub_1004A0228(a3, v6);

}

@end
