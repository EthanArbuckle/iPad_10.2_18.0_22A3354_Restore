@implementation SiriTTSSynthesisEngineRequest

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (BOOL)privacySensitive
{
  return self->_privacySensitive;
}

- (void)setPrivacySensitive:(BOOL)a3
{
  self->_privacySensitive = a3;
}

- (float)rate
{
  return self->_rate;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (float)pitch
{
  return self->_pitch;
}

- (void)setPitch:(float)a3
{
  self->_pitch = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (unint64_t)profile
{
  return self->_profile;
}

- (void)setProfile:(unint64_t)a3
{
  self->_profile = a3;
}

- (float)neuralSentencePitch
{
  return self->_neuralSentencePitch;
}

- (void)setNeuralSentencePitch:(float)a3
{
  self->_neuralSentencePitch = a3;
}

- (float)neuralSentencePitchRange
{
  return self->_neuralSentencePitchRange;
}

- (void)setNeuralSentencePitchRange:(float)a3
{
  self->_neuralSentencePitchRange = a3;
}

- (float)neuralSentenceDuration
{
  return self->_neuralSentenceDuration;
}

- (void)setNeuralSentenceDuration:(float)a3
{
  self->_neuralSentenceDuration = a3;
}

- (float)neuralSentenceEnergy
{
  return self->_neuralSentenceEnergy;
}

- (void)setNeuralSentenceEnergy:(float)a3
{
  self->_neuralSentenceEnergy = a3;
}

- (float)neuralSentenceTilt
{
  return self->_neuralSentenceTilt;
}

- (void)setNeuralSentenceTilt:(float)a3
{
  self->_neuralSentenceTilt = a3;
}

- (id)audioHandler
{
  return self->_audioHandler;
}

- (void)setAudioHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)promptHandler
{
  return self->_promptHandler;
}

- (void)setPromptHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)wordTimingsHandler
{
  return self->_wordTimingsHandler;
}

- (void)setWordTimingsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)neuralFallbackHandler
{
  return self->_neuralFallbackHandler;
}

- (void)setNeuralFallbackHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)useHydraFrontendHandler
{
  return self->_useHydraFrontendHandler;
}

- (void)setUseHydraFrontendHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)audioClickHandler
{
  return self->_audioClickHandler;
}

- (void)setAudioClickHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_audioClickHandler, 0);
  objc_storeStrong(&self->_useHydraFrontendHandler, 0);
  objc_storeStrong(&self->_neuralFallbackHandler, 0);
  objc_storeStrong(&self->_wordTimingsHandler, 0);
  objc_storeStrong(&self->_promptHandler, 0);
  objc_storeStrong(&self->_audioHandler, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
