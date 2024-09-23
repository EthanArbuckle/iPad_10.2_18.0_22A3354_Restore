@implementation DisambiguationResultModel

- (_TtC13TranslationUI25DisambiguationResultModel)init
{
  _TtC13TranslationUI25DisambiguationResultModel *result;

  result = (_TtC13TranslationUI25DisambiguationResultModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_disambiguableResult));
  sub_1D2CCCF1C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_globalAttributeProvider));
  sub_1D2CCCF1C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_linkAttributeProvider));
  sub_1D2CCCF1C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_userSelectionHandler));
  v3 = (char *)self + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_sourceLocale;
  v4 = sub_1D2D9C7EC();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_targetLocale, v4);
  swift_bridgeObjectRelease();
  v6 = (char *)self + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel__sourceAttributedText;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFCA5D50);
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel__targetAttributedText, v7);
  sub_1D2CDB684(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_displaySource), *(_QWORD *)&self->disambiguableResult[OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_displaySource]);
}

- (void)disambiguableResult:(id)a3 didChangeResultForSentence:(id)a4 withSelection:(id)a5
{
  char *v9;
  char v10;
  _TtC13TranslationUI25DisambiguationResultModel *v11;
  _TtC13TranslationUI25DisambiguationResultModel *v12;
  _TtC13TranslationUI25DisambiguationResultModel *v13;
  _TtC13TranslationUI25DisambiguationResultModel *v14;
  void (*v15)(_TtC13TranslationUI25DisambiguationResultModel *, _TtC13TranslationUI25DisambiguationResultModel *);

  v9 = (char *)self + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_renderMode;
  swift_beginAccess();
  v10 = *v9;
  v11 = (_TtC13TranslationUI25DisambiguationResultModel *)a3;
  v12 = (_TtC13TranslationUI25DisambiguationResultModel *)a4;
  v13 = (_TtC13TranslationUI25DisambiguationResultModel *)a5;
  v14 = self;
  if ((v10 & 1) != 0)
  {
    sub_1D2CD5A58();
    if (!v13)
      goto LABEL_8;
  }
  else
  {
    sub_1D2CD4D3C();
    if (!v13)
      goto LABEL_8;
  }
  v15 = *(void (**)(_TtC13TranslationUI25DisambiguationResultModel *, _TtC13TranslationUI25DisambiguationResultModel *))((char *)&v14->super.isa + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_userSelectionHandler);
  if (v15)
  {
    v13 = v13;
    v15(v12, v13);

    v11 = v12;
    v12 = v14;
    v14 = v13;
  }

  v11 = v12;
  v12 = v13;
LABEL_8:

}

- (id)excludedTypesForResult:(id)a3
{
  id v4;
  _TtC13TranslationUI25DisambiguationResultModel *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = _s13TranslationUI25DisambiguationResultModelC13excludedTypes3forShySo8NSNumberCGSgSo016_LTDisambiguableD0C_tF_0();

  if (v6)
  {
    sub_1D2CC63E8(0, (unint64_t *)&qword_1EFCA5F48);
    sub_1D2CDB624();
    v7 = (void *)sub_1D2D9DFC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)disambiguableResultDidUpdate:(id)a3
{
  _BYTE *v5;
  id v6;
  _TtC13TranslationUI25DisambiguationResultModel *v7;

  v5 = (char *)self + OBJC_IVAR____TtC13TranslationUI25DisambiguationResultModel_renderMode;
  swift_beginAccess();
  LOBYTE(v5) = *v5;
  v6 = a3;
  v7 = self;
  if ((v5 & 1) != 0)
    sub_1D2CD5A58();
  else
    sub_1D2CD4D3C();

}

@end
