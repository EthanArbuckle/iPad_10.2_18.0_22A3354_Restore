@implementation VoicePreviewer

- (_TtC26TextToSpeechVoiceBankingUI14VoicePreviewer)init
{
  return (_TtC26TextToSpeechVoiceBankingUI14VoicePreviewer *)sub_2487F613C();
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257793570);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2488BD924();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = a3;
  v12 = a3;
  swift_retain_n();
  v13 = v12;
  sub_2487F6484((uint64_t)v9, (uint64_t)&unk_257793678, (uint64_t)v11);
  swift_release();
  swift_release();

}

@end
