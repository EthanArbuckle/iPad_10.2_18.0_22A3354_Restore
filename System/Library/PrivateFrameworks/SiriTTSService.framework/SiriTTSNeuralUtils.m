@implementation SiriTTSNeuralUtils

+ (BOOL)isNeuralVoiceReady:(id)a3
{
  id v3;
  NeuralTTSUtils *v4;
  const char *v5;
  char is_neural_voice_ready;

  v3 = objc_retainAutorelease(a3);
  v4 = (NeuralTTSUtils *)objc_msgSend(v3, "UTF8String");
  is_neural_voice_ready = NeuralTTSUtils::is_neural_voice_ready(v4, v5);

  return is_neural_voice_ready;
}

+ (BOOL)shouldUseNeuralVoice:(id)a3
{
  id v3;
  NeuralTTSUtils *v4;
  const char *v5;
  char should_use_neural_voice;

  v3 = objc_retainAutorelease(a3);
  v4 = (NeuralTTSUtils *)objc_msgSend(v3, "UTF8String");
  should_use_neural_voice = NeuralTTSUtils::should_use_neural_voice(v4, v5);

  return should_use_neural_voice;
}

+ (float)currentSampleRate:(id)a3
{
  id v3;
  NeuralTTSUtils *v4;
  const char *v5;
  float v6;
  float v7;

  v3 = objc_retainAutorelease(a3);
  v4 = (NeuralTTSUtils *)objc_msgSend(v3, "UTF8String");
  NeuralTTSUtils::current_model_sample_rate(v4, v5);
  v7 = v6;

  return v7;
}

+ (BOOL)isANEModelCompiled:(id)a3
{
  id v3;
  NeuralTTSUtils *v4;
  const char *v5;
  char is_ane_model_compiled;

  v3 = objc_retainAutorelease(a3);
  v4 = (NeuralTTSUtils *)objc_msgSend(v3, "UTF8String");
  is_ane_model_compiled = NeuralTTSUtils::is_ane_model_compiled(v4, v5);

  return is_ane_model_compiled;
}

+ (BOOL)compileANEModel:(id)a3 error:(id *)a4
{
  id v4;
  NeuralTTSUtils *v5;
  const char *v6;

  v4 = objc_retainAutorelease(a3);
  v5 = (NeuralTTSUtils *)objc_msgSend(v4, "UTF8String");
  NeuralTTSUtils::compile_ane_model(v5, v6);

  return 1;
}

@end
