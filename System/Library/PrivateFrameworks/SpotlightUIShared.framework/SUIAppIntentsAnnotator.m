@implementation SUIAppIntentsAnnotator

+ (id)presentationHelperKey
{
  return (id)sub_2217DF098();
}

+ (id)queryHelperKey
{
  return (id)sub_2217DF098();
}

+ (void)annotateSearchField:(id)a3
{
  id v3;

  v3 = a3;
  sub_2217DE91C();

}

+ (void)registerDependency:(id)a3 forKey:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254124FF0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2217DF0A4();
  v10 = v9;
  v11 = sub_2217DF0F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);
  sub_2217DF0E0();
  swift_unknownObjectRetain_n();
  swift_bridgeObjectRetain();
  v12 = sub_2217DF0D4();
  v13 = (_QWORD *)swift_allocObject();
  v14 = MEMORY[0x24BEE6930];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v8;
  v13[5] = v10;
  v13[6] = a3;
  sub_2217DE624((uint64_t)v7, (uint64_t)&unk_255709AE8, (uint64_t)v13);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (SUIAppIntentsAnnotator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUIAppIntentsAnnotator;
  return -[SUIAppIntentsAnnotator init](&v3, sel_init);
}

@end
