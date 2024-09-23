@implementation ShelvesDelegate

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC23ShelfKitCollectionViews15ShelvesDelegate *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = ShelvesDelegate.collectionView(_:shouldSelectItemAt:)(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC23ShelfKitCollectionViews15ShelvesDelegate *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = ShelvesDelegate.collectionView(_:shouldSelectItemAt:)(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC23ShelfKitCollectionViews15ShelvesDelegate *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  ShelvesDelegate.collectionView(_:didSelectItemAt:)(v11, v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  _TtC23ShelfKitCollectionViews15ShelvesDelegate *v16;
  uint64_t v17;

  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v14 = a3;
  v15 = a4;
  v16 = self;
  sub_E2D98(v15, (uint64_t)v13);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_DD5A0(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, char *))ShelvesDelegate.collectionView(_:willDisplay:forItemAt:));
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_DD5A0(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, char *))ShelvesDelegate.collectionView(_:didEndDisplaying:forItemAt:));
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC23ShelfKitCollectionViews15ShelvesDelegate *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_E3914((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC23ShelfKitCollectionViews15ShelvesDelegate *v15;
  void *v16;
  uint64_t v18;

  y = a5.y;
  x = a5.x;
  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = a3;
  v15 = self;
  v16 = (void *)ShelvesDelegate.collectionView(_:contextMenuConfigurationForItemAt:point:)(v14, (uint64_t)v13, x, y);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return v16;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  return sub_DF0E8(self, (uint64_t)a2, a3, a4, 1);
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  return sub_DF0E8(self, (uint64_t)a2, a3, a4, 0);
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _TtC23ShelfKitCollectionViews15ShelvesDelegate *v14;

  v9 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_episodeController);
  v10 = v9[3];
  v11 = v9[4];
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v12 = a3;
  v13 = a4;
  swift_unknownObjectRetain(a5);
  v14 = self;
  dispatch thunk of EpisodeControllerProtocol.contextMenuWillPerformPreviewAction(configuration:animator:)(v13, a5, v10, v11);

  swift_unknownObjectRelease(a5);
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  objc_msgSend(a3, "setActivityItemsConfiguration:", 0, a4, a5);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  _TtC23ShelfKitCollectionViews15ShelvesDelegate *v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, uint64_t);
  Class isa;
  uint64_t v26;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v26 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)&v26 - v17;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = a3;
  v20 = self;
  v21 = IndexPath.section.getter();
  if (v21 == IndexPath.section.getter())
    v22 = v13;
  else
    v22 = v16;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v18, v22, v9);

  v23 = *(void (**)(char *, uint64_t))(v10 + 8);
  v23(v13, v9);
  v23(v16, v9);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v23(v18, v9);
  return isa;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews15ShelvesDelegate *v5;

  v4 = a3;
  v5 = self;
  ShelvesDelegate.scrollViewDidScroll(_:)((UIScrollView)v4);

}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews15ShelvesDelegate *v5;

  v4 = a3;
  v5 = self;
  ShelvesDelegate.scrollViewWillBeginDecelerating(_:)((UIScrollView)v4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews15ShelvesDelegate *v5;

  v4 = a3;
  v5 = self;
  ShelvesDelegate.scrollViewDidEndDecelerating(_:)((UIScrollView)v4);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  _TtC23ShelfKitCollectionViews15ShelvesDelegate *v7;

  v6 = a3;
  v7 = self;
  ShelvesDelegate.scrollViewDidEndDragging(_:willDecelerate:)((UIScrollView)v6, a4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  _TtC23ShelfKitCollectionViews15ShelvesDelegate *v10;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = self;
  ShelvesDelegate.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)((uint64_t)v9, (uint64_t)a5, x, y);

}

- (_TtC23ShelfKitCollectionViews15ShelvesDelegate)init
{
  _TtC23ShelfKitCollectionViews15ShelvesDelegate *result;

  result = (_TtC23ShelfKitCollectionViews15ShelvesDelegate *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.ShelvesDelegate", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_objectGraph));
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_presenter, (uint64_t *)&unk_3D5690);
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_episodeController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_scrollCoordinators));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_uberCellPublisher));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_overflowTransitioningDelegate));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_clickLocationTracker));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_impressionsCalculator));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_multiSelectableExtension));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_highlightsProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_modernImpressionsScrollCoordinator));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_recentlySearchedStore));
  v3 = *(_QWORD *)&self->presenter[OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_converter];
  v4 = *(_QWORD *)&self->presenter[OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_converter + 8];
  v5 = *(_QWORD *)&self->presenter[OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_converter + 16];
  v6 = *(_QWORD *)&self->presenter[OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_converter + 24];
  v7 = *(_QWORD *)&self->presenter[OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_converter + 32];
  v8 = *(_QWORD *)&self->episodeController[OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_converter];
  v9 = *(_QWORD *)&self->episodeController[OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_converter + 8];
  v10 = *(_QWORD *)&self->episodeController[OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_converter + 16];
  sub_1D618(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_converter), *(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_converter]);
  sub_1D618(v3, v4);
  sub_1D618(v5, v6);
  sub_1D618(v7, v8);
  sub_1D618(v9, v10);
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_currentContextMenuIndexPath, (uint64_t *)&unk_3D1A00);
}

@end
