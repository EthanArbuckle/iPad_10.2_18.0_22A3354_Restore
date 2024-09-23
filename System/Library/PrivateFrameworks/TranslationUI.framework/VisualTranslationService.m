@implementation VisualTranslationService

+ (void)isTranslatable:(id)a3 completion:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = _Block_copy(a4);
  sub_1D2CC63E8(0, &qword_1ED587860);
  v5 = sub_1D2D9DE60();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  swift_getObjCClassMetadata();
  static VisualTranslationService.isTranslatable(_:completion:)(v5, (uint64_t)sub_1D2D83710, v6);
  swift_release();
  swift_bridgeObjectRelease();
}

+ (void)translate:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 completion:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED587850);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v22 - v13;
  v15 = _Block_copy(a6);
  sub_1D2CC63E8(0, &qword_1ED587860);
  v16 = sub_1D2D9DE60();
  if (a4)
  {
    sub_1D2D9C75C();
    v17 = sub_1D2D9C7EC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 0, 1, v17);
  }
  else
  {
    v18 = sub_1D2D9C7EC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v14, 1, 1, v18);
  }
  if (a5)
  {
    sub_1D2D9C75C();
    v19 = sub_1D2D9C7EC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v11, 0, 1, v19);
  }
  else
  {
    v20 = sub_1D2D9C7EC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v11, 1, 1, v20);
  }
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v15;
  swift_getObjCClassMetadata();
  static VisualTranslationService.translate(_:sourceLocale:targetLocale:completion:)(v16, (uint64_t)v14, (uint64_t)v11, (uint64_t)sub_1D2D83708, v21);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1D2CCADA4((uint64_t)v11, &qword_1ED587850);
  sub_1D2CCADA4((uint64_t)v14, &qword_1ED587850);
}

- (_TtC13TranslationUI24VisualTranslationService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[VisualTranslationService init](&v3, sel_init);
}

@end
