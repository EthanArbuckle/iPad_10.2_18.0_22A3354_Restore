@implementation VoiceTrainingWelcomeController

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VoiceTrainingWelcomeController();
  v4 = (char *)v5.receiver;
  -[OBBaseWelcomeController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  if (MEMORY[0x22E29CD18](&v4[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_delegate]))
  {
    sub_22775ADB8();

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)secondaryButtonTapped
{
  _TtC9SiriSetup30VoiceTrainingWelcomeController *v2;

  v2 = self;
  sub_227755868();

}

- (_TtC9SiriSetup30VoiceTrainingWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC9SiriSetup30VoiceTrainingWelcomeController *result;

  result = (_TtC9SiriSetup30VoiceTrainingWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup30VoiceTrainingWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC9SiriSetup30VoiceTrainingWelcomeController *result;

  v6 = a5;
  result = (_TtC9SiriSetup30VoiceTrainingWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
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

  sub_2277489F0((uint64_t)self + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_orbView));
  v3 = *(_OWORD *)((char *)&self->super.super.super._title
                 + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel);
  v6[4] = *(_OWORD *)((char *)&self->super.super.super._navigationItem
                    + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel);
  v6[5] = v3;
  v7[0] = *(_OWORD *)((char *)&self->super.super.super._nibBundle
                    + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel);
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)((char *)&self->super.super.super._parentViewController
                                          + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel
                                          + 1);
  v4 = *(_OWORD *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel);
  v6[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel);
  v6[1] = v4;
  v5 = *(_OWORD *)((char *)&self->super.super.super._tab
                 + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel);
  v6[2] = *(_OWORD *)((char *)&self->super.super.super._view
                    + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel);
  v6[3] = v5;
  sub_227748A14((uint64_t)v6);
}

@end
