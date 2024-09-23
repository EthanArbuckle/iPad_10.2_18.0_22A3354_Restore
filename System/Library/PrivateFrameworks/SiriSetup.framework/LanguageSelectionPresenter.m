@implementation LanguageSelectionPresenter

- (_TtC9SiriSetup26LanguageSelectionPresenter)init
{
  _TtC9SiriSetup26LanguageSelectionPresenter *result;

  result = (_TtC9SiriSetup26LanguageSelectionPresenter *)_swift_stdlib_reportUnimplementedInitializer();
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

  sub_2277489F0((uint64_t)self + OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_presentingViewController));
  v3 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewModel + 8];
  v6[4] = *(_OWORD *)&self->presentingViewController[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewModel
                                                   + 8];
  v6[5] = v3;
  v7[0] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewModel + 24];
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewModel
                                                          + 33];
  v4 = *(_OWORD *)&self->dataSource[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewModel + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewModel);
  v6[1] = v4;
  v5 = *(_OWORD *)&self->delegate[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewModel + 8];
  v6[2] = *(_OWORD *)&self->dataSourceWriter[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewModel + 8];
  v6[3] = v5;
  sub_227748A14((uint64_t)v6);
  swift_release();
  swift_bridgeObjectRelease();
}

@end
