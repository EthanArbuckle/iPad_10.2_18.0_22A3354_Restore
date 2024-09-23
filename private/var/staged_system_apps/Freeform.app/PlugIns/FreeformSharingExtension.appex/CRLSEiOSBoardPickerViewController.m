@implementation CRLSEiOSBoardPickerViewController

- (_TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___shortDateFormatter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___mediumDateFormatter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___localizedDateFormatter) = 0;
  *(_QWORD *)&self->dataSource[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000546D0, "FreeformSharingExtension/CRLSEiOSBoardPickerViewController.swift", 64, 2, 51, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController *v2;

  v2 = self;
  sub_10002E21C();

}

- (void)cancel:(id)a3
{
  id v4;
  _TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController *v5;
  _TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController *v6;
  id v7;
  _TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController *v8;

  v4 = a3;
  v8 = self;
  v5 = (_TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController *)-[CRLSEiOSBoardPickerViewController navigationController](v8, "navigationController");
  if (v5)
  {
    v6 = v5;
    v7 = -[CRLSEiOSBoardPickerViewController popToRootViewControllerAnimated:](v5, "popToRootViewControllerAnimated:", 1);

    v4 = v7;
    v8 = v6;
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100030D4C(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  _TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController *result;

  v4 = a4;
  result = (_TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController *)_swift_stdlib_reportUnimplementedInitializer("FreeformSharingExtension.CRLSEiOSBoardPickerViewController", 58, "init(nibName:bundle:)", 21, 0, v5, v6, v7, v8);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100013BBC((uint64_t)self + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_representedObject, type metadata accessor for CRLSELibraryViewModeItemNode);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___shortDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___mediumDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___localizedDateFormatter));
  sub_1000287FC((uint64_t)self + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_delegate);
}

@end
