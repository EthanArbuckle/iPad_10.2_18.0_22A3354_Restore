@implementation CRLiOSFolderGridViewController.GridItem.GridViewController

- (void)viewDidLoad
{
  uint64_t ObjectType;
  _TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  ObjectType = swift_getObjectType(self);
  v8.receiver = self;
  v8.super_class = (Class)_s8GridItemC18GridViewControllerCMa();
  v4 = self;
  -[CRLiOSFolderGridViewController.Item.ViewController viewDidLoad](&v8, "viewDidLoad");
  v5 = sub_1004B804C((uint64_t *)&unk_1013F9B80);
  v6 = swift_allocObject(v5, 64, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100EF5A10;
  *(_QWORD *)(v6 + 32) = type metadata accessor for UITraitUserInterfaceLevel(0);
  *(_QWORD *)(v6 + 40) = &protocol witness table for UITraitUserInterfaceLevel;
  *(_QWORD *)(v6 + 48) = type metadata accessor for UITraitUserInterfaceStyle(0);
  *(_QWORD *)(v6 + 56) = &protocol witness table for UITraitUserInterfaceStyle;
  v7 = UIViewController.registerForTraitChanges<A>(_:handler:)(v6, sub_10055E120, 0, ObjectType);

  swift_bridgeObjectRelease(v6);
  swift_unknownObjectRelease(v7);
}

- (_TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController)init
{
  uint64_t v3;
  id v4;
  _TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController_labelBackdropView;
  v4 = objc_allocWithZone((Class)UIView);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&v5->super.super.super.super.isa
           + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController_attributionViewBottomConstraint) = 0;

  v7.receiver = v5;
  v7.super_class = (Class)_s8GridItemC18GridViewControllerCMa();
  return -[CRLiOSFolderGridViewController.Item.ViewController init](&v7, "init");
}

- (_TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController)initWithCoder:(id)a3
{
  return (_TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController *)sub_10055DE38(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController_labelBackdropView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController_attributionViewBottomConstraint));
}

@end
