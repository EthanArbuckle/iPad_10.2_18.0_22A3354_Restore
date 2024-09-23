@implementation TTSSpeechEventObjc

+ (id)makeWithOtherRewrite:(id)a3 from:(id)a4 to:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  char *v15;
  char *v16;
  objc_super v18;

  v5 = sub_1A3AB497C();
  v7 = v6;
  v8 = sub_1A3AB497C();
  v10 = v9;
  v11 = sub_1A3AB497C();
  v13 = v12;
  v14 = (objc_class *)type metadata accessor for TTSSpeechEventObjc();
  v15 = (char *)objc_allocWithZone(v14);
  v16 = &v15[OBJC_IVAR____TtC12TextToSpeech18TTSSpeechEventObjc_wrappedEvent];
  *(_QWORD *)v16 = v5;
  *((_QWORD *)v16 + 1) = v7;
  *((_QWORD *)v16 + 2) = v8;
  *((_QWORD *)v16 + 3) = v10;
  *((_QWORD *)v16 + 4) = v11;
  *((_QWORD *)v16 + 5) = v13;
  *((_QWORD *)v16 + 6) = 0;
  *((_QWORD *)v16 + 7) = 0;
  v16[64] = 3;
  v18.receiver = v15;
  v18.super_class = v14;
  return objc_msgSendSuper2(&v18, sel_init);
}

+ (id)makeWithStart:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  objc_super v10;

  v3 = sub_1A3AB497C();
  v5 = v4;
  v6 = (objc_class *)type metadata accessor for TTSSpeechEventObjc();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR____TtC12TextToSpeech18TTSSpeechEventObjc_wrappedEvent];
  *(_QWORD *)v8 = v3;
  *((_QWORD *)v8 + 1) = v5;
  *((_OWORD *)v8 + 1) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  *((_OWORD *)v8 + 3) = 0u;
  v8[64] = 4;
  v10.receiver = v7;
  v10.super_class = v6;
  return objc_msgSendSuper2(&v10, sel_init);
}

- (_TtC12TextToSpeech18TTSSpeechEventObjc)init
{
  _TtC12TextToSpeech18TTSSpeechEventObjc *result;

  result = (_TtC12TextToSpeech18TTSSpeechEventObjc *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC12TextToSpeech18TTSSpeechEventObjc_wrappedEvent;
  sub_1A3A2C090(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech18TTSSpeechEventObjc_wrappedEvent), *((_QWORD *)v2 + 1), *((_QWORD *)v2 + 2), *((_QWORD *)v2 + 3), *((_QWORD *)v2 + 4), *((_QWORD *)v2 + 5), *((_QWORD *)v2 + 6), *((_QWORD *)v2 + 7), v2[64]);
}

@end
