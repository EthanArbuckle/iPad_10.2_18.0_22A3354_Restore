@implementation CoreSynthesizer

- (_TtC12TextToSpeech13VoiceResolver)_voiceResolver
{
  swift_beginAccess();
  return (_TtC12TextToSpeech13VoiceResolver *)(id)swift_retain();
}

- (void)set_voiceResolver:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__voiceResolver);
  swift_beginAccess();
  *v4 = a3;
  swift_retain();
  swift_release();
}

- (_TtC12TextToSpeech13VoiceResolver)voiceResolver
{
  uint64_t KeyPath;
  void (*v4)(uint64_t);
  _TtC12TextToSpeech15CoreSynthesizer *v5;
  void **v6;
  void *v7;

  KeyPath = swift_getKeyPath();
  v4 = *(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x5E8);
  v5 = self;
  v4(KeyPath);
  swift_release();
  v6 = (void **)((char *)&v5->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__voiceResolver);
  swift_beginAccess();
  v7 = *v6;
  swift_retain();

  return (_TtC12TextToSpeech13VoiceResolver *)v7;
}

- (void)setVoiceResolver:(id)a3
{
  uint64_t KeyPath;
  void (*v6)(uint64_t, uint64_t (*)(), _QWORD *, uint64_t);
  _TtC12TextToSpeech15CoreSynthesizer *v7;
  _QWORD v8[6];

  KeyPath = swift_getKeyPath();
  v8[2] = self;
  v8[3] = a3;
  v6 = *(void (**)(uint64_t, uint64_t (*)(), _QWORD *, uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa)
                                                                        + 0x5F0);
  swift_retain();
  v7 = self;
  v6(KeyPath, sub_1A39EC428, v8, MEMORY[0x1E0DEE9C0] + 8);

  swift_release();
  swift_release();
}

- (TTSWrappedAudioQueue)_audioQueue
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioQueue);
  swift_beginAccess();
  return (TTSWrappedAudioQueue *)*v2;
}

- (void)set_audioQueue:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioQueue);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (TTSWrappedAudioQueue)audioQueue
{
  return (TTSWrappedAudioQueue *)sub_1A39E5E80(self, (uint64_t)a2, (uint64_t)&unk_1A3AC1340, &OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioQueue);
}

- (void)setAudioQueue:(id)a3
{
  sub_1A39E5FBC(self, (uint64_t)a2, a3, (uint64_t)&unk_1A3AC1340, (uint64_t)sub_1A39EC414);
}

- (NSArray)_offlineChain
{
  void *v2;

  swift_beginAccess();
  sub_1A39B11BC(0, &qword_1EE6D2D78);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A3AB4BA4();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)set_offlineChain:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  sub_1A39B11BC(0, &qword_1EE6D2D78);
  v4 = sub_1A3AB4BB0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__offlineChain);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSArray)offlineChain
{
  uint64_t KeyPath;
  void (*v4)(uint64_t);
  _TtC12TextToSpeech15CoreSynthesizer *v5;
  void *v6;

  KeyPath = swift_getKeyPath();
  v4 = *(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x5E8);
  v5 = self;
  v4(KeyPath);
  swift_release();
  swift_beginAccess();
  swift_bridgeObjectRetain();

  sub_1A39B11BC(0, &qword_1EE6D2D78);
  v6 = (void *)sub_1A3AB4BA4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (void)setOfflineChain:(id)a3
{
  uint64_t v4;
  uint64_t KeyPath;
  void (*v6)(uint64_t, uint64_t (*)(), _QWORD *, uint64_t);
  _TtC12TextToSpeech15CoreSynthesizer *v7;
  _QWORD v8[6];

  sub_1A39B11BC(0, &qword_1EE6D2D78);
  v4 = sub_1A3AB4BB0();
  KeyPath = swift_getKeyPath();
  v8[2] = self;
  v8[3] = v4;
  v6 = *(void (**)(uint64_t, uint64_t (*)(), _QWORD *, uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa)
                                                                        + 0x5F0);
  v7 = self;
  v6(KeyPath, sub_1A39EC400, v8, MEMORY[0x1E0DEE9C0] + 8);

  swift_release();
  swift_bridgeObjectRelease();
}

- (NSArray)_effects
{
  void *v2;

  swift_beginAccess();
  sub_1A3AB464C();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A3AB4BA4();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)set_effects:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  _TtC12TextToSpeech15CoreSynthesizer *v6;

  sub_1A3AB464C();
  v4 = sub_1A3AB4BB0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__effects);
  swift_beginAccess();
  *v5 = v4;
  v6 = self;
  swift_bridgeObjectRelease();
  sub_1A39DDB48();

}

- (NSArray)effects
{
  uint64_t KeyPath;
  void (*v4)(uint64_t);
  _TtC12TextToSpeech15CoreSynthesizer *v5;
  void *v6;

  KeyPath = swift_getKeyPath();
  v4 = *(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x5E8);
  v5 = self;
  v4(KeyPath);
  swift_release();
  swift_beginAccess();
  swift_bridgeObjectRetain();

  sub_1A3AB464C();
  v6 = (void *)sub_1A3AB4BA4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (void)setEffects:(id)a3
{
  uint64_t v4;
  uint64_t KeyPath;
  void (*v6)(uint64_t, uint64_t (*)(), _QWORD *, uint64_t);
  _TtC12TextToSpeech15CoreSynthesizer *v7;
  _QWORD v8[6];

  sub_1A3AB464C();
  v4 = sub_1A3AB4BB0();
  KeyPath = swift_getKeyPath();
  v8[2] = self;
  v8[3] = v4;
  v6 = *(void (**)(uint64_t, uint64_t (*)(), _QWORD *, uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa)
                                                                        + 0x5F0);
  v7 = self;
  v6(KeyPath, sub_1A39EC3EC, v8, MEMORY[0x1E0DEE9C0] + 8);

  swift_release();
  swift_bridgeObjectRelease();
}

- (AVAudioSession)_audioSession
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioSession);
  swift_beginAccess();
  return (AVAudioSession *)*v2;
}

- (void)set_audioSession:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC12TextToSpeech15CoreSynthesizer *v8;
  _QWORD *v9;
  void *v10;
  void *v11;

  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioSession);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  v9 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v10 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v8->super.isa) + 0x1B0))();
  v11 = (void *)(*(uint64_t (**)(void))((*v9 & (uint64_t)v8->super.isa) + 0x370))();
  objc_msgSend(v10, sel_setAudioSession_, v11);

}

- (AVAudioSession)audioSession
{
  return (AVAudioSession *)sub_1A39E5E80(self, (uint64_t)a2, (uint64_t)&unk_1A3AC14A8, &OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioSession);
}

- (void)setAudioSession:(id)a3
{
  sub_1A39E5FBC(self, (uint64_t)a2, a3, (uint64_t)&unk_1A3AC14A8, (uint64_t)sub_1A39EC3D8);
}

- (NSArray)channels
{
  uint64_t (*v2)(void);
  _TtC12TextToSpeech15CoreSynthesizer *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x1B0);
  v3 = self;
  v4 = (void *)v2();
  v5 = objc_msgSend(v4, sel_channels);

  sub_1A39B11BC(0, &qword_1EE6D3040);
  sub_1A3AB4BB0();

  v6 = (void *)sub_1A3AB4BA4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (void)setChannels:(id)a3
{
  uint64_t (*v4)(void);
  _TtC12TextToSpeech15CoreSynthesizer *v5;
  void *v6;
  id v7;

  sub_1A39B11BC(0, &qword_1EE6D3040);
  sub_1A3AB4BB0();
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x1B0);
  v5 = self;
  v6 = (void *)v4();
  v7 = (id)sub_1A3AB4BA4();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setChannels_, v7);

}

- (unsigned)audioQueueFlags
{
  uint64_t (*v2)(void);
  _TtC12TextToSpeech15CoreSynthesizer *v3;
  void *v4;
  unsigned int v5;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x1B0);
  v3 = self;
  v4 = (void *)v2();
  v5 = objc_msgSend(v4, sel_audioQueueFlags);

  return v5;
}

- (void)setAudioQueueFlags:(unsigned int)a3
{
  uint64_t v3;
  uint64_t (*v4)(void);
  _TtC12TextToSpeech15CoreSynthesizer *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x1B0);
  v5 = self;
  v6 = (id)v4();
  objc_msgSend(v6, sel_setAudioQueueFlags_, v3);

}

- (_TtC12TextToSpeech15CoreSynthesizer)init
{
  return (_TtC12TextToSpeech15CoreSynthesizer *)CoreSynthesizer.init()();
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
  _TtC12TextToSpeech15CoreSynthesizer *v16;
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
  v13[4] = &unk_1EE6D3210;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE6D3218;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A39D16BC((uint64_t)v9, (uint64_t)&unk_1EE6D3220, (uint64_t)v14);
  swift_release();
}

- (void)voiceWithLocale:(NSLocale *)a3 completionHandler:(id)a4
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
  _TtC12TextToSpeech15CoreSynthesizer *v16;
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
  v13[4] = &unk_1EE6D31F0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE6D31F8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A39D16BC((uint64_t)v9, (uint64_t)&unk_1EE6D3200, (uint64_t)v14);
  swift_release();
}

- (void)stopWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC12TextToSpeech15CoreSynthesizer *v13;
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
  v11[4] = &unk_1EE6D31D0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE6D31D8;
  v12[5] = v11;
  v13 = self;
  sub_1A39D16BC((uint64_t)v7, (uint64_t)&unk_1EE6D31E0, (uint64_t)v12);
  swift_release();
}

- (BOOL)mixToTelephonyUplink
{
  uint64_t (*v2)(void);
  _TtC12TextToSpeech15CoreSynthesizer *v3;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x378);
  v3 = self;
  LODWORD(v2) = v2();

  return (v2 >> 8) & 1;
}

- (void)setMixToTelephonyUplink:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v4;
  uint64_t (*v5)(void);
  int v6;
  int v7;
  _TtC12TextToSpeech15CoreSynthesizer *v8;

  v3 = a3;
  v4 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v5 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x378);
  v8 = self;
  v6 = v5();
  if (v3)
    v7 = 256;
  else
    v7 = 0;
  (*(void (**)(_QWORD))((*v4 & (uint64_t)v8->super.isa) + 0x380))(v6 & 0xFFFFFEFF | v7);

}

- (NSString)_auxSessionCategory
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionCategory);
  swift_beginAccess();
  return (NSString *)*v2;
}

- (void)set_auxSessionCategory:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC12TextToSpeech15CoreSynthesizer *v8;

  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionCategory);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_1A39E5D0C();
}

- (NSString)auxSessionCategory
{
  return (NSString *)sub_1A39E5E80(self, (uint64_t)a2, (uint64_t)&unk_1A3AC1578, &OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionCategory);
}

- (void)setAuxSessionCategory:(id)a3
{
  sub_1A39E5FBC(self, (uint64_t)a2, a3, (uint64_t)&unk_1A3AC1578, (uint64_t)sub_1A39EC3C4);
}

- (unint64_t)_auxSessionCategoryOptions
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionCategoryOptions);
  swift_beginAccess();
  return *v2;
}

- (void)set_auxSessionCategoryOptions:(unint64_t)a3
{
  unint64_t *v5;
  _TtC12TextToSpeech15CoreSynthesizer *v6;

  v5 = (unint64_t *)((char *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionCategoryOptions);
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_1A39E62F4();

}

- (unint64_t)auxSessionCategoryOptions
{
  uint64_t KeyPath;
  void (*v4)(uint64_t);
  _TtC12TextToSpeech15CoreSynthesizer *v5;
  unint64_t *v6;
  unint64_t v7;

  KeyPath = swift_getKeyPath();
  v4 = *(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x5E8);
  v5 = self;
  v4(KeyPath);
  swift_release();
  v6 = (unint64_t *)((char *)v5 + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionCategoryOptions);
  swift_beginAccess();
  v7 = *v6;

  return v7;
}

- (void)setAuxSessionCategoryOptions:(unint64_t)a3
{
  uint64_t KeyPath;
  void (*v6)(uint64_t, void (*)(), _QWORD *, uint64_t);
  _TtC12TextToSpeech15CoreSynthesizer *v7;
  _QWORD v8[6];

  KeyPath = swift_getKeyPath();
  v8[2] = self;
  v8[3] = a3;
  v6 = *(void (**)(uint64_t, void (*)(), _QWORD *, uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa)
                                                                     + 0x5F0);
  v7 = self;
  v6(KeyPath, sub_1A39E9F08, v8, MEMORY[0x1E0DEE9C0] + 8);

  swift_release();
}

- (BOOL)_auxSessionParticipatesInNowPlayingAppPolicy
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionParticipatesInNowPlayingAppPolicy;
  swift_beginAccess();
  return *v2;
}

- (void)set_auxSessionParticipatesInNowPlayingAppPolicy:(BOOL)a3
{
  BOOL *v5;
  _TtC12TextToSpeech15CoreSynthesizer *v6;

  v5 = (BOOL *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionParticipatesInNowPlayingAppPolicy;
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_1A39E6810();

}

- (BOOL)auxSessionParticipatesInNowPlayingAppPolicy
{
  return sub_1A39E6C40(self, (uint64_t)a2, (uint64_t)&unk_1A3AC1620, &OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionParticipatesInNowPlayingAppPolicy);
}

- (void)setAuxSessionParticipatesInNowPlayingAppPolicy:(BOOL)a3
{
  sub_1A39E6D74(self, (uint64_t)a2, a3, (uint64_t)&unk_1A3AC1620, (uint64_t)sub_1A39E9F1C);
}

- (BOOL)_audioSessionAutomaticallyDeactivatesAfterSpeaking
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioSessionAutomaticallyDeactivatesAfterSpeaking;
  swift_beginAccess();
  return *v2;
}

- (void)set_audioSessionAutomaticallyDeactivatesAfterSpeaking:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioSessionAutomaticallyDeactivatesAfterSpeaking;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)audioSessionAutomaticallyDeactivatesAfterSpeaking
{
  return sub_1A39E6C40(self, (uint64_t)a2, (uint64_t)&unk_1A3AC1688, &OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioSessionAutomaticallyDeactivatesAfterSpeaking);
}

- (void)setAudioSessionAutomaticallyDeactivatesAfterSpeaking:(BOOL)a3
{
  sub_1A39E6D74(self, (uint64_t)a2, a3, (uint64_t)&unk_1A3AC1688, (uint64_t)sub_1A39E9F30);
}

- (AVAudioSession)_auxiliarySession
{
  return (AVAudioSession *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxiliarySession));
}

- (void)set_auxiliarySession:(id)a3
{
  void *v4;
  id v5;
  _TtC12TextToSpeech15CoreSynthesizer *v6;
  _QWORD *v7;
  void *v8;
  id v9;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxiliarySession);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxiliarySession) = (Class)a3;
  v5 = a3;
  v6 = self;

  v7 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v8 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v6->super.isa) + 0x1B0))();
  v9 = (id)(*(uint64_t (**)(void))((*v7 & (uint64_t)v6->super.isa) + 0x370))();
  objc_msgSend(v8, sel_setAudioSession_, v9);

}

- (AVAudioSession)auxiliarySession
{
  uint64_t KeyPath;
  void (*v4)(uint64_t);
  _TtC12TextToSpeech15CoreSynthesizer *v5;
  AVAudioSession *v6;

  KeyPath = swift_getKeyPath();
  v4 = *(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x5E8);
  v5 = self;
  v4(KeyPath);
  swift_release();
  v6 = (AVAudioSession *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&v5->super.isa
                                                                 + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxiliarySession));

  return v6;
}

- (void)setAuxiliarySession:(id)a3
{
  uint64_t KeyPath;
  void (*v6)(uint64_t, void (*)(), _QWORD *, uint64_t);
  id v7;
  _TtC12TextToSpeech15CoreSynthesizer *v8;
  _QWORD v9[6];

  KeyPath = swift_getKeyPath();
  v9[2] = self;
  v9[3] = a3;
  v6 = *(void (**)(uint64_t, void (*)(), _QWORD *, uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa)
                                                                     + 0x5F0);
  v7 = a3;
  v8 = self;
  v6(KeyPath, sub_1A39EC3B0, v9, MEMORY[0x1E0DEE9C0] + 8);

  swift_release();
}

- (BOOL)useAuxiliarySession
{
  uint64_t KeyPath;
  void (*v4)(uint64_t);
  _TtC12TextToSpeech15CoreSynthesizer *v5;

  KeyPath = swift_getKeyPath();
  v4 = *(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x5E8);
  v5 = self;
  v4(KeyPath);
  swift_release();
  LOBYTE(self) = *((_BYTE *)&v5->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer___usingAuxiliarySession);

  return (char)self;
}

- (void)setUseAuxiliarySession:(BOOL)a3
{
  _TtC12TextToSpeech15CoreSynthesizer *v4;

  v4 = self;
  sub_1A39E75F4(a3);

}

- (void).cxx_destruct
{
  void *v3;
  char *v4;
  uint64_t v5;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(void **)&self->_offlineChain[OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__effectManager];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1A39E9ED0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__nextWordBlock));

  v4 = (char *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer___observationRegistrar;
  v5 = sub_1A3AB4580();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

- (BOOL)isSpeaking
{
  _TtC12TextToSpeech15CoreSynthesizer *v2;
  char v3;

  v2 = self;
  v3 = CoreSynthesizer.isSpeaking.getter();

  return v3 & 1;
}

- (BOOL)isPaused
{
  _TtC12TextToSpeech15CoreSynthesizer *v2;
  char v3;

  v2 = self;
  v3 = CoreSynthesizer.isPaused.getter();

  return v3 & 1;
}

- (void)speak:(AVSpeechUtterance *)a3 synth:(AVSpeechSynthesizer *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  AVSpeechUtterance *v17;
  AVSpeechSynthesizer *v18;
  _TtC12TextToSpeech15CoreSynthesizer *v19;
  uint64_t v20;

  v9 = sub_1A39A4820((uint64_t *)&unk_1ED1B53A0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1A3AB4D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EE6D4030;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EE6D4038;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1A39D16BC((uint64_t)v11, (uint64_t)&unk_1EE6D4040, (uint64_t)v16);
  swift_release();
}

- (void)write:(_TtC12TextToSpeech15CoreSynthesizer *)self toBufferCallback:(SEL)a2 synth:(AVSpeechUtterance *)a3 completionHandler:(id)a4
{
  void *v4;
  const void *v5;
  const void *v6;
  void *v7;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  AVSpeechUtterance *v20;
  id v21;
  _TtC12TextToSpeech15CoreSynthesizer *v22;
  uint64_t v23;

  v6 = v5;
  v7 = v4;
  v11 = sub_1A39A4820((uint64_t *)&unk_1ED1B53A0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a4);
  v15 = _Block_copy(v6);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a3;
  v16[3] = v14;
  v16[4] = v7;
  v16[5] = v15;
  v16[6] = self;
  v17 = sub_1A3AB4D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v13, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EE6D4010;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EE6D4018;
  v19[5] = v18;
  v20 = a3;
  v21 = v7;
  v22 = self;
  sub_1A39D16BC((uint64_t)v13, (uint64_t)&unk_1EE6D4020, (uint64_t)v19);
  swift_release();
}

- (void)write:(AVSpeechUtterance *)a3 toBufferCallback:(id)a4 toMarkerCallback:synth:completionHandler:
{
  const void *v4;
  void *v5;
  const void *v6;
  const void *v7;
  void *v8;
  const void *v9;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  AVSpeechUtterance *v23;
  id v24;
  _TtC12TextToSpeech15CoreSynthesizer *v25;
  uint64_t v26;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v13 = sub_1A39A4820((uint64_t *)&unk_1ED1B53A0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a4);
  v17 = _Block_copy(v9);
  v18 = _Block_copy(v7);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a3;
  v19[3] = v16;
  v19[4] = v17;
  v19[5] = v8;
  v19[6] = v18;
  v19[7] = self;
  v20 = sub_1A3AB4D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v15, 1, 1, v20);
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1EE6D3FE8;
  v21[5] = v19;
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EE6D3FF0;
  v22[5] = v21;
  v23 = a3;
  v24 = v8;
  v25 = self;
  sub_1A39D16BC((uint64_t)v15, (uint64_t)&unk_1EE6D3FF8, (uint64_t)v22);
  swift_release();
}

- (void)stopSpeakingAt:(int64_t)a3 completionHandler:(id)a4
{
  void *v6;
  _TtC12TextToSpeech15CoreSynthesizer *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_1A3A484CC(a3, v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)pauseSpeakingAt:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC12TextToSpeech15CoreSynthesizer *v15;
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
  v13[4] = &unk_1EE6D3F98;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE6D3FA8;
  v14[5] = v13;
  v15 = self;
  sub_1A39D16BC((uint64_t)v9, (uint64_t)&unk_1EE6D3FB8, (uint64_t)v14);
  swift_release();
}

- (BOOL)continueSpeaking
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC12TextToSpeech15CoreSynthesizer *v6;
  unsigned __int8 v7;
  uint64_t v8;
  _QWORD *v9;
  _TtC12TextToSpeech15CoreSynthesizer *v10;
  uint64_t v12;

  v3 = sub_1A39A4820((uint64_t *)&unk_1ED1B53A0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  v7 = -[CoreSynthesizer isPaused](v6, sel_isPaused);
  v8 = sub_1A3AB4D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v6;
  v10 = v6;
  sub_1A39DDD84((uint64_t)v5, (uint64_t)&unk_1EE6D3F88, (uint64_t)v9);

  swift_release();
  return v7;
}

- (void)speakWithRequest:(id)a3 synthesizer:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC12TextToSpeech15CoreSynthesizer *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  CoreSynthesizer.speak(request:synthesizer:completionHandler:)(v10, (uint64_t)v11, (uint64_t)sub_1A3A4E560, v9);

  swift_release();
}

@end
