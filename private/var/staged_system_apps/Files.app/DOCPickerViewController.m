@implementation DOCPickerViewController

- (_TtC5Files23DOCPickerViewController)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC5Files23DOCPickerViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Files23DOCPickerViewController_placeholderViewController) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC5Files23DOCPickerViewController_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = a3;

  result = (_TtC5Files23DOCPickerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001DLL, 0x80000001005223F0, "Files/DOCPickerViewController.swift", 35, 2, 33, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC5Files23DOCPickerViewController *v2;

  v2 = self;
  sub_1004340B4();

}

- (void)_didSelectURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC5Files23DOCPickerViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100435190((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)_dismissViewController
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  _TtC5Files23DOCPickerViewController *v9;

  v3 = (char *)self + OBJC_IVAR____TtC5Files23DOCPickerViewController_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Files23DOCPickerViewController_delegate, a2);
  if (Strong)
  {
    v6 = Strong;
    v7 = *((_QWORD *)v3 + 1);
    swift_getObjectType(Strong, v5);
    v8 = *(void (**)(void))(v7 + 16);
    v9 = self;
    v8();

    swift_unknownObjectRelease(v6);
  }
}

- (void)_stitchFileCreationAtURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)_displayLocationsMenuFromRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t Strong;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC5Files23DOCPickerViewController_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Files23DOCPickerViewController_delegate, a2);
  if (Strong)
  {
    v11 = Strong;
    v12 = *((_QWORD *)v8 + 1);
    ObjectType = swift_getObjectType(Strong, v10);
    (*(void (**)(_TtC5Files23DOCPickerViewController *, uint64_t, uint64_t, double, double, double, double))(v12 + 8))(self, ObjectType, v12, x, y, width, height);
    swift_unknownObjectRelease(v11);
  }
}

- (_TtC5Files23DOCPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Files23DOCPickerViewController *result;

  v4 = a4;
  result = (_TtC5Files23DOCPickerViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCPickerViewController", 29, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files23DOCPickerViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files23DOCPickerViewController_placeholderViewController));
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files23DOCPickerViewController_delegate);
}

@end
