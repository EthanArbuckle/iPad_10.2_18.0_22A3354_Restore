@implementation TTSPVSettingsWrapper

- (NSString)speechSource
{
  TTSPVSettingsWrapper *v3;
  void *v4;
  uint64_t v6;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_2488BC52C();
  swift_release();
  swift_release();

  if (!v6)
    return (NSString *)0;
  v4 = (void *)sub_2488BD774();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void)setSpeechSource:(id)a3
{
  TTSPVSettingsWrapper *v4;

  if (a3)
    sub_2488BD7A4();
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_2488BC538();
}

- (TTSPerVoiceSettingsViewControllerDelegate)dataDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___TTSPVSettingsWrapper_dataDelegate;
  swift_beginAccess();
  return (TTSPerVoiceSettingsViewControllerDelegate *)(id)MEMORY[0x24959E05C](v2);
}

- (void)setDataDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (UIViewController)rootView
{
  TTSPVSettingsWrapper *v2;
  id v3;

  v2 = self;
  v3 = sub_2488A7C08();

  return (UIViewController *)v3;
}

- (void)setRootView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TTSPVSettingsWrapper____lazy_storage___rootView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TTSPVSettingsWrapper____lazy_storage___rootView) = (Class)a3;
  v3 = a3;

}

- (TTSPVSettingsWrapper)init
{
  return (TTSPVSettingsWrapper *)TTSPVSettingsWrapper.init()();
}

- (void)reloadView
{
  TTSPVSettingsWrapper *v2;

  v2 = self;
  sub_2488A8184();

}

- (void)addViewToParent:(id)a3
{
  id v4;
  TTSPVSettingsWrapper *v5;

  v4 = a3;
  v5 = self;
  sub_2488A86F0(v4);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;

  v3 = (char *)self + OBJC_IVAR___TTSPVSettingsWrapper__voiceId;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577979D0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = (char *)self + OBJC_IVAR___TTSPVSettingsWrapper__voiceSettings;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577979E8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v5((char *)self + OBJC_IVAR___TTSPVSettingsWrapper__speechSource, v4);
  swift_bridgeObjectRelease();
  sub_2488AC778((uint64_t)self + OBJC_IVAR___TTSPVSettingsWrapper_dataDelegate);

}

@end
