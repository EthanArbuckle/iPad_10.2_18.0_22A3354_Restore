@implementation FMSeparationWelcomeScreenViewController

- (_TtC6FindMy39FMSeparationWelcomeScreenViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100422F3C();
}

- (void)viewDidLayoutSubviews
{
  _TtC6FindMy39FMSeparationWelcomeScreenViewController *v2;

  v2 = self;
  sub_1004223DC();

}

- (void)nextAction
{
  _TtC6FindMy39FMSeparationWelcomeScreenViewController *v2;

  v2 = self;
  sub_100422540();

}

- (void)secondaryAction
{
  _TtC6FindMy39FMSeparationWelcomeScreenViewController *v2;

  v2 = self;
  sub_100422724();

}

- (void)dismissPresentedVCWithSender:(id)a3
{
  _TtC6FindMy39FMSeparationWelcomeScreenViewController *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v10, a3);
  v6 = -[FMSeparationWelcomeScreenViewController presentedViewController](v5, "presentedViewController", swift_unknownObjectRelease(a3).n128_f64[0]);
  if (v6)
  {
    v7 = v6;
    v9[4] = State.rawValue.getter;
    v9[5] = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 1107296256;
    v9[2] = sub_100037DF8;
    v9[3] = &unk_100565EE0;
    v8 = _Block_copy(v9);
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);
    _Block_release(v8);

  }
  else
  {

  }
  sub_100029574(v10);
}

- (_TtC6FindMy39FMSeparationWelcomeScreenViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy39FMSeparationWelcomeScreenViewController *result;

  v4 = a4;
  result = (_TtC6FindMy39FMSeparationWelcomeScreenViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMSeparationWelcomeScreenViewController", 46, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_mediator));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_scrollContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_secondaryActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_informativeImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMSeparationWelcomeScreenViewController_heightConstraint));
}

@end
