@implementation VoiceOptionsView

- (SUICVoiceSelectionViewModelProviding)voiceSelectionViewModelProvider
{
  return (SUICVoiceSelectionViewModelProviding *)(id)swift_unknownObjectRetain();
}

- (void)setVoiceSelectionViewModelProvider:(id)a3
{
  sub_22774D9E0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_voiceSelectionViewModelProvider);
}

- (SUICVoiceSelectionEventHandling)voiceSelectionEventHandler
{
  return (SUICVoiceSelectionEventHandling *)(id)swift_unknownObjectRetain();
}

- (void)setVoiceSelectionEventHandler:(id)a3
{
  sub_22774D9E0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_voiceSelectionEventHandler);
}

- (_TtC9SiriSetup16VoiceOptionsView)init
{
  return (_TtC9SiriSetup16VoiceOptionsView *)sub_22774DDC8();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9SiriSetup16VoiceOptionsView *v12;
  uint64_t v13;

  v6 = sub_227767654();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22776763C();
  v11 = a3;
  v12 = self;
  sub_22774E7F8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)voiceSelectionViewModelDidChange
{
  _TtC9SiriSetup16VoiceOptionsView *v2;

  v2 = self;
  sub_22774E134();

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView____lazy_storage___tableViewDataSource));
}

@end
