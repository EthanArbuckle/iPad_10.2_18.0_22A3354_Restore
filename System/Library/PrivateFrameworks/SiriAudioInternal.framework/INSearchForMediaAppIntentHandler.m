@implementation INSearchForMediaAppIntentHandler

- (void)resolveMediaItemsForSearchForMedia:(INSearchForMediaIntent *)a3 withCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  INSearchForMediaIntent *v15;
  _TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB750);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_22727D6BC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2558CBAD0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2558CBAD8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_22725081C((uint64_t)v9, (uint64_t)&unk_2558CBAE0, (uint64_t)v14);
  swift_release();
}

- (void)handleSearchForMedia:(INSearchForMediaIntent *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  INSearchForMediaIntent *v15;
  _TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB750);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_22727D6BC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2558CBA90;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2558CBAA0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_22725081C((uint64_t)v9, (uint64_t)&unk_2558CBAB0, (uint64_t)v14);
  swift_release();
}

- (_TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler)init
{
  _TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler *result;

  result = (_TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_featureFlagProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_appIntentInvoker);
}

@end
