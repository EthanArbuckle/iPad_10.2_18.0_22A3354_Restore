@implementation TTSSpeechTracer

+ (_TtC12TextToSpeech15TTSSpeechTracer)shared
{
  if (qword_1EE6DD310 != -1)
    swift_once();
  return (_TtC12TextToSpeech15TTSSpeechTracer *)(id)qword_1EE6DD318;
}

- (_TtC12TextToSpeech15TTSSpeechTracer)init
{
  return (_TtC12TextToSpeech15TTSSpeechTracer *)TTSSpeechTracer.init()();
}

- (id)makeSpeechJobIdentifier
{
  _TtC12TextToSpeech15TTSSpeechTracer *v2;
  void *v3;

  v2 = self;
  sub_1A3A2D54C(0, 5, 0xD00000000000003ELL, 0x80000001A3AF1750);
  sub_1A39A4820(&qword_1EE6D3B28);
  sub_1A3A2D890(&qword_1EE6D3B30, &qword_1EE6D3B28);
  sub_1A3AB4B2C();

  v3 = (void *)sub_1A3AB4958();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)emitWithEvent:(id)a3 forIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t *__return_ptr);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _TtC12TextToSpeech15TTSSpeechTracer *v20;
  _QWORD v21[8];
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;

  v6 = sub_1A3AB497C();
  v18 = v7;
  v19 = v6;
  v8 = *(void (**)(uint64_t *__return_ptr))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)a3) + 0x58);
  v17 = a3;
  v20 = self;
  v8(&v23);
  v9 = v23;
  v10 = v24;
  v11 = v25;
  v12 = v26;
  v14 = v27;
  v13 = v28;
  v15 = v30;
  v16 = v29;
  LOBYTE(self) = v31;
  v21[0] = v23;
  v21[1] = v24;
  v21[2] = v25;
  v21[3] = v26;
  v21[4] = v27;
  v21[5] = v28;
  v21[6] = v29;
  v21[7] = v30;
  v22 = v31;
  (*(void (**)(_QWORD *, uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v20->super.isa) + 0x128))(v21, v19, v18);
  sub_1A3A2C090(v9, v10, v11, v12, v14, v13, v16, v15, (char)self);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
}

@end
