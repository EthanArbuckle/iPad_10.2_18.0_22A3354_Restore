@implementation CRLiOSBoardItemQuickLookPreviewViewController

- (_TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController)initWithCoder:(id)a3
{
  Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion (__swiftcall **v4)(CKRecordID, Swift::String);
  id v5;
  _TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_previewItem) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_shouldSaveMarkedUpItem) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_itemProvider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_previewOriginView) = 0;
  v4 = (Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion (__swiftcall **)(CKRecordID, Swift::String))((char *)self + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_onDismiss);
  *v4 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:);
  v4[1] = 0;
  v5 = a3;

  result = (_TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLiOSBoardItemQuickLookPreviewViewController.swift", 60, 2, 27, 0);
  __break(1u);
  return result;
}

- (_TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *result;

  v4 = a4;
  result = (_TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSBoardItemQuickLookPreviewViewController", 54, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (_TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController)initWithPreviewItems:(id)a3
{
  _TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *result;

  result = (_TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSBoardItemQuickLookPreviewViewController", 54, "init(previewItems:)", 19, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_previewItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_itemProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_previewOriginView));
  swift_release(*(_QWORD *)&self->previewItem[OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_onDismiss]);
}

- (BOOL)staysOpenOnSelectionChange
{
  return 1;
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_previewOriginView));
}

- (void)previewControllerWillDismiss:(id)a3
{
  id v4;
  _TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10067F24C();

}

- (void)previewControllerDidDismiss:(id)a3
{
  id v4;
  _TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10067F930();

}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  id v6;
  _TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *v7;
  int64_t v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_10067F98C(a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

- (id)excludedActivityTypesForPreviewController:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *v9;
  void *v10;
  uint64_t v11;
  id v12;
  Class isa;

  v5 = sub_1004B804C((uint64_t *)&unk_1013E8830);
  v6 = swift_allocObject(v5, 64, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100EF5E40;
  v7 = qword_1013DDD70;
  v8 = a3;
  v9 = self;
  if (v7 != -1)
    swift_once(&qword_1013DDD70, sub_100BC2180);
  v10 = (void *)qword_101480E40;
  type metadata accessor for ActivityType(0);
  *(_QWORD *)(v6 + 56) = v11;
  *(_QWORD *)(v6 + 32) = v10;
  v12 = v10;

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return *(Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_previewItem) != 0;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  void *v6;
  id v7;
  _TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *v8;
  id v9;
  id v10;
  id v11;
  _TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *v12;

  v6 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_previewItem);
  if (v6)
  {
    v7 = a3;
    v8 = self;
    v9 = v6;
  }
  else
  {
    v10 = objc_allocWithZone((Class)NSURL);
    v11 = a3;
    v12 = self;
    v9 = objc_msgSend(v10, "init");
    v6 = 0;
  }
  swift_unknownObjectRetain(v6);

  return v9;
}

- (void)previewController:(id)a3 didUpdateContentsOfPreviewItem:(id)a4
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController_shouldSaveMarkedUpItem) = 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *v7;
  uint64_t v8;
  _TtC8Freeform45CRLiOSBoardItemQuickLookPreviewViewController *v9;
  char v10;
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
  v10 = sub_10067EE60(a3, (uint64_t)v12);

  sub_1004CB800((uint64_t)v12, &qword_1013E0230);
  return v10 & 1;
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
  v9.super_class = (Class)type metadata accessor for CRLiOSBoardItemQuickLookPreviewViewController();
  v4 = a3;
  v5 = v9.receiver;
  -[CRLiOSBoardItemQuickLookPreviewViewController validateCommand:](&v9, "validateCommand:", v4);
  v6 = objc_msgSend(v4, "action", v9.receiver, v9.super_class);
  v7 = (NSString *)String._bridgeToObjectiveC()();
  v8 = NSSelectorFromString(v7);

  if ((static Selector.== infix(_:_:)(v6, v8) & 1) != 0)
    objc_msgSend(v4, "setAttributes:", 1);

}

@end
