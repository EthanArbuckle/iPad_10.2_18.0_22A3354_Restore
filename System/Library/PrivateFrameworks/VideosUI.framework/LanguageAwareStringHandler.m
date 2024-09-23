@implementation LanguageAwareStringHandler

- (_TtC8VideosUI26LanguageAwareStringHandler)init
{
  return (_TtC8VideosUI26LanguageAwareStringHandler *)sub_1D97C91B8();
}

- (id)makeLanguageAwareAttributedString:(id)a3 defaultParagraphStyle:(id)a4
{
  id v6;
  id v7;
  _TtC8VideosUI26LanguageAwareStringHandler *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1D97C92AC(v6, a4);

  return OUTLINED_FUNCTION_15_14(v9);
}

- (id)makeLanguageAwareString:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC8VideosUI26LanguageAwareStringHandler *v7;
  void *v8;

  v4 = sub_1DA143E80();
  v6 = v5;
  v7 = self;
  sub_1D9E32188(v4, v6);

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1DA143E50();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_15_14(v8);
}

@end
