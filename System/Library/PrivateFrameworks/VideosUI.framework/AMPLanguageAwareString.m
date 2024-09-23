@implementation AMPLanguageAwareString

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_120(OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString);
  OUTLINED_FUNCTION_120(OBJC_IVAR___AMPLanguageAwareString_cachedTextStorage);
  OUTLINED_FUNCTION_120(OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_120(OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase);
  OUTLINED_FUNCTION_120(OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase);
  OUTLINED_FUNCTION_120(OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
  OUTLINED_FUNCTION_120(OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSAttributedString)attributedString
{
  void *v2;
  AMPLanguageAwareString *v3;

  v3 = self;
  LanguageAwareString.attributedString.getter();
  OUTLINED_FUNCTION_214();
  return (NSAttributedString *)OUTLINED_FUNCTION_111(v2);
}

- (void)setAttributedString:(id)a3
{
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_91_0();
  v3 = OUTLINED_FUNCTION_301_0();
  sub_1D9DDCD50(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (NSString)string
{
  LanguageAwareString.string.getter();
  sub_1DA143E50();
  OUTLINED_FUNCTION_1_14();
  return (NSString *)OUTLINED_FUNCTION_111(self);
}

- (AMPLanguageAwareString)localizedLowercase
{
  void *v2;
  AMPLanguageAwareString *v3;

  v3 = self;
  LanguageAwareString.localizedLowercase.getter();
  OUTLINED_FUNCTION_214();
  return (AMPLanguageAwareString *)OUTLINED_FUNCTION_111(v2);
}

- (void)setLocalizedLowercase:(id)a3
{
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_91_0();
  v3 = OUTLINED_FUNCTION_301_0();
  sub_1D9DDCE9C(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (AMPLanguageAwareString)localizedUppercase
{
  void *v2;
  AMPLanguageAwareString *v3;

  v3 = self;
  LanguageAwareString.localizedUppercase.getter();
  OUTLINED_FUNCTION_214();
  return (AMPLanguageAwareString *)OUTLINED_FUNCTION_111(v2);
}

- (void)setLocalizedUppercase:(id)a3
{
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_91_0();
  v3 = OUTLINED_FUNCTION_301_0();
  sub_1D9DDD080(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (AMPLanguageAwareString)newlinesCollapsedToSpace
{
  void *v2;
  AMPLanguageAwareString *v3;

  v3 = self;
  LanguageAwareString.newlinesCollapsedToSpace.getter();
  OUTLINED_FUNCTION_214();
  return (AMPLanguageAwareString *)OUTLINED_FUNCTION_111(v2);
}

- (void)setNewlinesCollapsedToSpace:(id)a3
{
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_91_0();
  v3 = OUTLINED_FUNCTION_301_0();
  sub_1D9DDD260(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (AMPLanguageAwareString)trimmed
{
  void *v2;
  AMPLanguageAwareString *v3;

  v3 = self;
  LanguageAwareString.trimmed.getter();
  OUTLINED_FUNCTION_214();
  return (AMPLanguageAwareString *)OUTLINED_FUNCTION_111(v2);
}

- (void)setTrimmed:(id)a3
{
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_91_0();
  v3 = OUTLINED_FUNCTION_301_0();
  sub_1D9DDD470(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (NSArray)numbers
{
  LanguageAwareString.numbers.getter();
  type metadata accessor for _NSRange();
  OUTLINED_FUNCTION_10_17();
  OUTLINED_FUNCTION_1_14();
  return (NSArray *)OUTLINED_FUNCTION_111(self);
}

- (NSArray)paragraphs
{
  return (NSArray *)sub_1D9DDD534(self, (uint64_t)a2, LanguageAwareString.paragraphs.getter);
}

- (NSArray)words
{
  return (NSArray *)sub_1D9DDD534(self, (uint64_t)a2, LanguageAwareString.words.getter);
}

- (_NSRange)fullRange
{
  AMPLanguageAwareString *v2;
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v2 = self;
  LanguageAwareString.fullRange.getter();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)setFullRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = OUTLINED_FUNCTION_48_52((uint64_t)self, a3.length, a3.location);
  sub_1D9DDD658(v3, v4);
  OUTLINED_FUNCTION_2_1();
}

- (BOOL)isEmpty
{
  return LanguageAwareString.isEmpty.getter();
}

- (void)setIsEmpty:(BOOL)a3
{
  sub_1D9DDD77C(a3);
  OUTLINED_FUNCTION_2_1();
}

- (int64_t)length
{
  AMPLanguageAwareString *v2;
  int64_t result;

  v2 = self;
  LanguageAwareString.utf16Count.getter();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setLength:(int64_t)a3
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_48_52((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9DDD854(v3);
  OUTLINED_FUNCTION_2_1();
}

- (int64_t)utf32Length
{
  AMPLanguageAwareString *v2;
  int64_t result;

  v2 = self;
  LanguageAwareString.utf32Count.getter();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setUtf32Length:(int64_t)a3
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_48_52((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9DDD994(v3);
  OUTLINED_FUNCTION_2_1();
}

- (int64_t)numberOfCharacters
{
  AMPLanguageAwareString *v2;
  int64_t result;

  v2 = self;
  LanguageAwareString.characterCount.getter();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setNumberOfCharacters:(int64_t)a3
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_48_52((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9DDDAD8(v3);
  OUTLINED_FUNCTION_2_1();
}

+ (BOOL)alwaysGenerateAttributedString
{
  char v2;

  static LanguageAwareString.alwaysGenerateAttributedString.getter();
  return v2 & 1;
}

+ (void)setAlwaysGenerateAttributedString:(BOOL)a3
{
  static LanguageAwareString.alwaysGenerateAttributedString.setter(a3);
}

+ (BOOL)keepStatisticsOnLanguageComponents
{
  char v2;

  static LanguageAwareString.keepStatisticsOnLanguageComponents.getter();
  return v2 & 1;
}

+ (void)setKeepStatisticsOnLanguageComponents:(BOOL)a3
{
  static LanguageAwareString.keepStatisticsOnLanguageComponents.setter(a3);
}

+ (AMPLanguageAwareStringPreprocessor)delegate
{
  return (AMPLanguageAwareStringPreprocessor *)(id)static LanguageAwareString.delegate.getter();
}

+ (void)setDelegate:(id)a3
{
  uint64_t v3;

  v3 = swift_unknownObjectRetain();
  static LanguageAwareString.delegate.setter(v3);
}

+ (AMPLanguageAwareString)AMPLanguageAwareStringEmpty
{
  return (AMPLanguageAwareString *)static LanguageAwareString.empty.getter();
}

- (AMPLanguageAwareString)initWithAttributedString:(id)a3 baseParagraphStyle:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5
{
  id v7;
  id v8;
  AMPLanguageAwareString *result;

  v7 = a3;
  v8 = a4;
  LanguageAwareString.init(_:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(v7, a4, a5);
  OUTLINED_FUNCTION_9();
  return result;
}

- (AMPLanguageAwareString)initWithString:(id)a3 attributes:(id)a4 baseParagraphStyle:(id)a5 keepStatisticsOnLanguageComponents:(BOOL)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  AMPLanguageAwareString *result;

  sub_1DA143E80();
  if (a4)
  {
    type metadata accessor for Key(0);
    sub_1D97B0440(qword_1EDA92220, (uint64_t)&unk_1DA1C4340);
    a4 = (id)sub_1DA143C7C();
  }
  v9 = a5;
  v10 = (void *)OUTLINED_FUNCTION_300();
  LanguageAwareString.init(_:attributes:baseParagraphStyle:keepStatisticsOnLanguageComponents:)(v10, v11, (uint64_t)a4, a5, a6);
  OUTLINED_FUNCTION_90();
  return result;
}

- (AMPLanguageAwareString)initWithString:(id)a3 baseParagraphStyle:(id)a4 generateAttributedString:(BOOL)a5 keepStatisticsOnLanguageComponents:(BOOL)a6
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  AMPLanguageAwareString *result;

  if (a3)
    sub_1DA143E80();
  v7 = a4;
  v8 = OUTLINED_FUNCTION_300();
  OUTLINED_FUNCTION_46_59(v8, v9);
  OUTLINED_FUNCTION_28_0();
  return result;
}

- (AMPLanguageAwareString)initWithLanguageAwareString:(id)a3 attributes:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5
{
  uint64_t v6;
  AMPLanguageAwareString *result;

  v6 = (uint64_t)a4;
  if (a4)
  {
    OUTLINED_FUNCTION_55_60();
    sub_1D97B0440(qword_1EDA92220, (uint64_t)&unk_1DA1C4340);
    OUTLINED_FUNCTION_300();
    v6 = sub_1DA143C7C();
  }
  LanguageAwareString.init(_:attributes:keepStatisticsOnLanguageComponents:)((char *)a3, v6, a5);
  OUTLINED_FUNCTION_28_0();
  return result;
}

- (int64_t)baseWritingDirectionForCharacterAtLocation:(int64_t)a3
{
  AMPLanguageAwareString *v3;
  int64_t result;

  v3 = self;
  OUTLINED_FUNCTION_35_1();
  LanguageAwareString.baseWritingDirection(forCharacterAt:)();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (int64_t)thresholdBaseWritingDirection
{
  int64_t result;

  LanguageAwareString.thresholdBaseWritingDirection.getter();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setThresholdBaseWritingDirection:(int64_t)a3
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_48_52((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9DDF4C0(v3);
  OUTLINED_FUNCTION_2_1();
}

- (int64_t)writingDirectionOfLine:(int64_t)a3 maximumLinesShown:(int64_t)a4 withWidth:(double)a5 lineBreakMode:(int64_t)a6 cacheLayoutInfo:(BOOL)a7
{
  AMPLanguageAwareString *v12;
  int64_t v13;
  int64_t v14;

  v12 = self;
  LanguageAwareString.writingDirectionOfLine(_:maximumLinesShown:withWidth:lineBreakMode:cacheLayoutInfo:)(a3, (id)a4, (id)a6, a7, a5);
  v14 = v13;

  return v14;
}

- (id)writingDirectionsQuantities
{
  id v2;

  v2 = LanguageAwareString.writingDirectionsQuantities()();
  return OUTLINED_FUNCTION_111(v2);
}

- (AMPLanguageAwareString)init
{
  LanguageAwareString.init()();
}

@end
