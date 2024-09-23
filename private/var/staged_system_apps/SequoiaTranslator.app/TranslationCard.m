@implementation TranslationCard

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC17SequoiaTranslator15TranslationCard *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = (void *)sub_1001ACCCC((uint64_t)v9);

  return v12;
}

- (void)disambiguableResult:(id)a3 didChangeResultForSentence:(id)a4 withSelection:(id)a5
{
  void *v5;
  id v9;
  id v10;
  id v11;
  _TtC17SequoiaTranslator15TranslationCard *v12;
  id v13;

  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_cachedTranslation);
  if (v5)
  {
    v9 = a3;
    v10 = a4;
    v11 = a5;
    v12 = self;
    v13 = v5;
    sub_1001A52A8(v13);

  }
}

- (_TtC17SequoiaTranslator15TranslationCard)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator15TranslationCard *)sub_1001AE778(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC17SequoiaTranslator15TranslationCard *v2;

  v2 = self;
  sub_1001AEC18();

}

- (_TtC17SequoiaTranslator15TranslationCard)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001B1ABC();
}

- (void)sourceTapped:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator15TranslationCard *v5;

  v4 = a3;
  v5 = self;
  sub_1001B0C18(v4);

}

- (void)targetTapped:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator15TranslationCard *v5;

  v4 = a3;
  v5 = self;
  sub_1001B0D50((uint64_t)v4);

}

- (void)senseTapped:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator15TranslationCard *v5;

  v4 = a3;
  v5 = self;
  sub_1001B0E70(v4);

}

- (id)_axSourceLanguage
{
  return sub_1001B1150(self, (uint64_t)a2, (uint64_t (*)(void))sub_1001AD220);
}

- (id)_axTargetLanguage
{
  return sub_1001B1150(self, (uint64_t)a2, (uint64_t (*)(void))sub_1001AD9C4);
}

- (id)_axSourceLanguageTranslationResult
{
  id result;

  sub_1001B1200(self, (uint64_t)a2, (uint64_t (*)(void))sub_1001AD668);
  return result;
}

- (id)_axTargetLanguageTranslationResult
{
  id result;

  sub_1001B1200(self, (uint64_t)a2, (uint64_t (*)(void))sub_1001ADBD4);
  return result;
}

- (BOOL)_axTranslationIsFavorited
{
  _TtC17SequoiaTranslator15TranslationCard *v2;
  objc_class *v3;
  unsigned __int8 v4;

  v2 = self;
  v3 = sub_1000216BC();
  v4 = -[objc_class isSelected](v3, "isSelected");

  return v4;
}

- (void)_axPerformFavoriteAction
{
  sub_1001B1368(self, (uint64_t)a2, (uint64_t (*)(void))sub_1000216BC);
}

- (BOOL)_axCanPerformLookupAction
{
  _TtC17SequoiaTranslator15TranslationCard *v2;
  objc_class *v3;
  unsigned __int8 v4;

  v2 = self;
  v3 = sub_1000218B0();
  v4 = -[objc_class isHidden](v3, "isHidden");

  return v4 ^ 1;
}

- (void)_axPerformLookupAction
{
  sub_1001B1368(self, (uint64_t)a2, (uint64_t (*)(void))sub_1000218B0);
}

- (void)_axPerformSpeakTranslationAction
{
  sub_1001B1368(self, (uint64_t)a2, (uint64_t (*)(void))sub_100021BF8);
}

- (id)_axSenseHeader
{
  _TtC17SequoiaTranslator15TranslationCard *v2;
  id v3;

  v2 = self;
  v3 = sub_1001AE158();

  return v3;
}

- (id)_axSourceLocale
{
  return sub_1001B1588(self, (uint64_t)a2, (void (*)(void))sub_1001B13FC);
}

- (id)_axTargetLocale
{
  return sub_1001B1588(self, (uint64_t)a2, (void (*)(void))sub_1001B1414);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___languageOneLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___separatorWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___sourceView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___languageTwoLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___targetView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___hintView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___senseHeader));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___senseRowsStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___favoritedImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard____lazy_storage___spacer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_favoriteObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_selectedAlternativeObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_ttsPlaybackRateObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_cachedDisambiguableResult));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_cachedTranslation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_alternativesBehaviour));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_expandedFont));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_collapsedFontBold));
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_sourceLocale, (uint64_t *)&unk_10028FE50);
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator15TranslationCard_targetLocale, (uint64_t *)&unk_10028FE50);
}

@end
