@implementation AlphonsoSwiftDecoder

+ (id)getInstance
{
  if (qword_1EF8D99D0 != -1)
    swift_once();
  return (id)qword_1EF8D9C70;
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _TtC24AppletTranslationLibrary20AlphonsoSwiftDecoder *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = self;
  v19 = sub_1C35B6A5C();
  v21 = v20;

  sub_1C35B6C60();
  sub_1C3583614(v19, v21);
  swift_bridgeObjectRelease();

  sub_1C3573D7C(v19, v21);
  v22 = (void *)sub_1C35B6C0C();
  swift_bridgeObjectRelease();
  return v22;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC24AppletTranslationLibrary20AlphonsoSwiftDecoder *v13;
  void *v14;

  v9 = sub_1C35B6C60();
  v11 = v10;
  v12 = a3;
  v13 = self;
  sub_1C3583B8C(v12, v9, v11);
  swift_bridgeObjectRelease();

  v14 = (void *)sub_1C35B6C0C();
  swift_bridgeObjectRelease();
  return v14;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  void *v7;

  sub_1C3584538();
  v7 = (void *)sub_1C35B6C0C();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  void *v7;

  sub_1C35AB35C(MEMORY[0x1E0DEE9D8]);
  v7 = (void *)sub_1C35B6C0C();
  swift_bridgeObjectRelease();
  return v7;
}

- (_TtC24AppletTranslationLibrary20AlphonsoSwiftDecoder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AlphonsoSwiftDecoder();
  return -[AlphonsoSwiftDecoder init](&v3, sel_init);
}

@end
