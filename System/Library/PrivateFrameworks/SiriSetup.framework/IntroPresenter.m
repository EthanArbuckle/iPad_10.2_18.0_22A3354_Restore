@implementation IntroPresenter

- (_TtC9SiriSetup14IntroPresenter)init
{
  _TtC9SiriSetup14IntroPresenter *result;

  result = (_TtC9SiriSetup14IntroPresenter *)_swift_stdlib_reportUnimplementedInitializer();
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

  v3 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewModel + 40];
  v6[4] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewModel + 24];
  v6[5] = v3;
  v7[0] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewModel + 56];
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewModel + 65];
  v4 = *(_OWORD *)&self->dataSource[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewModel + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewModel);
  v6[1] = v4;
  v5 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewModel + 8];
  v6[2] = *(_OWORD *)&self->dataSourceWriter[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewModel + 8];
  v6[3] = v5;
  sub_227748A14((uint64_t)v6);
  swift_release();
  sub_2277489F0((uint64_t)self + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_delegate);

}

@end
