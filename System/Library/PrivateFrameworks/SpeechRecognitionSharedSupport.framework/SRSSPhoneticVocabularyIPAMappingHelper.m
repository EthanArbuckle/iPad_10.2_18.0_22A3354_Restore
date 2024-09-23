@implementation SRSSPhoneticVocabularyIPAMappingHelper

+ (id)nvASRFromIPA:(id)a3 locale:(id)a4 separator:(id)a5
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = sub_247956A68();
  v7 = v6;
  v8 = sub_247956A68();
  _s30SpeechRecognitionSharedSupport38SRSSPhoneticVocabularyIPAMappingHelperC5nvASR7fromIPA6locale9separatorS2S_S2StFZ_0(v5, v7, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_247956A5C();
  swift_bridgeObjectRelease();
  return v10;
}

- (_TtC30SpeechRecognitionSharedSupport38SRSSPhoneticVocabularyIPAMappingHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SRSSPhoneticVocabularyIPAMappingHelper();
  return -[SRSSPhoneticVocabularyIPAMappingHelper init](&v3, sel_init);
}

@end
