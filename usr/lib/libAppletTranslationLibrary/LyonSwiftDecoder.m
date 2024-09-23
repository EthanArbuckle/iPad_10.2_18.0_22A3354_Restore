@implementation LyonSwiftDecoder

+ (id)getInstance
{
  if (qword_1EF8D99C0 != -1)
    swift_once();
  return (id)qword_1EF8D9B80;
}

- (int64_t)stateNumber
{
  unsigned int v2;

  v2 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC24AppletTranslationLibrary16LyonSwiftDecoder_state);
  if (!(v2 >> 6))
    return 2;
  if (v2 >> 6 == 1)
    return 3;
  if (v2 == 128)
    return 1;
  return 4;
}

- (_TtC24AppletTranslationLibrary16LyonSwiftDecoder)init
{
  return (_TtC24AppletTranslationLibrary16LyonSwiftDecoder *)sub_1C3578AC4();
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _TtC24AppletTranslationLibrary16LyonSwiftDecoder *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = self;
  v19 = sub_1C35B6A5C();
  v21 = v20;

  v22 = sub_1C35B6C60();
  v24 = v23;

  sub_1C357E994(v19, v21, v22, v24);
  swift_bridgeObjectRelease();

  sub_1C3573D7C(v19, v21);
  v25 = (void *)sub_1C35B6C0C();
  swift_bridgeObjectRelease();
  return v25;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  return sub_1C357BCE4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, "LyonDecoder doesn't support GetState");
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  void *v7;

  sub_1C357EFC8();
  v7 = (void *)sub_1C35B6C0C();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  return sub_1C357BCE4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, "LyonDecoder doesn't support processEndOfTransaction");
}

- (void)cleanup
{
  _TtC24AppletTranslationLibrary16LyonSwiftDecoder *v2;

  v2 = self;
  sub_1C357BD90();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
