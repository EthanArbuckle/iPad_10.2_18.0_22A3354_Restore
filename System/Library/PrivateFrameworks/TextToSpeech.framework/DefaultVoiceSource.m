@implementation DefaultVoiceSource

- (_TtC12TextToSpeech18DefaultVoiceSource)init
{
  return (_TtC12TextToSpeech18DefaultVoiceSource *)DefaultVoiceSource.init()();
}

- (void)resourceCacheDidReceiveUpdate
{
  void (*v3)(uint64_t (*)(), _TtC12TextToSpeech18DefaultVoiceSource *);

  v3 = *(void (**)(uint64_t (*)(), _TtC12TextToSpeech18DefaultVoiceSource *))(**(_QWORD **)((char *)&self->super.super.isa + OBJC_IVAR____TtC12TextToSpeech18DefaultVoiceSource_debouncer)
                                                                                      + 184);
  swift_retain_n();
  v3(sub_1A39DA67C, self);
  swift_release_n();
}

@end
