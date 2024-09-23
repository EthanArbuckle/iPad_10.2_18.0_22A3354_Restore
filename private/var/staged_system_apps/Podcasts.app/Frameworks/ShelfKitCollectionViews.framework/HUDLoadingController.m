@implementation HUDLoadingController

- (_TtC23ShelfKitCollectionViews20HUDLoadingController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_F2318();
}

- (void)viewDidLoad
{
  _TtC23ShelfKitCollectionViews20HUDLoadingController *v2;

  v2 = self;
  sub_F02A4();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for HUDLoadingController(0);
  v4 = v12.receiver;
  -[HUDLoadingController viewDidAppear:](&v12, "viewDidAppear:", v3);
  v5 = (void *)objc_opt_self(UIView);
  v6 = swift_allocObject(&unk_381788, 24, 7);
  *(_QWORD *)(v6 + 16) = v4;
  v10[4] = sub_F2310;
  v11 = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_24360;
  v10[3] = &block_descriptor_26;
  v7 = _Block_copy(v10);
  v8 = v11;
  v9 = v4;
  swift_release(v8);
  objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 131074, v7, 0, 0.2, 0.0);
  _Block_release(v7);

}

- (_TtC23ShelfKitCollectionViews20HUDLoadingController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews20HUDLoadingController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews20HUDLoadingController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.HUDLoadingController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20HUDLoadingController_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20HUDLoadingController_loadingView));
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews20HUDLoadingController_config;
  v5 = type metadata accessor for LoadingAction.Configuration(0, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20HUDLoadingController_presentationWindow));
  sub_F23F4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews20HUDLoadingController____lazy_storage___viewToken);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20HUDLoadingController____lazy_storage___HUDView));
}

@end
