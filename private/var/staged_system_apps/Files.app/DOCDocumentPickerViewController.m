@implementation DOCDocumentPickerViewController

- (_TtP5Files25DOCDocumentPickerDelegate_)pickerDelegate
{
  char *v2;
  uint64_t v3;
  _BYTE v5[24];

  v2 = (char *)self + OBJC_IVAR____TtC5Files31DOCDocumentPickerViewController_pickerDelegate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files31DOCDocumentPickerViewController_pickerDelegate, v5, 0, 0);
  return (_TtP5Files25DOCDocumentPickerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong(v2, v3);
}

- (void)setPickerDelegate:(id)a3
{
  char *v4;
  _BYTE v5[24];

  v4 = (char *)self + OBJC_IVAR____TtC5Files31DOCDocumentPickerViewController_pickerDelegate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files31DOCDocumentPickerViewController_pickerDelegate, v5, 1, 0);
  swift_unknownObjectWeakAssign(v4, a3);
}

- (_TtC5Files31DOCDocumentPickerViewController)initWithConfiguration:(id)a3 context:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (_TtC5Files31DOCDocumentPickerViewController *)DOCDocumentPickerViewController.init(configuration:context:)(v5, a4);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC5Files31DOCDocumentPickerViewController *v4;

  v4 = self;
  DOCDocumentPickerViewController.viewDidDisappear(_:)(a3);

}

- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC5Files31DOCDocumentPickerViewController *v10;

  v7 = type metadata accessor for URL(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_100263414(v8);

  swift_bridgeObjectRelease(v8);
}

- (_TtC5Files31DOCDocumentPickerViewController)initWithConfiguration:(id)a3 sourceObserver:(id)a4
{
  id v5;
  id v6;
  _TtC5Files31DOCDocumentPickerViewController *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC5Files31DOCDocumentPickerViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCDocumentPickerViewController", 37, "init(configuration:sourceObserver:)", 35, 0);
  __break(1u);
  return result;
}

- (_TtC5Files31DOCDocumentPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Files31DOCDocumentPickerViewController *result;

  v4 = a4;
  result = (_TtC5Files31DOCDocumentPickerViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCDocumentPickerViewController", 37, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (_TtC5Files31DOCDocumentPickerViewController)initWithStyle:(int64_t)a3
{
  _TtC5Files31DOCDocumentPickerViewController *result;

  result = (_TtC5Files31DOCDocumentPickerViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCDocumentPickerViewController", 37, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files31DOCDocumentPickerViewController_pickerDelegate);
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4;
  _TtC5Files31DOCDocumentPickerViewController *v5;

  v4 = a3;
  v5 = self;
  DOCDocumentPickerViewController.effectiveAppearanceDidChange(_:)(v4);

}

@end
