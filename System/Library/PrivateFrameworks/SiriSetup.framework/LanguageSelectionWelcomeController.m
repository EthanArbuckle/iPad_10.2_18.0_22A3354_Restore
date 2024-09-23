@implementation LanguageSelectionWelcomeController

- (void)continueTappedWithSender:(id)a3
{
  id v4;
  _TtC9SiriSetup34LanguageSelectionWelcomeController *v5;

  v4 = a3;
  v5 = self;
  sub_22775D938(v4);

}

- (_TtC9SiriSetup34LanguageSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC9SiriSetup34LanguageSelectionWelcomeController *result;

  result = (_TtC9SiriSetup34LanguageSelectionWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup34LanguageSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC9SiriSetup34LanguageSelectionWelcomeController *result;

  v6 = a5;
  result = (_TtC9SiriSetup34LanguageSelectionWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
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

  sub_2277489F0((uint64_t)self + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_orbView));
  v3 = *(_OWORD *)((char *)&self->super.super.super._title
                 + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v6[4] = *(_OWORD *)((char *)&self->super.super.super._navigationItem
                    + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v6[5] = v3;
  v7[0] = *(_OWORD *)((char *)&self->super.super.super._nibBundle
                    + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)((char *)&self->super.super.super._parentViewController
                                          + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel
                                          + 1);
  v4 = *(_OWORD *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v6[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v6[1] = v4;
  v5 = *(_OWORD *)((char *)&self->super.super.super._tab
                 + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v6[2] = *(_OWORD *)((char *)&self->super.super.super._view
                    + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v6[3] = v5;
  sub_227748A14((uint64_t)v6);
}

@end
