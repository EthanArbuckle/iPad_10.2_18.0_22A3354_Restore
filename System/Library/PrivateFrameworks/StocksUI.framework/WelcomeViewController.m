@implementation WelcomeViewController

- (_TtC8StocksUI21WelcomeViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8StocksUI21WelcomeViewController *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_allowRendering) = 0;
  v5 = OBJC_IVAR____TtC8StocksUI21WelcomeViewController_statusBarView;
  v6 = objc_allocWithZone((Class)sub_1DC404444());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8StocksUI21WelcomeViewController *)sub_1DC409838();
  __break(1u);
  return result;
}

- (_TtC8StocksUI21WelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8StocksUI21WelcomeViewController *result;

  v4 = a4;
  result = (_TtC8StocksUI21WelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_styler);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_viewProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_viewAnimator);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_statusBarView));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_sceneStateManager);
}

- (void)viewDidLoad
{
  _TtC8StocksUI21WelcomeViewController *v2;

  v2 = self;
  sub_1DC3C0598();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[WelcomeViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  swift_getObjectType();
  sub_1DC404D68();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8StocksUI21WelcomeViewController *v4;

  v4 = self;
  sub_1DC3C0B28(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  -[WelcomeViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
  __swift_project_boxed_opaque_existential_1(&v4[OBJC_IVAR____TtC8StocksUI21WelcomeViewController_sceneStateManager], *(_QWORD *)&v4[OBJC_IVAR____TtC8StocksUI21WelcomeViewController_sceneStateManager + 24]);
  sub_1DC081B48(&qword_1F03532A8, v5, (uint64_t (*)(uint64_t))type metadata accessor for WelcomeViewController, (uint64_t)&unk_1DC42FA28);
  sub_1DC402B54();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)&v4[OBJC_IVAR____TtC8StocksUI21WelcomeViewController_eventHandler] + 88), *(_QWORD *)(*(_QWORD *)&v4[OBJC_IVAR____TtC8StocksUI21WelcomeViewController_eventHandler] + 112));
  sub_1DC401828();
  swift_getObjectType();
  sub_1DC404D68();

}

- (void)viewWillLayoutSubviews
{
  _TtC8StocksUI21WelcomeViewController *v2;

  v2 = self;
  sub_1DC3C0D84();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v7.receiver;
  -[WelcomeViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DC3C0828((uint64_t)v6);

}

- (int64_t)preferredStatusBarStyle
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  _TtC8StocksUI21WelcomeViewController *v13;
  int64_t v14;
  uint64_t v16;

  v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_styler);
  swift_beginAccess();
  v4 = v3[3];
  v5 = v3[4];
  v6 = __swift_project_boxed_opaque_existential_1(v3, v4);
  v7 = *(_QWORD *)(v4 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v16 - v9;
  (*(void (**)(char *, __n128))(v7 + 16))((char *)&v16 - v9, v8);
  v11 = *(_QWORD *)(v5 + 16);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
  v13 = self;
  v14 = v12(v4, v11);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v4);

  return v14;
}

- (void)didTapContinueButton
{
  _QWORD *v3;
  _TtC8StocksUI21WelcomeViewController *v4;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_eventHandler);
  __swift_project_boxed_opaque_existential_1(v3 + 11, v3[14]);
  v4 = self;
  sub_1DC401828();
  if (qword_1EDB28F98 != -1)
    swift_once();
  type metadata accessor for WelcomeInteractor();
  sub_1DC081B48(&qword_1F03532A0, 255, (uint64_t (*)(uint64_t))type metadata accessor for WelcomeInteractor, (uint64_t)&unk_1DC42DF94);
  sub_1DC4013B4();
  swift_getObjectType();
  sub_1DC40385C();
  __swift_project_boxed_opaque_existential_1(v3 + 6, v3[9]);
  sub_1DC2BA7E8();

}

- (void)showPrivacyText
{
  _TtC8StocksUI21WelcomeViewController *v2;

  v2 = self;
  sub_1DC3C02F4();

}

@end
