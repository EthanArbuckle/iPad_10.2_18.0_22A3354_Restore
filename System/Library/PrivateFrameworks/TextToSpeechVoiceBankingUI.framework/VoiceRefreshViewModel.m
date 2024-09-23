@implementation VoiceRefreshViewModel

- (void)timerFired
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257793570);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2488BD924();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_2488BD900();
  swift_retain_n();
  v8 = sub_2488BD8F4();
  v9 = (_QWORD *)swift_allocObject();
  v10 = MEMORY[0x24BEE6930];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = self;
  sub_2487F6484((uint64_t)v6, (uint64_t)&unk_257795940, (uint64_t)v9);
  swift_release();
  swift_release();
}

@end
