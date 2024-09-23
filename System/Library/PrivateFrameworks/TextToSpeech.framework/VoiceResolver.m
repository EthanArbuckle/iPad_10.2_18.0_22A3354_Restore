@implementation VoiceResolver

+ (_TtC12TextToSpeech13VoiceResolver)shared
{
  if (qword_1EE6D4E20 != -1)
    swift_once();
  swift_beginAccess();
  return (_TtC12TextToSpeech13VoiceResolver *)(id)swift_retain();
}

+ (void)setShared:(id)a3
{
  uint64_t v4;

  v4 = qword_1EE6D4E20;
  swift_retain();
  if (v4 != -1)
    swift_once();
  swift_beginAccess();
  qword_1EE6D4E38 = (uint64_t)a3;
  swift_release();
}

- (void)currentSystemLocaleWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = sub_1A39A4820((uint64_t *)&unk_1ED1B53A0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1A3AB4D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE6D34B0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE6D34B8;
  v12[5] = v11;
  swift_retain();
  sub_1A39D16BC((uint64_t)v7, (uint64_t)&unk_1EE6D34C0, (uint64_t)v12);
  swift_release();
}

- (void)currentLocalesWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = sub_1A39A4820((uint64_t *)&unk_1ED1B53A0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1A3AB4D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE6D3490;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE6D3498;
  v12[5] = v11;
  swift_retain();
  sub_1A39D16BC((uint64_t)v7, (uint64_t)&unk_1EE6D34A0, (uint64_t)v12);
  swift_release();
}

- (void)currentLocaleIdentifiersWithCompletionHandler:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_retain();
  sub_1A39ED2D8((uint64_t)sub_1A39FFB10, v4);
  swift_release();
  swift_release();
}

- (void)currentSystemLocaleIdentifierWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = sub_1A39A4820((uint64_t *)&unk_1ED1B53A0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1A3AB4D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE6D3470;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE6D3478;
  v12[5] = v11;
  swift_retain();
  sub_1A39D16BC((uint64_t)v7, (uint64_t)&unk_1EE6D3480, (uint64_t)v12);
  swift_release();
}

- (_TtC12TextToSpeech13VoiceResolver)init
{
  return (_TtC12TextToSpeech13VoiceResolver *)VoiceResolver.init()();
}

- (void)voiceForIdentifier:(NSString *)a3 completionHandler:(id)a4
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
  uint64_t v16;

  v7 = sub_1A39A4820((uint64_t *)&unk_1ED1B53A0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_1EE6D3450;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE6D3458;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1A39D16BC((uint64_t)v9, (uint64_t)&unk_1EE6D3460, (uint64_t)v14);
  swift_release();
}

- (void)voiceForLocale:(NSLocale *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSLocale *v15;
  uint64_t v16;

  v7 = sub_1A39A4820((uint64_t *)&unk_1ED1B53A0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_1EE6D3430;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE6D3438;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1A39D16BC((uint64_t)v9, (uint64_t)&unk_1EE6D3440, (uint64_t)v14);
  swift_release();
}

- (void)voiceForLocaleIdentifier:(id)a3 completionHandler:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = _Block_copy(a4);
  v5 = sub_1A3AB497C();
  v7 = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v4;
  swift_retain();
  sub_1A39F1D40(v5, v7, (uint64_t)sub_1A3A01700, v8);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)voiceForIdentifier:(id)a3 preferringLanguage:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v7 = _Block_copy(a5);
  if (!a3)
  {
    v8 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v8 = sub_1A3AB497C();
  a3 = v9;
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v10 = sub_1A3AB497C();
  a4 = v11;
LABEL_6:
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v7;
  swift_retain();
  sub_1A39F21E0(v8, (uint64_t)a3, v10, (uint64_t)a4, (uint64_t)sub_1A39FF950, v12);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)fallbackForVoice:(TTSSpeechVoice *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  TTSSpeechVoice *v15;
  uint64_t v16;

  v7 = sub_1A39A4820((uint64_t *)&unk_1ED1B53A0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_1EE6D3410;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE6D3418;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1A39D16BC((uint64_t)v9, (uint64_t)&unk_1EE6D3420, (uint64_t)v14);
  swift_release();
}

@end
