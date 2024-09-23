@implementation SSMLParserWrapperInternal

- (SSMLParserWrapperInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SSMLParserWrapper();
  return -[SSMLParserWrapperInternal init](&v3, sel_init);
}

- (id)generateSSMLFromString:(id)a3
{
  id v4;
  SSMLParserWrapperInternal *v5;
  id v6;
  void *v7;
  _QWORD v9[6];

  sub_1A3AB497C();
  v4 = objc_allocWithZone((Class)SSMLParseResult);
  v5 = self;
  v6 = objc_msgSend(v4, sel_init);
  TTSMarkup.SpeechDocument.init(_:)((uint64_t (*)(void))sub_1A3A88BC8, v9);
  TTSMarkup.SpeechDocument.asSSML()();
  sub_1A39A1B14((uint64_t)v9);
  v7 = (void *)sub_1A3AB4958();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setSsmlResult_, v7);

  swift_bridgeObjectRelease();
  return v6;
}

- (id)parseSSMLToPlainText:(id)a3
{
  return sub_1A3A886DC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))_s12TextToSpeech17SSMLParserWrapperC016parseSSMLToPlainA0ySo15SSMLParseResultCSSF_0);
}

- (id)generateSSMLFromAVSpeechUtterance:(id)a3
{
  id v5;
  id v6;
  SSMLParserWrapperInternal *v7;
  id v8;
  void *v9;
  _QWORD v11[6];

  v5 = objc_allocWithZone((Class)SSMLParseResult);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, sel_init);
  AVSpeechUtterance.asSpeech.getter(v11);
  TTSMarkup.SpeechDocument.asSSML()();
  sub_1A39A1B14((uint64_t)v11);
  v9 = (void *)sub_1A3AB4958();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setSsmlResult_, v9);

  return v8;
}

- (id)generateSSMLFromPlainTalkString:(id)a3
{
  return sub_1A3A886DC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))_s12TextToSpeech17SSMLParserWrapperC12generateSSML19fromPlainTalkStringSo15SSMLParseResultCSS_tF_0);
}

- (id)parseSSMLToPlainTalk:(id)a3
{
  return sub_1A3A886DC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))_s12TextToSpeech17SSMLParserWrapperC20parseSSMLToPlainTalkySo15SSMLParseResultCSSF_0);
}

@end
