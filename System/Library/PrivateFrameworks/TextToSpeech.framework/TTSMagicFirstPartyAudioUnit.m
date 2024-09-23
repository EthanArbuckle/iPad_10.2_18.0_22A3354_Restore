@implementation TTSMagicFirstPartyAudioUnit

- (_TtC12TextToSpeech27TTSMagicFirstPartyAudioUnit)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5
{
  return (_TtC12TextToSpeech27TTSMagicFirstPartyAudioUnit *)TTSMagicFirstPartyAudioUnit.init(componentDescription:options:)(*(_QWORD *)&a3->componentType, *(_QWORD *)&a3->componentManufacturer, a3->componentFlagsMask, *(uint64_t *)&a4);
}

- (id)defaultSettingsForVoice:(id)a3
{
  _TtC12TextToSpeech27TTSMagicFirstPartyAudioUnit *v3;
  void *v4;

  v3 = self;
  sub_1A39B0CF8();

  sub_1A39B11BC(0, (unint64_t *)&qword_1EE6D2388);
  v4 = (void *)sub_1A3AB4868();
  swift_bridgeObjectRelease();
  return v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
