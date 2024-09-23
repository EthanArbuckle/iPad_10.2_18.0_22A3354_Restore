@implementation DRIMainViewController

- (DOCConfiguration)configuration
{
  _TtC5Files21DRIMainViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_10002E3A0();

  return (DOCConfiguration *)v3;
}

- (void)viewDidLoad
{
  _TtC5Files21DRIMainViewController *v2;

  v2 = self;
  sub_1000ADBFC();

}

- (id)initForOpeningContentTypes:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    v4 = type metadata accessor for UTType(0);
    v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  }
  else
  {
    v5 = 0;
  }
  return sub_1000ADDFC(v5);
}

- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  sub_10031EFFC(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))sub_100322940);
}

- (void)documentBrowser:(id)a3 didPickImportedURLs:(id)a4
{
  sub_10031EFFC(self, (uint64_t)a2, a3, (uint64_t)a4, sub_100322DD0);
}

- (void)previewControllerDidDismiss:(id)a3
{
  id v4;
  _TtC5Files21DRIMainViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10032304C();

}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  id v6;
  _TtC5Files21DRIMainViewController *v7;
  void *v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100323198((uint64_t)v6, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  id v6;
  _TtC5Files21DRIMainViewController *v7;
  int64_t v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100323324((uint64_t)v6, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

- (id)dismissActionsForPreviewController:(id)a3
{
  uint64_t v4;
  Class isa;

  v4 = type metadata accessor for DOCPreviewController(0);
  swift_dynamicCastClass(a3, v4);
  sub_10004F2F0(0, &qword_10064EBF8, QLDismissAction_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  return isa;
}

- (BOOL)shouldAppendDefaultDismissActionsForPreviewController:(id)a3
{
  uint64_t v4;

  v4 = type metadata accessor for DOCPreviewController(0);
  swift_dynamicCastClass(a3, v4);
  return 1;
}

- (BOOL)previewController:(id)a3 shouldAllowKeyCommandWithIdentifier:(unint64_t)a4
{
  return a4 - 4 < 0xFFFFFFFFFFFFFFFELL;
}

- (void)previewController:(id)a3 willSaveEditedItem:(id)a4
{
  id v6;
  _TtC5Files21DRIMainViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_1003234C4((uint64_t)v6, a4);

  swift_unknownObjectRelease(a4);
}

- (id)excludedActivityTypesForPreviewController:(id)a3
{
  id v4;
  _TtC5Files21DRIMainViewController *v5;
  _QWORD *v6;
  Class isa;

  v4 = a3;
  v5 = self;
  v6 = sub_100323664((uint64_t)v4);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC5Files21DRIMainViewController *v14;
  uint64_t v15;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  swift_unknownObjectRetain(a4);
  v14 = self;
  sub_100323760((uint64_t)v13, (uint64_t)a4, (uint64_t)v12);

  swift_unknownObjectRelease(a4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)initForOpeningFilesWithContentTypes:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  else
    v3 = 0;
  return sub_10031F5E0(v3);
}

- (_TtC5Files21DRIMainViewController)initWithCoder:(id)a3
{
  return (_TtC5Files21DRIMainViewController *)sub_10031F724(a3);
}

- (_TtC5Files21DRIMainViewController)initWithConfiguration:(id)a3
{
  id v3;
  _TtC5Files21DRIMainViewController *v4;

  v3 = a3;
  v4 = (_TtC5Files21DRIMainViewController *)sub_1003239F0((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DRIMainViewController_currentQuickLookPreviewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DRIMainViewController_currentQuickLookPreviewItemObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DRIMainViewController_currentLocationTitleObserver));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files21DRIMainViewController_currentQuickLookURL, &qword_100643470);
  swift_bridgeObjectRelease(*(NSMutableDictionary **)((char *)&self->super._didLoadStateByTab
                                                    + OBJC_IVAR____TtC5Files21DRIMainViewController_quicklookStateRestorationActivityIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DRIMainViewController____lazy_storage___internalConfiguration));
}

@end
