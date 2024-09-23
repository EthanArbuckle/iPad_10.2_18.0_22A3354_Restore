@implementation INUpdateMediaAffinityIntentHandler

- (_TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler *v12;
  uint64_t v14;

  v2 = sub_22727CF3C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v14 - v7;
  sub_22727D0F8();
  sub_22727D0EC();
  sub_22727CF30();
  sub_22727D1F4();
  swift_allocObject();
  v9 = sub_22727D1E8();
  sub_22727D470();
  v10 = sub_22727D464();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  v11 = swift_retain();
  v12 = (_TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler *)sub_227246090(v11, (uint64_t)v6, v9, v10);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v12;
}

- (void)handleUpdateMediaAffinity:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_22724643C(v7, (char *)v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_mediaRemoteAPIProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_playbackController);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_nowPlayingProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_favoriteEntityProvider);
}

@end
