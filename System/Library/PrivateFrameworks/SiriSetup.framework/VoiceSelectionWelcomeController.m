@implementation VoiceSelectionWelcomeController

- (void)continueTapped
{
  _TtC9SiriSetup31VoiceSelectionWelcomeController *v2;

  v2 = self;
  sub_22774D5A0();

}

- (void)chooseForMeTapped
{
  void *v2;
  void *v4;
  _TtC9SiriSetup31VoiceSelectionWelcomeController *v5;
  id v6;
  _QWORD v7[6];

  v2 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceSelectionPresenter);
  if (v2)
  {
    v7[4] = nullsub_1;
    v7[5] = 0;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 1107296256;
    v7[2] = sub_22774D664;
    v7[3] = &block_descriptor;
    v4 = _Block_copy(v7);
    v5 = self;
    v6 = v2;
    objc_msgSend(v6, sel_selectRandomVoiceWithCompletion_, v4);
    _Block_release(v4);

  }
}

- (_TtC9SiriSetup31VoiceSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  _TtC9SiriSetup31VoiceSelectionWelcomeController *result;

  result = (_TtC9SiriSetup31VoiceSelectionWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup31VoiceSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5;
  _TtC9SiriSetup31VoiceSelectionWelcomeController *result;

  v5 = a5;
  result = (_TtC9SiriSetup31VoiceSelectionWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup31VoiceSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  _TtC9SiriSetup31VoiceSelectionWelcomeController *result;

  result = (_TtC9SiriSetup31VoiceSelectionWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup31VoiceSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6;
  _TtC9SiriSetup31VoiceSelectionWelcomeController *result;

  v6 = a5;
  result = (_TtC9SiriSetup31VoiceSelectionWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2277489F0((uint64_t)self + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_orbView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_currentVoiceSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceOptionsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceSelectionPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_primaryButton));
}

- (void)presenter:(id)a3 didChangeVoiceSelection:(id)a4
{
  id v6;
  id v7;
  _TtC9SiriSetup31VoiceSelectionWelcomeController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22774E770(v7);

}

@end
