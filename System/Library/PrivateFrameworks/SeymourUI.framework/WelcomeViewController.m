@implementation WelcomeViewController

- (void)viewDidLoad
{
  _TtC9SeymourUI21WelcomeViewController *v2;

  v2 = self;
  WelcomeViewController.viewDidLoad()();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC9SeymourUI21WelcomeViewController *v10;
  objc_super v11;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_22BA7FE00();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = self;
  sub_22BA7FA10();
  sub_22BA7FDE8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v11.receiver = v10;
  v11.super_class = ObjectType;
  -[OBBaseWelcomeController viewDidAppear:](&v11, sel_viewDidAppear_, v3);

}

- (void)didTapContinueButton
{
  _TtC9SeymourUI21WelcomeViewController *v2;

  v2 = self;
  sub_22B7ABFE8();

}

- (_TtC9SeymourUI21WelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC9SeymourUI21WelcomeViewController *result;

  result = (_TtC9SeymourUI21WelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI21WelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC9SeymourUI21WelcomeViewController *result;

  v6 = a5;
  result = (_TtC9SeymourUI21WelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_dismissHandler));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_privacyPreferenceClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_storefrontLocalizer);
  sub_22B119E68(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_version), *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags+ OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_version), *((_BYTE *)&self->super.super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_version));
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_sheet;
  v4 = sub_22BA79CBC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_metricPage;
  v6 = sub_22BA79CF8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
