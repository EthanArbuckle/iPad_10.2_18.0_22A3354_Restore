@implementation SiriTTSProsodyProperties

- (float)neuralSentencePitch
{
  float result;

  sub_19AD6AED8();
  return result;
}

- (void)setNeuralSentencePitch:(float)a3
{
  sub_19AD6AF2C(a3);
}

- (float)neuralSentencePitchRange
{
  float result;

  sub_19AD6AFC8();
  return result;
}

- (void)setNeuralSentencePitchRange:(float)a3
{
  sub_19AD6B01C(a3);
}

- (float)neuralSentenceDuration
{
  float result;

  sub_19AD6B0B8();
  return result;
}

- (void)setNeuralSentenceDuration:(float)a3
{
  sub_19AD6B10C(a3);
}

- (float)neuralSentenceEnergy
{
  float result;

  sub_19AD6B1A8();
  return result;
}

- (void)setNeuralSentenceEnergy:(float)a3
{
  sub_19AD6B1FC(a3);
}

- (float)neuralSentenceTilt
{
  float result;

  sub_19AD6B298();
  return result;
}

- (void)setNeuralSentenceTilt:(float)a3
{
  sub_19AD6B2EC(a3);
}

- (SiriTTSProsodyProperties)init
{
  SiriTTSProsodyProperties *result;

  ProsodyProperties.init()();
  return result;
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static ProsodyProperties.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ProsodyProperties.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSProsodyProperties *v5;

  v4 = a3;
  v5 = self;
  sub_19AD6B4BC();

}

- (SiriTTSProsodyProperties)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (SiriTTSProsodyProperties *)ProsodyProperties.init(coder:)();
}

@end
