@implementation CoreSynthesisVoiceShim

+ (_TtC12TextToSpeech22CoreSynthesisVoiceShim)shared
{
  if (qword_1EE6E12F0 != -1)
    swift_once();
  swift_beginAccess();
  return (_TtC12TextToSpeech22CoreSynthesisVoiceShim *)(id)qword_1EE6E12F8;
}

+ (void)setShared:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1EE6E12F0;
  v4 = a3;
  if (v3 != -1)
    swift_once();
  swift_beginAccess();
  v5 = (void *)qword_1EE6E12F8;
  qword_1EE6E12F8 = (uint64_t)v4;

}

- (void)voiceWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC12TextToSpeech22CoreSynthesisVoiceShim *v16;
  uint64_t v17;

  v7 = sub_1A39A4820((uint64_t *)&unk_1ED1B53A0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1A3AB4D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE6D3EB8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE6D3EC0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A39D16BC((uint64_t)v9, (uint64_t)&unk_1EE6D3EC8, (uint64_t)v14);
  swift_release();
}

- (void)voiceWithLanguageCode:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC12TextToSpeech22CoreSynthesisVoiceShim *v16;
  uint64_t v17;

  v7 = sub_1A39A4820((uint64_t *)&unk_1ED1B53A0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1A3AB4D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE6D3E98;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE6D3EA0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A39D16BC((uint64_t)v9, (uint64_t)&unk_1EE6D3EA8, (uint64_t)v14);
  swift_release();
}

- (void)publicVoicesWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC12TextToSpeech22CoreSynthesisVoiceShim *v13;
  uint64_t v14;

  v5 = sub_1A39A4820((uint64_t *)&unk_1ED1B53A0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1A3AB4D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE6D3E78;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE6D3E80;
  v12[5] = v11;
  v13 = self;
  sub_1A39D16BC((uint64_t)v7, (uint64_t)&unk_1EE6D3E88, (uint64_t)v12);
  swift_release();
}

- (void)internalVoicesIncludingSiri:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC12TextToSpeech22CoreSynthesisVoiceShim *v15;
  uint64_t v16;

  v7 = sub_1A39A4820((uint64_t *)&unk_1ED1B53A0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_1A3AB4D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE6D3E50;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE6D3E58;
  v14[5] = v13;
  v15 = self;
  sub_1A39D16BC((uint64_t)v9, (uint64_t)&unk_1EE6D3E60, (uint64_t)v14);
  swift_release();
}

- (void)internalVoiceWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC12TextToSpeech22CoreSynthesisVoiceShim *v16;
  uint64_t v17;

  v7 = sub_1A39A4820((uint64_t *)&unk_1ED1B53A0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1A3AB4D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE6D3E30;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE6D3E38;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A39D16BC((uint64_t)v9, (uint64_t)&unk_1EE6D3E40, (uint64_t)v14);
  swift_release();
}

- (_TtC12TextToSpeech22CoreSynthesisVoiceShim)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12TextToSpeech22CoreSynthesisVoiceShim____lazy_storage___internalResolver) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12TextToSpeech22CoreSynthesisVoiceShim____lazy_storage___publicResolver) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CoreSynthesisVoiceShim();
  return -[CoreSynthesisVoiceShim init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
