@implementation LanguagesServiceBridge

- (NSArray)models
{
  void *v2;

  swift_beginAccess();
  sub_1D2CC63E8(0, (unint64_t *)&qword_1ED586C38);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D2D9DE48();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setModels:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  sub_1D2CC63E8(0, (unint64_t *)&qword_1ED586C38);
  v4 = sub_1D2D9DE60();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13TranslationUI22LanguagesServiceBridge_models);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

+ (NSString)modelsKeyPath
{
  return (NSString *)(id)sub_1D2D9DCB0();
}

- (_TtC13TranslationUI22LanguagesServiceBridge)init
{
  return (_TtC13TranslationUI22LanguagesServiceBridge *)LanguagesServiceBridge.init()();
}

- (id)modelForLocale:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _TtC13TranslationUI22LanguagesServiceBridge *v8;
  NSArray *v9;
  unint64_t v10;
  void *v11;
  _BYTE v13[16];
  _BYTE *v14;

  v4 = sub_1D2D9C7EC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1D2D9C75C();
  v8 = self;
  v9 = -[LanguagesServiceBridge models](v8, sel_models);
  sub_1D2CC63E8(0, (unint64_t *)&qword_1ED586C38);
  v10 = sub_1D2D9DE60();

  v14 = v7;
  v11 = sub_1D2D06BF0(sub_1D2D119D4, (uint64_t)v13, v10);

  swift_bridgeObjectRelease();
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (void)downloadLocales:(id)a3
{
  uint64_t v4;
  _TtC13TranslationUI22LanguagesServiceBridge *v5;

  sub_1D2D9C7EC();
  v4 = sub_1D2D9DE60();
  v5 = self;
  LanguagesServiceBridge.download(locales:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)deleteLocale:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC13TranslationUI22LanguagesServiceBridge *v8;
  uint64_t v9;

  v4 = sub_1D2D9C7EC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D2D9C75C();
  v8 = self;
  LanguagesServiceBridge.delete(locale:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
