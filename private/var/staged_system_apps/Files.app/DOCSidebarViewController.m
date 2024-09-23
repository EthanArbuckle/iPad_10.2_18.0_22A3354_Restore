@implementation DOCSidebarViewController

- (void)noteBrowserDidUpdateHierarchy:(id)a3 displayedRootLocation:(id)a4
{
  id v6;
  id v7;
  _TtC5Files24DOCSidebarViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  -[DOCSidebarViewController updateSelectionToMatchBrowsedLocation:scrollToVisible:](v8, "updateSelectionToMatchBrowsedLocation:scrollToVisible:", v7, 0);
  sub_100020920();

}

- (BOOL)isEditing
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC5Files24DOCSidebarViewController_editingSession);
  return v2 && *(_BYTE *)(v2 + 17) != 0;
}

- (void)setSidebarDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC5Files24DOCSidebarViewController_sidebarDelegate, a3);
}

- (_TtC5Files24DOCSidebarViewController)initWithConfiguration:(id)a3 sourceObserver:(id)a4
{
  return (_TtC5Files24DOCSidebarViewController *)sub_100019CB4(a3, a4);
}

- (void)viewDidLoad
{
  _TtC5Files24DOCSidebarViewController *v2;

  v2 = self;
  DOCSidebarViewController.viewDidLoad()();

}

- (void)setSearchController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files24DOCSidebarViewController_searchController);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files24DOCSidebarViewController_searchController) = (Class)a3;
  v3 = a3;

}

- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  _TtC5Files24DOCSidebarViewController *v11;
  id v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v11 = self;
  v12 = _s5Files24DOCSidebarViewControllerC014_newCollectionC09withFrame010collectionC6LayoutSo012UICollectionC0CSgSo6CGRectV_So0kcJ0CSgtF_0(a4, x, y, width, height);

  return v12;
}

- (UICollectionView)collectionView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCSidebarViewController(0);
  return -[DOCSidebarViewController collectionView](&v3, "collectionView");
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC5Files24DOCSidebarViewController *v14;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a3;
  swift_unknownObjectRetain(a5);
  v14 = self;
  LOBYTE(self) = sub_10016C8D8((uint64_t)v12);

  swift_unknownObjectRelease(a5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return self & 1;
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
  id v19;
  _TtC5Files24DOCSidebarViewController *v20;
  void (*v21)(char *, uint64_t);
  Class isa;
  uint64_t v24;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v24 - v14;
  __chkstk_darwin(v16);
  v18 = (char *)&v24 - v17;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = a3;
  v20 = self;
  DOCSidebarViewController.collectionView(_:targetIndexPathForMoveFromItemAt:toProposedIndexPath:)(v19, (uint64_t)v15, (uint64_t)v12, (uint64_t)v18);

  v21 = *(void (**)(char *, uint64_t))(v10 + 8);
  v21(v12, v9);
  v21(v15, v9);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v21(v18, v9);
  return isa;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  _TtC5Files24DOCSidebarViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_100165CEC((uint64_t)v6, a4);

  swift_unknownObjectRelease(a4);
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v6;
  _TtC5Files24DOCSidebarViewController *v7;
  char v8;
  char v9;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_10016D5B8(a4);
  v9 = v8;

  swift_unknownObjectRelease(a4);
  return v9 & 1;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v6;
  _TtC5Files24DOCSidebarViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_10016D724((uint64_t)a4);

  swift_unknownObjectRelease(a4);
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC5Files24DOCSidebarViewController *v15;
  id v16;
  uint64_t v18;

  v9 = sub_10006922C((uint64_t *)&unk_100642710);
  __chkstk_darwin(v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v16 = sub_10016D850(a4, (uint64_t)v11);

  swift_unknownObjectRelease(a4);
  sub_10000CB4C((uint64_t)v11, (uint64_t *)&unk_100642710);
  return v16;
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  sub_1000E0260(self, (uint64_t)a2, a3, (uint64_t)a4, _s5Files24DOCSidebarViewControllerC010collectionC0_18dropSessionDidExitySo012UICollectionC0C_So06UIDropG0_ptF_0);
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  sub_1000E0260(self, (uint64_t)a2, a3, (uint64_t)a4, _s5Files24DOCSidebarViewControllerC010collectionC0_17dropSessionDidEndySo012UICollectionC0C_So06UIDropG0_ptF_0);
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(char *, uint64_t, uint64_t);
  int64_t v18;
  int64_t result;
  id v21;
  _TtC5Files24DOCSidebarViewController *v22;
  uint64_t v23;
  uint64_t v24;

  v9 = sub_10006922C((uint64_t *)&unk_100642710);
  __chkstk_darwin(v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v14 = (char *)&v24 - v13;
  if (!a5)
  {
    v23 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v14, 1, 1, v23);
    v18 = 0;
    goto LABEL_9;
  }
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = type metadata accessor for IndexPath(0);
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
  v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = 0;
  if (v17(v14, 1, v15) == 1 || a4 == 0)
    goto LABEL_9;
  sub_1000271D4((uint64_t)v14, (uint64_t)v11, (uint64_t *)&unk_100642710);
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v17)(v11, 1, v15);
  if ((_DWORD)result != 1)
  {
    v21 = a3;
    swift_unknownObjectRetain(a4);
    v22 = self;
    v18 = sub_10016DC64((uint64_t)v11);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v15);

    swift_unknownObjectRelease(a4);
LABEL_9:
    sub_10000CB4C((uint64_t)v14, (uint64_t *)&unk_100642710);
    return v18;
  }
  __break(1u);
  return result;
}

- (BOOL)sidebarHasActiveFocus
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC5Files24DOCSidebarViewController_sidebarHasActiveFocus);
}

- (void)setSidebarHasActiveFocus:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Files24DOCSidebarViewController_sidebarHasActiveFocus) = a3;
}

- (_TtP5Files32DOCSidebarViewControllerDelegate_)sidebarDelegate
{
  return (_TtP5Files32DOCSidebarViewControllerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Files24DOCSidebarViewController_sidebarDelegate, a2);
}

- (_TtC5Files16DOCPickerContext)pickerContext
{
  return (_TtC5Files16DOCPickerContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                 + OBJC_IVAR____TtC5Files24DOCSidebarViewController_pickerContext));
}

- (void)setPickerContext:(id)a3
{
  _TtC5Files24DOCSidebarViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_10023C7F8(a3);

}

- (DOCConcreteLocation)selectedLocation
{
  return (DOCConcreteLocation *)objc_retainAutoreleaseReturnValue((*(id **)((char *)&self->super.super.super.super.super.isa
                                                                          + OBJC_IVAR____TtC5Files24DOCSidebarViewController_locationSelection))[2]);
}

- (_TtC5Files19DOCSearchController)searchController
{
  return (_TtC5Files19DOCSearchController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC5Files24DOCSidebarViewController_searchController));
}

- (NSArray)additionalTrailingNavigationBarButtonItems
{
  return (NSArray *)sub_100234B34((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Files24DOCSidebarViewController_additionalTrailingNavigationBarButtonItems, (unint64_t *)&qword_1006475F0, UIBarButtonItem_ptr);
}

- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  _TtC5Files24DOCSidebarViewController *v8;

  v5 = sub_10004F2F0(0, (unint64_t *)&qword_1006475F0, UIBarButtonItem_ptr);
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC5Files24DOCSidebarViewController_additionalTrailingNavigationBarButtonItems);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files24DOCSidebarViewController_additionalTrailingNavigationBarButtonItems) = v6;
  v8 = self;
  swift_bridgeObjectRelease(v7);
  sub_10002D328();

}

- (NSArray)customActions
{
  return (NSArray *)sub_100234B34((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Files24DOCSidebarViewController_customActions, (unint64_t *)&unk_1006475D0, UIDocumentBrowserAction_ptr);
}

- (void)setCustomActions:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  _TtC5Files24DOCSidebarViewController *v11;

  v5 = sub_10004F2F0(0, (unint64_t *)&unk_1006475D0, UIDocumentBrowserAction_ptr);
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = OBJC_IVAR____TtC5Files24DOCSidebarViewController_customActions;
  v8 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC5Files24DOCSidebarViewController_customActions);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files24DOCSidebarViewController_customActions) = v6;
  v11 = self;
  swift_bridgeObjectRelease(v8);
  v9 = *(void (**)(uint64_t))((swift_isaMask & **(_QWORD **)((char *)&v11->super.super.super.super.super.isa
                                                                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_actionManager))
                                      + 0xB8);
  v10 = swift_bridgeObjectRetain(*(Class *)((char *)&self->super.super.super.super.super.isa + v7));
  v9(v10);

}

- (void)setCollectionView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCSidebarViewController(0);
  -[DOCSidebarViewController setCollectionView:](&v4, "setCollectionView:", a3);
}

- (void)dealloc
{
  _TtC5Files24DOCSidebarViewController *v2;

  v2 = self;
  DOCSidebarViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files24DOCSidebarViewController_sidebarDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_pickerContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_configuration));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files24DOCSidebarViewController__mutableSectionsData));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files24DOCSidebarViewController_sourceVisibilityController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_sourceObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files24DOCSidebarViewController____lazy_storage___notificationsController));
  swift_bridgeObjectRelease(*(_QWORD *)&self->sidebarHasActiveFocus[OBJC_IVAR____TtC5Files24DOCSidebarViewController_recentlyUsedNotificationRegistration]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_favoritesSubscriber));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_recentlyUsedFavoritesSubscriber));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_trashObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_trashSubscriber));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files24DOCSidebarViewController__diffableDataSource, &qword_100642730);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_itemToCachedIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_dropPointIndicatorView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files24DOCSidebarViewController_activeDropContext));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files24DOCSidebarViewController_editingSession));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files24DOCSidebarViewController_swipeToDeletePresentation));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files24DOCSidebarViewController_itemSelectionPacer));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files24DOCSidebarViewController_preferredFocusIndexPath, (uint64_t *)&unk_100642710);
  sub_1000B1664(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Files24DOCSidebarViewController_currentlySelectedSidebarItem), *(_QWORD *)&self->sidebarHasActiveFocus[OBJC_IVAR____TtC5Files24DOCSidebarViewController_currentlySelectedSidebarItem], *(_QWORD *)&self->sidebarDelegate[OBJC_IVAR____TtC5Files24DOCSidebarViewController_currentlySelectedSidebarItem + 7], self->pickerContext[OBJC_IVAR____TtC5Files24DOCSidebarViewController_currentlySelectedSidebarItem + 7]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->sidebarHasActiveFocus[OBJC_IVAR____TtC5Files24DOCSidebarViewController_pendingSelectionProviderDomainIdentifier]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files24DOCSidebarViewController_locationSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_searchController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_sourcesOrderObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files24DOCSidebarViewController_sourcesVisitedObserver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_sectionsDisablingUpdateAnimationUntilFirstLoad));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_additionalTrailingNavigationBarButtonItems));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files24DOCSidebarViewController_bbiStorage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_actionManager));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_customActions));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_contextMenuInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCSidebarViewController_debugOptionsMenu));
}

- (_TtC5Files24DOCSidebarViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC5Files24DOCSidebarViewController *result;

  v3 = a3;
  result = (_TtC5Files24DOCSidebarViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCSidebarViewController", 30, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCSidebarViewController(0);
  v4 = a3;
  v5 = v6.receiver;
  -[DOCSidebarViewController effectiveAppearanceDidChange:](&v6, "effectiveAppearanceDidChange:", v4);
  if (objc_msgSend(v5, "isViewLoaded", v6.receiver, v6.super_class))
    sub_1000A5F38();

}

- (void)viewDidLayoutSubviews
{
  _TtC5Files24DOCSidebarViewController *v2;

  v2 = self;
  DOCSidebarViewController.viewDidLayoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5Files24DOCSidebarViewController *v6;
  _TtC5Files24DOCSidebarViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  DOCSidebarViewController.traitCollectionDidChange(_:)(v8);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Files24DOCSidebarViewController *v4;

  v4 = self;
  DOCSidebarViewController.viewWillAppear(_:)(a3);

}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCSidebarViewController(0);
  v4 = v6.receiver;
  -[DOCSidebarViewController viewIsAppearing:](&v6, "viewIsAppearing:", v3);
  if (v4[OBJC_IVAR____TtC5Files24DOCSidebarViewController_diffableNeedsReload] == 1)
    sub_100013B5C(v3, 1);
  sub_1000A3FE8(0, 1);
  if (sub_100237858() == 2)
  {
    v5 = objc_msgSend(v4, "transitionCoordinator", v6.receiver, v6.super_class);
    sub_1003E2EB0(v3, v5);

    swift_unknownObjectRelease(v5);
  }
  else
  {

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Files24DOCSidebarViewController *v4;

  v4 = self;
  DOCSidebarViewController.viewDidAppear(_:)(a3);

}

- (void)_doc_performLiveResizeSkipped_updateNavigationButtons
{
  _TtC5Files24DOCSidebarViewController *v2;

  v2 = self;
  sub_10002D328();

}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  _TtC5Files24DOCSidebarViewController *v7;
  uint64_t v8;
  _TtC5Files24DOCSidebarViewController *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _OWORD v18[2];
  _QWORD v19[3];
  uint64_t v20;

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v18, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    v9 = self;
  }
  DOCSidebarViewController.target(forAction:withSender:)((uint64_t)a3, (uint64_t)v18, (uint64_t)v19);

  sub_10000CB4C((uint64_t)v18, &qword_100642730);
  v10 = v20;
  if (!v20)
    return 0;
  v11 = sub_10007E7A0(v19, v20);
  v12 = *(_QWORD *)(v10 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v12 + 16))(v15, v13);
  v16 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v15, v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
  sub_100068588(v19);
  return v16;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC5Files24DOCSidebarViewController *v7;
  uint64_t v8;
  _TtC5Files24DOCSidebarViewController *v9;
  unsigned __int8 v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = DOCSidebarViewController.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v12);

  sub_10000CB4C((uint64_t)v12, &qword_100642730);
  return v10 & 1;
}

- (void)performFind:(id)a3
{
  id v4;
  id v5;
  id v6;
  _TtC5Files24DOCSidebarViewController *v7;
  _TtC5Files24DOCSidebarViewController *v8;

  v4 = a3;
  v8 = self;
  v5 = -[DOCSidebarViewController navigationItem](v8, "navigationItem");
  v6 = objc_msgSend(v5, "searchController");

  if (v6)
  {
    objc_msgSend(v6, "setActive:", 1);
    v7 = (_TtC5Files24DOCSidebarViewController *)objc_msgSend(v6, "searchBar");
    -[DOCSidebarViewController becomeFirstResponder](v7, "becomeFirstResponder");

    v4 = v6;
    v8 = v7;
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Files24DOCSidebarViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10023C99C((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC5Files24DOCSidebarViewController *v11;
  _TtC5Files24DOCSidebarViewController *v12;
  unsigned __int8 v13;
  Class isa;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (_TtC5Files24DOCSidebarViewController *)a3;
  v12 = self;
  if (sub_1003E1C70((uint64_t)v10))
  {
    v13 = 1;
  }
  else
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v13 = -[DOCSidebarViewController collectionView:shouldHighlightItemAtIndexPath:](v12, "collectionView:shouldHighlightItemAtIndexPath:", v11, isa);

    v11 = v12;
    v12 = (_TtC5Files24DOCSidebarViewController *)isa;
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Files24DOCSidebarViewController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_10023CB7C((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)withLocationChangePacingDisabled:(id)a3
{
  void (**v4)(_QWORD, __n128);
  uint64_t v5;
  __n128 v6;
  _TtC5Files24DOCSidebarViewController *v7;

  v4 = (void (**)(_QWORD, __n128))_Block_copy(a3);
  v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC5Files24DOCSidebarViewController_itemSelectionPacer);
  v7 = self;
  swift_retain();
  sub_1000AF824();
  v6 = swift_release(v5);
  v4[2](v4, v6);
  _Block_release(v4);

}

- (void)updateSelectionToMatchBrowsedLocation:(id)a3 scrollToVisible:(BOOL)a4
{
  id v7;
  _TtC5Files24DOCSidebarViewController *v8;

  v7 = a3;
  v8 = self;
  sub_100028E10(a3, a4);

}

- (BOOL)sidebarVisibilityPinnedToWindowSizingOnly
{
  return 0;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Files24DOCSidebarViewController_configuration), "setSceneIdentifier:", a3);
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4;
  id v5;
  UICollectionView *v6;
  UICollectionView *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DOCSidebarViewController(0);
  v4 = a3;
  v5 = v12.receiver;
  v6 = -[DOCSidebarViewController collectionView](&v12, "collectionView");
  if (v6)
  {
    v7 = v6;
    v8 = type metadata accessor for DOCSidebarCollectionView();
    v9 = (void *)swift_dynamicCastClassUnconditional(v7, v8, 0, 0, 0);
    v10 = objc_msgSend(v9, "hasUncommittedUpdates", v12.receiver, v12.super_class);

    LOBYTE(v6) = v10 ^ 1;
  }
  else
  {
    __break(1u);
  }
  return (char)v6;
}

- (void)setEditing:(BOOL)a3
{
  -[DOCSidebarViewController setEditing:animated:](self, "setEditing:animated:", a3, 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC5Files24DOCSidebarViewController *v6;

  v6 = self;
  DOCSidebarViewController.setEditing(_:animated:)(a3, a4);

}

- (_TtP5Files27DOCScannedDocumentReceiving_)doc_documentScannerReceivingTarget
{
  return (_TtP5Files27DOCScannedDocumentReceiving_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Files24DOCSidebarViewController_sidebarDelegate, a2);
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  uint64_t v7;
  id v8;
  _TtC5Files24DOCSidebarViewController *v9;
  id v10;
  id v11;

  v7 = swift_allocObject(&unk_1005D9E50, 32, 7);
  *(_QWORD *)(v7 + 16) = self;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = a3;
  v9 = self;
  v10 = v8;
  v11 = a4;
  sub_100469270(v11, (uint64_t)sub_100152054, v7);

  swift_release(v7);
}

- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC5Files24DOCSidebarViewController *v13;
  id v14;
  NSURL *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD aBlock[5];
  uint64_t v21;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_1005DA398, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = self;
  v14 = sub_1002C654C();
  URL._bridgeToObjectiveC()(v15);
  v17 = v16;
  aBlock[4] = sub_1001D25F4;
  v21 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100018CC0;
  aBlock[3] = &unk_1005DA3B0;
  v18 = _Block_copy(aBlock);
  v19 = v21;
  swift_retain();
  objc_msgSend(v14, "getTransitionControllerForURL:completionBlock:", v17, v18, swift_release(v19).n128_f64[0]);
  _Block_release(v18);

  swift_release(v12);
  swift_unknownObjectRelease(v14);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC5Files24DOCSidebarViewController *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005DA348, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = sub_1002C654C();
  v13[4] = sub_100162138;
  v14 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100018CC0;
  v13[3] = &unk_1005DA360;
  v11 = _Block_copy(v13);
  v12 = v14;
  swift_retain();
  objc_msgSend(v10, "getTransitionControllerForItem:completionBlock:", v8, v11, swift_release(v12).n128_f64[0]);
  _Block_release(v11);

  swift_release(v7);
  swift_unknownObjectRelease(v10);
}

- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC5Files24DOCSidebarViewController *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005DA2F8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = sub_1002C654C();
  v13[4] = sub_1001620C0;
  v14 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100018CC0;
  v13[3] = &unk_1005DA310;
  v11 = _Block_copy(v13);
  v12 = v14;
  swift_retain();
  objc_msgSend(v10, "getPopoverTrackerForItem:completionBlock:", v8, v11, swift_release(v12).n128_f64[0]);
  _Block_release(v11);

  swift_release(v7);
  swift_unknownObjectRelease(v10);
}

- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5
{
  _BOOL8 v5;
  void *v8;
  uint64_t v9;
  id v10;
  _TtC5Files24DOCSidebarViewController *v11;
  id v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;

  v5 = a4;
  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1005DA2A8, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = self;
  v12 = sub_1002C654C();
  v15[4] = sub_1001CFDA0;
  v16 = v9;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_100083540;
  v15[3] = &unk_1005DA2C0;
  v13 = _Block_copy(v15);
  v14 = v16;
  swift_retain();
  objc_msgSend(v12, "getViewFor:waitForNewThumbnail::", v10, v5, v13, swift_release(v14).n128_f64[0]);
  _Block_release(v13);

  swift_release(v9);
  swift_unknownObjectRelease(v12);
}

- (void)getCellFor:(id)a3 :(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC5Files24DOCSidebarViewController *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005DA258, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = sub_1002C654C();
  v13[4] = sub_100162138;
  v14 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10015936C;
  v13[3] = &unk_1005DA270;
  v11 = _Block_copy(v13);
  v12 = v14;
  swift_retain();
  objc_msgSend(v10, "getCellFor::", v8, v11, swift_release(v12).n128_f64[0]);
  _Block_release(v11);

  swift_release(v7);
  swift_unknownObjectRelease(v10);
}

- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v5;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC5Files24DOCSidebarViewController *v12;
  id v13;
  Class isa;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  uint64_t v18;

  v5 = a4;
  v8 = _Block_copy(a5);
  v9 = sub_10004F2F0(0, (unint64_t *)&qword_1006419B0, FPItem_ptr);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
  v11 = swift_allocObject(&unk_1005DA208, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v12 = self;
  v13 = sub_1002C654C();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v17[4] = sub_100145FB4;
  v18 = v11;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_10016C02C;
  v17[3] = &unk_1005DA220;
  v15 = _Block_copy(v17);
  v16 = v18;
  swift_retain();
  objc_msgSend(v13, "revealWithItems:selectEvenIfVisible:completionBlock:", isa, v5, v15, swift_release(v16).n128_f64[0]);
  _Block_release(v15);

  swift_bridgeObjectRelease(v10);
  swift_release(v11);
  swift_unknownObjectRelease(v13);

}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC5Files24DOCSidebarViewController *v9;
  uint64_t v10;
  uint64_t v11;
  Class isa;
  uint64_t v14;

  v5 = sub_10006922C((uint64_t *)&unk_100642710);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = self;
  DOCSidebarViewController.indexPathForPreferredFocusedView(in:)((uint64_t)v8, (uint64_t)v7);

  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }
  return isa;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC5Files24DOCSidebarViewController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  _s5Files24DOCSidebarViewControllerC010collectionC0_16didUpdateFocusIn4withySo012UICollectionC0C_So0kchG7ContextCSo27UIFocusAnimationCoordinatorCtF_0(v8, v9);

}

- (UICollectionViewCompositionalLayout)collectionViewLayout
{
  id v2;
  UICollectionViewCompositionalLayout *result;
  UICollectionViewCompositionalLayout *v4;
  id v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCSidebarViewController(0);
  v2 = v7.receiver;
  result = -[DOCSidebarViewController collectionView](&v7, "collectionView");
  if (result)
  {
    v4 = result;
    v5 = -[UICollectionViewCompositionalLayout collectionViewLayout](result, "collectionViewLayout", v7.receiver, v7.super_class);

    v6 = objc_opt_self(UICollectionViewCompositionalLayout);
    return (UICollectionViewCompositionalLayout *)(id)swift_dynamicCastObjCClassUnconditional(v5, v6, 0, 0, 0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC5Files24DOCSidebarViewController *v13;
  Class v14;
  uint64_t v16;

  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  v14 = sub_1004B77C4((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

@end
