@implementation CRLiOSFolderGridViewController

- (NSUndoManager)undoManager
{
  id v2;

  sub_100BB7D70();
  return (NSUndoManager *)v2;
}

- (_TtC8Freeform30CRLiOSFolderGridViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100BB7EC0(0xD000000000000025, 0x8000000100FAD6F0, 275);
}

- (_TtC8Freeform30CRLiOSFolderGridViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;

  v3 = a3;
  sub_100BB7EC0(0xD000000000000034, 0x8000000100FFD220, 279);
}

- (void)dealloc
{
  _TtC8Freeform30CRLiOSFolderGridViewController *v2;

  v2 = self;
  sub_100B7A024();
}

- (void).cxx_destruct
{
  sub_1004B84A4((uint64_t)self + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_folder, type metadata accessor for CRLBoardLibraryViewModel.Folder);
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_delegate);
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_thumbnailProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController____lazy_storage___diffableDataSource));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_libraryProvider));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_boardPreviewImageCache));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_boardSearchHelper));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_imageCacheObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_storeMetadataObserver));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_renameDeleteObserver));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_gridLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_listLayout));
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_iCloudStatusObserver, &qword_1013E0230);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController____lazy_storage___libraryProviderRefreshLimiter));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_syncDidEndObserver));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_syncDidBeginObserver));
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController__currentSnapshotWithExpandedSections, (uint64_t *)&unk_1014072C0);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController____lazy_storage___layoutBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController____lazy_storage___toolbarItemToAddBoard));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController____lazy_storage___toolbarItemToSelectAllOrNone));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController____lazy_storage___editModeToolbarButtonToDuplicateSelectedItems));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController____lazy_storage___emptyFolderViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_emptyFolderBottomConstraint));
}

- (void)viewDidLoad
{
  _TtC8Freeform30CRLiOSFolderGridViewController *v2;

  v2 = self;
  sub_100B7A4E8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8Freeform30CRLiOSFolderGridViewController *v4;

  v4 = self;
  sub_100B7AFA8(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8Freeform30CRLiOSFolderGridViewController *v4;

  v4 = self;
  sub_100B7BAC0(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLiOSFolderGridViewController(0);
  v4 = v5.receiver;
  -[CRLiOSFolderGridViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  objc_msgSend(v4, "setEditing:animated:", 0, 0, v5.receiver, v5.super_class);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8Freeform30CRLiOSFolderGridViewController *v4;

  v4 = self;
  sub_100B7BE78(a3);

}

- (void)observedTraitsDidChange
{
  _TtC8Freeform30CRLiOSFolderGridViewController *v2;

  v2 = self;
  sub_100B7C3B4();

}

- (void)handleBoardLibrarySnapshotUpdateWithNotification:(id)a3
{
  sub_100BA06E0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_100B7CD9C);
}

- (void)reloadAllItems
{
  sub_100B9E6E0(self, (uint64_t)a2, (uint64_t)&unk_1012973C8, (uint64_t)sub_100BBC100, (uint64_t)&unk_1012973E0);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC8Freeform30CRLiOSFolderGridViewController *v7;
  uint64_t v8;
  _TtC8Freeform30CRLiOSFolderGridViewController *v9;
  char v10;
  char v11;
  _OWORD v13[2];

  if (a4)
  {
    v7 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v13, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v9 = self;
  }
  sub_100B7EB98((uint64_t)a3, (uint64_t)v13);
  v11 = v10;

  sub_1004CB800((uint64_t)v13, &qword_1013E0230);
  return v11 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSString *v7;
  SEL v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CRLiOSFolderGridViewController(0);
  v4 = a3;
  v5 = v9.receiver;
  -[CRLiOSFolderGridViewController validateCommand:](&v9, "validateCommand:", v4);
  v6 = objc_msgSend(v4, "action", v9.receiver, v9.super_class);
  v7 = (NSString *)String._bridgeToObjectiveC()();
  v8 = NSSelectorFromString(v7);

  if ((static Selector.== infix(_:_:)(v6, v8) & 1) != 0 && (sub_100B7F42C() & 1) != 0)
    objc_msgSend(v4, "setAttributes:", 1);

}

- (void)find:(id)a3
{
  _TtC8Freeform30CRLiOSFolderGridViewController *v5;
  uint64_t v6;
  _TtC8Freeform30CRLiOSFolderGridViewController *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_100B7F2A4();

  sub_1004CB800((uint64_t)v8, &qword_1013E0230);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)undo:(id)a3
{
  sub_100B7F578(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_canUndo, (SEL *)&selRef_undo);
}

- (void)redo:(id)a3
{
  sub_100B7F578(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_canRedo, (SEL *)&selRef_redo);
}

- (void)restoreUserActivityState:(id)a3
{
  _TtC8Freeform30CRLiOSFolderGridViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_100B7FE84(v5);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v5;
  _TtC8Freeform30CRLiOSFolderGridViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100B844F4(v5, a4);

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8Freeform30CRLiOSFolderGridViewController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_100B84A54(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  sub_100B85DE4(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, char *))sub_100B84E3C);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  sub_100B85DE4(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, char *))sub_100B859D0);
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8Freeform30CRLiOSFolderGridViewController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_100BB84F4((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8Freeform30CRLiOSFolderGridViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_isCurrentlyInMultipleSelectionInteraction) = 1;
  v11 = a3;
  v12 = self;
  if (!-[CRLiOSFolderGridViewController isEditing](v12, "isEditing")
    || !objc_msgSend(v11, "isEditing"))
  {
    -[CRLiOSFolderGridViewController setEditing:animated:](v12, "setEditing:animated:", 1, 1);
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_isCurrentlyInMultipleSelectionInteraction) = 0;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC8Freeform30CRLiOSFolderGridViewController *v13;
  id v14;
  uint64_t v16;

  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  v14 = sub_100BB86FC(v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  _TtC8Freeform30CRLiOSFolderGridViewController *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  swift_unknownObjectRetain(a5);
  v9 = self;
  sub_100B87158(v10, v8, a5);

  swift_unknownObjectRelease(a5);
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  sub_100B87A3C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, sub_100BB8FD8);
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  sub_100B87A3C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id))sub_100BB9358);
}

- (_TtC8Freeform30CRLiOSFolderGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform30CRLiOSFolderGridViewController *result;

  v4 = a4;
  result = (_TtC8Freeform30CRLiOSFolderGridViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSFolderGridViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void)newBoard:(id)a3
{
  _TtC8Freeform30CRLiOSFolderGridViewController *v5;
  uint64_t v6;
  _TtC8Freeform30CRLiOSFolderGridViewController *v7;
  uint64_t Strong;
  uint64_t v9;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_delegate);
  if (Strong)
  {
    v9 = Strong;
    sub_100913210(self);

    swift_unknownObjectRelease(v9);
  }
  else
  {

  }
  sub_1004CB800((uint64_t)v10, &qword_1013E0230);
}

- (id)itemTitleForCloudSharingController:(id)a3
{
  id v4;
  _TtC8Freeform30CRLiOSFolderGridViewController *v5;
  id v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  _QWORD v14[2];

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, "share");
  if (v6)
  {
    v8 = static CKShare.SystemFieldKey.title.getter(v7);
    v10 = v9;
    v11 = sub_1004B8930(0, &qword_1013E0240, CKShare_ptr);
    CKRecordKeyValueSetting.subscript.getter(v14, v8, v10, v11, &type metadata for String, &protocol witness table for String);

    swift_bridgeObjectRelease();
    if (v14[1])
    {
      v12 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  else
  {

  }
  return 0;
}

- (void)cloudSharingControllerDidStopSharing:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC8Freeform30CRLiOSFolderGridViewController *v6;
  id v7;
  __n128 v8;
  uint64_t v9;
  _BYTE v10[24];

  v4 = qword_1013DD8C8;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once(&qword_1013DD8C8, sub_100A069BC);
  swift_beginAccess(&static OS_os_log.shareState, v10, 0, 0);
  v7 = (id)static OS_os_log.shareState;
  v9 = static os_log_type_t.default.getter(v8);
  sub_100A06EBC((uint64_t)v7, &_mh_execute_header, v9, "Stopped sharing", 15, 2, (uint64_t)_swiftEmptyArrayStorage);

}

- (void)cloudSharingControllerDidSaveShare:(id)a3
{
  id v4;
  _TtC8Freeform30CRLiOSFolderGridViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100B8F52C(v4);

}

- (void)cloudSharingController:(id)a3 failedToSaveShareWithError:(id)a4
{
  id v6;
  _TtC8Freeform30CRLiOSFolderGridViewController *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_100BB9AE0((uint64_t)v8);

}

- (id)itemThumbnailDataForCloudSharingController:(id)a3
{
  id v4;
  _TtC8Freeform30CRLiOSFolderGridViewController *v5;
  id v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  Class isa;
  uint64_t v16;
  unint64_t v17;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, "share");
  if (v6)
  {
    v8 = static CKShare.SystemFieldKey.thumbnailImageData.getter(v7);
    v10 = v9;
    v11 = sub_1004B8930(0, &qword_1013E0240, CKShare_ptr);
    CKRecordKeyValueSetting.subscript.getter(&v16, v8, v10, v11, &type metadata for Data, &protocol witness table for Data);

    swift_bridgeObjectRelease();
    v12 = v17;
    if (v17 >> 60 != 15)
    {
      v13 = v16;
      isa = Data._bridgeToObjectiveC()().super.isa;
      sub_1004BE2FC(v13, v12);
      return isa;
    }
  }
  else
  {

  }
  return 0;
}

- (void)iCloudStatusDidChangeWithNotification:(id)a3
{
  id v4;
  _TtC8Freeform30CRLiOSFolderGridViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100B83B88();

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC8Freeform30CRLiOSFolderGridViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100B996B4(v4);

}

- (void)didRecognizeSingleContinuousTouchGesture:(id)a3
{
  _TtC8Freeform30CRLiOSFolderGridViewController *v5;
  uint64_t v6;
  _TtC8Freeform30CRLiOSFolderGridViewController *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_100B997A0((uint64_t)v8);

  sub_1004CB800((uint64_t)v8, &qword_1013E0230);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC8Freeform30CRLiOSFolderGridViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100B9DA8C(v4);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  _TtC8Freeform30CRLiOSFolderGridViewController *v7;

  v6 = a3;
  v7 = self;
  sub_100B9DE58(v6, a4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC8Freeform30CRLiOSFolderGridViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100B9E0F8(v4);

}

- (void)calendarDayDidChange
{
  sub_100B9E6E0(self, (uint64_t)a2, (uint64_t)&unk_101296450, (uint64_t)sub_100BB2A14, (uint64_t)&unk_101296468);
}

- (void)shareFailedWithError:(id)a3 recordID:(id)a4
{
  id v6;
  _TtC8Freeform30CRLiOSFolderGridViewController *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_100BA0268((uint64_t)v8, v6);

}

- (UIWindow)keyboardObserversWindow
{
  _TtC8Freeform30CRLiOSFolderGridViewController *v2;
  UIWindow *result;
  UIWindow *v4;
  id v5;

  v2 = self;
  result = (UIWindow *)-[CRLiOSFolderGridViewController view](v2, "view");
  if (result)
  {
    v4 = result;
    v5 = -[UIWindow window](result, "window");

    return (UIWindow *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)keyboardWillShowOrDock:(id)a3
{
  sub_100BA06E0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_100BA0530);
}

- (void)keyboardWillHideOrUndock:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  double v9;
  _TtC8Freeform30CRLiOSFolderGridViewController *v10;
  uint64_t v11;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = *(double *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_keyboardHeight);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform30CRLiOSFolderGridViewController_keyboardHeight) = 0;
  v10 = self;
  sub_100B88118(v9);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BOOL)accessibilityPerformEscape
{
  _TtC8Freeform30CRLiOSFolderGridViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_100DACF48();

  return v3 & 1;
}

@end
