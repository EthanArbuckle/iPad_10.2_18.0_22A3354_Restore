@implementation VSNeuralTTSUtils

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

+ (BOOL)hasCompactNeuralFallback:(id)a3
{
  id v3;
  NeuralTTSUtils *v4;
  const char *v5;
  char has_compact_neural_fallback;

  v3 = objc_retainAutorelease(a3);
  v4 = (NeuralTTSUtils *)objc_msgSend(v3, "UTF8String");
  has_compact_neural_fallback = NeuralTTSUtils::has_compact_neural_fallback(v4, v5);

  return has_compact_neural_fallback;
}

+ (BOOL)isNeuralFallbackCondition
{
  return NeuralTTSUtils::check_thermal_critical_conditions((NeuralTTSUtils *)a1);
}

+ (BOOL)hasOTAANEModel:(id)a3
{
  id v3;
  NeuralTTSUtils *v4;
  const char *v5;
  char has_ota_ane_model;

  v3 = objc_retainAutorelease(a3);
  v4 = (NeuralTTSUtils *)objc_msgSend(v3, "UTF8String");
  has_ota_ane_model = NeuralTTSUtils::has_ota_ane_model(v4, v5);

  return has_ota_ane_model;
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

+ (void)compileANEModel:(id)a3
{
  id v3;
  NeuralTTSUtils *v4;
  const char *v5;

  v3 = objc_retainAutorelease(a3);
  v4 = (NeuralTTSUtils *)objc_msgSend(v3, "UTF8String");
  NeuralTTSUtils::compile_ane_model(v4, v5);

}

@end
