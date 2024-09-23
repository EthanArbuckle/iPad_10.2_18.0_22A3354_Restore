@implementation IntroWelcomeController

- (void)continueTapped
{
  _TtC9SiriSetup22IntroWelcomeController *v2;

  v2 = self;
  sub_227757764();

}

- (void)skipTapped
{
  _TtC9SiriSetup22IntroWelcomeController *v2;

  v2 = self;
  sub_227757878();

}

- (_TtC9SiriSetup22IntroWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC9SiriSetup22IntroWelcomeController *result;

  result = (_TtC9SiriSetup22IntroWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup22IntroWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC9SiriSetup22IntroWelcomeController *result;

  v6 = a5;
  result = (_TtC9SiriSetup22IntroWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v6[6];
  _OWORD v7[2];

  sub_2277489F0((uint64_t)self + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_orbView));
  v3 = *(_OWORD *)((char *)&self->super.super.super._title + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_viewModel);
  v6[4] = *(_OWORD *)((char *)&self->super.super.super._navigationItem
                    + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_viewModel);
  v6[5] = v3;
  v7[0] = *(_OWORD *)((char *)&self->super.super.super._nibBundle
                    + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_viewModel);
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)((char *)&self->super.super.super._parentViewController
                                          + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_viewModel
                                          + 1);
  v4 = *(_OWORD *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_viewModel);
  v6[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_viewModel);
  v6[1] = v4;
  v5 = *(_OWORD *)((char *)&self->super.super.super._tab + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_viewModel);
  v6[2] = *(_OWORD *)((char *)&self->super.super.super._view
                    + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_viewModel);
  v6[3] = v5;
  sub_227748A14((uint64_t)v6);
}

@end
