@implementation HUDViewController

- (UILabel)primaryLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_primaryLabel));
}

- (void)setPrimaryLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_primaryLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_primaryLabel) = (Class)a3;
  v3 = a3;

}

- (UILabel)secondaryLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_secondaryLabel));
}

- (void)setSecondaryLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_secondaryLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_secondaryLabel) = (Class)a3;
  v3 = a3;

}

- (_TtC23ShelfKitCollectionViews17HUDViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s23ShelfKitCollectionViews17HUDViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  _TtC23ShelfKitCollectionViews17HUDViewController *v2;

  v2 = self;
  sub_104EE8();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews17HUDViewController *v4;

  v4 = self;
  sub_105ADC(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC23ShelfKitCollectionViews17HUDViewController *v2;

  v2 = self;
  sub_105E78();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews17HUDViewController *v6;

  v5 = a3;
  v6 = self;
  sub_107258((uint64_t)a3);

}

- (_TtC23ShelfKitCollectionViews17HUDViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews17HUDViewController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews17HUDViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.HUDViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_107CF8(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_type), *(_QWORD *)&self->type[OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_type], *(_QWORD *)&self->type[OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_type + 8], *(_QWORD *)&self->type[OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_type + 16], *(void **)&self->type[OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_type + 24]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_presentationWindow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController____lazy_storage___HUDView));
}

@end
