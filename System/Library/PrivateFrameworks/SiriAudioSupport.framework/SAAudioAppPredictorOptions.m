@implementation SAAudioAppPredictorOptions

- (BOOL)trimDisambiguationForRelevance
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SAAudioAppPredictorOptions_trimDisambiguationForRelevance;
  swift_beginAccess();
  return *v2;
}

- (void)setTrimDisambiguationForRelevance:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SAAudioAppPredictorOptions_trimDisambiguationForRelevance;
  swift_beginAccess();
  *v4 = a3;
}

- (SAAudioAppPredictorOptions)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___SAAudioAppPredictorOptions_trimDisambiguationForRelevance) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SiriAudioAppPredictorOptions();
  return -[SAAudioAppPredictorOptions init](&v3, sel_init);
}

@end
