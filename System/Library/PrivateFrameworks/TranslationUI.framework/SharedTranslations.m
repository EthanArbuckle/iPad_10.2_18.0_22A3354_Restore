@implementation SharedTranslations

- (NSOperationQueue)presentedItemOperationQueue
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI18SharedTranslations_presentedItemOperationQueue);
  swift_beginAccess();
  return (NSOperationQueue *)*v2;
}

- (void)setPresentedItemOperationQueue:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC13TranslationUI18SharedTranslations_presentedItemOperationQueue);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSURL)presentedItemURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED586240);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC13TranslationUI18SharedTranslations_presentedItemURL;
  swift_beginAccess();
  sub_1D2D3279C((uint64_t)v6, (uint64_t)v5);
  v7 = sub_1D2D9C648();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1D2D9C60C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (void)setPresentedItemURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC13TranslationUI18SharedTranslations *v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED586240);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1D2D9C624();
    v8 = sub_1D2D9C648();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1D2D9C648();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC13TranslationUI18SharedTranslations_presentedItemURL;
  swift_beginAccess();
  v11 = self;
  sub_1D2D32938((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();

}

- (void)dealloc
{
  _TtC13TranslationUI18SharedTranslations *v2;
  objc_super v3;

  v2 = self;
  sub_1D2D337DC();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for SharedTranslations(0);
  -[SharedTranslations dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13TranslationUI18SharedTranslations_presentedItemOperationQueue));
  sub_1D2CCADA4((uint64_t)self + OBJC_IVAR____TtC13TranslationUI18SharedTranslations_presentedItemURL, (uint64_t *)&unk_1ED586240);
  swift_bridgeObjectRelease();
  sub_1D2CCCF1C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13TranslationUI18SharedTranslations_presentedItemChangedAction));

}

- (void)presentedItemDidChange
{
  _TtC13TranslationUI18SharedTranslations *v2;

  v2 = self;
  sub_1D2D36658();

}

- (_TtC13TranslationUI18SharedTranslations)init
{
  _TtC13TranslationUI18SharedTranslations *result;

  result = (_TtC13TranslationUI18SharedTranslations *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
