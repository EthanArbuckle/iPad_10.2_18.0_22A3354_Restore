@implementation VAFeatureExtract

- (_TtC12VoiceActions16VAFeatureExtract)init
{
  objc_class *v2;
  char *v3;
  objc_super v5;

  v2 = (objc_class *)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12VoiceActions16VAFeatureExtract_windowAppliedFrame) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12VoiceActions16VAFeatureExtract_frameFeatureVec) = v2;
  v3 = (char *)self + OBJC_IVAR____TtC12VoiceActions16VAFeatureExtract____lazy_storage___nfft;
  *(_QWORD *)v3 = 0;
  v3[8] = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12VoiceActions16VAFeatureExtract____lazy_storage___fftCalculator) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12VoiceActions16VAFeatureExtract____lazy_storage___fbankTFlattened) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12VoiceActions16VAFeatureExtract____lazy_storage___hammingWindow) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VAFeatureExtract();
  return -[VAFeatureExtract init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
