@implementation AMPLanguageAwareString

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSAttributedString)attributedString
{
  AMPLanguageAwareString *v2;
  id v3;

  v2 = self;
  v3 = sub_1DA48D19C();

  return (NSAttributedString *)v3;
}

- (void)setAttributedString:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString) = (Class)a3;
  v3 = a3;

}

- (NSString)string
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (AMPLanguageAwareString)localizedLowercase
{
  AMPLanguageAwareString *v2;
  id v3;

  v2 = self;
  v3 = sub_1DA64A63C();

  return (AMPLanguageAwareString *)v3;
}

- (void)setLocalizedLowercase:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase) = (Class)a3;
  v3 = a3;

}

- (AMPLanguageAwareString)localizedUppercase
{
  AMPLanguageAwareString *v2;
  id v3;

  v2 = self;
  v3 = sub_1DA64A708();

  return (AMPLanguageAwareString *)v3;
}

- (void)setLocalizedUppercase:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase) = (Class)a3;
  v3 = a3;

}

- (AMPLanguageAwareString)newlinesCollapsedToSpace
{
  AMPLanguageAwareString *v2;
  id v3;

  v2 = self;
  v3 = sub_1DA64A8B8();

  return (AMPLanguageAwareString *)v3;
}

- (void)setNewlinesCollapsedToSpace:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace) = (Class)a3;
  v3 = a3;

}

- (AMPLanguageAwareString)trimmed
{
  AMPLanguageAwareString *v2;
  id v3;

  v2 = self;
  v3 = sub_1DA64AA98();

  return (AMPLanguageAwareString *)v3;
}

- (void)setTrimmed:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed) = (Class)a3;
  v3 = a3;

}

- (NSArray)numbers
{
  void *v2;

  type metadata accessor for _NSRange(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DA66FA90();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_NSRange)fullRange
{
  AMPLanguageAwareString *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = self;
  v3 = sub_1DA64AD20();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)setFullRange:(_NSRange)a3
{
  _NSRange *v3;

  v3 = (_NSRange *)((char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___fullRange);
  *v3 = a3;
  LOBYTE(v3[1].location) = 0;
}

- (BOOL)isEmpty
{
  return sub_1DA64AE14();
}

- (void)setIsEmpty:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___isEmpty) = a3;
}

- (int64_t)length
{
  AMPLanguageAwareString *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1DA64AF00();

  return v3;
}

- (void)setLength:(int64_t)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf16Count;
  *(_QWORD *)v3 = a3;
  v3[8] = 0;
}

- (int64_t)utf32Length
{
  AMPLanguageAwareString *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1DA64B02C();

  return v3;
}

- (void)setUtf32Length:(int64_t)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf32Count;
  *(_QWORD *)v3 = a3;
  v3[8] = 0;
}

+ (BOOL)alwaysGenerateAttributedString
{
  swift_beginAccess();
  return byte_1F026E6C0;
}

+ (void)setAlwaysGenerateAttributedString:(BOOL)a3
{
  swift_beginAccess();
  byte_1F026E6C0 = a3;
}

+ (AMPLanguageAwareStringPreprocessor)delegate
{
  swift_beginAccess();
  return (AMPLanguageAwareStringPreprocessor *)(id)swift_unknownObjectRetain();
}

+ (void)setDelegate:(id)a3
{
  swift_beginAccess();
  qword_1EDADE968 = (uint64_t)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

+ (AMPLanguageAwareString)AMPLanguageAwareStringEmpty
{
  if (qword_1F0268810 != -1)
    swift_once();
  return (AMPLanguageAwareString *)(id)qword_1F026E6D0;
}

- (AMPLanguageAwareString)initWithAttributedString:(id)a3 baseParagraphStyle:(id)a4
{
  id v5;
  id v6;
  AMPLanguageAwareString *v7;

  v5 = a3;
  v6 = a4;
  v7 = (AMPLanguageAwareString *)sub_1DA64D2F4(v5, a4);

  return v7;
}

- (AMPLanguageAwareString)initWithString:(id)a3 attributes:(id)a4 baseParagraphStyle:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  AMPLanguageAwareString *v11;

  v7 = sub_1DA66F8BC();
  v9 = v8;
  if (a4)
  {
    type metadata accessor for Key(0);
    sub_1DA5853EC();
    a4 = (id)sub_1DA66F754();
  }
  v10 = a5;
  v11 = (AMPLanguageAwareString *)sub_1DA64D644(v7, v9, (uint64_t)a4, a5);

  return v11;
}

- (AMPLanguageAwareString)initWithString:(id)a3 baseParagraphStyle:(id)a4 generateAttributedString:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, id, _BOOL8);
  id v11;
  AMPLanguageAwareString *v12;

  if (a3)
  {
    v5 = a5;
    v7 = sub_1DA66F8BC();
    v9 = v8;
    v10 = *(uint64_t (**)(uint64_t, uint64_t, id, _BOOL8))(swift_getObjectType() + 464);
    v11 = a4;
    v12 = (AMPLanguageAwareString *)v10(v7, v9, a4, v5);
  }
  else
  {
    swift_getObjectType();
    v12 = 0;
  }
  swift_deallocPartialClassInstance();
  return v12;
}

- (AMPLanguageAwareString)initWithLanguageAwareString:(id)a3 attributes:(id)a4
{
  uint64_t v4;
  id v6;
  AMPLanguageAwareString *v7;

  v4 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for Key(0);
    sub_1DA5853EC();
    v4 = sub_1DA66F754();
  }
  v6 = a3;
  v7 = (AMPLanguageAwareString *)sub_1DA64DCF8((uint64_t)v6, v4);

  return v7;
}

- (int64_t)baseWritingDirectionForCharacterAtLocation:(int64_t)a3
{
  AMPLanguageAwareString *v4;
  id v5;
  id v6;
  char v7;
  char v8;

  v4 = self;
  v5 = sub_1DA48D19C();
  v6 = NSAttributedString.baseWritingDirection(forCharacterAt:)(a3);
  v8 = v7;

  if ((v8 & 1) != 0)
    return -1;
  else
    return (int64_t)v6;
}

- (int64_t)thresholdBaseWritingDirection
{
  return sub_1DA64C218();
}

- (void)setThresholdBaseWritingDirection:(int64_t)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___thresholdBaseWritingDirection;
  *(_QWORD *)v3 = a3;
  v3[8] = 0;
}

- (int64_t)writingDirectionOfLine:(int64_t)a3 maximumLinesShown:(int64_t)a4 withWidth:(double)a5 lineBreakMode:(int64_t)a6 cacheLayoutInfo:(BOOL)a7
{
  AMPLanguageAwareString *v12;
  int64_t v13;
  int64_t v14;

  v12 = self;
  sub_1DA64C300(a3, (id)a4, (id)a6, a7, a5);
  v14 = v13;

  return v14;
}

- (id)writingDirectionsQuantities
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections));
}

- (AMPLanguageAwareString)init
{
  AMPLanguageAwareString *result;

  result = (AMPLanguageAwareString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
