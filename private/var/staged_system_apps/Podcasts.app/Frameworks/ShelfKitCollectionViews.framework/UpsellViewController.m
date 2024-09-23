@implementation UpsellViewController

- (_TtC23ShelfKitCollectionViews20UpsellViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_43138();
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UpsellViewController();
  v2 = v3.receiver;
  -[UpsellViewController viewDidLoad](&v3, "viewDidLoad");
  sub_40058();
  sub_404BC();

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_3FF90(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews20UpsellViewController *v4;

  v4 = self;
  sub_3FE10(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_3FF90(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, 2);
}

- (void)viewWillLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UpsellViewController();
  v2 = v3.receiver;
  -[UpsellViewController viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  sub_40D64();

}

- (_TtC23ShelfKitCollectionViews20UpsellViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews20UpsellViewController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews20UpsellViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.UpsellViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20UpsellViewController_purchaseController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20UpsellViewController_purchases));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20UpsellViewController_upsellInformation));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews20UpsellViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews20UpsellViewController_metricsController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20UpsellViewController_artworkHeader));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20UpsellViewController_infoContainerView));
}

@end
